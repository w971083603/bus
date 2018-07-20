<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../../apiCurrency/top.jsp" %>
<body>
    <div  class="zhsz_div" style="width: 100%">
         <ul>
             <li class="ready ready_tel">
                 <input type="text" placeholder="请输入手机号" id="tel">
             </li>
             <li class="ready ready_tel">
                 <input type="password" placeholder="请输入密码" id="password">
             </li>
             <li class="ready ready_code">
                 <input type="text" placeholder="请输入验证码" id="code">

                 <button   id="send">发送验证码</button>
             </li>

             <li class="ready">
                 <input type="hidden" id="type" value="1"/>
                 <button   id="ok">注册</button>
             </li>
         </ul>
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
                url: platform.CONSTS.URL_BASE_CMS + "api/ownRegister",
                data: {
                    "tel": tel,
                    "code": code,
                    "type":$("#type").val(),
                    "password":password
                },
                async: false,
                success: function (data) {
                    if (data.success == true) {
                        layer.msg('注册成功！');
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