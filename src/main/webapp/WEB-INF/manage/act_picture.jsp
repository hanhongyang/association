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
    <%@include file="../head.jsp" %>
</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <!-- 引入bar -->
        <jsp:include page="../sidebar.jsp"/>
        <jsp:include page="../topbar.jsp"/>
        <!-- page content -->
        <div class="right_col" role="main">
            <div class="page-title">
                <div class="title_left">
                    <h3>${activity.title}</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div class="col-md-7 col-sm-7 col-xs-12"><!--轮播图-->

                                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                    <!-- Indicators -->
                                    <ol class="carousel-indicators">

                                        <c:if test="${imgNum==0}">
                                        </c:if>
                                        <c:if test="${imgNum==1}">
                                            <li data-target="#carousel-example-generic" data-slide-to="0"></li>
                                        </c:if>
                                        <c:if test="${imgNum==2}">
                                            <li data-target="#carousel-example-generic" data-slide-to="0"></li>
                                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                        </c:if>
                                        <c:if test="${imgNum==3}">
                                            <li data-target="#carousel-example-generic" data-slide-to="0"></li>
                                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                        </c:if>
                                    </ol>

                                    <!-- Wrapper for slides -->
                                    <div class="carousel-inner" role="listbox" style="width: 575px;height: 448px">
                                        <c:if test="${imgNum==0}">
                                        </c:if>
                                        <c:if test="${imgNum==1}">
                                            <div class="item active">
                                                <img src="${imgLocation[0]}" alt="...">
                                            </div>
                                        </c:if>
                                        <c:if test="${imgNum==2}">
                                            <div class="item active">
                                                <img src="${imgLocation[0]}" alt="...">
                                            </div>
                                            <div class="item ">
                                                <img src="${imgLocation[1]}" alt="...">
                                            </div>
                                        </c:if>
                                        <c:if test="${imgNum==3}">
                                            <div class="item active">
                                                <img src="${imgLocation[0]}" alt="...">
                                            </div>
                                            <div class="item ">
                                                <img src="${imgLocation[1]}" alt="...">
                                            </div>
                                            <div class="item ">
                                                <img src="${imgLocation[2]}" alt="...">
                                            </div>
                                        </c:if>
                                    </div>

                                    <!-- Controls -->
                                    <a class="left carousel-control" href="#carousel-example-generic" role="button"
                                       data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="right carousel-control" href="#carousel-example-generic" role="button"
                                       data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>
                                <!--轮播图/-->
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->
<jsp:include page="../footer.jsp"/>
</body>
</html>
