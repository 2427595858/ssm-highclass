<%--
  Created by IntelliJ IDEA.
  User: 光玉
  Date: 2018/4/14
  Time: 22:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>登录认证</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <meta name="keywords" content="Login" />
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel='stylesheet' type='text/css' />
    <!--webfonts-->
    <link href='http://fonts.useso.com/css?family=PT+Sans:400,700,400italic,700italic|Oswald:400,300,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.useso.com/css?family=Exo+2' rel='stylesheet' type='text/css'>
    <!--//webfonts-->
    <%--<script src="http://ajax.useso.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>--%>
    <script src="${pageContext.request.contextPath}/plugin/jquery/jquery.js"></script>
</head>
<body>
<script>$(document).ready(function(c) {
    $('.close').on('click', function(c){
        $('.login-form').fadeOut('slow', function(c){
            $('.login-form').remove();
        });
    });
});
</script>
<!--SIGN UP-->
<h1>Login</h1>
<div class="login-form">
    <div class="close"> </div>
    <div class="head-info">
        <label class="lbl-1"> </label>
        <label class="lbl-2"> </label>
        <label class="lbl-3"> </label>
    </div>
    <div class="clear"> </div>
    <div class="avtar">
        <img src="${pageContext.request.contextPath}/assets/images/avtar.png" />
    </div>
    <form action="${pageContext.request.contextPath}/login.action" method="post">
        <input type="text" class="text" name="username" value="username" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'username';}" >
        <div class="key">
            <input type="password" name="password" value="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'password';}">
        </div>
        <div class="signin">
            <input type="submit" value="Login" >
        </div>
    </form>
</div>
<div class="copy-rights">
    <p>Copyright &copy; 2018.光玉</p>
</div>

</body>
</html>
