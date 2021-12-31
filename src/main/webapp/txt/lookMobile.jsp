<%@ page contentType="text/html" %>
<%@ page pageEncoding = "utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>

<title>浏览图书页面</title>

<style>
   #tom{
      font-family:宋体;font-size:26;color:black 
   }
</style>

<HTML><body background =image/11.jpg>   <!--引入11.jpg-->
<div align="center">
<br>

<p id=tom>选择你想要看的图书，来进入书屋吧！</p>
<% Connection con=null; 
   Statement sql;
   ResultSet rs;
   Context context = new InitialContext();
   Context contextNeeded=(Context)context.lookup("java:comp/env");
   DataSource ds=(DataSource)contextNeeded.lookup("mobileConn");//获得连接池。
   try {
      con= ds.getConnection();//使用连接池中的连接。
      sql=con.createStatement();
      //读取mobileClassify表，获得分类：  
      rs=sql.executeQuery("SELECT * FROM mobileClassify");
      out.print("<form action='queryServlet' id =tom method ='post'>") ;
      out.print("<select id =tom name='fenleiNumber'>") ;
      while(rs.next()){
         int id = rs.getInt(1);
         String mobileCategory = rs.getString(2);
         out.print("<option value ="+id+">"+mobileCategory+"</option>");
      }  
      out.print("</select>");
      out.print("<input type ='submit' id =tom value ='提交'>");  
      out.print("</form>");
      rs.close();
      con.close();//连接返回连接池。
   }
   catch(SQLException e){ 
      out.print(e);
   }
   finally{
     try{
        con.close();
     }
     catch(Exception ee){}
   } 
%>
</div></body></HTML>
