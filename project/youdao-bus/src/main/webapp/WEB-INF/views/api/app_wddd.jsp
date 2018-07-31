<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../../apiCurrency/topapp.jsp" %>
<body style=" background: none;  background-color: #fbfbfb; ">
<header class="ptm-bar ptm-bar-nav  ptm-fix">
    <a class="back ptm-pull-left" onclick="appTz('/api/app_grzx')"  style="margin: 16px;"></a>
    <div class="ptm-title">我的订单</div>
    <a class="ptm-pull-right" onclick="appTz('/api/app_fbxc')">发布行程</a>
</header>
<div class="ptm-content" style="margin-top:40px;">
    <div  class="wddd_div" style="overflow-y: scroll;height: 590px;background-color: white;">
        <div class="wddd_div_title">
            <ul>
                <li class="wddd_div_li mr" onclick="orderstatus('1',this)">报价中(<span style="color: red;" id="bj">0</span>)</li>
                <li class="wddd_div_li" onclick="orderstatus('0',this)">已预定(<span style="color: red;" id="yj">0</span>)</li>
                <li class="wddd_div_li" onclick="orderstatus('3',this)">行驶中(<span style="color: red;" id="xs">0</span>)</li>
                <li class="wddd_div_li" onclick="orderstatus('4',this)">已完成(<span style="color: red;" id="wc">0</span>)</li>
            </ul>
        </div>

        <div class="wddd_div_table">
            <table class="tableOrder" border="1" align="center" cellpadding="2" cellspacing="1" >
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
                </tr>
                </thead>
                <tbody class="orderlist">

                </tbody>
            </table>
            <div class="noList">
                <div style="padding-top: 32%;width: 48%;margin: auto;text-align: center;">
                    <img src="../../../api/img/web/myorder.png">
                    <p>暂无数据，您未发布需求</p>
                </div>
                <div align="center">
                    <button type="button" class="fbxcBtn" onclick="topUrl('/api/app_fbxc')">发布行程</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<!-- jQuery 2.2.3 -->
<%@ include file="../../../apiCurrency/js.jsp" %>
<script>

    function orderstatus(type,obj) {
        $(".wddd_div_li").css("background-color","#fcfffb");
        $(obj).css("background-color","rgb(218, 244, 218)");
        //清空td，ajax获取数据展示
        getMessage(type);
    }

    $(function () {
        getMessage("1");
        $(".mr").css("background-color","rgb(218, 244, 218)");
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
                                "                         <td class=\"wddd_div_tableTime\">" + result.list[i].contactName + "</td>\n" +
                                "                         <td class=\"wddd_div_tableTime\">" + result.list[i].contactTel + "</td>\n" +
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