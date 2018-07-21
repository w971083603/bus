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
            <label>姓名：</label>
            <input type="text" placeholder="请输入姓名" id="name">
        </li>
        <li class="ready ready_one">
            <label>手机号：</label>
            <input type="text" placeholder="请输入手机号" id="phone">
        </li>
        <li class="ready ready_one">
            <div style="background-color:#80c369;padding:  10px 0;text-align: center;width: 100px;" onclick="saveLxr()">
                保存
            </div>
        </li>
        <li class="ready ready_one" style="width: 100%;display: block;">
            <table style="width: 100%;">
                <tbody class="cyxxList">

                </tbody>
            </table>
        </li>

        <li class="ready ready_two">
            <label>发票抬头：</label>
            <input type="text" placeholder="请输入发票抬头">
        </li>
        <li class="ready ready_two">
            <label>收件人：</label>
            <input type="text" placeholder="请输入收件人">
        </li>
        <li class="ready ready_two">
            <label>手机号码：</label>
            <input type="text" placeholder="请输入手机号码">
        </li>
        <li class="ready ready_two">
            <label>收件地址：</label>
            <input type="text" placeholder="请输入收件地址">
        </li>
        <li class="ready ready_two">
            <label>税号：</label>
            <input type="text" placeholder="请输入税号">
        </li>
        <li class="ready ready_two">
            <div style="background-color:#80c369;padding:  10px 0;text-align: center;width: 100px;" onclick="savefp()">
                保存
            </div>
        </li>
        <li class="ready ready_two">
            <table>
                <tr>
                    <td>发票抬头</td>
                    <td>收件人</td>
                    <td>手机号码</td>
                    <td>收件地址</td>
                    <td>税号</td>
                    <td>
                        <button style="background-color:#80c369;padding:  10px 0;text-align: center;width: 100px;">修改
                        </button>
                        <button style="background-color:red;padding:  10px 0;text-align: center;width: 100px;">删除
                        </button>
                    </td>
                </tr>
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
            data : {
                id:lxid
            },
            success:function(result){
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
            data : {
                "id": lxIdOnley,
                "name": $("#name").val(),
                "phone": $("#phone").val()
            },
            success:function(result){
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
        if(lxIdOnley != ""){
            updateLxr();
        }else{
            $.ajax({
                type: "POST",
                url: platform.CONSTS.URL_BASE_CMS + "api/createContract",
                data : {
                    "name": $("#name").val(),
                    "phone": $("#phone").val()
                },
                success:function(result){
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
            console.log(result);
            var list = result;
            $(".cyxxList").empty();
            for (var i = 0; i < list.length; i++) {
                var str = "<tr lxid='" + list[i].id + "'>" +
                    "                             <td>" + list[i].name + "</td>" +
                    "                             <td>" + list[i].phone + "</td>" +
                    "                             <td>" +
                    "                                 <button style=\"background-color:#80c369;padding:  10px 0;text-align: center;width: 100px;\" onclick=\"detailLxr(this)\">修改</button>" +
                    "                                 <button style=\"background-color:red;padding:  10px 0;text-align: center;width: 100px;\" onclick=\"deleteLxr(this)\">删除</button>" +
                    "                             </td>" +
                    "                         </tr>";

                $(".cyxxList").append(str);
            }
        }, function (err) {
            layer.msg('操作失败！', {icon: 2});
        }, "application/json");
    }


    //以下是发票



</script>