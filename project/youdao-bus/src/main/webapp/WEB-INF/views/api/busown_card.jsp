<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <img onclick="tzUrl('/api/busown')"
                         src="${empty sessionScope.headerUrl || sessionScope.headerUrl eq ''?'../../../api/img/web/header.png':sessionScope.headerUrl}"
                         class="user_head">
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
            <img src="${empty sessionScope.headerUrl || sessionScope.headerUrl eq ''?'../../../api/img/web/header.png':sessionScope.headerUrl}"
                 width="70px" height="70px">
            <span><span></span>${sessionScope.nickname}</span>
        </div>
        <div style="width:100%;height: 500px">
            <ul>
                <li class="lib order" onclick="tz('api/wddd',this)">订单列表</li>
            </ul>
        </div>
    </div>
    <div class="content_right">
        <div class="wddd_div">
            <div class="wddd_div_title">
                <ul>
                    <li class="wddd_div_li one" onclick="orderstatus('1',this)">报价订单(<span style="color: red;"
                                                                                           id="bj">0</span>)
                    </li>
                    <li class="wddd_div_li one" onclick="orderstatus('2',this)">等待客户选择(<span style="color: red;"
                                                                                           id="qr">0</span>)
                    </li>
                    <li class="wddd_div_li" onclick="orderstatus('5',this)">未出行(<span style="color: red;"
                                                                                       id="wcx">0</span>)
                    </li>
                    <li class="wddd_div_li" onclick="orderstatus('3',this)">行驶中(<span style="color: red;"
                                                                                      id="xs">0</span>)
                    </li>
                    <li class="wddd_div_li" onclick="orderstatus('4',this)">已完成(<span style="color: red;"
                                                                                      id="wc">0</span>)
                    </li>
                </ul>
            </div>

            <div class="wddd_div_table">
                <table class="tableOrder">
                    <thead>
                    <tr>
                        <td class="wddd_div_tableInvoice">订单号</td>
                        <td class="wddd_div_tableInvoice">服务</td>
                        <td class="wddd_div_tableCfd">出发地</td>
                        <td class="wddd_div_tableCfd">目的地</td>
                        <td class="wddd_div_tableInvoice">用车人数</td>
                        <td class="wddd_div_tableInvoice">用车数量</td>
                        <td class="wddd_div_tableInvoice">发票</td>
                        <td class="wddd_div_tableTime">出发时间</td>
                        <td class="wddd_div_tableTime">结束时间</td>
                        <td class="wddd_div_tableTime">报价金额</td>
                        <td class="wddd_div_tableTime2">操作</td>
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

    function tz(url, obj) {
        $(".lib").css("background-color", "#fcfffb");
        $(obj).css("background-color", "rgb(128, 194, 105)");
    }

    $(".order").click();
    $(".one").click();

    function orderstatus(type, obj) {
        $(".wddd_div_li").css("background-color", "#fcfffb");
        $(obj).css("background-color", "rgb(128, 194, 105)");
        //清空td，ajax获取数据展示
        getMessage(type);
    }

    function getMessage(status) {
        $.ajax({
            type: "POST",
            url: platform.CONSTS.URL_BASE_CMS + "api/orderListForFleet",
            data: {
                status: status
            },
            async: false,
            success: function (data) {
                if (data.success == true) {
                    var result = data.data;
                    $("#bj").html(result.bjOrder);
                    $("#qr").html(result.qrOrder);
                    $("#wcx").html(result.wcxOrder);
                    $("#xs").html(result.xszOrder);
                    $("#wc").html(result.finishOrder);
                    if (result.list.length > 0) {
                        $(".tableOrder").show();
                        $(".orderlist").empty();
                        $(".noList").hide();
                        for (var i = 0; i < result.list.length; i++) {
                            var caozuo = "<td class=\"wddd_div_tableTime2\">-</td>";
                            if (status == "1") {
                                caozuo = "<td class=\"wddd_div_tableTime\">" +
                                    "<input placeholder='请输入报价金额' value='' style='font-size: 11px;width: 50%;'>" +
                                    "<button  style='margin-left: 1%;' type=\"button\" onclick=\"sureOrder('" + result.list[i].orderUuid + "',this)\">确认</button>" +
                                    "</td>";
                            }else if (status == "3") {
                                changeFleet = " <td class=\"wddd_div_tableTime\">" +
                                    "<button type=\"button\" onclick=\"sureOrderGo('4','" + result.list[i].orderUuid + "')\">已完成行程</button>" +
                                    "</td></tr>";
                            }
                            var busNumber =    Number(result.list[i].busNumber1)+ '座  '
                                + (result.list[i].busNumber2 == 0?"":"/" + (Number(result.list[i].busNumber2)+ '座  '))
                                + (result.list[i].busNumber3 == 0?"":"/" +  (Number(result.list[i].busNumber3)+ '座  '));
                            var str = "<tr><td class=\"wddd_div_tableInvoice\">" + result.list[i].orderUuid + "</td>" +
                                " <td class=\"wddd_div_tableInvoice\">" + result.list[i].typeName + "</td>" +
                                "                         <td class=\"wddd_div_tableCfd\">" + result.list[i].fromProvince + result.list[i].fromCity + result.list[i].fromAddress + "</td>" +
                                "                         <td class=\"wddd_div_tableCfd\">" + result.list[i].toProvince + result.list[i].toCity + result.list[i].toAddress + "</td>" +
                                "                         <td class=\"wddd_div_tableInvoice\">" + result.list[i].useNumber + "</td>" +
                                "                         <td class=\"wddd_div_tableInvoice\">" + busNumber + "</td>" +
                                "                         <td class=\"wddd_div_tableInvoice\">" + result.list[i].isInvoice + "</td>" +
                                "                         <td class=\"wddd_div_tableTime\">" + result.list[i].fromTime + "</td>" +
                                "                         <td class=\"wddd_div_tableTime\">" + result.list[i].toTime + "</td>" +
                                "                         <td class=\"wddd_div_tableTime\">" + result.list[i].amount + "</td>" +
                                caozuo +
                                "</tr>";
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

    //确认报价
    function sureOrder(orderUuid, obj) {
        if ($(obj).prev().val() == "") {
            layer.msg("报价金额不能为空", {icon: 2});
            return;
        }
        $.ajax({
            type: "POST",
            url: platform.CONSTS.URL_BASE_CMS + "api/addorderFleetAmount",
            data: {
                orderUuid: orderUuid,
                amount: $(obj).prev().val()
            },
            async: false,
            success: function (data) {
                if (data.success == true) {
                    getMessage("1");
                } else {
                    layer.msg(data.message, {icon: 2});
                    return;
                }
            }
        });
    }

    //确认出行
    function sureOrderGo(value,orderUuid) {
        $.ajax({
            type: "POST",
            url: platform.CONSTS.URL_BASE_CMS + "api/userChangeStatus",
            data: {
                orderUuid: orderUuid,
                status: value
            },
            async: false,
            success: function (data) {
                if (data.success == true) {
                    getMessage(value);
                } else {
                    layer.msg(data.message, {icon: 2});
                    return;
                }
            }
        });
    }

</script>
</html>
