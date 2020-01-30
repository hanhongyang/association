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
                    <h3>列表</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class=" x_panel">
                        <div class="x_content">
                            <div class="row "><!--社团列表 -->
                                <div class="col-md-9 col-sm-9 col-xs-9 text-center"><!--社团分类栏-->
                                    <ul class="nav nav-tabs nav-justified">
                                        <li role="presentation" class="${type == 1  ? 'active':''}"><a href="/associations?type=1">文体类社团</a></li>
                                        <li role="presentation"class="${type == 2  ? 'active':''}"><a href="/associations?type=2">学术类社团</a></li>
                                        <li role="presentation"class="${type == 3  ? 'active':''}"><a href="/associations?type=3">公益类社团</a></li>
                                    </ul>
                                    <div class="clearfix"></div>
                                    <c:forEach items="${associationsList}" var="association">
                                        <div>
                                            <div class="col-md-6 profile_details" style="padding-top: 10px">
                                                <div class="well profile_view">
                                                    <a href="/association?associationId=${association.associationId}" >
                                                        <div class="col-sm-12">
                                                            <h4 class="brief"><i>${association.name}</i></h4>
                                                            <div class="left col-xs-7">
                                                                <h2 text="">${association.name}</h2>

                                                                <p text=""style="word-wrap:break-word;width:225px;height:57px;overflow:hidden;">
                                                                    <strong>简介： </strong> ${association.description}
                                                                </p>
                                                            </div>
                                                            <div class="right col-xs-5 text-center">
                                                                <img src="${association.logo}" alt=""
                                                                     class="img-circle img-responsive">
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <div class="col-xs-12 bottom text-center">
                                                        <div class="col-xs-12 col-sm-6 emphasis">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div><!--社团分类栏/-->
                                <div class="row">
                                    <div class="col-md-3 col-sm-3 col-xs-3"><!--近期活动 -->
                                        <div>
                                            <div class="x_title">
                                                <h2>近期活动</h2>
                                                <div class="clearfix"></div>
                                            </div>
                                            <ul class="list-unstyled top_profiles scroll-view">
                                                <c:forEach items="${lastActivity}" var="theActivity">
                                                <li class="media event">
                                                    <a class="pull-left border-aero profile_thumb">
                                                        <i class="fa fa-user aero"></i>
                                                    </a>
                                                    <div class="media-body">
                                                        <a class="title" href="#">${theActivity.title}</a>
                                                        <p><strong>地点 </strong> ${theActivity.location} </p>
                                                        <p>
                                                            <small>${theActivity.startTime}</small>
                                                        </p>
                                                    </div>
                                                </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div><!--近期活动/ -->
                                </div>
                            </div>
                            <!--社团列表/ -->
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
</div>
<!-- /page content -->
<jsp:include page="../footer.jsp"/>
</body>
</html>
