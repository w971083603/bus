<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <a onclick="tzUrl('/api/busindex')" class="apiTitle">首页</a>
                <c:if test="${empty sessionScope.uuid || sessionScope.type == 1 }">
                    <a onclick="tzUrl('/api/fbxc')" class="apiTitle">发布行程</a>
                </c:if>
                <c:if test="${empty sessionScope.uuid}">
                    <a onclick="tzUrl('/api/cdrz')" class="apiTitle">车队登录</a>
                </c:if>
                <a onclick="tzUrl('/api/gywm')" class="apiTitle">关于我们</a>
                <a onclick="tzUrl('/api/zxkf')" class="apiTitle">在线客服</a>
            </div>
            <div class="index_title_three">
                <c:choose>
                    <c:when test="${empty sessionScope.uuid}">
                        <div class="index_login">
                            <a onclick="tzUrl('/api/login')" class="indexcolor">登陆</a>
                            <span class="indexcolor"> &nbsp;&nbsp;/&nbsp;&nbsp;</span>
                            <a onclick="tzUrl('/api/register')" class="indexcolor">注册</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <img onclick="tzUrl('/api/busown')" src="${empty sessionScope.headerUrl || sessionScope.headerUrl eq ''?'../../../api/img/web/header.png':sessionScope.headerUrl}" class="user_head">
                        <div class="index_login">
                            <a onclick="tzUrl('/api/busown')" class="indexcolor">${sessionScope.nickname}</a>
                            <span class="indexcolor"> &nbsp;&nbsp;/&nbsp;&nbsp;</span>
                            <a onclick="tzUrl('/api/loginout')" class="indexcolor">退出</a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    <div class="content">
        <div class="content_left">
            <div style="width: 100%;height: 100px;text-align: center;line-height: 111px;">
                <img src="${empty sessionScope.headerUrl || sessionScope.headerUrl eq ''?'../../../api/img/web/header.png':sessionScope.headerUrl}" width="70px" height="70px">
                <span><span></span>${sessionScope.nickname}</span>
            </div>
            <div style="width:100%;height: 500px">
                <ul>
                    <li class="lib order" onclick="tz('api/wddd',this)">我的订单</li>
                    <li class="lib" onclick="tz('api/grzl',this)">个人资料</li>
                    <li class="lib" onclick="tz('api/zhsz',this)">账号设置</li>
                    <li class="lib" onclick="tz('api/cyxx',this)">常用信息</li>
                    <li class="lib" onclick="tz('api/bzzx',this)">帮助中心</li>
                    <li class="lib" onclick="tz('api/mymessage',this)">我的消息</li>
                    <li class="lib" onclick="tz('api/feedback',this)">问题反馈</li>
                </ul>
            </div>
        </div>
        <div class="content_right">

        </div>
    </div>

</body>
<%@ include file="../../../apiCurrency/js.jsp" %>
<script>
    var type = platform.getQueryDecodeString("type");
    if(type != '' && type != null && type == '1'){
        $(".order").click();
    }
        function tz(url,obj) {
            $(".content_right").empty();
            url = platform.CONSTS.URL_BASE_CMS + url;
            var str = "<iframe id='myFrameId' src='"+url+"' name='myFrameName' scrolling='no' frameborder='0' style='width: 100%;height: 100%;'> </iframe>"
            $(".content_right").append(str);
            $(".lib").css("background-color","#fcfffb");
            $(obj).css("background-color","rgb(128, 194, 105)");
        }
</script>
</html>
