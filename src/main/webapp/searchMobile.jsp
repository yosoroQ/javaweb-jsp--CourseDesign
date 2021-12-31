<%@ page contentType="text/html" %>
<%@ page pageEncoding = "utf-8" %>

<HEAD>
<%@ include file="txt/vscode1.txt" %>    <!--引入顶栏-->
</HEAD>

<title>查询页面</title>
<style>
   #tom{
      font-family:宋体;font-size:26;color:black; 
   }
</style>
<HTML><body background =image/11.jpg >    <!--引入名为11的图像-->
<div align="center">
<br>
<p id=tom>欢迎查询！</p>
<p id=tom>查询时可以输入书籍的编号，名称或者价格区间。<br>
书籍名支持模糊查询哦。
</p>
<form action="searchByConditionServlet" id =tom method="post" >  <!--交给searchByConditionServlet-->


输入查询信息:<input type=text id=tom name="searchMess"><br>    <!--searchMess和servlet相连-->
   <input type =radio name="radio" id =tom value="ISBN"/>      <!--radio和servlet相连-->
    书籍编号
   <input type =radio name="radio" id =tom value="book_name">   <!--radio和servlet相连-->
    书籍名
   <input type =radio name="radio" value="book_price" checked>   <!--radio和servlet相连-->
    书籍价格区间
   <br><input type=submit id =tom value="提交">
</form>
</div></body></HTML>
