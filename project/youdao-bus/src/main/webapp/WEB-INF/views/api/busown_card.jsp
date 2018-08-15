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
                    <li class="wddd_div_li" onclick="orderstatus('2',this)">等待客户选择(<span style="color: red;"
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

            <div class="wddd_div_table"  >
                <table class="tableOrder" >
                    <thead>
                    <tr>
                        <td class="wddd_div_tableInvoice djs" style="display: none;">倒计时</td>
                        <td class="wddd_div_tableInvoice">订单号</td>
                        <td class="wddd_div_tableInvoice">报价金额</td>
                        <td class="wddd_div_tableInvoice">操作</td>
                        <td class="wddd_div_tableTime">出发时间</td>
                        <td class="wddd_div_tableTime">结束时间</td>
                        <td class="wddd_div_tableCfd">出发地</td>
                        <td class="wddd_div_tableCfd">目的地</td>
                        <td class="wddd_div_tableInvoice">途径地</td>
                        <td class="wddd_div_tableInvoice">天数</td>
                    </tr>
                    </thead>
                    <tbody class="orderlist">

                    </tbody>
                </table>
            </div>
        </div>

    </div>

</div>

<%--订单详情--%>
<div class="detailorder" style="top: 29%;left: 30%;width: 40%;">
    <div class="fbxc_div_content">
        <div class="fbxc_div_content_content">
            <input type="hidden" class="orderUuid">
            <input type="hidden" class="status">
            <ul>
                <li>
                    你的用车类型：<span class="type"></span>
                </li>
                <li>
                    出发时间：<span class="fromTime"></span>
                </li>
                <li class="toTimeTitel">
                    结束时间：<span class="toTime"></span>
                </li>
                <li>
                    出发地：<span class="fromAddress"></span>
                </li>
                <li>
                    目的地：<span class="toAddress"></span>
                </li>
                <li class="roadTitel">
                    途径地：<span class="road"></span>
                </li>
                <li class="lxxli" style="display: none;">
                    联系人：<span class="contactName"></span>
                </li>
                <li class="lxxli" style="display: none;">
                    手机号码：<span class="contactTel"></span>
                </li>
                <li>
                    乘客总数：<span class="useNumber"></span>
                </li>
                <li>
                    用车数量：<span class="busNumber"></span>
                </li>
                <li>
                    <ul class="invoiceTitel" style="display: block">
                        <li>
                            用车单位名称：<span class="invoiceHeader"></span>
                        </li>
                        <li>
                            用车单位纳税人识别号：<span class="invoiceDuty"></span>
                        </li>
                        <li>
                            用车单位开户行及账号：<span class="invoiceContact"></span>
                        </li>
                        <li>
                            用车单位地址、电话：<span class="invoiceAddress"></span>
                        </li>
                        <li>
                            收票人手机号：<span class="invoicePhone"></span>
                        </li>
                    </ul>
                </li>
                <li class="bjjeli">
                    报价金额：<input type="text" class="amount" disabled/>
                </li>
                <li class="addSomeInfor">
                    联系&nbsp;&nbsp;&nbsp;&nbsp;人：<input type="text" class="busName" disabled>
                </li>
                <li class="addSomeInfor">
                    联系电话： <input type="text" class="busPhone" disabled>
                </li>
                <li class="addSomeInfor">
                    车牌&nbsp;&nbsp;&nbsp;号： <input type="text" class="licensePlate" disabled>
                </li>
            </ul>
            <div align="center">
                <button type="button" class="busBtnsure okbj" style='margin-left: 1%;display: none;'
                        onclick="sureOrder()">确认报价
                </button>
                <button type="button" class="busBtnsure okxx" onclick="addOrderInfor()" style="display: none;">
                    保存联系信息
                </button>
                <button type="button" class="busBtnclose" onclick="closeDetailOrder()">关闭</button>
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
                        $(".djs").hide();
                        $(".tableOrder").show();
                        $(".orderlist").empty();
                        if (status == "1") {
                            $(".djs").show();
                        }
                        for (var i = 0; i < result.list.length; i++) {
                            console.log(result.list[i]);
                            var timeDjs =  result.list[i].time;
                            if(result.list[i].status == "2") timeDjs = 0;
                            var wcdd = "";
                            var road = "";
                            var roadList = result.list[i].roadList;
                            for (var j = 0; j < roadList.length; j++) {
                                if (road == '') {
                                    road = roadList[j].address;
                                } else {
                                    road += "，" + roadList[j].address;
                                }
                            }
                            var djs = " <td class=\"wddd_div_tableTime2\" style='display:none;'></td>";
                            if (status == "1") {
                                djs = "<td class=\"wddd_div_tableTime2\">" +
                                    "<span id='" + result.list[i].orderUuid + "' onclick='settime(this)' class = 'timeSpanRed'>" + timeDjs + "</span></td>";
                            } else if (status == "3") {
                                wcdd = "<button type=\"button\" class='busBtnYwc' onclick=\"sureOrderGo('" + result.list[i].orderUuid + "')\">已完成</button>";
                            }
                            var str = "<tr>" + djs +
                                "<td class=\"wddd_div_tableInvoice\" >" + result.list[i].orderUuid + "</td>" +
                                "<td class=\"wddd_div_tableInvoice\" >" + result.list[i].amount + "</td>" +
                                " <td class=\"wddd_div_tableInvoice\">" +
                                "   <button type=\"button\" class='busBtnCkxq' onclick=\"detailorderAjax('" + result.list[i].orderUuid + "','" + result.list[i].amount + "')\">查看详情 </button> " +
                                wcdd + " </td>" +
                                "                         <td class=\"wddd_div_tableTime\">" + platform.StringDateString(result.list[i].fromTime) + "</td>" +
                                "                         <td class=\"wddd_div_tableTime\">" + platform.StringDateString(result.list[i].toTime) + "</td>" +
                                "                         <td class=\"wddd_div_tableCfd\">" + result.list[i].fromProvince + result.list[i].fromCity + result.list[i].fromArea + result.list[i].fromAddress + "</td>" +
                                "                         <td class=\"wddd_div_tableCfd\">" + result.list[i].toProvince + result.list[i].toCity + result.list[i].toArea + result.list[i].toAddress + "</td>" +
                                "                         <td class=\"wddd_div_tableInvoice\">" + road + "</td>" +
                                "                         <td class=\"wddd_div_tableInvoice\">" +  result.list[i].godays  + "</td>" +

                                "</tr>";
                            $(".orderlist").append(str);
                            $("#" + result.list[i].orderUuid).click();
                        }
                    } else {
                        $(".tableOrder").hide();
                    }

                } else {
                    layer.msg(data.message, {icon: 2});
                    return;
                }
            }
        });
    }

    //确认报价
    function sureOrder() {
        if ($(".amount").val() == "") {
            layer.msg("报价金额不能为空", {icon: 2});
            return;
        }
        $.ajax({
            type: "POST",
            url: platform.CONSTS.URL_BASE_CMS + "api/addorderFleetAmount",
            data: {
                orderUuid: $(".orderUuid").val(),
                amount: $(".amount").val()
            },
            async: false,
            success: function (data) {
                if (data.success == true) {
                    layer.msg("报价成功！");
                    getMessage("1");
                } else {
                    layer.msg(data.message, {icon: 2});
                    return;
                }
            }
        });
        closeDetailOrder();

    }

    //已完成
    function sureOrderGo(orderUuid) {
        $.ajax({
            type: "POST",
            url: platform.CONSTS.URL_BASE_CMS + "api/userChangeStatus",
            data: {
                orderUuid: orderUuid,
                status: "4"
            },
            async: false,
            success: function (data) {
                if (data.success == true) {
                    layer.msg("确认成功！");
                    getMessage("3");
                } else {
                    layer.msg(data.message, {icon: 2});
                    return;
                }
            }
        });
        closeDetailOrder();
    }

    /**
     * 新增订单信息
     * @param orderUuid
     */
    function addOrderInfor() {
        var licensePlate = $(".licensePlate").val();
        var busPhone = $(".busPhone").val();
        var busName = $(".busName").val();
        if (licensePlate == null || licensePlate == '') {
            layer.msg("车牌号不能为空", {icon: 2});
            return;
        }
        if (busName == null || busName == '') {
            layer.msg("联系人不能为空", {icon: 2});
            return;
        }
        if (busPhone == null || busPhone == '') {
            layer.msg("联系电话不能为空", {icon: 2});
            return;
        }
        $.ajax({
            type: "POST",
            url: platform.CONSTS.URL_BASE_CMS + "api/addLicensePlate",
            data: {
                "orderUuid": $(".orderUuid").val(),
                "licensePlate": $(".licensePlate").val(),
                "busPhone": $(".busPhone").val(),
                "busName": $(".busName").val()
            },
            async: false,
            success: function (data) {
                if (data.success == true) {
                    layer.msg("保存成功！");
                    getMessage("5");
                } else {
                    layer.msg(data.message, {icon: 2});
                    return;
                }
            }
        });
        closeDetailOrder();
    }


    //详情
    function detailorderAjax(orderUuid, amount) {
        $.ajax({
            type: "POST",
            url: platform.CONSTS.URL_BASE_CMS + "api/findByOrderUuid",
            data: {
                orderUuid: orderUuid
            },
            async: false,
            success: function (data) {
                if (data.success == true) {
                    var result = data.data;
                    $(".orderUuid").val(result.orderUuid);
                    $(".status").val(result.status);
                    $(".fromTime").html(result.fromTime);
                    $(".toTime").html(result.toTime);
                    $(".fromAddress").html(result.fromProvince + result.fromCity + result.fromArea + result.fromAddress);
                    $(".toAddress").html(result.toProvince + result.toCity + result.toArea + result.toAddress);
                    $(".contactTel").html(result.contactTel);
                    $(".contactName").html(result.contactName);
                    $(".invoiceHeader").html(result.invoiceHeader);
                    $(".invoiceContact").html(result.invoiceContact);
                    $(".invoicePhone").html(result.invoicePhone);
                    $(".invoiceAddress").html(result.invoiceAddress);
                    $(".invoiceDuty").html(result.invoiceDuty);
                    $(".useNumber").html(result.useNumber);
                    $(".busName").val(result.busName);
                    $(".busPhone").val(result.busPhone);
                    $(".licensePlate").val(result.licensePlate);
                    $(".amount").val(amount);

                    var busNumber = Number(result.busNumber1) + '座  '
                        + (result.busNumber2 == 0 ? "" : (Number(result.busNumber2) + '座  '))
                        + (result.busNumber3 == 0 ? "" : (Number(result.busNumber3) + '座  '))
                        + '*' + (Number(result.busNumber) + '辆');
                    $(".busNumber").html(busNumber);
                    var typeName = result.typeName;
                    $(".type").html(typeName);
                    if (typeName == '包车服务') {
                        $(".toTimeTitel").show();
                        var roadList = result.roadList;
                        if (roadList != '' && roadList.length > 0) {
                            var road = "";
                            for (var i = 0; i < roadList.length; i++) {
                                if (road == '') {
                                    road = roadList[i].address;
                                } else {
                                    road += "，" + roadList[i].address;
                                }
                            }
                            $(".road").html(road);
                            $(".roadTitel").show();
                        } else {
                            $(".roadTitel").hide();
                        }
                    } else {
                        $(".toTimeTitel").hide();
                        $(".roadTitel").hide();
                    }
                    var isInvoice = result.isInvoice;
                    if (isInvoice == '是') {
                        $(".invoiceTitel").show();
                    } else {
                        $(".invoiceTitel").hide();
                    }
                    $(".lxxli").hide();
                    $(".bjjeli").hide();
                    $(".addSomeInfor").hide();
                    $(".li").hide();
                    var status = result.status;
                    var busPhone = result.busPhone;
                    $(".bjjeli").show();
                    if (status == "1" || status == "2") {
                        if(amount == 0) {
                            $(".okbj").show();
                            $(".amount").removeAttr("disabled");
                        }
                    } else if (status == "5") {
                        $(".lxxli").show();
                        $(".addSomeInfor").show();
                        if (busPhone == "") {
                            $(".okxx").show();
                        }
                        $(".busName").removeAttr("disabled");
                        $(".busPhone").removeAttr("disabled");
                        $(".licensePlate").removeAttr("disabled");
                    } else if (status == "3") {
                        $(".lxxli").show();
                        $(".addSomeInfor").show();
                    } else if (status == "4") {
                        $(".lxxli").show();
                        $(".addSomeInfor").show();
                    }
                } else {
                    layer.msg(data.message, {icon: 2});
                    return;
                }
            }
        });
        $(".detailorder").show();
    }

    //关闭
    function closeDetailOrder() {
        $(".detailorder").hide();
        $(".okbj").hide();
        $(".okxx").hide();
    }


    function settime(obj) {

        var time = parseInt($(obj).html() == null ? "0" : $(obj).html());
        if (time == 0) {
            $(obj).html("0");
        } else {
            time--;
            $(obj).html(time + '秒');
            setTimeout(function () {
                settime(obj)
            }, 1000)
        }
    }


</script>
</html>
