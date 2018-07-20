<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
<%@ include file="../../../currency/top.jsp"%>
<body   class="sidebar-mini">
<!-- 查询、添加、批量删除、导出、刷新 -->
<div class="content">
    <!-- 查询、添加、批量删除、导出、刷新 -->
    <div class="row-fluid">
        <form id="queryForm" class="form-horizontal" action="" method="post">
            <div class="form-group">
                <label for="name" class="col-sm-1 control-label">姓名</label>
                <div class="col-sm-2" >
                    <input type="text" name="name" id="name" class="form-control">
                </div>
                <label for="tel" class="col-sm-1 control-label">手机号</label>
                <div class="col-sm-2" >
                    <input type="text" name="tel" id="tel" class="form-control">
                </div>
                <label for="status" class="col-sm-1 control-label">状态</label>
                <div class="col-sm-1">
                    <select id ="status" name="status" class="form-control">
                        <option value="">全部</option>
                        <option value="1">待审核</option>
                        <option value="2">审核通过</option>
                        <option value="3">审核不通过</option>
                    </select>
                </div>
                <div class="col-sm-2" >
                    <div class="pull-right" style=" margin-top: 5px;">
                        <div class="btn-group">
                            <shiro:hasPermission name="2search">
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
            <th style="width: 10%;">手机号</th>
            <th style="width: 10%;">姓名</th>
            <th style="width: 10%;">备注</th>
            <th style="width: 10%;">状态</th>
            <th style="width: 10%;">审核备注</th>
            <th style="width: 10%;">创建时间</th>
            <th style="width: 10%;">操作</th>
        </tr>
        </thead>
        <tbody></tbody>
    </table>
</div>

<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:50%;">
        <div class="modal-content" style=" width: 100%; ">
            <div class="modal-header" style=" width: 100%; ">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only"></span>
                </button>
                <h4 class="modal-title" id="myModalLabel">车队审核</h4>
            </div>

            <div class="modal-body" style=" width: 100%; ">
                <form role="form" class="form-horizontal" id="updateForm" style=" width: 100%; ">
                    <input type="hidden" class="form-control id" >
                    <div class="form-group"  >
                        <label class="col-sm-3 control-label">手机号</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control tel"  readonly >
                        </div>
                        <label class="col-sm-3 control-label">姓名</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control name" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">备注</label>
                        <div class="col-sm-6">
                            <textarea  style="margin: 0px; width: 100%; height: 100px;" class="remarks" name="remarks" readonly></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">审核备注</label>
                        <div class="col-sm-6">
                            <textarea  style="margin: 0px; width: 100%; height: 100px;" class="auditRemarks" ></textarea>
                        </div>
                    </div>
                </form>
                <div class="auditButton" style="display: none">
                    <div class="text-center " >
                        <div class="btn-group" style="margin-right: 10%;">
                            <button type="button" class="btn btn-default btn-lg" id="errorOne"  >
                                审核不通过
                            </button>
                        </div>
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary btn-lg" id="okOne">
                                审核通过
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
<%@ include file="../../../currency/js.jsp"%>
<script>
    $(function () {

        //添加、修改异步提交地址
        var str = "";
        <shiro:hasPermission name="2search">
        str+= "<div class='btn-group'>" +
            "<button class='btn btn-danger btn-sm audit' type='button'> 详情</button>" +
            "</div>"
        </shiro:hasPermission>


        var tables = $("#dataTable").dataTable(
            //URL
            platform.getDatatableSettings('/fleet/system/dataGrid',
                //查询条件
                'queryForm',
                //对应上面thead里面的序列
                [
                    {"data": "tel"},
                    {"data": "name"},
                    {"data": "remarks"},
                    {
                        "data": 'status',
                        "render": function (data, type, full, callback) {
                            var st = "";
                            if (data == '1') {
                                st = "待审核";
                            }else if (data == '2') {
                                st = "审核通过";
                            }else if (data == '3') {
                                st = "审核不通过";
                            }
                            return st;
                        }
                    },
                    {"data": "aduitRemarks"},
                    {
                        "data": 'createTime',
                        "render": function (data, type, full, callback) {
                            return platform.timeStamp2String(data)
                        }
                    },
                    {"data": 'columnDefs'}
                ],
                //行操作按钮定义
                [
                    {
                        targets: -1,
                        defaultContent: str
                    }
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

        ///查看详情
        $("#dataTable tbody").on("click", ".audit", function () {
            var data = tables.api().row($(this).parents("tr")).data();
            console.log(data);
            $(".id").val(data.id);
            $(".tel").val(data.tel);
            $(".name").val(data.name);
            $(".auditRemarks").val(data.aduitRemarks);
            var st = "";
            if (data.status == '1') {
                st = "等待审核";
            }else if (data.status == '2') {
                st = "审核通过";
            }else if (data.status == '3') {
                st = "审核不通过";
            }
            $(".status").val(st);
            if(data.status == '1') {
                $(".auditButton").show();
            }else{
                $(".auditButton").hide();
            }
            $("#editModal").modal("show");
        });

        //审核通过按钮
        $("#okOne").on("click", function () {
            layer.confirm('<span style="color:red">确定审核通过吗？</span>', {
                title:"审核",
                btn: ['确认'] //按钮
            }, function(index){
                changeTradeHecStatus("2");
                layer.close(index);
            });

        });

        //审核不通过通过按钮
        $("#errorOne").on("click", function () {
            layer.confirm('<span style="color:red">确定不通过审核吗？</span>', {
                title:"审核",
                btn: ['确认'] //按钮
            }, function(index){
                if($(".auditRemarks").val() == ""){
                    layer.msg("审核备注信息不能为空", {icon: 2});
                }else{
                    changeTradeHecStatus("3");
                }
                layer.close(index);
            });

        });
        //改变审核状态
        function changeTradeHecStatus(status){
            $.ajax({
                type: "POST",
                url: platform.CONSTS.URL_BASE_CMS + "fleet/system/audit",
                data: {
                    "auditBy": '<shiro:principal property="id"/>',
                    "id": $(".id").val(),
                    "status" : status,
                    "auditRemarks" : $(".auditRemarks").val()
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
