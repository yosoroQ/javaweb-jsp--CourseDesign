<%@ page contentType="text/html" %>
<%@ page pageEncoding = "utf-8" %>
<%@ page import="save.data.Login" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.sql.*" %>


<jsp:useBean id="loginBean" class="save.data.Login" scope="session"/>

<HEAD>
<%@ include file="txt/vscode1.txt" %>   <!--引入顶栏-->
</HEAD>

<title>商品详情</title>

<style>
   #tom{
      font-family:宋体;font-size:26;color:black 
   }
</style>

<HTML>
<center>
<body background =image/11.jpg >    <!--引入名为11的图像-->
<%  try{ 
         loginBean = (Login)session.getAttribute("loginBean");
         if(loginBean==null){
           response.sendRedirect("txt/login.jsp");//重定向到登录页面.
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
   String ISBN = request.getParameter("ISBN"); 
   if(ISBN==null) {
       out.print("没有产品号，无法查看细节");
       return;
   } 
   Context context = new InitialContext();
   Context contextNeeded = (Context)context.lookup("java:comp/env");
   DataSource ds = (DataSource)contextNeeded.lookup("mobileConn");//获得连接池。
   Connection con = null;
   Statement sql; 
   ResultSet rs;
   try{ 
     con= ds.getConnection();//使用连接池中的连接。
     sql=con.createStatement();
     String query="SELECT * FROM mobileForm where ISBN = '"+ISBN+"'";
     rs=sql.executeQuery(query);
     out.print("<table id=tom border=1>");
     out.print("<tr>");
     out.print("<th>图书ISBN");
     out.print("<th>图书名");
     out.print("<th>出版社");
     out.print("<th>图书价格");
     out.print("<th>放入购物车<th>");
     out.print("</tr>");
     String picture="background.jpg";
     String detailMess="";
     while(rs.next()){
       ISBN=rs.getString(1);
       String name=rs.getString(2);
       String maker=rs.getString(3);
       String price=rs.getString(4);
       detailMess=rs.getString(5);
       picture=rs.getString(6); 
       out.print("<tr>");
       out.print("<td>"+ISBN+"</td>");
       out.print("<td>"+name+"</td>");
       out.print("<td>"+maker+"</td>");
       out.print("<td>"+price+"</td>");
       String shopping =
       "<a href ='putGoodsServlet?ISBN="+ISBN+"'>添加到购物车</a>";
       out.print("<td>"+shopping+"</td>"); 
       out.print("</tr>");
     } 
     out.print("</table>");
     out.print("<br>");
     out.print("<p id=tom>产品详情:</p>");
     out.println("<div align=center id=tom>"+"出版日期："+detailMess+"<div>");
     String pic ="<img src='image/"+picture+"' width=260 height=350 ></img>";
     out.print(pic); //产片图片
     con.close(); //连接返回连接池。                
  }
  catch(SQLException exp){}
  finally{
     try{
          con.close();
     }
     catch(Exception ee){}
  } 
%>
</center>
</body></HTML>
