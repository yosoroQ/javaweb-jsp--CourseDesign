<%@ page contentType="text/html" %>
<%@ page pageEncoding = "utf-8" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.sql.*" %>



<jsp:useBean id="loginBean" class="save.data.Login" scope="session"/>


<HEAD>
<%@ include file="txt/vscode1.txt" %>
</HEAD>

<title>查看订单</title>

<style>
   #tom{
      font-family:微软雅黑;font-size:26;color:black 
   }
</style>

<HTML><body background =image/11.jpg>     <!--引入名为11的图像-->

<div align="center">
<%  if(loginBean==null){
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
    Context  context = new InitialContext();
    Context  contextNeeded = (Context)context.lookup("java:comp/env");
    DataSource  ds = (DataSource)contextNeeded.lookup("mobileConn");//获得连接池。
    Connection con =null;
    Statement sql; 
    ResultSet rs;
    
    //打印表头信息
    out.print("<table border=1>");
    out.print("<tr>");
    out.print("<th id=tom width=110>"+"订单序号");
    out.print("<th id=tom width=100>"+"用户名称");
    out.print("<th id=tom width=200>"+"订单信息");
    out.print("</tr>"); 
   try{
       con = ds.getConnection();//使用连接池中的连接。
       sql=con.createStatement(); 
       String SQL = 
      "SELECT * FROM orderForm where logname='"+loginBean.getLogname()+"'";
       rs=sql.executeQuery(SQL);//查表。
       
       //获取数据库表中信息
       while(rs.next()) {
           out.print("<tr>");
           out.print("<td id=tom>"+rs.getString(1)+"</td>"); 
           out.print("<td id=tom>"+rs.getString(2)+"</td>");
           out.print("<td id=tom>"+rs.getString(3)+"</td>");
           out.print("</tr>") ; 
       }
       out.print("</table>");
       con.close() ;//连接返回连接池。
    }
    catch(SQLException e) { 
       out.print("<h1>"+e+"</h1>");
    }
    finally{
        try{
             con.close();
        }
        catch(Exception ee){}
    } 
%>
</div></body></HTML>
