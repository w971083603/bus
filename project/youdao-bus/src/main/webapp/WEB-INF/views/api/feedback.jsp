<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../../apiCurrency/top.jsp" %>
<body>
    <div  class="feedbackDiv" style="width: 100%">
         <ul>
             <li>
                 <p class="title">用车类型</p>
             </li>
             <hr class="hr" align="left"/>
             <li>
                 <div class="change updateType" onclick="changediv(this,'1')">包车</div>
                 <div class="change updateType" onclick="changediv(this,'2')">单接送</div>
             </li>
             <li >
                 <p class="titleTwo">反馈详情</p>
             </li>
             <hr class="hr" align="left"/>
             <li>
                 <textarea id="remarks"  placeholder="我有话说..." class="area" ></textarea>
             </li>
             <li>
                 <button id="ok" class="feedbackButton">立即反馈</button>
             </li>
         </ul>
    </div>
</body>
</html>
<!-- jQuery 2.2.3 -->
<%@ include file="../../../apiCurrency/js.jsp" %>
<script>
    var updateType;
    $(function () {
        $("#ok").click(function () {
            if (updateType == null || updateType == '') {
                layer.msg("请选择用车类型", {icon: 2});
                return;
            }
            var remarks = $("#remarks").val();
            if (remarks == null || remarks == '') {
                layer.msg("请填写反馈建议", {icon: 2});
                return;
            }
            $.ajax({
                type: "POST",
                url: platform.CONSTS.URL_BASE_CMS + "api/feedback",
                data: {
                    "type":updateType,
                    "remarks":remarks
                },
                async: false,
                success: function (data) {
                    if (data.success == true) {
                        layer.msg("您的建议已反馈成功");
                    } else {
                        layer.msg(data.message, {icon: 2});
                        return;
                    }
                }
            });
        });
    });

    function changediv(obj,type) {
        $(".change").css("background-color","#fcfffb");
        $(obj).css("background-color","#06dc00");
        if(type == "1"){
            updateType = 1;
        }else{
            updateType = 2;
        }

    }

</script>