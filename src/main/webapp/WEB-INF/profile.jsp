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
                    <h3>个人信息</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class=" x_panel">
                        <div class="x_content">
                            <div class="row ">
                                <div class="col-md-12 col-sm-12 col-xs-12 text-center"><!--分类栏-->
                                    <ul class="nav nav-tabs nav-justified">
                                        <c:if test="${userType==0}">
                                            <li role="presentation" class="${bar == 1  ? 'active':''}"><a href="/assJoin?bar=1">你加入的社团</a></li>
                                        </c:if>
                                        <c:if test="${userType==2}">
                                            <li role="presentation" class="${bar == 2  ? 'active':''}"><a href="/assCreate?bar=2">你创建的社团</a></li>
                                        </c:if>
                                    </ul>
                                    <!--主要内容-->
                                    <c:choose>
                                        <c:when test="${bar==1}">
                                            <div class="x_content">
                                                <table class="table table-striped projects">
                                                    <thead>
                                                    <tr>
                                                        <th style="width: 8%">社团Id</th>
                                                        <th>名称</th>
                                                        <th style="width: 5%">社团状态</th>
                                                        <th >创建时间</th>
                                                        <th style="width: 5%">类型</th>
                                                        <th style="width: 40%">介绍</th>
                                                        <th style="width: 5%">会长Id</th>
                                                        <th style="width: 8%">特色活动Id</th>
                                                        <th style="width: 10%">logo</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach var="ass" items="${assJoin}">
                                                        <tr >
                                                            <td>${ass.associationId}</td>
                                                            <td >${ass.name}</td>
                                                            <c:choose>
                                                                <c:when test="${ass.associationStatus==1}">
                                                                    <td >已创建</td>
                                                                </c:when>
                                                                <c:when test="${ass.associationStatus==0}">
                                                                    <td >未审核</td>
                                                                </c:when>
                                                                <c:when test="${ass.associationStatus==2}">
                                                                    <td >已拒绝</td>
                                                                </c:when>
                                                            </c:choose>
                                                            <c:if test="${not empty ass.createTime}">
                                                                <td >${ass.createTime}</td>
                                                            </c:if>
                                                            <c:if test="${empty ass.createTime}">
                                                                <td >无创建时间</td>
                                                            </c:if>
                                                            <c:if test="${ass.type==1}">
                                                                <td >文艺类社团</td>
                                                            </c:if>
                                                            <c:if test="${ass.type==2}">
                                                                <td >学术类社团</td>
                                                            </c:if>
                                                            <c:if test="${ass.type==3}">
                                                                <td >公益类社团</td>
                                                            </c:if>
                                                            <td >${ass.description}</td>
                                                            <td >${ass.ownerId}</td>
                                                            <td >${ass.signatureActivity}</td>
                                                            <td ><img class="img-circle img-responsive"src="${ass.logo}"style="height: 100px;width: 100px"></td>
                                                        </tr>
                                                    </c:forEach>
                                                    <c:if test="${empty assJoin}">
                                                        <div>
                                                            <h2>没有哦！</h2>
                                                        </div>
                                                    </c:if>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </c:when>
                                        <c:when test="${bar==2}">
                                            <div class="x_content">
                                                <table class="table table-striped projects">
                                                    <thead>
                                                    <tr>
                                                        <th style="width: 8%">社团Id</th>
                                                        <th>名称</th>
                                                        <th style="width: 5%">社团状态</th>
                                                        <th >创建时间</th>
                                                        <th style="width: 5%">类型</th>
                                                        <th style="width: 40%">介绍</th>
                                                        <th style="width: 5%">会长Id</th>
                                                        <th style="width: 8%">特色活动Id</th>
                                                        <th style="width: 10%">logo</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr >
                                                            <td>${assCreate.associationId}</td>
                                                            <td >${assCreate.name}</td>
                                                            <c:choose>
                                                                <c:when test="${assCreate.associationStatus==1}">
                                                                    <td >已创建</td>
                                                                </c:when>
                                                                <c:when test="${assCreate.associationStatus==0}">
                                                                    <td >未审核</td>
                                                                </c:when>
                                                                <c:when test="${assCreate.associationStatus==2}">
                                                                    <td >已拒绝</td>
                                                                </c:when>
                                                            </c:choose>
                                                            <c:if test="${not empty assCreate.createTime}">
                                                                <td >${assCreate.createTime}</td>
                                                            </c:if>
                                                            <c:if test="${empty assCreate.createTime}">
                                                                <td >无创建时间</td>
                                                            </c:if>
                                                            <c:if test="${assCreate.type==1}">
                                                                <td >文艺类社团</td>
                                                            </c:if>
                                                            <c:if test="${assCreate.type==2}">
                                                                <td >学术类社团</td>
                                                            </c:if>
                                                            <c:if test="${assCreate.type==3}">
                                                                <td >公益类社团</td>
                                                            </c:if>
                                                            <td >${assCreate.description}</td>
                                                            <td >${assCreate.ownerId}</td>
                                                            <td >${assCreate.signatureActivity}</td>
                                                            <td ><img class="img-circle img-responsive"src="${assCreate.logo}"style="height: 100px;width: 100px"></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <c:if test="${empty assCreate}">
                                                    <div>
                                                        <h2>没有哦！</h2>
                                                    </div>
                                                </c:if>
                                                <h3>申请的活动</h3>
                                                <table class="table table-striped projects">
                                                    <thead>
                                                    <tr>
                                                        <th style="width: 8%">活动Id</th>
                                                        <th style="width: 8%">社团名称</th>
                                                        <th style="width: 8%">活动名称</th>
                                                        <th >活动介绍</th>
                                                        <th style="width: 8%">活动状态</th>
                                                        <th >开始时间</th>
                                                        <th >结束时间</th>
                                                        <th >地点</th>
                                                        <th >物资</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach var="act" items="${actApply}">
                                                        <tr >
                                                            <td >${act.activityId}</td>
                                                            <td >${act.name}</td>
                                                            <td >${act.title}</td>
                                                            <td >${act.description}</td>
                                                            <c:if test="${act.activityStatus==1}">
                                                                <td >已通过</td>
                                                            </c:if>
                                                            <c:if test="${act.activityStatus==2}">
                                                                <td >已拒绝</td>
                                                            </c:if>
                                                            <c:if test="${act.activityStatus==0}">
                                                                <td >审核中</td>
                                                            </c:if>
                                                            <td >${act.startTime}</td>
                                                            <td >${act.endTime}</td>
                                                            <td >${act.location}</td>
                                                            <td >${act.material}</td>
                                                            <td>
                                                                <a href="/actPicture?activityId=${act.activityId}" class="btn btn-sm btn-primary">查看图片</a>
                                                            </td>
                                                        </tr>
                                                        <c:if test="${empty actApply}">
                                                            <div>
                                                                <h2>没有哦！</h2>
                                                            </div>
                                                        </c:if>
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
<jsp:include page="footer.jsp"/>
<script  type="text/javascript" src="../static/js/main4.js"></script>
</body>
</html>

