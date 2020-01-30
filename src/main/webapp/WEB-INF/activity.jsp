<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
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
<%@ page import="com.example.association2.model.Activity" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>

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
                    <h3>列表</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class=" x_panel">
                        <div class="x_content">
                            <div id="datatable_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <table id="datatable"
                                               class="table table-striped table-bordered dataTable no-footer"
                                               role="grid" aria-describedby="datatable_info">
                                            <thead>
                                            <tr role="row">
                                                <th class="sorting_asc" tabindex="0" aria-controls="datatable"
                                                    rowspan="1" colspan="1" aria-sort="ascending"
                                                    aria-label="Name: activate to sort column descending"
                                                    style="width: 189px;">社团
                                                </th>
                                                <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1"
                                                    colspan="1" aria-label="Position: activate to sort column ascending"
                                                    style="width: 300px;">标题
                                                </th>
                                                <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1"
                                                    colspan="1" aria-label="Office: activate to sort column ascending"
                                                    style="width: 140px;">开始时间
                                                </th>
                                                <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1"
                                                    colspan="1" aria-label="Age: activate to sort column ascending"
                                                    style="width: 140px;">结束时间
                                                </th>
                                                <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1"
                                                    colspan="1"
                                                    aria-label="Start date: activate to sort column ascending"
                                                    style="width: 309px;">地点
                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="activity" items="${activityList}">
                                            <tr role="row" class="${activity.associationId%2==1?'odd':'even'}">
                                                <td class="">${activity.name}</td>
                                                <td class="sorting_1">${activity.title}</td>
                                                <td>${activity.startTime}</td>
                                                <td>${activity.endTime}</td>
                                                <td class="">${activity.location}</td>
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
</div>
</div>
</div>
</div>
<!-- /page content -->
<jsp:include page="footer.jsp"/>
</body>
</html>

