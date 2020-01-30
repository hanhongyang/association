<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //获取userId
    Integer userId;
    if(session.getAttribute("userId")!=null) {
         userId = (Integer) session.getAttribute("userId");
    }else
    {
        userId=null;
    }

%>
<div class="col-md-3 left_col menu_fixed">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <a href="/associations" class="site_title"><i class="fa fa-paw"></i> <span>大学社团!</span></a>
        </div>

        <div class="clearfix"></div>

        <!-- menu profile quick info -->
        <div class="profile clearfix">
            <div class="profile_pic">
                <img src="../static/images/img.jpg" alt="..." class="img-circle profile_img">
            </div>
            <c:choose>
            <c:when test="${not empty userId}"><!--控制登录按钮出现-->
            <div class="profile_info">
                <span>欢迎,</span>
                <h2><%=userId%></h2>
            </div>
            </c:when>
            <c:otherwise>
            <div class="profile_info">
                <h3><a href="/"style="color: white;">登录/注册</a></h3>
            </div>
            </c:otherwise>
            </c:choose>
            <div class="clearfix"></div>
        </div>
        <!-- /menu profile quick info -->

        <br />

        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <ul class="nav side-menu">
                    <c:if test="${not empty userId}">
                    <li><a ><i class="fa fa-home"></i> 个人中心 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="/profile">个人信息</a></li>
                            <li><a href="/toEditPassword">密码修改</a></li>
                            <li><a href="/exit">注销</a></li>
                        </ul>
                    </li>
                    </c:if>
                    <li><a><i class="fa fa-edit "></i>近期活动 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="/activities?key=0">所有活动</a></li>
                            <li><a href="/activities?key=1">文体类社团</a></li>
                            <li><a href="/activities?key=2">学术类社团</a></li>
                            <li><a href="/activities?key=3">公益类社团</a></li>
                        </ul>
                    </li>

                    <li style="display:${userType=='1'||userType==null?'none':''} "><a><i class="fa fa-edit"></i>申请 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <c:if test="${userType==2}">
                            <li><a href="/activityApply">活动申请</a></li>
                            </c:if>
                            <c:if test="${userType==0}">
                            <li><a href="/associationApply">创建社团</a></li>
                            </c:if>
                        </ul>
                    </li>
                    <c:if test="${userType==1}">
                    <li><a><i class="fa fa-clone"></i>后台管理 <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="/userManage">用户管理</a></li>
                            <li><a href="/assManage">社团管理</a></li>
                            <li><a href="/applyManage">审核管理</a></li>
                            <li><a href="/newsManage">新闻管理</a></li>
                        </ul>
                    </li>
                    </c:if>
                </ul>
            </div>
        </div>
        <!-- /sidebar menu -->


    </div>
</div>