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
                    <h3>创建社团</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">


                            <form id="assApplyForm"class="form-horizontal form-label-left" method="post" novalidate  onsubmit="return false" >
                                <input id="ownerId" required="required" type="hidden"value="${userId}">

                                <span class="section">填写社团信息</span>

                                <div class="item form-group">

                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" >社团名称 <span
                                            class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input id="name" class="form-control col-md-7 col-xs-12" placeholder="" required="required" type="text">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">社团类型 </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select id="type"class="select2_single form-control" tabindex="-1">
                                            <option></option>
                                            <option value=1>文艺类</option>
                                            <option value=2>学术类</option>
                                            <option value=3>公益类</option>
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
                                                <img src="/static/images/photo_icon.jpg" id="zhl_admin_img" onclick="zhl_admin_file.click()" />
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
                                          class="form-control col-md-7 col-xs-12"date-parsley-maxlength="100"></textarea>
                                    </div>
                                </div>
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3"style="margin-bottom: 10px;margin-top: 10px">
                                        <input id="zhl_admin_update_btn" type="button"class="btn btn-success" value="提交"/>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>
<!-- /page content -->
<jsp:include page="footer.jsp"/>
<script  type="text/javascript" src="../static/js/main2.js"></script>
</body>
</html>
