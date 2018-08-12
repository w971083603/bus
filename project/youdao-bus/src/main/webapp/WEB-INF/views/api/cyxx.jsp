<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../../apiCurrency/top.jsp" %>
<body>
<div class="cyxx_div" style="width: 100%;padding: 40px;overflow-y: scroll;height: 590px;">
    <ul>
        <li>
            <div class="change change_lxr zhszType" onclick="changediv(this,'1')">联系人</div>
            <div class="change change_fp zhszType" onclick="changediv(this,'2')">发票</div>
        </li>
        <li class="ready ready_one">
            <label >姓名：</label>
            <input type="text" class="cyxxInput" placeholder="请输入姓名" id="name">
        </li>
        <li class="ready ready_one">
            <label>手机号：</label>
            <input type="text" class="cyxxInput" placeholder="请输入手机号" id="phone">
        </li>
        <li class="ready ready_one">
           <%-- <div style="background-color:#80c369;padding:  10px 0;text-align: center;width: 100px;" onclick="saveLxr()">
                保存
            </div>--%>
            <button  class="zhszOk" id="ok" onclick="saveLxr()">保存</button>
        </li>
        <li class="ready ready_one" style="width: 100%;display: block;">
            <table style="width: 100%;">
                <tbody class="cyxxList">

                </tbody>
            </table>
        </li>

        <li class="ready ready_two">
            <label>发票抬头：</label>
            <input type="text" class="cyxxInput" placeholder="请输入发票抬头" id="invoiceHeader" >
        </li>
        <li class="ready ready_two">
            <label>收件人：</label>
            <input type="text" class="cyxxInput" placeholder="请输入收件人" id="invoiceContact">
        </li>
        <li class="ready ready_two">
            <label>手机号码：</label>
            <input type="text" class="cyxxInput" placeholder="请输入手机号码" id="invoicePhone">
        </li>
        <li class="ready ready_two">
            <label>收件地址：</label>
            <input type="text" class="cyxxInput" placeholder="请输入收件地址" id="invoiceAddress">
        </li>
        <li class="ready ready_two">
            <label>税号：</label>
            <input type="text" class="cyxxInput" placeholder="请输入税号" id="invoiceDuty" >
        </li>
        <li class="ready ready_two">
            <%--<div style="background-color:#80c369;padding:  10px 0;text-align: center;width: 100px;" onclick="saveFp()">
                保存
            </div>--%>
            <button  class="zhszOk" onclick="saveFp()">保存</button>
        </li>
        <li class="ready ready_two">
            <table>
                <tbody class="fplist">

                </tbody>
            </table>
        </li>

    </ul>
</div>
</body>
</html>
<!-- jQuery 2.2.3 -->
<%@ include file="../../../apiCurrency/js.jsp" %>
<script>
    $(function () {
        $(".change_lxr").click();
    });
    var changeType = 1;

    function changediv(obj, type) {
        $(".change").css("background-color", "#fcfffb");
        $(obj).css("background-color", "#06dc00");
        $(".ready").hide();
        if (type == "1") {
            $(".ready_one").show();
            $(".ready_two").hide();
            changeType = type;
        } else {
            $(".ready_two").show();
            $(".ready_one").hide();
            changeType = type;
        }
    }

    var lxIdOnley = "";

    //删除联系人
    function deleteLxr(obj) {
        var lxid = $(obj).parent().parent().attr("lxid");
        $.ajax({
            type: "POST",
            url: platform.CONSTS.URL_BASE_CMS + "api/deleteContract",
            data: {
                id: lxid
            },
            success: function (result) {
                layer.msg('删除成功！');
                //更新列表
                listContract();
            }
        });
    }

    //修改联系人
    function updateLxr() {
        $.ajax({
            type: "POST",
            url: platform.CONSTS.URL_BASE_CMS + "api/updateContract",
            data: {
                "id": lxIdOnley,
                "name": $("#name").val(),
                "phone": $("#phone").val()
            },
            success: function (result) {
                layer.msg('修改成功！');
                $("#name").val("");
                $("#phone").val(""),
                    //更新列表
                    listContract();
            }
        });

        lxIdOnley = "";
    }

    //新增联系人
    function saveLxr() {
        if (lxIdOnley != "") {
            updateLxr();
        } else {
            $.ajax({
                type: "POST",
                url: platform.CONSTS.URL_BASE_CMS + "api/createContract",
                data: {
                    "name": $("#name").val(),
                    "phone": $("#phone").val()
                },
                success: function (result) {
                    layer.msg('新增成功！');
                    $("#name").val("");
                    $("#phone").val("");
                    //更新列表
                    listContract();
                }
            });
        }
    }

    //联系人详情
    function detailLxr(obj) {
        var firstParent = $(obj).parent().parent();
        lxIdOnley = firstParent.attr("lxid");
        $("#name").val($(firstParent).children("td").eq(0).html());
        $("#phone").val($(firstParent).children("td").eq(1).html());
    }

    //联系人列表 listContract
    listContract();

    function listContract() {
        platform.post('api/listContract', {}, function (result) {
            var list = result;
            $(".cyxxList").empty();
            for (var i = 0; i < list.length; i++) {
                var str = "<tr lxid='" + list[i].id + "'>" +
                    "                             <td>" + list[i].name + "</td>" +
                    "                             <td>" + list[i].phone + "</td>" +
                    "                             <td>" +
                    "                                 <button class=\"cyxxUpdateBtn\" onclick=\"detailLxr(this)\">修改</button>" +
                    "                                 <button class=\"cyxxDelBtn\" onclick=\"deleteLxr(this)\">删除</button>" +
                    "                             </td>" +
                    "                         </tr>";

                $(".cyxxList").append(str);
            }
        }, function (err) {
            layer.msg('操作失败！', {icon: 2});
        }, "application/json");
    }


    //以下是发票

    var fpIdOnley = "";

    //删除发票
    function deleteFp(obj) {
        var fpid = $(obj).parent().parent().attr("fpid");
        $.ajax({
            type: "POST",
            url: platform.CONSTS.URL_BASE_CMS + "api/deleteInvoice",
            data: {
                id: fpid
            },
            success: function (result) {
                layer.msg('删除成功！');
                //更新列表
                listInvoice();
            }
        });
    }

    //修改联系人
    function updateFp() {
        $.ajax({
            type: "POST",
            url: platform.CONSTS.URL_BASE_CMS + "api/updateInvoice",
            data: {
                "id": fpIdOnley,
                "invoiceHeader": $("#invoiceHeader").val(),
                "invoiceContact": $("#invoiceContact").val(),
                "invoicePhone": $("#invoicePhone").val(),
                "invoiceAddress": $("#invoiceAddress").val(),
                "invoiceDuty": $("#invoiceDuty").val()
            },
            success: function (result) {
                layer.msg('修改成功！');
                $("#invoiceHeader").val("");
                $("#invoiceContact").val("");
                $("#invoicePhone").val("");
                $("#invoiceAddress").val("");
                $("#invoiceDuty").val("");
                    //更新列表
                    listInvoice();
            }
        });
        lxIdOnley = "";
    }
    //创建发票
    function saveFp() {
        if (fpIdOnley != "") {
            updateFp();
        } else {
            $.ajax({
                type: "POST",
                url: platform.CONSTS.URL_BASE_CMS + "api/createInvoice",
                data: {
                    "name": $("#name").val(),
                    "phone": $("#phone").val()
                },
                success: function (result) {
                    layer.msg('新增成功！');
                    $("#invoiceHeader").val("");
                    $("#invoiceContact").val("");
                    $("#invoicePhone").val("");
                    $("#invoiceAddress").val("");
                    $("#invoiceDuty").val("");
                    //更新列表
                    listInvoice();
                }
            });
        }
    }

    //联系人详情
    function detailFp(obj) {
        var firstParent = $(obj).parent().parent();
        fpIdOnley = firstParent.attr("fpid");
        $("#invoiceHeader").val($(firstParent).children("td").eq(0).html());
        $("#invoiceContact").val($(firstParent).children("td").eq(1).html());
        $("#invoicePhone").val($(firstParent).children("td").eq(2).html());
        $("#invoiceAddress").val($(firstParent).children("td").eq(3).html());
        $("#invoiceDuty").val($(firstParent).children("td").eq(4).html());
    }

    //发票列表 listInvoice
    listInvoice();
    function listInvoice() {
        platform.post('api/listInvoice', {}, function (result) {
            console.log(result);
            var list = result;
            $(".fplist").empty();
            for (var i = 0; i < list.length; i++) {
                var str = "<tr fpid='" + list[i].id + "'>" +
                    "                    <td>" + list[i].invoiceHeader + "</td>" +
                    "                    <td>" + list[i].invoiceContact + "</td>" +
                    "                    <td>" + list[i].invoicePhone + "</td>" +
                    "                    <td>" + list[i].invoiceAddress + "</td>" +
                    "                    <td>" + list[i].invoiceDuty + "</td>" +
                    "                    <td>" +
                    "                        <button class=\"cyxxUpdateBtn\" onclick=\"detailFp(this)\">修改</button>" +
                    "                        <button class=\"cyxxDelBtn\" onclick=\"deleteFp(this)\">删除</button>" +
                    "                    </td>" +
                    "                </tr>";

                $(".fplist").append(str);
            }
        }, function (err) {
            layer.msg('操作失败！', {icon: 2});
        }, "application/json");
    }


</script>