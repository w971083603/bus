<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../../apiCurrency/topapp.jsp" %>
<body>
<header>
    <div class="app_title_back"><a class="back" href="javascript:history.back(-1)" ></a> </div>
</header>
<section class="content">
    <div class="margin_div">
        <input type="text" class="app_input" placeholder="请输入位手机号" id="tel">
    </div>
    <div class="margin_div">
        <input type="password" class="app_input" placeholder="请输入密码" id="password">
    </div>
    <div class="margin_div2">
        <div class="app_buttom_ls"  id="ok">登录</div>
    </div>
    <div style="width:100%;text-align: center;padding-top: 1%;" >
        <a style="color: white;text-decoration: underline;" onclick="appTz(url)">忘记密码?</a>
    </div>
</section>
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
//                        window.location.href = platform.CONSTS.URL_BASE_CMS + '/api/fbxc';
                    } else {
                        layer.msg(data.message, {icon: 2});
                        return;
                    }
                }
            });
        });
    });

</script>