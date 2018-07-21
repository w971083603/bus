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
<div  class="zc_div" >
    <div class="zc_div_title" >账号登录</div>
    <div style="width: 60%;height: 100%;margin:0 auto;">
        <ul>
            <input type="hidden" id="type" value="1">
            <li>
               <p style="color: red;font-size: 14px;">*请输入手机号和密码登录</p>
            </li>
            <li>
                <input type="text" placeholder="请输入手机号" id="tel">
            </li>
            <li>
                <input type="password" placeholder="请输入密码" id="password">
            </li>
            <li>
                <a onclick="tzUrl('/api/forgetpassword')" style="display: block;float: left;height: 45px;color: #0f0f0f;">忘记密码</a>

                <a onclick="tzUrl('/api/register')" style="display: block;float: right;height: 45px;color: #0f0f0f;">注册新账号</a>
            </li>
            <li>
                <div id="ok">登录</div>
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
                    "type":$("#type").val(),
                    "password":password
                },
                async: false,
                success: function (data) {
                    if (data.success == true) {
                        layer.msg('登录成功！');
                        // window.location.href = platform.CONSTS.URL_BASE_API;
                    } else {
                        layer.msg(data.message, {icon: 2});
                        return;
                    }
                }
            });
        });
    });

</script>