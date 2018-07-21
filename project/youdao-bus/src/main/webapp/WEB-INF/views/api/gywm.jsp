<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../../apiCurrency/top.jsp" %>
<body>
<div class="apiHeader">
    <div class="apiLogoDiv">
        <div class="index_title_one">
            <img src="../../../api/img/web/logo.png" class="index_logimage">
        </div>
        <div class="index_title_two">
            <a onclick="tzUrl('/api/busindex')" class="apiTitle">首页</a>
            <a onclick="tzUrl('/api/fbxc')" class="apiTitle">发布行程</a>
            <a onclick="tzUrl('/api/cdrz')" class="apiTitle">车队入住</a>
            <a onclick="tzUrl('/api/gywm')" class="apiTitle" style=" color: #00B83F;">关于我们</a>
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
<div style="width: 100%;margin: 10% 45%;position: absolute;" id="qrcode"></div>
<div class="apiLogoImage">
    <img src="../../../api/img/web/zcbj.png" style="width:100%;height:100%;">
</div>
</body>
</html>
<!-- jQuery 2.2.3 -->
<%@ include file="../../../apiCurrency/js.jsp" %>
<script>
    $(function () {
        $("#qrcode").qrcode({
            render: "table",
            width: 400,
            height:400,
            text: platform.CONSTS.URL_BASE_CMS + "api/busindex"
        });
    });

</script>