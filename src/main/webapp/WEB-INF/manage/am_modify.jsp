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
                    <h3>成员管理</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class=" x_panel">
                        <div class="x_content">
                            <div class="row ">
                                <div class="col-md-12 col-sm-12 col-xs-12 text-center"><!--分类栏-->
                                    <div class="x_content">
                                        <form class="form-horizontal form-label-left" action="/amModify" >
                                            <div class="item form-group">

                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" >社团名称 <span
                                                        class="required"></span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly" value="${am.name}">
                                                </div>
                                            </div>
                                            <div class="item form-group">

                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" >用户ID <span
                                                        class="required"></span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly" name="userId" value="${am.userId}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" >职位 <span
                                                        class="required"></span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select name="position" class="select2_single form-control" tabindex="-1">
                                                        <c:choose>
                                                            <c:when test="${am.position==1}">
                                                                <option value=1>会长</option>
                                                                <option value=2>副会长</option>
                                                                <option value=3>部长</option>
                                                                <option value=0>会员</option>
                                                            </c:when>
                                                            <c:when test="${am.position==2}">
                                                                <option value=2>副会长</option>
                                                                <option value=1>会长</option>
                                                                <option value=3>部长</option>
                                                                <option value=0>会员</option>
                                                            </c:when>
                                                            <c:when test="${am.position==3}">
                                                                <option value=3>部长</option>
                                                                <option value=1>会长</option>
                                                                <option value=2>副会长</option>
                                                                <option value=0>会员</option>
                                                            </c:when>
                                                            <c:when test="${am.position==0}">
                                                                <option value=1>会员</option>
                                                                <option value=2>副会长</option>
                                                                <option value=3>部长</option>
                                                                <option value=0>会长</option>
                                                            </c:when>
                                                        </c:choose>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="item form-group">

                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" >描述 <span
                                                        class="required"></span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" class="form-control col-md-7 col-xs-12" name="description" value="${am.description}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-6 col-md-offset-3"style="margin-bottom: 10px;margin-top: 10px">
                                                    <button  type="submit"class="btn btn-success">修改</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
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

