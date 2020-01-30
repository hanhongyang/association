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
                    <h3>审核管理</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class=" x_panel">
                        <div class="x_content">
                            <div class="row ">
                                <div class="col-md-12 col-sm-12 col-xs-12 text-center"><!--分类栏-->
                                    <ul class="nav nav-tabs nav-justified">
                                        <li role="presentation" class="${bar == 1  ? 'active':''}"><a href="/appplyManage?bar=1">活动申请</a></li>
                                        <li role="presentation"class="${bar == 2  ? 'active':''}"><a href="/applyManage?bar=2">创建社团申请</a></li>
                                    </ul>
                                    <!--主要内容-->
                                    <c:choose>
                                        <c:when test="${bar==1}">
                                            <div class="x_content">
                                                <table class="table table-striped projects">
                                                    <thead>
                                                    <tr>
                                                        <th style="width: 20%">活动Id</th>
                                                        <th>标题</th>
                                                        <th>介绍</th>
                                                        <th>社团</th>
                                                        <th>开始时间</th>
                                                        <th>结束时间</th>
                                                        <th>地点</th>
                                                        <th>资金</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach var="act" items="${actApplyList}">
                                                        <tr >
                                                            <td >${act.activityId}</td>
                                                            <td >${act.title}</td>
                                                            <td >${act.description}</td>
                                                            <td >${act.name}</td>
                                                            <td >${act.startTime}</td>
                                                            <td >${act.endTime}</td>
                                                            <td >${act.location}</td>
                                                            <td >${act.material}</td>
                                                            <td>
                                                                <a href="/actPicture?activityId=${act.activityId}" class="btn btn-sm btn-primary">查看图片</a>
                                                                <a href="/actApplyPass?activityId=${act.activityId}" class="btn btn-sm btn-primary">通过申请</a>
                                                                <a href="/actApplyRefuse?activityId=${act.activityId}" class="btn btn-sm btn-danger deleteBtn">拒绝申请</a>
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
                                                        <th>社团名称</th>
                                                        <th>类型</th>
                                                        <th>会长</th>
                                                        <th>介绍</th>
                                                        <th>logo</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach var="ass" items="${assApplyList}">
                                                        <tr >
                                                            <td >${ass.name}</td>
                                                            <c:if test="${ass.type==1}">
                                                                <td >文艺类社团</td>
                                                            </c:if>
                                                            <c:if test="${ass.type==2}">
                                                                <td >学术类社团</td>
                                                            </c:if>
                                                            <c:if test="${ass.type==3}">
                                                                <td >公益类社团</td>
                                                            </c:if>
                                                            <td >${ass.ownerId}</td>
                                                            <td >${ass.description}</td>
                                                            <td ><img class="img-circle img-responsive"src="${ass.logo}"style="height: 100px;width: 100px"></td>
                                                            <td><a href="/assApplyPass?associationId=${ass.associationId}" class="btn btn-sm btn-primary">通过申请</a>
                                                                <a href="/assApplyRefuse?associationId=${ass.associationId}" class="btn btn-sm btn-danger deleteBtn">拒绝申请</a>
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

