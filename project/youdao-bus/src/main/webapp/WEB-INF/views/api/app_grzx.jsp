<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../../apiCurrency/topapp.jsp" %>
<body>
<header class="ptm-bar ptm-bar-nav  ptm-fix">
    <div class="ptm-title">用户中心</div>
    <a class="ptm-pull-right" onclick="appTz('/api/app_loginout')">注销</a>
</header>
<div class="ptm-content my-header" style="margin-top:40px;">
    <div class="my-info">
        <img src="${empty sessionScope.headerUrl || sessionScope.headerUrl eq ''?'../../../api/img/web/header.png':sessionScope.headerUrl}">
    </div>
</div>
<div class="ptm-content ptm-card">
    <ul class="ptm-list-view">
        <li class="ptm-list-view-cell">
            <a class="ptm-arrow-right" href="javascript:void(0)/user/history/index.html">浏览历史</a>
        </li>
    </ul>
</div>
</body>
</html>
<!-- jQuery 2.2.3 -->
<%@ include file="../../../apiCurrency/js.jsp" %>
<script>
    $(function () {
        $("#ok").click(function () {
            var tel = $("#tel").val();
            if (tel == '' || tel == null) {
                layer.msg("手机号不能为空", {icon: 2});
                return;
            }
            var password = $("#password").val();
            if (password == '' || password == null) {
                layer.msg("密码不能为空", {icon: 2});
                return;
            }
            $.ajax({
                type: "POST",
                url: platform.CONSTS.URL_BASE_CMS + "api/login",
                data: {
                    "tel": tel,
                    "type" : "1",
                    "password":password
                },
                async: false,
                success: function (data) {
                    if (data.success == true) {
                        layer.msg('登录成功！');
                        window.location.href = platform.CONSTS.URL_BASE_CMS + '/api/app_grzx';
                    } else {
                        layer.msg(data.message, {icon: 2});
                        return;
                    }
                }
            });
        });
    });

</script>