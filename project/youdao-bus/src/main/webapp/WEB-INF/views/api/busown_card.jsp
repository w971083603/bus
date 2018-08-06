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
                        <td class="wddd_div_tableTime2">操作</td>
                        <td class="wddd_div_tableInvoice">发票</td>
                        <td class="wddd_div_tableTime">出发时间</td>
                        <td class="wddd_div_tableTime">结束时间</td>
                        <td class="wddd_div_tableTime">报价金额</td>
                    </tr>
                    </thead>
                    <tbody class="orderlist">

                    </tbody>
                </table>
            </div>
        </div>

        <div class="addSomeInfor" style="display: none;width: 30%;height: 303px;position: absolute;top: 50%;left: 37%;background-color: #cfcdcd;">
            <input type="hidden" class="orderUuid">
            <input type="hidden" class="status">
            <div style="  height: 60px;  margin-top: 25px;   margin-left: 26px; ">
                车牌&nbsp;&nbsp;&nbsp;号： <input type="text" class="licensePlate">
            </div>
            <div style="  height: 60px;  margin-top: 25px;   margin-left: 26px; ">
                联系电话： <input type="text" class="busPhone">
            </div>
            <div align="center">
                <button type="button" class="fbxcBtnclose" onclick="addOrderInfor()">确认</button>
                <button type="button" class="fbxcBtncloseRed" onclick="closeNow()">关闭</button>
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
                        $(".fbxcBtnclose").hide();
                        $(".addSomeInfor").hide();
                        $(".tableOrder").show();
                        $(".orderlist").empty();
                        $(".noList").hide();
                        for (var i = 0; i < result.list.length; i++) {
                            console.log(result.list[i]);
                            var caozuo = "<td class=\"wddd_div_tableTime2\">-</td>";
                            if (status == "1") {
                                caozuo = "<td class=\"wddd_div_tableTime\">" +
                                    "<input placeholder='请输入报价金额' value='' style='font-size: 11px;width: 50%;'>" +
                                    "<button  style='margin-left: 1%;' type=\"button\" onclick=\"sureOrder('" + result.list[i].orderUuid + "',this)\">确认</button>" +
                                    "</td>";
                            } else if (status == "3") {
                                caozuo = " <td class=\"wddd_div_tableTime\">" +
                                    "<button type=\"button\" onclick=\"sureOrderGo('" + result.list[i].orderUuid + "')\">已完成行程</button>" +
                                    "</td>";
                            } else if (status == "5") {
                                if(result.list[i].licensePlate == ""){
                                    $(".fbxcBtnclose").show();
                                }
                                caozuo = " <td class=\"wddd_div_tableTime\">" +
                                    "<button type=\"button\" onclick=\"addPhone('5','" + result.list[i].orderUuid + "','" + result.list[i].licensePlate + "','" + result.list[i].busPhone + "')\">操作联系方式</button>" +
                                    "</td>";
                            } else if (status == "5") {
                                if(result.list[i].licensePlate == ""){
                                    $(".fbxcBtnclose").show();
                                }
                                caozuo = " <td class=\"wddd_div_tableTime\">" +
                                    "<button type=\"button\" onclick=\"addPhone('5','" + result.list[i].orderUuid + "','" + result.list[i].licensePlate + "','" + result.list[i].busPhone + "')\">操作联系方式</button>" +
                                    "</td>";
                            }
                            var busNumber = Number(result.list[i].busNumber1) + '座  '
                                + (result.list[i].busNumber2 == 0 ? "" : "/" + (Number(result.list[i].busNumber2) + '座  '))
                                + (result.list[i].busNumber3 == 0 ? "" : "/" + (Number(result.list[i].busNumber3) + '座  '));
                            var str = "<tr><td class=\"wddd_div_tableInvoice\">" + result.list[i].orderUuid + "</td>" +
                                " <td class=\"wddd_div_tableInvoice\">" + result.list[i].typeName + "</td>" +
                                "                         <td class=\"wddd_div_tableCfd\">" + result.list[i].fromProvince + result.list[i].fromCity + result.list[i].fromAddress + "</td>" +
                                "                         <td class=\"wddd_div_tableCfd\">" + result.list[i].toProvince + result.list[i].toCity + result.list[i].toAddress + "</td>" +
                                "                         <td class=\"wddd_div_tableInvoice\">" + result.list[i].useNumber + "</td>" +
                                "                         <td class=\"wddd_div_tableInvoice\">" + busNumber + "</td>" +
                                caozuo +
                                "                         <td class=\"wddd_div_tableInvoice\">" + result.list[i].isInvoice + "</td>" +
                                "                         <td class=\"wddd_div_tableTime\">" + result.list[i].fromTime + "</td>" +
                                "                         <td class=\"wddd_div_tableTime\">" + result.list[i].toTime + "</td>" +
                                "                         <td class=\"wddd_div_tableTime\">" + result.list[i].amount + "</td>" +
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
                    layer.msg("报价成功！");
                    getMessage("1");
                } else {
                    layer.msg(data.message, {icon: 2});
                    return;
                }
            }
        });
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
    }

    /**
     * 新增订单信息
     * @param orderUuid
     */
    function addOrderInfor() {
        var licensePlate = $(".licensePlate").val();
        var busPhone = $(".busPhone").val();
        if (licensePlate == null || licensePlate == '') {
            layer.msg("车牌号不能为空", {icon: 2});
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
                "busPhone": $(".busPhone").val()
            },
            async: false,
            success: function (data) {
                if (data.success == true) {
                    layer.msg("新增成功！");
                    getMessage("5");
                } else {
                    layer.msg(data.message, {icon: 2});
                    return;
                }
            }
        });
        $(".addSomeInfor").hide();
    }

    function addPhone(value, orderUuid,licensePlate,busPhone) {
        $(".status").val(value);
        $(".orderUuid").val(orderUuid);
        $(".licensePlate").val(licensePlate);
        $(".busPhone").val(busPhone);
        $(".addSomeInfor").show();
    }
    function closeNow() {
        $(".addSomeInfor").hide();
    }


</script>
</html>
