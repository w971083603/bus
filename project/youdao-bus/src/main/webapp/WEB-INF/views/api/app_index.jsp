<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../../apiCurrency/topapp.jsp" %>
<body>
<section class="content">
    <div class="margin_div2">
        <div class="app_buttom_ls" onclick="appTz('/api/app_kszc')">快速注册</div>
    </div>
    <div class="margin_div2">
        <a style="color: white;text-decoration: underline;" onclick="appTz('/api/app_login')">已有账号?</a>
        <div class="app_buttom_bs" onclick="appTz('/api/app_login')">手机号登录</div>
    </div>
    <div style="width:100%;text-align: center;padding-top: 1%;" >
        <a style="color: white;text-decoration: underline;" onclick="appTz('/api/app_wjmm')">忘记密码?</a>
    </div>
</section>
</body>
</html>
<!-- jQuery 2.2.3 -->
<%@ include file="../../../apiCurrency/js.jsp" %>