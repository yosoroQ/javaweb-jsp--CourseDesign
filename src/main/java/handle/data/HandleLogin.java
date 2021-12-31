package handle.data;
import save.data.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
@SuppressWarnings("serial")
public class HandleLogin extends HttpServlet{
   public void init(ServletConfig config) throws ServletException{
      super.init(config);
   }
   public void service(HttpServletRequest request,
                       HttpServletResponse response) 
                       throws ServletException,IOException{
      request.setCharacterEncoding("utf-8");
      Connection con =null; 
      Statement sql; 
      String logname=request.getParameter("logname").trim(),
      password=request.getParameter("password").trim();
    
      boolean boo=(logname.length()>0)&&(password.length()>0);  
      try{ 
           Context  context = new InitialContext();
           Context  contextNeeded=(Context)context.lookup("java:comp/env");
           DataSource ds=
           (DataSource)contextNeeded.lookup("mobileConn");//获得连接池。
            con= ds.getConnection();//使用连接池中的连接。
           String condition="select * from user where logname = '"+logname+
            "' and password ='"+password+"'";
           sql=con.createStatement();  
           if(boo){
              ResultSet rs=sql.executeQuery(condition);
              boolean m=rs.next();
              if(m==true){ 
                  //调用登录成功的方法:
                  success(request,response,logname,password); 
                  RequestDispatcher dispatcher=
                  request.getRequestDispatcher("txt/login.jsp");//转发
                  dispatcher.forward(request,response);
              }
              else{
                  String backNews="您输入的用户名不存在，或密码不般配";
                  //调用登录失败的方法:
                  fail(request,response,logname,backNews); 
              }
           }
           else{
                  String backNews="请输入用户名和密码";
                  fail(request,response,logname,backNews);
           }
           con.close();//连接返回连接池。
      }
      catch(SQLException exp){
          String backNews=""+exp;
          fail(request,response,logname,backNews);
      }
      catch(NamingException exp){
          String backNews="没有设置连接池"+exp;
          fail(request,response,logname,backNews); 
      }
      finally{
        try{
             con.close();
        }
        catch(Exception ee){}
      } 
   }
   public void success(HttpServletRequest request,
                       HttpServletResponse response,
                       String logname,String password) {
      Login loginBean=null;
      HttpSession session=request.getSession(true);
      try{  loginBean=(Login)session.getAttribute("loginBean");
            if(loginBean==null){
               loginBean=new Login();  //创建新的数据模型 。
               session.setAttribute("loginBean",loginBean);
               loginBean=(Login)session.getAttribute("loginBean");
            }
            String name =loginBean.getLogname();
            if(name.equals(logname)) {
               loginBean.setBackNews(logname+"已经登录了");
               loginBean.setLogname(logname);
            }
            else {  //数据模型存储新的登录用户:
                loginBean.setBackNews(logname+"登录成功");
                loginBean.setLogname(logname);
            }
      }
      catch(Exception ee){
            loginBean=new Login();  
            session.setAttribute("loginBean",loginBean);
            loginBean.setBackNews(ee.toString());
            loginBean.setLogname(logname);
      }
   }
   public void fail(HttpServletRequest request,
                    HttpServletResponse response,
                    String logname,String backNews) {
        response.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out=response.getWriter();    
            out.println("<html><body>");
            out.println("<h2>"+logname+"登录反馈结果<br>"+backNews+"</h2>") ;
            out.println("返回登录页面<br>");
            out.println("<a href =txt/login.jsp>登录页面</a>");
            out.println("</body></html>");

        }
        catch(IOException exp){}
    }
}

