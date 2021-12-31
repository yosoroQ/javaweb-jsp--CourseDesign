package handle.data;
import save.data.Login;
import javax.sql.*;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
@SuppressWarnings({ "serial", "unused" })
public class HandleUpdate extends HttpServlet {
   public void init(ServletConfig config) throws ServletException { 
      super.init(config);
   }
   public  void  service(HttpServletRequest request,
                         HttpServletResponse response) 
                         throws ServletException,IOException {
      request.setCharacterEncoding("utf-8");
      String amount = request.getParameter("update");
      String goodsId = request.getParameter("goodsId");
      if(amount ==null)
          amount="1";
      int newAmount = 0;
      try{
         newAmount =Integer.parseInt(amount);
         if(newAmount<0){
           newAmount = 1; 
         }
      }
      catch(NumberFormatException exp){
           newAmount = 1; 
      }
      Connection con=null;
      PreparedStatement pre=null; //预处理语句。 
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
      Context  contextNeeded=null;
      try {
        Context  context = new InitialContext();
         contextNeeded=(Context)context.lookup("java:comp/env");
        DataSource ds=
       (DataSource)contextNeeded.lookup("mobileConn");//获得连接池。
        con = ds.getConnection();//使用连接池中的连接。
        String updateSQL = 
        "update shoppingForm set goodsAmount =? where goodsId=?"; //更新购物车。
         pre = con.prepareStatement(updateSQL);
         pre.setInt(1,newAmount);
         pre.setString(2,goodsId);
         pre.executeUpdate();
         con.close();//连接放回连接池。
         response.sendRedirect("lookShoppingCar.jsp");//查看购物车。
      }
      catch(SQLException e) { 
         response.getWriter().print(""+e);
      }
      catch(NamingException exp){
          response.getWriter().print(""+exp);
      }
      finally{
         try{ 
              con.close();
         }
         catch(Exception ee){}
      }
   }
}
