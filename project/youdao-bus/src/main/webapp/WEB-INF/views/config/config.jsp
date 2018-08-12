<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
<%@ include file="../../../currency/top.jsp" %>
<body class="sidebar-mini">
<!-- 查询、添加、批量删除、导出、刷新 -->
<div class="content">
        <form role="form" class="form-horizontal" id="updateForm" style=" width: 100%; ">
            <div class="form-group">
                <label class="col-sm-3 control-label">车队报价设置（分钟）</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control minute">
                </div>
            </div>
        </form>
        <div class="auditButton">
            <div class="text-center ">
                <div class="btn-group">
                    <button type="button" class="btn btn-primary btn-lg" id="okOne">
                        确定
                    </button>
                </div>
            </div>
        </div>
</div>

</body>
</html>
<%@ include file="../../../currency/js.jsp" %>
<script>
    $(function () {
        select();
        //审核通过按钮
        $("#okOne").on("click", function () {
            layer.confirm('<span style="color:red">确定保存吗？</span>', {
                title: "修改",
                btn: ['确认'] //按钮
            }, function (index) {
                changeTradeHecStatus();
                layer.close(index);
            });

        });

        function select(){
            $.ajax({
                type: "POST",
                url: platform.CONSTS.URL_BASE_CMS + "config/system/dataGrid",
                data: {

                },
                async: false,
                success: function (data) {
                    console.log(data);
                    return;
                    if (data.success == true) {
                        window.location.reload();
                    } else {
                        layer.msg(data.message, {icon: 2});
                        return;
                    }
                }
            });
        }

        function changeTradeHecStatus() {
            $.ajax({
                type: "POST",
                url: platform.CONSTS.URL_BASE_CMS + "config/system/insert",
                data: {
                    "minute": $(".minute").val()
                },
                async: false,
                success: function (data) {
                    if (data.success == true) {
                        window.location.reload();
                    } else {
                        layer.msg(data.message, {icon: 2});
                        return;
                    }
                }
            });
        }
    });

</script>
