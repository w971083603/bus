<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../../apiCurrency/top.jsp" %>
<body>
<div class="wddd_div" style="overflow-y: scroll;height: 590px;">
    <div class="wddd_div_title">
        <ul>
            <li class="wddd_div_li" onclick="orderstatus('1',this)">报价中(<span style="color: red;" id="bj">0</span>)</li>
            <li class="wddd_div_li" onclick="orderstatus('2',this)">选择报价(<span style="color: red;" id="qr">0</span>)</li>
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
                <td class="wddd_div_tableInvoice">服务</td>
                <td class="wddd_div_tableCfd">出发地</td>
                <td class="wddd_div_tableCfd">目的地</td>
                <td class="wddd_div_tableTime">联系人</td>
                <td class="wddd_div_tableTime">手机号码</td>
                <td class="wddd_div_tableInvoice">用车人数</td>
                <td class="wddd_div_tableInvoice">用车数量</td>
                <td class="wddd_div_tableInvoice">发票</td>
                <td class="wddd_div_tableTime">出发时间</td>
                <td class="wddd_div_tableTime">结束时间</td>
                <td class="wddd_div_tableTime">报价金额</td>
                <td class="wddd_div_tableTime">操作</td>
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
</body>
</html>
<!-- jQuery 2.2.3 -->
<%@ include file="../../../apiCurrency/js.jsp" %>
<script>

    function orderstatus(type, obj) {
        $(".wddd_div_li").css("background-color", "#fcfffb");
        $(obj).css("background-color", "#06dc00");
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
                        $(".tableOrder").show();
                        $(".orderlist").empty();
                        $(".noList").hide();
                        for (var i = 0; i < result.list.length; i++) {
                            var changeFleet = " <td class=\"wddd_div_tableTime\">-</td></tr>";
                            if (status == "2") {
                                var optionStr = " <option value='''>请选择</option>";
                                var fleetList = result.list[i].fleetList;
                                for (var j = 0; j < fleetList.length; j++) {
                                    optionStr += "<option value='" + fleetList[j].id + "''>" + fleetList[j].amount + "元</option>"
                                }
                                changeFleet = " <td class=\"wddd_div_tableTime\"><select style='width: 88px;'>" + optionStr + "</select>" +
                                    "<button type=\"button\" onclick=\"sureOrder(this,'" + result.list[i].orderUuid + "')\">确认</button>" +
                                    "</td></tr>";
                            } else if (status == "5") {
                                changeFleet = " <td class=\"wddd_div_tableTime\">" +
                                    "<button type=\"button\" onclick=\"sureOrderGo('" + result.list[i].orderUuid + "')\">确认出行</button>" +
                                    "</td></tr>";
                            }


                            var busNumber = Number(result.list[i].busNumber1) + Number(result.list[i].busNumber2) + Number(result.list[i].busNumber3) + '座*' + result.list[i].busNumber + "辆";
                            var str = "<tr><td class=\"wddd_div_tableInvoice\">" + result.list[i].typeName + "</td>\n" +
                                "                         <td class=\"wddd_div_tableCfd\">" + result.list[i].fromProvince + result.list[i].fromCity + result.list[i].fromAddress + "</td>\n" +
                                "                         <td class=\"wddd_div_tableCfd\">" + result.list[i].toProvince + result.list[i].toCity + result.list[i].toAddress + "</td>\n" +
                                "                         <td class=\"wddd_div_tableTime\">" + result.list[i].contactName + "</td>\n" +
                                "                         <td class=\"wddd_div_tableTime\">" + result.list[i].contactTel + "</td>\n" +
                                "                         <td class=\"wddd_div_tableInvoice\">" + result.list[i].useNumber + "</td>\n" +
                                "                         <td class=\"wddd_div_tableInvoice\">" + busNumber + "</td>\n" +
                                "                         <td class=\"wddd_div_tableInvoice\">" + result.list[i].isInvoice + "</td>\n" +
                                "                         <td class=\"wddd_div_tableTime\">" + result.list[i].fromTime + "</td>\n" +
                                "                         <td class=\"wddd_div_tableTime\">" + result.list[i].toTime + "</td>" +
                                "                         <td class=\"wddd_div_tableTime\">" + result.list[i].amount + "</td>" +
                                changeFleet +
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
                    getMessage("1");
                } else {
                    layer.msg(data.message, {icon: 2});
                    return;
                }
            }
        });
    }

    //确认出行
    function sureOrderGo(orderUuid) {
        $.ajax({
            type: "POST",
            url: platform.CONSTS.URL_BASE_CMS + "api/userChangeStatus",
            data: {
                orderUuid: orderUuid,
                status: "3"
            },
            async: false,
            success: function (data) {
                if (data.success == true) {
                    getMessage("5");
                } else {
                    layer.msg(data.message, {icon: 2});
                    return;
                }
            }
        });
    }


</script>