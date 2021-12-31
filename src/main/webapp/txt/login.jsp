<%@ page contentType="text/html" %>
<%@ page pageEncoding = "utf-8" %>

<jsp:useBean id="loginBean" class="save.data.Login" scope="session"/> 

<title>登录页面</title>

<%@ include file="vscode1.txt" %>  <!--引入顶栏-->
<link rel="stylesheet" href="css/style1.css">  <!--引入style1样式-->

<style>

<!--footer底栏的样式-->
.footer{
    position: absolute;
     background-color: rgb(96,125,139);
    left: 50%;
    transform: translateX(-50%);
    width: 100%;
    height: 60px;
    bottom: 0px;

}

<!--footer2底栏文字的样式-->
.footer2{
    text-align: center;
    color: rgba(255, 255, 255, 0.8);
      font-size: 20px;

}

   #ok{
      font-family:微软雅黑;font-size:26;color:black; }
   #yes{
      font-family:微软雅黑;font-size:18;color:black; }
</style>

<HTML>
 <body background =css/1.jpg>   <!--引入css文件夹的1.jpg-->
<div align="center">
<br>
<p id="ok">登录</p>
<form action="loginServlet" method="post">   <!--请求loginServlet-->
<table id=ok> 
<tr>
<td>用户名称：</td>
<td><input type=text id=ok name="logname"/></td>
</tr>

<tr>
<td>用户密码：</td>
<td><input type=password id=ok name="password"/></td>
</tr>

</table>
<br><hr>
<input type=submit id=ok value="提交">
<hr>
</form></div>
<div align="center">
登录反馈信息:<br>
<jsp:getProperty name="loginBean" property="backNews"/>
<br>登录名称:<br><jsp:getProperty name="loginBean" property="logname"/>


<!--底栏↓↓↓↓↓↓↓↓↓↓↓-->
<footer class="footer">
                <p class="footer2">作者：<a target="_blank" href="https://www.mxzfun.com" >19信管2班</a></p>
            </footer>
</div></body></HTML>

