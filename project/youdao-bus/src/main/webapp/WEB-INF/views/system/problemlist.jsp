<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html style=" overflow: hidden;">
<%@ include file="../../../currency/top.jsp"%>
<body   class="sidebar-mini">
<!-- 查询、添加、批量删除、导出、刷新 -->
<div class="content">
    <!-- 查询、添加、批量删除、导出、刷新 -->
    <div class="row-fluid">
        <form id="queryForm" class="form-horizontal" action="" method="post">
            <div class="form-group">
                <label for="nickname" class="col-sm-2 control-label">昵称</label>
                <div class="col-sm-2">
                    <input type="text" name="nickname" id="nickname" class="form-control" style="width: 120%;">
                </div>
                <div class="col-sm-4">
                    <div class="pull-right" style="margin-top: 5px;">
                        <div class="btn-group">
                            <shiro:hasPermission name="51search">
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
            <th style="width: 2%;">用户昵称</th>
            <th style="width: 2%;">反馈类型</th>
            <th style="width: 2%;">反馈内容</th>
            <th style="width: 10%;">创建时间</th>
        </tr>
        </thead>
        <tbody></tbody>
    </table>
</div>

</body>
</html>
<%@ include file="../../../currency/js.jsp"%>
<script>
    $(function () {
        var tables = $("#dataTable").dataTable(
            //URL
            platform.getDatatableSettings('system/system/dataGridProblem',
                //查询条件
                'queryForm',
                //对应上面thead里面的序列
                [
                    {"data": 'nickname'},
                    {"data": 'type'},
                    {"data": 'remarks'},
                    {
                        "data": 'createTime',
                        "render": function (data, type, full, callback) {
                            return platform.timeStamp2String(data)
                        }
                    }
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
//                    cell.innerHTML = cicada.CONSTS.TASK_TYPE.getName(i+1);
                    });
                }
            ));
    });
</script>