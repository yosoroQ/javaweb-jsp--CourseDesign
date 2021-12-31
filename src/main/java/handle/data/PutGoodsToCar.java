package handle.data;
import save.data.Login;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
@SuppressWarnings("serial")
public class PutGoodsToCar extends HttpServlet {
   public void init(ServletConfig config) throws ServletException { 
      super.init(config);
   }
   @SuppressWarnings("resource")
public  void  service(HttpServletRequest request,
                         HttpServletResponse response) 
                         throws ServletException,IOException {
      request.setCharacterEncoding("utf-8");
      Connection con=null;
      PreparedStatement pre=null; //预处理语句。 
      ResultSet rs;
      String ISBN = request.getParameter("ISBN");
      Login loginBean=null;
      HttpSession session=request.getSession(true);
      try{ 
         loginBean = (Login)session.getAttribute("loginBean");
         if(loginBean==null){
           response.sendRedirect("txt/login.jsp");//重定向到登录页面。
           return;
         }
         else {
           boolean b =loginBean.getLogname()==null||
                   loginBean.getLogname().length()==0;
           if(b){
              response.sendRedirect("txt/login.jsp");//重定向到登录页面。
              return;
           }
         }
      }
      catch(Exception exp){
           response.sendRedirect("txt/login.jsp");//重定向到登录页面。
           return;
      }
      try {
        Context  context = new InitialContext();
        Context  contextNeeded=(Context)context.lookup("java:comp/env");
        DataSource ds=
        (DataSource)contextNeeded.lookup("mobileConn");//获得连接池。
        con= ds.getConnection();//使用连接池中的连接。
        String queryMobileForm =  
        "select * from mobileForm where ISBN =?";//查询商品表。
        String queryShoppingForm = 
        "select goodsAmount from shoppingForm where goodsId =?";//购物车表。
         String updateSQL = 
        "update shoppingForm set goodsAmount =? where goodsId=?"; //更新购物车。
         String insertSQL =
        "insert into shoppingForm values(?,?,?,?,?)";//添加到购物车。
         pre = con.prepareStatement(queryShoppingForm);
         pre.setString(1,ISBN);
         rs = pre.executeQuery();
         if(rs.next()){ //该货物已经在购物车中。
             int amount = rs.getInt(1);
             amount++;
             pre = con.prepareStatement(updateSQL);
             pre.setInt(1,amount);
             pre.setString(2,ISBN);
             pre.executeUpdate(); //更新购物车中该货物的数量。
         }
         else {  //向购物车添加商品。
             pre = con.prepareStatement(queryMobileForm); 
             pre.setString(1,ISBN);
             rs = pre.executeQuery();
             if(rs.next()){
                pre = con.prepareStatement(insertSQL); 
                pre.setString(1,rs.getString("ISBN"));
                pre.setString(2,loginBean.getLogname());
                pre.setString(3,rs.getString("book_name"));
                pre.setFloat(4,rs.getFloat("book_price"));
                pre.setInt(5,1);
                pre.executeUpdate(); //向购物车中添加该货物。
             }
         }
         con.close();
         response.sendRedirect("lookShoppingCar.jsp");//查看购物车。
      }
      catch(SQLException exp){ 
         response.getWriter().print(""+exp);
      }
      catch(NamingException exp){}
      finally{
        try{
             con.close();
        }
        catch(Exception ee){}
      }  
   }
}
