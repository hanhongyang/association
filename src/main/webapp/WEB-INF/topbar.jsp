<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/12/5
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    window.onload=function() {
        $.ajax({
            type: "GET",
            url: "/news",
            success: function (lastNews) {
                //获取div
                var div = document.getElementById("div2");
                for(var i=0;i<lastNews.length;i++){
                    //h
                    var h=document.createElement("h4");
                    var title=lastNews[i].title
                    h.innerHTML=title;

                    //a
                    var a = document.createElement("a");
                    a.appendChild(h)
                    var href='/newsDetail?id='
                    href=href+lastNews[i].id
                    a.href = href;
                    div.appendChild(a)
                }
            }
        })
    }
</script>
<!-- top navigation -->
<div class="top_nav">
    <div class="nav_menu">
        <div class="title_right" style="padding-top: 5px">
            <!--新闻轮播-->
            <div style="display: inline-block;position: absolute;left: 300px;top: 20px;">
                <img src="../static/images/news.png" width="20">
            </div>
            <div style="display: inline-block">
                <h3 style="vertical-align: inherit;position: absolute;left: 330px;top: 5px;"> 社联新闻：
                </h3>
            </div>
            <div class="col-md-7 col-sm-7 col-xs-12 div1" style="display: inline-block">
                <div class="div2 "id="div2">

                </div>
            </div>
            <!--新闻轮播/-->
            <div class="col-md-3 col-sm-3 col-xs-12 form-group pull-right top_search">
                <!--搜索-->
                <!--<div class="input-group">
                    <input type="text" class="form-control" placeholder="搜索">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                </div>
                -->
            </div>
        </div>
    </div>
</div>
<!-- /top navigation -->
