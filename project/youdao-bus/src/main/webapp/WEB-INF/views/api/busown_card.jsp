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
                <a onclick="tzUrl('/api/fbxc')" class="apiTitle">发布行程</a>
                <a onclick="tzUrl('/api/cdrz')" class="apiTitle" >车队登录</a>
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
                    <li class="lib order" onclick="tz('api/wddd',this)">订单列表</li>
                </ul>
            </div>
        </div>
        <div class="content_right">
            <div  class="wddd_div" style="overflow-y: scroll;height: 590px;">
                <div class="wddd_div_title">
                    <ul>
                        <li class="wddd_div_li" onclick="orderstatus('1',this)">报价中(<span style="color: red;" id="bj">0</span>)</li>
                        <li class="wddd_div_li" onclick="orderstatus('0',this)">已预定(<span style="color: red;" id="yj">0</span>)</li>
                        <li class="wddd_div_li" onclick="orderstatus('3',this)">行驶中(<span style="color: red;" id="xs">0</span>)</li>
                        <li class="wddd_div_li" onclick="orderstatus('4',this)">已完成(<span style="color: red;" id="wc">0</span>)</li>
                    </ul>
                    <div style="width: 20%;float: right;text-align: center;">
                        <img src="">
                        <a>服务热线</a>
                    </div>
                </div>

                <div class="wddd_div_table">
                    <table class="tableOrder">
                        <thead>
                        <tr>
                            <td class="wddd_div_tableInvoice">服务</td>
                            <td class="wddd_div_tableCfd">出发地</td>
                            <td class="wddd_div_tableCfd">目的地</td>
                            <td class="wddd_div_tableInvoice">用车人数</td>
                            <td class="wddd_div_tableInvoice">用车数量</td>
                            <td class="wddd_div_tableInvoice">发票</td>
                            <td class="wddd_div_tableTime">出发时间</td>
                            <td class="wddd_div_tableTime">结束时间</td>
                        </tr>
                        </thead>
                        <tbody class="orderlist">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</body>
<%@ include file="../../../apiCurrency/js.jsp" %>
<script>
    var type = platform.getQueryDecodeString("type");
    if(type != '' && type != null && type == '2'){
        $(".order").click();
    }
    function orderstatus(type,obj) {
        $(".wddd_div_li").css("background-color","#fcfffb");
        $(obj).css("background-color","#06dc00");
        //清空td，ajax获取数据展示
        getMessage(type);
    }

    $(function () {
        getMessage("1");
    })

    function getMessage(status) {
        $.ajax({
            type: "POST",
            url: platform.CONSTS.URL_BASE_CMS + "api/orderList",
            data: {
                status:status
            },
            async: false,
            success: function (data) {
                if (data.success == true) {
                    var result = data.data;
                    $("#bj").html(result.bjOrder);
                    $("#yj").html(result.createOrder);
                    $("#xs").html(result.xszOrder);
                    $("#wc").html(result.finishOrder);
                    if (result.list.length > 0) {
                        $(".tableOrder").show();
                        $(".orderlist").empty();
                        $(".noList").hide();
                        // $(".orderlist").html("");
                        for(var i = 0; i < result.list.length;i++ ) {
                            var busNumber = Number(result.list[i].busNumber1) + Number(result.list[i].busNumber2) + Number(result.list[i].busNumber3) + '座*' + result.list[i].busNumber  + "辆";
                            var str = "<tr><td class=\"wddd_div_tableInvoice\">" + result.list[i].typeName + "</td>\n" +
                                "                         <td class=\"wddd_div_tableCfd\">" + result.list[i].fromProvince +result.list[i].fromCity + result.list[i].fromAddress + "</td>\n" +
                                "                         <td class=\"wddd_div_tableCfd\">"  + result.list[i].toProvince +result.list[i].toCity + result.list[i].toAddress +  "</td>\n" +
                                 "                         <td class=\"wddd_div_tableInvoice\">" + result.list[i].useNumber + "</td>\n" +
                                "                         <td class=\"wddd_div_tableInvoice\">" + busNumber + "</td>\n" +
                                "                         <td class=\"wddd_div_tableInvoice\">" + result.list[i].isInvoice + "</td>\n" +
                                "                         <td class=\"wddd_div_tableTime\">" + result.list[i].fromTime + "</td>\n" +
                                "                         <td class=\"wddd_div_tableTime\">" + result.list[i].toTime + "</td></tr>";
                            $(".orderlist").append(str);
                        }
                    } else {
                        $(".tableOrder").hide();
                        $(".noList").show();

                    }

                } else {
                    layer.msg(data.message, {icon: 2});
                    return;
                }
            }
        });
    }

</script>
</html>
