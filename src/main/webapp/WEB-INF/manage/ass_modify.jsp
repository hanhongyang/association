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
                    <h3>社团更新</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class=" x_panel">
                        <div class="x_content">
                            <div class="row ">
                                <div class="col-md-12 col-sm-12 col-xs-12 text-center"><!--分类栏-->
                                    <div class="x_content">
                                        <form class="form-horizontal form-label-left" method="post" >
                                            <input id="associationId" name="associationId"value="${ass.associationId}" hidden="hidden"/>
                                            <div class="item form-group">

                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" >会长Id <span
                                                        class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="ownerId" value="${ass.ownerId}" name="ownerId" class="form-control col-md-7 col-xs-12" placeholder=""required="required" type="text">
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" >社团名称 <span
                                                        class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="name" value="${ass.name}" class="form-control col-md-7 col-xs-12" placeholder="" required="required" type="text">
                                                </div>
                                            </div>
                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" >特色活动Id (可以为空)<span
                                                        class="required"></span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="signatureActivity" value="${ass.signatureActivity}" class="form-control col-md-7 col-xs-12" placeholder=""  type="number">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12">社团类型 </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <select id="type"class="select2_single form-control" tabindex="-1">
                                                        <c:choose>
                                                            <c:when test="${ass.type==1}">
                                                                <option value=1>文艺类</option>
                                                                <option value=2>学术类</option>
                                                                <option value=3>公益类</option>
                                                            </c:when>
                                                            <c:when test="${ass.type==2}">
                                                                <option value=2>学术类</option>
                                                                <option value=1>文艺类</option>
                                                                <option value=3>公益类</option>
                                                            </c:when>
                                                            <c:when test="${ass.type==3}">
                                                                <option value=3>公益类</option>
                                                                <option value=1>文艺类</option>
                                                                <option value=2>学术类</option>
                                                            </c:when>
                                                        </c:choose>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" >社团图标 <span
                                                        class="required"></span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12" >

                                                    <div id="zhl_admin_box" class="zhl_admin_update_more">
                                                        <div id="zhl_admin_update">
                                                            <input type="file" id="zhl_admin_file" hidefocus   style="display:none" multiple="multiple">
                                                            <span id="zhl_admin_imgs">

                                                            </span>
                                                            <img src="${ass.logo}" id="zhl_admin_img" onclick="zhl_admin_file.click()" />
                                                        </div>
                                                        <span>最多1张图片</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" >社团介绍 <span
                                                        class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                <textarea id="description" required="required"
                                          class="form-control col-md-7 col-xs-12"date-parsley-maxlength="100">${ass.description}</textarea>
                                                </div>
                                            </div>

                                            <div class="ln_solid"></div>
                                            <div class="form-group">
                                                <div class="col-md-6 col-md-offset-3"style="margin-bottom: 10px;margin-top: 10px">
                                                    <input id="zhl_admin_update_btn" type="button"class="btn btn-success" value="修改"/>
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
<script  type="text/javascript" src="../static/js/main4.js"></script>
</body>
</html>

