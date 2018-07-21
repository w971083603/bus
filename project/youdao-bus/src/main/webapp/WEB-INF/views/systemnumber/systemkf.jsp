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
            <div class="form-group">
                <label for="loginName" class="col-sm-2 control-label">账号</label>
                <div class="col-sm-2">
                    <input type="text" name="loginName" id="loginName" class="form-control" style="width: 120%;">
                </div>

                <div class="col-sm-4">
                    <div class="pull-right" style="margin-top: 5px;">
                        <div class="btn-group">
                            <shiro:hasPermission name="41search">
                                <button type="button" class="btn btn-primary btn-sm" id="btn-query">
                                    <i class="fa fa-search"></i> 查询
                                </button>
                            </shiro:hasPermission>
                        </div>
                        <shiro:hasPermission name="41add">
                            <button type="button" class="btn btn-primary btn-sm toadd">
                                新增
                            </button>
                        </shiro:hasPermission>
                    </div>
                </div>


            </div>
        </form>
    </div>

    <!--表格-->
    <table id="dataTable" class="table table-striped table-bordered table-hover table-condensed" align="center">
        <thead>
        <tr class="info">
            <th style="width: 10%;">账号</th>
            <th style="width: 10%;">昵称</th>
            <th style="width: 10%;">手机号</th>
            <th style="width: 10%;">注册时间</th>
            <th style="width: 10%;">上线时间</th>
            <th style="width: 10%;">备注</th>
            <th style="width: 10%;">操作</th>
        </tr>
        </thead>
        <tbody></tbody>
    </table>
</div>


<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:30%;">
        <div class="modal-content" style=" width: 100%; ">
            <div class="modal-header" style=" width: 100%; ">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only"></span>
                </button>
                <h4 class="modal-title">新增账号</h4>
            </div>

            <div class="modal-body" style=" width: 100%; ">
                <form role="form" class="form-horizontal" id="addForm" style=" width: 100%; ">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">登录账号</label>
                        <div class="col-sm-6">
                            <input type="text" name="loginName" class="form-control addloginName"
                                   onkeyup="value=value.replace(/[^\0-9\a-z\A-Z]/g,'')">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">登录密码</label>
                        <div class="col-sm-6">
                            <input type="text" name="passWord" class="form-control addpassWord"
                                   onkeyup="value=value.replace(/[^\0-9\a-z\A-Z]/g,'')">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">手机号</label>
                        <div class="col-sm-6">
                            <input type="text" name="phone" class="form-control addphone"
                                   onkeyup="value=value.replace(/[^\0-9\a-z\A-Z]/g,'')">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">昵称</label>
                        <div class="col-sm-6">
                            <input type="text" name="nickName" class="form-control addnickName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">备注</label>
                        <div class="col-sm-6">
                            <textarea type="text" name="remarks" class="form-control addremarks"></textarea>
                        </div>
                    </div>
                </form>

                <div class="text-center" style="margin-top: 50px">
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary btn-lg" id="okAdd">
                                确认新增
                            </button>
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:50%;">
        <div class="modal-content" style=" width: 100%; ">
            <div class="modal-header" style=" width: 100%; ">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only"></span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改账号</h4>
            </div>

            <div class="modal-body" style=" width: 100%; ">
                <form role="form" class="form-horizontal" id="detailForm" style=" width: 100%; ">
                    <input type="hidden" class="userId" value="">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">登录账号</label>
                        <div class="col-sm-6">
                            <input type="text" name="loginName" class="form-control updateloginName"
                                   readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">手机号</label>
                        <div class="col-sm-6">
                            <input type="text" name="phone" class="form-control updatephone"
                                   onkeyup="value=value.replace(/[^\0-9]/g,'')">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">昵称</label>
                        <div class="col-sm-6">
                            <input type="text" name="nickName" class="form-control updatenickName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">二维码</label>
                        <div class="col-sm-6 qrcode">

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">备注</label>
                        <div class="col-sm-6">
                            <textarea type="text" name="remarks" class="form-control updateremarks"></textarea>
                        </div>
                    </div>

                </form>

                <div class="text-center" style="margin-top: 50px">
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary btn-lg" id="okUpdate">
                                确认修改
                            </button>
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>



</body>
</html>
<%@ include file="../../../currency/js.jsp" %>
<script>
    $(function () {

        //添加、修改异步提交地址
        var str = "";
        <shiro:hasPermission name="41update">
        str += "<div class='btn-group'>" +
            "<button  class='btn btn-primary btn-sm toupdate'  id='btn-query'  type='button'>修改</button>" +
            "</div>"
        </shiro:hasPermission>


        var tables = $("#dataTable").dataTable(
            //URL
            platform.getDatatableSettings('user/system/dataGridKf',
                //查询条件
                'queryForm',
                //对应上面thead里面的序列
                [
                    {"data": "loginName"},
                    {"data": 'nickName'},
                    {"data": 'phone'},
                    {
                        "data": 'createDate',
                        "render": function (data, type, full, callback) {
                            return platform.timeStamp2String(data)
                        }
                    },
                    {
                        "data": 'lastTime',
                        "render": function (data, type, full, callback) {
                            return platform.timeStamp2String(data)
                        }
                    },
                    {
                        "data": 'remarks',
                        "render": function (data, type, full, callback) {
                            return data;
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


        //添加
        $(".toadd").on("click", function () {
            $("#addModal").modal("show");
        });


        //新增
        $("#okAdd").on("click", function () {
            if ($(".addloginName").val() == "") {
                layer.msg("登录账号不能为空！", {icon: 2});
                return;
            }
            if (!loginNameIsHave($(".addloginName").val())) {
                layer.msg("登录账号已存在，请更换登录账号！", {icon: 2});
                return;
            }
            if ($(".addpassWord").val() == "") {
                layer.msg("登录密码不能为空！", {icon: 2});
                return;
            }
            if ($(".addphone").val() == "") {
                layer.msg("手机号不能为空！", {icon: 2});
                return;
            }
            $.ajax({
                type: "POST",
                url: platform.CONSTS.URL_BASE_CMS + "user/system/addUser",
                data: {
                    "createBy": '<shiro:principal property="id"/>',
                    "loginNumber": $(".addloginName").val(),
                    "password": $(".addpassWord").val(),
                    "phone": $(".addphone").val(),
                    "name": $(".addnickName").val(),
                    "remarks": $(".addremarks").val(),
                    "roleId": "2"
                },
                async: false,
                success: function (data) {
                    console.log("=========" + data)
                    if (data.success == true) {
                        layer.msg('新增成功！');
                        window.location.reload();
                    } else {
                        layer.msg(data.message, {icon: 2});
                        return;
                    }
                }
            });
        });

        //修改
        $("#dataTable tbody").on("click", ".toupdate", function () {
            var data = tables.api().row($(this).parents("tr")).data();
            $(".updateloginName").val(data.loginName);
            $(".updatephone").val(data.phone);
            $("#qrcode").qrcode({
                render: "table",
                width: 200,
                height:200,
                text: data.phone
            });
            $(".updatenickName").val(data.nickName);
            $(".updateroleId").val(data.roleId);
            $(".userId").val(data.userId);
            $("#editModal").modal("show");
        });
        //修改
        $("#okUpdate").on("click", function () {
            if ($(".updatephone").val() == "") {
                layer.msg("手机号不能为空！", {icon: 2});
                return;
            }
            $.ajax({
                type: "POST",
                url: platform.CONSTS.URL_BASE_CMS + "user/system/updateUser",
                data: {
                    "updateBy": '<shiro:principal property="id"/>',
                    "userId": $(".userId").val(),
                    "phone": $(".updatephone").val(),
                    "name": $(".updatenickName").val(),
                    "remarks": $(".updateremarks").val()
                },
                async: false,
                success: function (data) {
                    if (data.success == true) {
                        layer.msg('修改成功！');
                        window.location.reload();
                    } else {
                        layer.msg(data.message, {icon: 2});
                    }
                }
            });
        });

        //判断登录账号是否存在
        function loginNameIsHave(loginName) {
            var flag = true;
            $.ajax({
                type: "POST",
                url: platform.CONSTS.URL_BASE_CMS + "user/system/loginNameIsHave",
                data: {
                    "loginNumber": loginName
                },
                async: false,
                success: function (data) {
                    flag = data.success;
                }
            });
            return flag;
        }

    });


</script>