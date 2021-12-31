<%@ page contentType="text/html" %>
<%@ page pageEncoding = "utf-8" %>

<jsp:useBean id="userBean" class="save.data.Register" scope="request"/>


<head>
<title>注册页面</title>
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
</head>

<body background =css/1.jpg>  <!--引入css文件夹的1.jpg-->
 <div align="center">
<form action="registerServlet" method="post">  <!--请求registerServlet-->
<br>
<p id="ok">寸金小书屋</p>
<p id="ok">欢迎您注册</p>
<table id=ok> 
   <tr><td>用户名称:</td>
       <td><input type=text id=ok name="logname" /></td>

       <td>用户密码:</td><td><input type=password id=ok name="password">
       </td></tr>
   <tr><td>重复密码:</td><td>
       <input type=password id=ok name="again_password"></td>
       <td>联系电话:</td><td><input type=text id=ok name="phone"/></td></tr>
   <tr><td>邮寄地址:</td><td><input type=text id=ok name="address"/></td>
       <td>真实姓名:</td><td><input type=text id=ok name="realname"/></td>
</table>
<br><hr>
<input type=submit  id=ok value="提交">
</form>
<hr>
</div>

<div align="center">
注册反馈：
<jsp:getProperty name="userBean"  property="backNews" /> 

<!--底栏↓↓↓↓↓↓↓↓↓↓↓-->
 <footer class="footer">
                <p class="footer2">作者：<a target="_blank" href="https://www.mxzfun.com" >19信管2班</a></p>
            </footer>
</div></body></HTML>