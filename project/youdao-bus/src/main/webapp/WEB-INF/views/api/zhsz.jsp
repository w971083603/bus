<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../../apiCurrency/top.jsp" %>
<body>
    <div  class="zhsz_div" style="width: 100%">
         <ul>
             <li>
                 <p class="zhszTitel">操作类型</p>
             </li>
             <hr class="hr" align="left"/>
             <li>
                 <div class="change change_phone zhszType" onclick="changediv(this,'1')">更换手机</div>
                 <div class="change change_password zhszType" onclick="changediv(this,'2')">修改密码</div>
             </li>
             <li class="ready ready_tel">
                 <input type="text" class="zhszInput" placeholder="请输入手机号" id="tel">
             </li>
             <li class="ready ready_code">
                 <div>
                     <input type="text" class="zhszInputYzm" placeholder="请输入验证码" id="code">
                     <button class="zhszSend" id="send">发送验证码</button>
                 </div>

             </li>


             <li class="ready ready_oldPassword">
                 <input type="password" class="zhszInput" placeholder="请输入旧密码" id="oldPassword">
             </li>
             <li class="ready">
                 <input type="password" class="zhszInput" placeholder="请输入新密码" id="password">
             </li>

             <li class="ready ready_newPassword">
                 <input type="password" class="zhszInput" placeholder="确认密码" id="newPassword">
             </li>

             <li class="ready">
                 <input type="hidden" class="_type" />
                 <button  class="zhszOk" id="ok">确认</button>
             </li>
         </ul>
    </div>
</body>
</html>
<!-- jQuery 2.2.3 -->
<%@ include file="../../../apiCurrency/js.jsp" %>
<script>
    var updateType = 1;
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
                    "smsType": "3"
                },
                async: false,
                success: function (data) {
                    if (data.success == true) {
                        layer.msg('短信发送成功！');
                    } else {
                        layer.msg("短信发送失败", {icon: 2});
                        return;
                    }
                }
            });
        });

        $("#ok").click(function () {
            var data;
            var message;
            var url;
            if (updateType == 2) {
                var oldPassword = $("#oldPassword").val();
                if (oldPassword == '' || oldPassword == null) {
                    layer.msg("旧密码不能为空", {icon: 2});
                    return;
                }
                var password = $("#password").val();
                if (password == '' || password == null) {
                    layer.msg("新密码不能为空", {icon: 2});
                    return;
                }
                var newPassword = $("#newPassword").val();
                if (newPassword == '' || newPassword == null) {
                    layer.msg("确认密码不能为空", {icon: 2});
                    return;
                }
                data = {
                    "oldPassword": oldPassword,
                    "password": password,
                    "newPassword":newPassword
                };
                message = "密码更新成功";
                url = platform.CONSTS.URL_BASE_CMS + "api/updatePassword";
            } else if(updateType == 1) {
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
                data = {
                    "tel": tel,
                    "code": code,
                    "password":password
                };
                message = "手机号更换成功";
                url = platform.CONSTS.URL_BASE_CMS + "api/updateTel";
            }
            $.ajax({
                type: "POST",
                url: url,
                data: data,
                async: false,
                success: function (data) {
                    if (data.success == true) {
                        layer.msg(message);
                        window.location.href = platform.CONSTS.URL_BASE_API;
                    } else {
                        layer.msg(data.message, {icon: 2});
                        return;
                    }
                }
            });
        });

        $(".change_phone").click();
    });

    function changediv(obj,type) {
        $(".change").css("background-color","#fcfffb");
        $(obj).css("background-color","#06dc00");
        $(".ready").show();
        if(type == "1"){
            $(".ready_tel").show();
            $(".ready_code").show();
            $(".ready_oldPassword").hide();
            $(".ready_password").hide();
            $(".ready_newPassword").hide();
            updateType = 1;

        }else{
            $(".ready_tel").hide();
            $(".ready_code").hide();
            $(".ready_oldPassword").show();
            updateType = 2;
        }

    }

</script>