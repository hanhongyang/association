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
                    <h3>新闻管理</h3>
                    <a href="/toAddNews" class="btn btn-sm btn-primary">添加新闻</a>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class=" x_panel">
                        <div class="x_content">
                            <div class="row ">
                                <div class="col-md-12 col-sm-12 col-xs-12 text-center">

                                            <div class="x_content">
                                                <table class="table table-striped projects">
                                                    <thead>
                                                    <tr>
                                                        <th style="width: 20%">新闻Id</th>
                                                        <th>标题</th>
                                                        <th>介绍</th>
                                                        <th>创建时间</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach var="news" items="${newsList}">
                                                        <tr >
                                                            <td >${news.id}</td>
                                                            <td >${news.title}</td>
                                                            <td >${news.description}</td>
                                                            <td >${news.createTime}</td>
                                                            <td>
                                                                <a href="/toNewsModify?id=${news.id}" class="btn btn-sm btn-primary">编辑</a>
                                                                <a href="/deleteNews?id=${news.id}" class="btn btn-sm btn-danger deleteBtn">删除</a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>

                                </div>

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


