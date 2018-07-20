<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../../apiCurrency/top.jsp" %>
<body>
    <div  class="zhsz_div" style="width: 100%">
         <ul>
             <li>
                 <p>我的消息</p>
             </li>
             <table id="table">
                 <tr>
                     <td>
                         <input type="checkbox" id="check">
                     </td>
                     <td>
                         <div class="change change_phone" onclick="">标记所选为已读</div>
                         <div class="change change_password" onclick="">删除所选</div>
                     </td>
                     <td>未读/全部</td>
                 </tr>
             </table>
         </ul>
    </div>
</body>
</html>
<!-- jQuery 2.2.3 -->
<script src="../../../plugins/jQuery/jquery-2.2.3.min.js"></script>
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
                    "type": "3"
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
                type: "POST",
                url: platform.CONSTS.URL_BASE_CMS + "api/updateTel",
                data: {
                    "tel": tel,
                    "code": code,
                    "password":password
                },
                async: false,
                success: function (data) {
                    if (data.success == true) {
                        layer.msg('手机号更换成功！');
                        window.location.href = platform.CONSTS.URL_BASE_API;
                    } else {
                        layer.msg("手机号更换失败", {icon: 2});
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
            $(".ready_password").hide();
        }else{
            $(".ready_tel").hide();
            $(".ready_code").hide();
            $(".ready_oldPassword").show();
            $(".ready_password").show()
        }

    }

</script>