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
            <a href="company.jsp" class="apiTitle">首页</a>
            <a href="company.jsp" class="apiTitle">发布行程</a>
            <a href="company.jsp" class="apiTitle">车队入住</a>
            <a href="company.jsp" class="apiTitle">关于我们</a>
            <a href="company.jsp" class="apiTitle">在线客服</a>
        </div>
        <div class="index_title_three">
            <img src="../../../api/img/web/header.png" class="user_head">
            <div class="index_login">
                <a href="company.jsp" class="indexcolor">13616524441</a>
                <span class="indexcolor"> &nbsp;&nbsp;/&nbsp;&nbsp;</span>
                <a href="company.jsp" class="indexcolor">退出</a>
            </div>
        </div>
    </div>
</div>
<div  class="zc_div" >
    <div class="zc_div_title" >忘记密码</div>
    <div style="width: 60%;height: 100%;margin:0 auto;">
        <ul>
            <li>
                <input type="text" placeholder="请输入手机号" id="tel">
            </li>
            <li>
                <input type="text" placeholder="请输入验证码" id="code" style="width: 54%;">

                <span   id="send">发送验证码</span>
            </li>
            <li>
                <input type="password" placeholder="请输入新密码" id="password">
            </li>
            <li>
                <div id="ok">确认提交</div>
            </li>
            <li style="font-size: 12px;">
                <a  href="#" style="color: red;">立即登录</a>
            </li>
        </ul>
    </div>
</div>
<div class="apiLogoImage">
    <img src="../../../api/img/web/zcbj.png" style="width:100%;height:100%;">
</div>
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
                    "type":$("#type").val(),
                    "smsType": "1"
                },
                async: false,
                success: function (data) {
                    console.log(data);
                    if (data.success == true) {
                        layer.msg('短信发送成功！');
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
            $.ajax({
                type: "GET",
                url: platform.CONSTS.URL_BASE_CMS + "api/forgetPassword",
                data: {
                    "tel": tel,
                    "code": code,
                    "type":$("#type").val(),
                    "password":password
                },
                async: false,
                success: function (data) {
                    if (data.success == true) {
                        layer.msg('修改成功！');
//                         window.location.href = platform.CONSTS.URL_BASE_API;
                    } else {
                        layer.msg(data.message, {icon: 2});
                        return;
                    }
                }
            });
        });
    });

</script>