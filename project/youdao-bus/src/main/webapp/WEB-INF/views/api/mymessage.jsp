<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../../apiCurrency/top.jsp" %>
<body>
    <div  class="message_div" style="width: 100%">
         <ul>
             <li>
                 <p>我的消息(<span class="message_number"></span>)</p>
             </li>
             <li>
               <table  border="1" cellspacing="0" cellpadding="0" bordercolor="#FF0000">
                   <thead>
                        <tr>
                            <td class="messageTdCheckbox">
                                <input type="checkbox" class="all_checked" onclick="change(this)" >
                            </td>
                            <td class="messageTdContent">
                                <button class="messageBtn" id="yornOk">标记为已读</button>
                                <button class="messageBtn" id="deleteOk">删除已选</button>
                            </td>
                            <td class="messageTdYorn">是否已读</td>
                            <td class="messageTdTime">时间</td>
                        </tr>
                   </thead>
                   <tbody id="selectMessage">
                       <%--<tr>
                           <td><input type="checkbox" class="one_checked" value="1">全选</td>
                           <td>内容</td>
                           <td>是否已读</td>
                           <td>时间</td>
                       </tr>--%>
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
        getMessage();
        $("#yornOk").click(function () {
            //TODO 获取选中的数据
            var ids = "";
            $(".one_checked").each(function (n,obj) {
                if($(obj).is(":checked")){
                    ids += $(obj).val() + ",";
                }
            });
            if (ids == '' || ids == null) {
                layer.msg("未选择需要标记为已读的消息", {icon: 2});
                return;
            }
            $.ajax({
                type: "POST",
                url: platform.CONSTS.URL_BASE_CMS + "api/updateMessage",
                data: {
                    "ids":ids
                },
                async: false,
                success: function (data) {
                    if (data.success == true) {
                        layer.msg('标记已读成功！');
                        getMessage();
                    } else {
                        layer.msg(data.message, {icon: 2});
                        return;
                    }
                }
            });
        });
        $("#deleteOk").click(function () {
            //TODO 获取选中的数据
            var ids = "";
            $(".one_checked").each(function (n,obj) {
                if($(obj).is(":checked")){
                    ids += $(obj).val() + ",";
                }
            });
            if (ids == '' || ids == null) {
                layer.msg("未选择需要删除的消息", {icon: 2});
                return;
            }
            $.ajax({
                type: "POST",
                url: platform.CONSTS.URL_BASE_CMS + "api/updateDeleteMessage",
                data: {
                    "ids":ids
                },
                async: false,
                success: function (data) {
                    if (data.success == true) {
                        layer.msg('删除消息成功！');
                        getMessage();
                    } else {
                        layer.msg(data.message, {icon: 2});
                        return;
                    }
                }
            });
        });
    });

    function getMessage() {
        $(".all_checked").prop("checked",false);
        $.ajax({
            type: "POST",
            url: platform.CONSTS.URL_BASE_CMS + "api/messageList",
            data: {
            },
            async: false,
            success: function (data) {
                if (data.success == true) {
                    var result = data.data;
                    $("#selectMessage").empty();
                    $(".message_number").html(result.allRead);
                    if (result.list.length > 0) {
                        for(var i = 0; i < result.list.length;i++ ) {
                            var str = "<tr><td class=\"messageTdCheckbox\"><input type=\"checkbox\" class=\"one_checked\" value='" + result.list[i].id
                                + "'></td><td class=\"messageTdContent\">" + result.list[i].massage + "</td>"
                                +"<td class=\"messageTdYorn\">" + result.list[i].isYorn + "</td><td class=\"messageTdTime\">" + result.list[i].createTime + "</td>";
                            $("#selectMessage").append(str);
                        }
                    }

                } else {
                    layer.msg(data.message, {icon: 2});
                    return;
                }
            }
        });
    }
    
    //选中
    function change(obj) {
        if($(obj).is(":checked")){
             $(".one_checked").prop("checked",true);
        }else{
            $(".one_checked").prop("checked",false);
        }
    }

</script>