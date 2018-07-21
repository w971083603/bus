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
            <c:if test="${empty sessionScope.uuid}" >
                <div class="index_login">
                    <a onclick="tzUrl('/api/login')" class="indexcolor">登陆</a>
                    <span class="indexcolor"> &nbsp;&nbsp;/&nbsp;&nbsp;</span>
                    <a onclick="tzUrl('/api/register')" class="indexcolor">注册</a>
                </div>
            </c:if>
            <c:if test="${!empty sessionScope.uuid}" >
                <img src="${sessionScope.headerUrl}" class="user_head">
                <div class="index_login">
                    <a onclick="tzUrl('/api/busown')" class="indexcolor">${sessionScope.nickname}</a>
                    <span class="indexcolor"> &nbsp;&nbsp;/&nbsp;&nbsp;</span>
                    <a onclick="tzUrl('/api/loginout')" class="indexcolor">退出</a>
                </div>
            </c:if>
        </div>
    </div>
</div>
<div  class="zc_div" >
    <div class="zc_div_title" >账号注册</div>
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
                <input type="password" placeholder="请输入密码" id="password">
            </li>
            <li style="font-size: 12px;">
                <input type="checkbox"> 我已同意<a  href="#" style="color: red;">《就道巴士服务协议》</a>
            </li>
            <li>
                <div id="ok">注册</div>
            </li>
            <li style="font-size: 12px;">
                已有账号？<a  onclick="tzUrl('/api/login')" style="color: red;">立即登录</a>
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
                    "type":"1",
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
                url: platform.CONSTS.URL_BASE_CMS + "api/ownRegister",
                data: {
                    "tel": tel,
                    "code": code,
                    "type":"1",
                    "password":password
                },
                async: false,
                success: function (data) {
                    if (data.success == true) {
                        layer.msg('注册成功！');
                        setTimeout(function () {
                            window.location.href = platform.CONSTS.URL_BASE_CMS + '/api/login';
                        }, 3000);
                    } else {
                        layer.msg(data.message, {icon: 2});
                        return;
                    }
                }
            });
        });
    });

</script>