<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../../apiCurrency/topapp.jsp" %>
<body style=" background: none;  background-color: #fbfbfb; ">
<header class="ptm-bar ptm-bar-nav  ptm-fix">
    <a class="back ptm-pull-left" onclick="appTz('/api/app_grzx')"  style="margin: 16px;"></a>
    <div class="ptm-title">详细信息</div>
    <a class="ptm-pull-right"></a>
</header>
<div class="ptm-content my-header" style="margin-top:40px;">
    <div class="my-info" id="headerUrl" onclick="changeImage('headerUrl')">
        <img class="headerUrl img-thumbnail" src="../../../api/img/web/header.png"  layer-src="../../../api/img/web/header.png" >
    </div>
    <input type="hidden" class="form-control QheaderUrl" name="headerUrl"/>
</div>
<div class="ptm-content ptm-card">
    <ul class="ptm-list-view">
        <li class="ptm-list-view-cell">
            昵称 <input type="text" value="" class="xxxx_right" id="nickname">
        </li>
        <li class="ptm-list-view-cell">
            性别
            <select id="grzl_xb" style=" -webkit-appearance: none;width: 56px; " class="xxxx_right">
                <option value="先生">先生</option>
                <option value="女士">女士</option>
                <option value="保密">保密</option>
            </select>
        </li>
        <li class="ptm-list-view-cell">
            生日 <input type="text" class="grzlInput xxxx_right" value="" id="birthday" >
        </li>
        <li class="ptm-list-view-cell">
            邮箱 <input type="email" value="" class="xxxx_right"  id="email">
        </li>
        <%--<li class="ptm-list-view-cell">--%>
        <%--信用值 <span></span>--%>
        <%--</li>--%>
        <li class="ptm-list-view-cell">
            <div class="app_buttom_ls"  id="ok" style="background-color: #11161b; border: #11161b;">修改</div>
        </li>
    </ul>
</div>
<form class="form-horizontal" id="imageForm" enctype="multipart/form-data" method="post">
    <input type="file" class="upLoadImage" name="upLoadImage" style="display: none" onchange="downImage(this)"
           multiple="multiple"/>
</form>
</body>
</html>
<!-- jQuery 2.2.3 -->
<%@ include file="../../../apiCurrency/js.jsp" %>
<script>
    $(function () {
        detailUser();
        $('#birthday').datepicker({
            language: "zh-CN", //语言
            todayHighlight: true, //是否今日高亮
            format: 'yyyy-mm-dd', //点击月份后显示在input中的格式
            autoclose: true //是否开启自动关闭
            /* startView: 'months', //开始视图层，为月视图层
             maxViewMode: 'years', //最大视图层，为年视图层
             minViewMode: 'months' //最小视图层，为月视图层*/
        });
        $("#ok").click(function () {
            var nickname = $("#nickname").val();
            if (nickname == '' || nickname == null) {
                layer.msg("昵称不能为空", {icon: 2});
                return;
            }
            var sex = $("#grzl_xb").val();
            $.ajax({
                type: "POST",
                url: platform.CONSTS.URL_BASE_CMS + "api/updateUser",
                data: {
                    "nickname": nickname,
                    "email":$("#email").val(),
                    "sex":sex,
                    "headerUrl":$(".QheaderUrl").val(),
                    "birthday":$("#birthday").val()
                },
                async: false,
                success: function (data) {
                    if (data.success == true) {
                        layer.msg('个人资料修改成功！');
                    } else {
                        layer.msg(data.message, {icon: 2});
                        return;
                    }
                }
            });
        });
    });

    var classId = "";
    //上传按钮点击
    function changeImage(value) {
        classId = value;
        $(".upLoadImage").click();
    }
    //判断图片是否符合格式-图片大小
    function validaImage(obj) {
        var filename = /\.[^\.]+$/.exec(obj.value);
        if ('.gif.png.jpg.jpeg'.indexOf(filename) < 0 && '.GIF.PNG.JPG.JPEG'.indexOf(filename) < 0) {
            alert("请上传照片gif,png,jpg,jpeg格式");
            return false;
        } else {
            if (((obj.files[0].size).toFixed(2)) >= (1 * 1024 * 1024)) {
                alert("请上传小于1M的图片");
                return false;
            }
        }
        return true;
    }

    //订单详情循环展示图片
    function showImageS(classId,backurl) {
        if(backurl == null || backurl == ""){
            backurl = "../../../api/img/web/header.png";
        }
        $("#" + classId).empty();
        var imgs = backurl.split(",");
        for (var i = 0; i < imgs.length; i++) {
            if (imgs[i] == "") continue;
            var str = "<img class='" + classId + " img-thumbnail' style='height: 80px;'" +
                " layer-src='" + imgs[i] + "' src='" + imgs[i] + "'/>"
            $("#" + classId).append(str);
        }
        $(".Q" + classId).val(backurl);
        // layer.photos({
        //     photos: '#' + classId
        //     , anim: 5
        // });
    }

    //下载图片
    function downImage(obj) {
        //ajaxForm表单提交
        if (!validaImage(obj)) {
            return;
        } else {
            var url = platform.CONSTS.URL_BASE_CMS + 'order/saveImage?tm=' + new Date().getTime();
            $("#imageForm").ajaxSubmit({
                url: url,
                type: "POST",//提交类型
                dataType: "json",
                cache: false,
                ifModified: true,
                success: function (data) {
                    if (data.success == true) {
                        var backurl = data.data ;
                        showImageS(classId,backurl);
                        classId = "";
                    } else {
                        layer.msg(data.message, {icon: 2});
                        return;
                    }
                }
            });
        }
    }
    function detailUser() {
        $.ajax({
            type: "POST",
            url: platform.CONSTS.URL_BASE_CMS + "api/detailUser",
            data: {},
            async: false,
            success: function (data) {
                if (data.success == true) {
                    var data = data.data;
                    $("#birthday").val(data.birthday);
                    $("#email").val(data.email);
                    $("#nickname").val(data.nickname);
                    var sex = data.sex;
                    $("#grzl_xb").val(sex);
                    showImageS("headerUrl", data.headerUrl);
                } else {
                    layer.msg(data.message, {icon: 2});
                    return;
                }
            }
        });
    }
</script>