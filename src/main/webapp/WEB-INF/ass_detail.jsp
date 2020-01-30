<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/12/4
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.association2.model.User" %>
<%@ page import="com.example.association2.model.Association" %>
<%@ page import="java.util.List" %>
<%@ page import="static java.lang.Integer.parseInt" %>

<html lang="zh-CN">
<head>
    <%@include file="head.jsp" %>
</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <!-- 引入bar -->
        <jsp:include page="sidebar.jsp"/>
        <jsp:include page="topbar.jsp"/>
        <!-- page content -->
        <div class="right_col" role="main">
            <div class="page-title">
                <div class="title_left">
                    <h3>${association.name}</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class=" x_panel">
                        <div class="x_content">
                            <div class="row ">
                                <div class="col-md-12 col-sm-12 col-xs-12 text-center"><!--分类栏-->
                                    <ul class="nav nav-tabs nav-justified">
                                        <li role="presentation" class="${bar == 1  ? 'active':''}"><a href="/association?associationId=${association.associationId}&bar=1">社团介绍</a></li>
                                        <li role="presentation"class="${bar == 2  ? 'active':''}"><a href="/association?associationId=${association.associationId}&bar=2">成员介绍</a></li>
                                        <li role="presentation"class="${bar == 3  ? 'active':''}"><a href="/association?associationId=${association.associationId}&bar=3">活动</a></li>
                                    </ul>

                                    <!--主要内容-->
                                    <c:choose>
                                        <c:when test="${bar==1}">
                                            <div class="x_content">

                                                <div class="bs-example" data-example-id="simple-jumbotron">
                                                    <div class="jumbotron">
                                                        <h1>Hello, world!</h1>
                                                        <p>${association.description}</p>
                                                    </div>
                                                </div>

                                            </div>
                                        </c:when>
                                        <c:when test="${bar==2}">
                                            <div class="col-md-3 col-xs-12 widget widget_tally_box">
                                                <div class="x_panel fixed_height_390">
                                                    <div class="x_content">
                                                        <div class="flex">
                                                            <ul class="list-inline widget_profile_box">
                                                                <li>
                                                                    <a>
                                                                        <i class="fa fa-phone"style="position: relative;top: 5px;"></i>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <img src="../static/images/user.png" alt="..." class="img-circle profile_img">
                                                                </li>
                                                                <li>
                                                                    <a>
                                                                        <i class="fa fa-envelope"style="position: relative;top: 5px;"></i>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <h3 class="name">会长</h3>
                                                        <div class="flex">
                                                                    <text style="display:block;">${presidentDes}</text>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <c:forEach items="${VicePresidentDes}" var="theVice">
                                                <div class="col-md-3 col-xs-12 widget widget_tally_box">
                                                    <div class="x_panel fixed_height_390">
                                                        <div class="x_content">
                                                            <div class="flex">
                                                                <ul class="list-inline widget_profile_box">
                                                                    <li>
                                                                        <a>
                                                                            <i class="fa fa-phone"style="position: relative;top: 5px;"></i>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <img src="../static/images/user.png" alt="..." class="img-circle profile_img">
                                                                    </li>
                                                                    <li>
                                                                        <a>
                                                                            <i class="fa fa-envelope"style="position: relative;top: 5px;"></i>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                            <h3 class="name">副会长</h3>
                                                            <div class="flex">
                                                                <text style="display:block;">${VicePresidentDes}</text>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            <c:forEach items="${MinisterDes}" var="theMinister">
                                                <div class="col-md-3 col-xs-12 widget widget_tally_box">
                                                    <div class="x_panel fixed_height_390">
                                                        <div class="x_content">
                                                            <div class="flex">
                                                                <ul class="list-inline widget_profile_box">
                                                                    <li>
                                                                        <a>
                                                                            <i class="fa fa-phone"style="position: relative;top: 5px;"></i>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <img src="../static/images/user.png" alt="..." class="img-circle profile_img">
                                                                    </li>
                                                                    <li>
                                                                        <a>
                                                                            <i class="fa fa-envelope"style="position: relative;top: 5px;"></i>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                            <h3 class="name">部长</h3>
                                                            <div class="flex">
                                                                <text style="display:block;">${MinisterDes}</text>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:when>
                                        <c:when test="${bar==3}">
                                            <h2>特色活动：${signatureActivity}</h2>
                                            <c:forEach items="${activityList}" var="activity">
                                            <div class="col-md-55">
                                                <div class="thumbnail">
                                                    <div class="image view view-first">
                                                        <img style="width: 100%; display: block;" src="../static/images/media.jpg" alt="活动图片">
                                                        <div class="mask">
                                                            <p style="vertical-align: inherit;font-family: 宋体">${activity.description}</p>
                                                        </div>
                                                    </div>
                                                    <div class="caption">
                                                        <a href="/activity?activityId=${activity.activityId}">
                                                        <p>${activity.title}</p>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            </c:forEach>
                                        </c:when>
                                    </c:choose>
                                    <!--主要内容/-->

                                </div><!--分类栏/-->

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->
<jsp:include page="footer.jsp"/>
</body>
</html>
