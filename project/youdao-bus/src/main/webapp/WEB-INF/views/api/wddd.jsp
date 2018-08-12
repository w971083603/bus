<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../../apiCurrency/top.jsp" %>
<body>
<div class="wddd_div">
    <div class="wddd_div_title">
        <ul>
            <li class="wddd_div_li" onclick="orderstatus('1',this)">报价中(<span style="color: red;" id="bj">0</span>)</li>
            <li class="wddd_div_li" onclick="orderstatus('2',this)">选择报价(<span style="color: red;" id="qr">0</span>)
            </li>
            <li class="wddd_div_li" onclick="orderstatus('0',this)">预订单(<span style="color: red;" id="yj">0</span>)</li>
            <li class="wddd_div_li" onclick="orderstatus('5',this)">未出行(<span style="color: red;" id="wcx">0</span>)
            </li>
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
                <td class="wddd_div_tableInvoice djs" style="display: none;">倒计时</td>
                <td class="wddd_div_tableInvoice">订单号</td>
                <td class="wddd_div_tableInvoice">服务</td>
                <td class="wddd_div_tableCfd">出发地</td>
                <td class="wddd_div_tableCfd">目的地</td>
                <td class="wddd_div_tableTime2 cztd">操作</td>
                <td class="wddd_div_tableTime">联系人</td>
                <%--<td class="wddd_div_tableTime">手机号码</td>--%>
                <%--<td class="wddd_div_tableInvoice">用车人数</td>--%>
                <td class="wddd_div_tableInvoice">用车数量</td>
                <td class="wddd_div_tableInvoice2">发票</td>
                <td class="wddd_div_tableTime">出发时间</td>
                <td class="wddd_div_tableTime">结束时间</td>
                <td class="wddd_div_tableTime lianxxx" style="display: none">报价金额</td>
                <td class="wddd_div_tableTime lianxxx" style="display: none">车牌号</td>
                <td class="wddd_div_tableTime lianxxx" style="display: none">联系电话</td>
            </tr>
            </thead>
            <tbody class="orderlist">

            </tbody>
        </table>
        <div class="noList">
            <div style="padding-top: 8%;width: 20%;margin: auto;text-align: center;">
                <img src="../../../api/img/web/myorder.png">
                <p>暂无数据，您未发布需求</p>
            </div>
            <div align="center">
                <button type="button" class="fbxcBtn" onclick="topUrl('/api/fbxc')">发布行程</button>
            </div>
        </div>
    </div>
</div>

<%--订单详情--%>
<div class="detailorder">
    <div class="fbxc_div_content">
        <div class="fbxc_div_content_content">
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
                <li>
                    联系人：<span class="contactName"></span>
                </li>
                <li>
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
            </ul>
            <div align="center">
                <button type="button" class="fbxcBtnclose" onclick="closeDetailOrder()">关闭</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<!-- jQuery 2.2.3 -->
<%@ include file="../../../apiCurrency/js.jsp" %>
<script>

    function orderstatus(type, obj) {
        $(".wddd_div_li").css("background-color", "#fcfffb");
        $(obj).css("background-color", "rgb(128, 194, 105)");
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
                status: status
            },
            async: false,
            success: function (data) {
                if (data.success == true) {
                    var result = data.data;
                    $("#bj").html(result.bjOrder);
                    $("#qr").html(result.qrOrder);
                    $("#yj").html(result.createOrder);
                    $("#tx").html(result.txOrder);
                    $("#xs").html(result.xszOrder);
                    $("#wcx").html(result.wcxOrder);
                    $("#wc").html(result.finishOrder);
                    if (result.list.length > 0) {
                        $(".lianxxx").hide();
                        $(".djs").hide();
                        $(".tableOrder").show();
                        $(".orderlist").empty();
                        $(".noList").hide();
                        $(".cztd").html("-");
                        if (status == "2") {
                            $(".cztd").html("车队选择");
                        } else if (status == "1") {
                            $(".djs").show();
                        }
                        for (var i = 0; i < result.list.length; i++) {
                            var changeFleet = " <td class=\"wddd_div_tableTime2\">-</td>";
                            var djs =" <td class=\"wddd_div_tableTime2\" style='display:none;'></td>";
                            var lianxxx = "";
                            if (status == "2") {
                                $(".cztd").html("车队选择");
                                var optionStr = " <option value='''>请选择</option>";
                                var fleetList = result.list[i].fleetList;
                                for (var j = 0; j < fleetList.length; j++) {
                                    optionStr += "<option value='" + fleetList[j].id + "''>" + fleetList[j].fleetName + " " + fleetList[j].amount + "元</option>"
                                }
                                changeFleet = " <td class=\"wddd_div_tableTime\"><select style='width: 88px;height: 32px;'>" + optionStr + "</select>" +
                                    "<button type=\"button\" onclick=\"sureOrder(this,'" + result.list[i].orderUuid + "')\">确认</button>" +
                                    "</td>";
                            } else if (status == "5") {
                                lianxxx = "                         <td class=\"wddd_div_tableTime\">" + result.list[i].amount + "</td>" +
                                    "                         <td class=\"wddd_div_tableTime\">" + result.list[i].licensePlate + "</td>" +
                                    "                         <td class=\"wddd_div_tableTime\">" + result.list[i].busPhone + "</td>";
                                $(".lianxxx").show();
                                $(".cztd").html("出行确认");
                                changeFleet = " <td class='wddd_div_tableTime'>" +
                                    "<button type=\"button\" onclick=\"sureOrderGo(3,'" + result.list[i].orderUuid + "')\">确认出行</button>" +
                                    "</td>";
                            } else if (status == "4") {
                                lianxxx = "                         <td class=\"wddd_div_tableTime\">" + result.list[i].amount + "</td>" +
                                    "                         <td class=\"wddd_div_tableTime\">" + result.list[i].licensePlate + "</td>" +
                                    "                         <td class=\"wddd_div_tableTime\">" + result.list[i].busPhone + "</td>";
                                $(".lianxxx").show();
                            } else if (status == "3") {
                                lianxxx = "                         <td class=\"wddd_div_tableTime\">" + result.list[i].amount + "</td>" +
                                    "                         <td class=\"wddd_div_tableTime\">" + result.list[i].licensePlate + "</td>" +
                                    "                         <td class=\"wddd_div_tableTime\">" + result.list[i].busPhone + "</td>";
                                $(".lianxxx").show();
                            }else if(status == "1"){
                                djs = "<td class=\"wddd_div_tableTime2\">" +
                                    "<span id='" + result.list[i].orderUuid + "' onclick='settime(this)'>" + result.list[i].time + "</span></td>";
                            }


                            var busNumber = Number(result.list[i].busNumber1) + '座  '
                                + (result.list[i].busNumber2 == 0 ? "" : "/" + (Number(result.list[i].busNumber2) + '座  '))
                                + (result.list[i].busNumber3 == 0 ? "" : "/" + (Number(result.list[i].busNumber3) + '座  '))
                            var str = "<tr>" + djs +
                                "<td class=\"wddd_div_tableInvoice\" onclick=\"detailorderAjax('" + result.list[i].orderUuid + "')\"><a>" + result.list[i].orderUuid + "</a></td>" +
                                "                       <td class=\"wddd_div_tableInvoice\">" + result.list[i].typeName + "</td>" +
                                "                         <td class=\"wddd_div_tableCfd\">" + result.list[i].fromProvince + result.list[i].fromCity + result.list[i].fromArea + result.list[i].fromAddress + "</td>" +
                                "                         <td class=\"wddd_div_tableCfd\">" + result.list[i].toProvince + result.list[i].toCity + result.list[i].toArea + result.list[i].toAddress + "</td>" +
                                changeFleet +
                                "                         <td class=\"wddd_div_tableTime\">" + result.list[i].contactName + "</td>" +
                                //                                "                         <td class=\"wddd_div_tableTime\">" + result.list[i].contactTel + "</td>" +
                                //                                "                         <td class=\"wddd_div_tableInvoice\">" + result.list[i].useNumber + "</td>" +
                                "                         <td class=\"wddd_div_tableInvoice\">" + busNumber + "</td>" +
                                "                         <td class=\"wddd_div_tableInvoice2\">" + result.list[i].isInvoice + "</td>" +
                                "                         <td class=\"wddd_div_tableTime\">" + result.list[i].fromTime + "</td>" +
                                "                         <td class=\"wddd_div_tableTime\">" + result.list[i].toTime + "</td>" +
                                lianxxx +
                                "</tr>";
                            $(".orderlist").append(str);
                            $("#" + result.list[i].orderUuid ).click();
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
    function sureOrder(obj, orderUuid) {
        if ($(obj).prev().val() == "") {
            layer.msg("车队不能为空", {icon: 2});
            return;
        }
        $.ajax({
            type: "POST",
            url: platform.CONSTS.URL_BASE_CMS + "api/userChangeFleet",
            data: {
                orderUuid: orderUuid,
                orderFleetId: $(obj).prev().val()
            },
            async: false,
            success: function (data) {
                if (data.success == true) {
                    layer.msg("选择车队成功！");
                    getMessage("2");
                } else {
                    layer.msg(data.message, {icon: 2});
                    return;
                }
            }
        });
    }

    //确认出行
    function sureOrderGo(value, orderUuid) {
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
                    layer.msg("确认出行成功！");
                    getMessage("5");
                } else {
                    layer.msg(data.message, {icon: 2});
                    return;
                }
            }
        });
    }

    //关闭
    function closeDetailOrder() {
        $(".detailorder").hide();
    }


    //详情
    function detailorderAjax(orderUuid) {
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
                    $("#orderUuid").val(result.orderUuid);
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
                    var busNumber = Number(result.busNumber1) + '座  '
                        + (result.busNumber2 == 0 ? "" : (Number(result.busNumber2) + '座  '))
                        + (result.busNumber3 == 0 ? "" : (Number(result.busNumber3) + '座  '));
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
                } else {
                    layer.msg(data.message, {icon: 2});
                    return;
                }
            }
        });
        $(".detailorder").show();
    }


    function settime(obj) {
        var time = parseInt($(obj).html() == null ? "0" : $(obj).html());
        if (time == 0) {
            $(obj).html("0");
        } else {
            time--;
            $(obj).html(time);
            setTimeout(function () {
                settime(obj)
            }, 1000)
        }
    }


</script>