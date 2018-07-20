<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../../apiCurrency/top.jsp" %>
<body class="api">
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

    <div class="content">
        <div class="content_left">
            <div style="width: 100%;height: 100px;text-align: center;line-height: 144px;">
                <img src="../../../api/img/web/header.png">
                <span><span>个人</span>：No.2222222222</span>
            </div>
            <div style="width:100%;height: 500px">
                <ul>
                    <li class="lib">我的订单</li>
                    <li class="lib" onclick="tz('api/grzl',this)">个人资料</li>
                    <li class="lib" onclick="tz('api/zhsz',this)">账号设置</li>
                    <li class="lib">常用信息</li>
                    <li class="lib">帮助中心</li>
                    <li class="lib" onclick="tz('api/mymessage',this)">我的消息</li>
                    <li class="lib" onclick="tz('api/feedback',this)">问题反馈</li>
                </ul>
            </div>
        </div>
        <div class="content_right">

        </div>
    </div>

</body>
<%@ include file="../../../currency/js.jsp" %>
<script>
        function tz(url,obj) {
            $(".content_right").empty();
            url = platform.CONSTS.URL_BASE_CMS + url;
            var str = "<iframe id='myFrameId' src='"+url+"' name='myFrameName' scrolling='no' frameborder='0' style='width: 100%;height: 100%;'> </iframe>"
            $(".content_right").append(str);
            $(".lib").css("background-color","#fcfffb");
            $(obj).css("background-color","#00B83F");
        }
</script>
</html>
