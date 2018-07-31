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
        <input type="text" class="app_input" placeholder="请输入验证码" id="code">
        <div class="app_buttom_ls_one"  id="send">获取验证码</div>
    </div>
    <div class="margin_div">
        <input type="password" class="app_input" placeholder="请输入密码" id="password">
    </div>
    <div class="margin_div">
        <input type="password" class="app_input" placeholder="请再次输入密码" id="password_again">
    </div>
    <div class="margin_div2">
        <div class="app_buttom_ls" id="ok">完成</div>
    </div>
</section>
</body>
</html>
<!-- jQuery 2.2.3 -->
<%@ include file="../../../apiCurrency/js.jsp" %>
<script>
    $(function () {
        $("#send").click(function () {
            var tel = $("#tel").val();
            if (tel == '' || tel == null) {
                layer.msg("手机号不能为空", {icon: 2});
                return;
            }
            $.ajax({
                type: "POST",
                url: platform.CONSTS.URL_BASE_CMS + "api/getCode",
                data: {
                    "tel": tel,
                    "type":"1",
                    "smsType": "2"
                },
                async: false,
                success: function (data) {
                    console.log(data);
                    if (data.success == true) {
                        layer.msg('短信发送成功！');
                        settime();
                    } else {
                        layer.msg(data.message, {icon: 2});
                        return;
                    }
                }
            });
        });
        $("#ok").click(function () {
            var tel = $("#tel").val();
            if (tel == '' || tel == null) {
                layer.msg("手机号不能为空", {icon: 2});
                return;
            }
            var code = $("#code").val();
            if (code == '' || code == null) {
                layer.msg("验证码不能为空", {icon: 2});
                return;
            }
            var password = $("#password").val();
            if (password == '' || password == null) {
                layer.msg("密码不能为空", {icon: 2});
                return;
            }
            var password_again = $("#password_again").val();
            if (password_again == '' || password_again == null) {
                layer.msg("再次输入密码不能为空", {icon: 2});
                return;
            }
            if(password_again != password){
                layer.msg("两次密码输入不一致，请重新输入", {icon: 2});
                return;
            }
            $.ajax({
                type: "POST",
                url: platform.CONSTS.URL_BASE_CMS + "api/forgetPassword",
                data: {
                    "tel": tel,
                    "code": code,
                    "type":"1",
                    "password":password
                },
                async: false,
                success: function (data) {
                    if (data.success == true) {
                        layer.msg('修改成功！');
                        window.location.href = platform.CONSTS.URL_BASE_CMS + '/api/app_login';
                    } else {
                        layer.msg(data.message, {icon: 2});
                        return;
                    }
                }
            });
        });

        //验证码倒计时
        var countdown=60;
        function settime() {
            if (countdown == 0) {
                $("#send").attr("disabled");
                $("#send").html( "重新获取验证码") ;
                countdown = 60;
            } else {
                $("#send").attr("disabled", true);
                $("#send").html("重新发送(" + countdown + ")");
                countdown--;
                setTimeout(function () {
                    settime()
                }, 1000)
            }
        }
    });

</script>