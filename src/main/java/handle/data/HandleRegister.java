package handle.data;
import save.data.Register;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
@SuppressWarnings("serial")
public class HandleRegister extends HttpServlet {
   public void init(ServletConfig config) throws ServletException { 
      super.init(config);
   }
   public  void  service(HttpServletRequest request,
                         HttpServletResponse response) 
                         throws ServletException,IOException {
      request.setCharacterEncoding("utf-8");
      Connection con =null; 
      PreparedStatement sql=null; 
      Register userBean=new Register();  //创建bean。
      request.setAttribute("userBean",userBean);
      String logname=request.getParameter("logname").trim();
      String password=request.getParameter("password").trim();
      String again_password=request.getParameter("again_password").trim();
      String phone=request.getParameter("phone").trim();
      String address=request.getParameter("address").trim();
      String realname=request.getParameter("realname").trim();
      if(logname==null)
           logname="";
      if(password==null)
           password="";
      if(!password.equals(again_password)) { 
         userBean.setBackNews("两次密码不同，注册失败，");
         RequestDispatcher dispatcher= 
         request.getRequestDispatcher("index4-register.jsp");
         dispatcher.forward(request, response);//转发
         return;
      }
      boolean isLD=true;
      for(int i=0;i<logname.length();i++){
          char c=logname.charAt(i);
          if(!(Character.isLetterOrDigit(c)||c=='_')) 
             isLD=false;
      } 
      boolean boo=logname.length()>0&&password.length()>0&&isLD;
      String backNews="";
      try{   Context  context = new InitialContext();
             Context  contextNeeded = (Context)context.lookup("java:comp/env");
             DataSource ds=
             (DataSource)contextNeeded.lookup("mobileConn");//获得连接池。
             con= ds.getConnection();//使用连接池中的连接。
             String insertCondition="INSERT INTO user VALUES (?,?,?,?,?)";
             sql=con.prepareStatement(insertCondition);
             if(boo){
               sql.setString(1,logname);

               sql.setString(2,password);
               sql.setString(3,phone);
               sql.setString(4,address);
               sql.setString(5,realname);
               int m=sql.executeUpdate();
               if(m!=0){
                  backNews="注册成功";
                  userBean.setBackNews(backNews);
                  userBean.setLogname(logname);
                  userBean.setPhone(phone);
                  userBean.setAddress(address);
                  userBean.setRealname(realname);
               }
             }
             else {
                 backNews="信息填写不完整或名字中有非法字符";
                 userBean.setBackNews(backNews);  
             }
             con.close();//连接返回连接池。
      }
      catch(SQLException exp){
             backNews="该会员名已被使用，请您更换名字"+exp;
             userBean.setBackNews(backNews); 
      }
      catch(NamingException exp){
             backNews="没有设置连接池"+exp;
             userBean.setBackNews(backNews); 
      }
      finally{
        try{
             con.close();
        }
        catch(Exception ee){}
      } 
      RequestDispatcher dispatcher= 
      request.getRequestDispatcher("index4-register.jsp");
      dispatcher.forward(request, response);//转发
   }
}
