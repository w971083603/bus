<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../../apiCurrency/top.jsp" %>
<body class="api">
    <div class="apiHeader">
        <div class="apiLogoDiv">
            <div class="index_title_one">
                <img src="../../../api/img/web/logo.png" class="index_logimage">
            </div>
            <div class="index_title_two">
                <a onclick="tzUrl('/api/busindex')" class="apiTitle">首页</a>
                <a onclick="tzUrl('/api/fbxc')" class="apiTitle">发布行程</a>
                <a onclick="tzUrl('/api/cdrz')" class="apiTitle">车队入住</a>
                <a onclick="tzUrl('/api/gywm')" class="apiTitle">关于我们</a>
                <a onclick="tzUrl('/api/zxkf')" class="apiTitle">在线客服</a>
            </div>
            <div class="index_title_three">
                <img src="../../../api/img/web/header.png" class="user_head">
                <div class="index_login">
                    <a onclick="tzUrl('/api/login')" class="indexcolor">登陆</a>
                    <span class="indexcolor"> &nbsp;&nbsp;/&nbsp;&nbsp;</span>
                    <a onclick="tzUrl('/api/register')" class="indexcolor">注册</a>
                </div>
            </div>
        </div>
    </div>
    <div class="apiLogoImage">
        <img src="../../../api/img/web/banner.png" width="100%" height="100%">
    </div>
    <div class="contentDiv">
        <div class="contentDiv_one">
               <img src="../../../api/img/web/three.png" style="width: 15%;height: 1px;">
                <span class="indexcolor">始终温暖守护伴你每次出行</span>
                <img src="../../../api/img/web/three.png"  style="width: 10%;height: 1px;">
        </div>
        <div class="contentDiv_two">
            <img src="../../../api/img/web/three_1.png"  style="width: 25%">
            <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <img src="../../../api/img/web/three_2.png"  style="width: 25%">
        </div>
    </div>
    <div class="footer">
        <img src="../../../api/img/web/buttom.png" width="100%" height="100%">
    </div>
</body>
<%@ include file="../../../apiCurrency/js.jsp" %>
<script>

</script>
</html>