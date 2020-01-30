<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.association2.model.User" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Gentelella Alela! | </title>

    <!-- Bootstrap -->
    <link href="/static/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/static/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/static/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="/static/vendors/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="/static/css/custom.min.css" rel="stylesheet">
</head>
<body class="login">
<div>

    <div class="login_wrapper">
        <div class="animate form login_form">
            <section class="login_content">
                <form action="/login"   method="post">
                    <h1>登录</h1>
                    <!-- 提示登录失败 -->
                    <div>
                        <c:if test="${not empty msg}">
                            <h1 style="color:red">${msg}
                            </h1>
                        </c:if>
                    </div>
                    <div>
                        <input type="text" class="form-control" name="userId" placeholder="请输入用户名" required="" />
                    </div>
                    <div>
                        <input type="password" class="form-control"name="password" placeholder="请输入密码" required="" />
                    </div>
                    <div>
                        <a ><button type="submit"  class="btn btn-default submit" style="margin:  0px 200px 30px 0px;" >登录</button></a>

                    </div>

                    <div>
                        <a href="register"><button type="button"  class="btn btn-default submit" style="margin:  -115px 0px 0px 200px;" >注册</button></a>
                    </div>
                    <div class="clearfix"></div>
                    <div class="clearfix"></div>
                    <br />
                    <div>
                        <h1><i class="fa fa-paw"></i>**大学社团网站</h1>

                    </div>
                </form>
            </section>
        </div>
    </div>
</div>
</body>
</html>

