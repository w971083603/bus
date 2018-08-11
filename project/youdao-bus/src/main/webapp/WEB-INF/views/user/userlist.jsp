<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
<%@ include file="../../../currency/top.jsp" %>
<body class="sidebar-mini">
<!-- 查询、添加、批量删除、导出、刷新 -->
<div class="content">
    <!-- 查询、添加、批量删除、导出、刷新 -->
    <div class="row-fluid">
        <form id="queryForm" class="form-horizontal" action="" method="post">
            <input type="hidden" class="type" name="type" value="1">
            <div class="form-group">
                <label for="loginName" class="col-sm-2 control-label">账号</label>
                <div class="col-sm-2">
                    <input type="text" name="loginName" id="loginName" class="form-control" style="width: 120%;">
                </div>

                <div class="col-sm-4">
                    <div class="pull-right" style="margin-top: 5px;">
                        <div class="btn-group">
                            <shiro:hasPermission name="57search">
                                <button type="button" class="btn btn-primary btn-sm" id="btn-query">
                                    <i class="fa fa-search"></i> 查询
                                </button>
                            </shiro:hasPermission>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <!--表格-->
    <table id="dataTable" class="table table-striped table-bordered table-hover table-condensed" align="center">
        <thead>
        <tr class="info">
            <th style="width: 10%;">昵称</th>
            <th style="width: 10%;">手机号</th>
            <th style="width: 10%;">性别</th>
            <th style="width: 10%;">邮箱</th>
            <th style="width: 10%;">生日</th>
        </tr>
        </thead>
        <tbody></tbody>
    </table>
</div>

</body>
</html>
<%@ include file="../../../currency/js.jsp" %>
<script>
    $(function () {

        var tables = $("#dataTable").dataTable(
            //URL
            platform.getDatatableSettings('user/system/dataGridBus',
                //查询条件
                'queryForm',
                //对应上面thead里面的序列
                [
                    {"data": 'nickname'},
                    {"data": 'tel'},
                    {"data":'sex'},
                    {"data": 'email'},
                    {"data": 'birthday'}
                ],
                //行操作按钮定义
                [

                ],
                // 在每次table被draw完后回调函数
                function () {
                    var api = this.api();
                    //获取到本页开始的条数
                    var startIndex = api.context[0]._iDisplayStart;
                    api.column(1).nodes().each(function (cell, i) {
                    });
                }
            ));


        //查询按钮
        $("#btn-query").on("click", function () {
            tables.fnDraw();//查询后不需要保持分页状态，回首页
        });

        //刷新
        $("#btn-re").on("click", function () {
            tables.fnDraw(false);//刷新保持分页状态
        });

    });


</script>