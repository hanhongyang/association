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
                    <h3>社团管理</h3>
                    <a href="/toAddAss" class="btn btn-sm btn-primary">创建社团</a>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class=" x_panel">
                        <div class="x_content">
                            <div class="row ">
                                <div class="col-md-12 col-sm-12 col-xs-12 text-center"><!--分类栏-->
                                    <ul class="nav nav-tabs nav-justified">
                                        <li role="presentation" class="${bar == 1  ? 'active':''}"><a href="/assManage?bar=1">社团列表</a></li>
                                        <li role="presentation"class="${bar == 2  ? 'active':''}"><a href="/assManage?bar=2">社团活动</a></li>
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
                                                    <c:forEach var="ass" items="${assList}">
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
                                                            <td>
                                                                <c:if test="${ass.associationStatus==1}">
                                                                    <a href="/toAddAct?associationId=${ass.associationId}" class="btn btn-sm btn-primary">创建活动</a>
                                                                </c:if>
                                                                <a href="/toAssModify?associationId=${ass.associationId}" class="btn btn-sm btn-primary">编辑</a>
                                                                <a href="/assDelete?associationId=${ass.associationId}" class="btn btn-sm btn-danger deleteBtn">删除</a>
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
                                                    <c:forEach var="act" items="${actList}">
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
                                                                <a href="/toActModify?activityId=${act.activityId}" class="btn btn-sm btn-primary">编辑</a>
                                                                <a href="/actDelete?activityId=${act.activityId}" class="btn btn-sm btn-danger deleteBtn">删除</a>
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
