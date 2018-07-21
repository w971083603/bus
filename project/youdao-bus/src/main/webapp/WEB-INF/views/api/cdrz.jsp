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
            <a onclick="tzUrl('/api/cdrz')" class="apiTitle" style=" color: #00B83F;">车队入住</a>
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
            <li>
                <input type="text" placeholder="请输入负责人姓名" id="name">
            </li>
            <li>
                <input type="text" placeholder="请输入手机号" id="tel">
            </li>
            <li>
                <textarea type="text" placeholder="请输入车队信息" id="info" style="height: 100px;width: 100%;"></textarea>
            </li>
            <li>
                <div id="ok">保存</div>
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
            var name = $("#name").val();
            if (name == '' || name == null) {
                layer.msg("名字不能为空", {icon: 2});
                return;
            }
            var remarsk = $("#remarsk").val();
            if (remarsk == '' || remarsk == null) {
                layer.msg("信息不能为空", {icon: 2});
                return;
            }
            $.ajax({
                type: "GET",
                url: platform.CONSTS.URL_BASE_CMS + "api/createFleet",
                data: {
                    "tel": tel,
                    "name": name,
                    "remarsk": remarsk
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