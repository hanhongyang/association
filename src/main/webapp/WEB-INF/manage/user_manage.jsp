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
                    <h3>用户管理</h3>
                    <a href="/register" class="btn btn-sm btn-primary">注册用户</a>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class=" x_panel">
                        <div class="x_content">
                            <div class="row ">
                                <div class="col-md-12 col-sm-12 col-xs-12 text-center"><!--分类栏-->
                                    <ul class="nav nav-tabs nav-justified">
                                        <li role="presentation" class="${bar == 1  ? 'active':''}"><a href="/userManage?bar=1">用户列表</a></li>
                                        <li role="presentation"class="${bar == 2  ? 'active':''}"><a href="/userManage?bar=2">社团成员</a></li>
                                    </ul>
                                    <!--主要内容-->
                                    <c:choose>
                                        <c:when test="${bar==1}">
                                            <div class="x_content">
                                                <table class="table table-striped projects">
                                                    <thead>
                                                    <tr>
                                                        <th style="width: 20%">用户Id</th>
                                                        <th>用户密码</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach var="user" items="${userList}">
                                                    <tr >
                                                        <td >${user.userId}</td>
                                                        <td >${user.password}</td>
                                                        <td>
                                                            <a href="/toUserModify?userId=${user.userId}" class="btn btn-sm btn-primary">编辑</a>
                                                            <a href="/userDelete?userId=${user.userId}" class="btn btn-sm btn-danger deleteBtn">删除</a>
                                                        </td>
                                                    </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </c:when>
                                        <c:when test="${bar==2}">
                                            <div class="x_content">
                                                <table class="table table-striped projects">
                                                    <thead>
                                                    <tr>
                                                        <th style="width: 10%">社团名称</th>
                                                        <th style="width: 5%">用户Id</th>
                                                        <th style="width: 5%">职位</th>
                                                        <th >描述</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach var="am" items="${AssociationMemberList}">
                                                        <tr >
                                                            <td >${am.name}</td>
                                                            <td >${am.userId}</td>
                                                            <c:choose>
                                                                <c:when test="${am.position==1}">
                                                                    <td >会长</td>
                                                                </c:when>
                                                                <c:when test="${am.position==2}">
                                                                    <td >副会长</td>
                                                                </c:when>
                                                                <c:when test="${am.position==3}">
                                                                    <td >部长</td>
                                                                </c:when>
                                                                <c:when test="${am.position==0}">
                                                                    <td >会员</td>
                                                                </c:when>
                                                            </c:choose>
                                                            <td >${am.description}</td>
                                                            <td>
                                                                <a href="/toAmModify?id=${am.id}" class="btn btn-sm btn-primary">编辑</a>
                                                                <a href="/amDelete?id=${am.id}" class="btn btn-sm btn-danger deleteBtn">删除</a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
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
<jsp:include page="../footer.jsp"/>
</body>
</html>
