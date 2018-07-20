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
                <label for="orderUuid" class="col-sm-1 control-label">订单编号</label>
                <div class="col-sm-2" >
                    <input type="text" name="orderUuid" id="orderUuid" class="form-control">
                </div>
                <label for="contactTel" class="col-sm-1 control-label">联系人手机号</label>
                <div class="col-sm-2" >
                    <input type="text" name="contactTel" id="contactTel" class="form-control">
                </div>
                <label for="status" class="col-sm-1 control-label">状态</label>
                <div class="col-sm-1">
                    <select id ="status" name="status" class="form-control">
                        <option value="">全部</option>
                        <option value="0">预订单</option>
                        <option value="1">等待报价</option>
                        <option value="2">等待客户确认报价</option>
                        <option value="3">行驶中</option>
                        <option value="4">已完成</option>
                    </select>
                </div>
                <label for="type" class="col-sm-1 control-label">服务</label>
                <div class="col-sm-1">
                    <select id ="type" name="type" class="form-control">
                        <option value="">全部</option>
                        <option value="1">包车服务</option>
                        <option value="2">单接送服务</option>
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
            <th style="width: 6%;">订单号</th>
            <th style="width: 6%;">服务</th>
            <th style="width: 6%;">状态</th>
            <th style="width: 6%;">联系人</th>
            <th style="width: 6%;">联系方式</th>
            <th style="width: 6%;">出发时间</th>
            <th style="width: 6%;">结束时间</th>
            <th style="width: 10%;">出发地址</th>
            <th style="width: 10%;">目的地地址</th>
            <th style="width: 6%;">用车人数</th>
            <th style="width: 7%;">用车数量</th>
            <th style="width: 6%;">需要发票</th>
            <th style="width: 10%;">备注</th>
            <th style="width: 6%;">创建人</th>
            <th style="width: 6%;">创建时间</th>
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
                <h4 class="modal-title" id="myModalLabel">订单详情</h4>
            </div>
            <div class="modal-body" style=" width: 100%; ">
                <form role="form" class="form-horizontal" id="updateForm" style=" width: 100%; ">
                    <input type="hidden" class="form-control orderUuid" >
                    <input type="hidden" class="form-control uuid" >
                    <div class="form-group"  >
                        <label class="col-sm-3 control-label">出发时间</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control fromTime"  readonly >
                        </div>
                        <label class="col-sm-3 control-label">结束时间</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control toTime" readonly>
                        </div>
                    </div>
                    <div class="form-group"  >
                        <label class="col-sm-3 control-label">出发地址</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control fromAddress"  readonly >
                        </div>
                        <label class="col-sm-3 control-label">目的地地址</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control toAddress" readonly>
                        </div>
                    </div>
                    <div class="form-group"  >
                        <label class="col-sm-3 control-label">途径地址</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control address"  readonly >
                        </div>
                    </div>
                    <div class="form-group"  >
                        <label class="col-sm-3 control-label">联系人</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control contactName"  readonly >
                        </div>
                        <label class="col-sm-3 control-label">联系电话</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control contactTel" readonly>
                        </div>
                    </div>
                    <div class="form-group"  >
                        <label class="col-sm-3 control-label">用车人数</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control useNumber"  readonly >
                        </div>
                        <label class="col-sm-3 control-label">用车数量</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control busNumber" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">备注</label>
                        <div class="col-sm-6">
                            <textarea  style="margin: 0px; width: 100%; height: 100px;" class="remarks" name="remarks" readonly></textarea>
                        </div>
                    </div>
                    <div class="form-group"  >
                        <label class="col-sm-3 control-label">状态</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control status"  readonly >
                        </div>
                        <label class="col-sm-3 control-label">需要发票</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control isInvoice"  readonly >
                        </div>
                    </div>
                    <div class="invoice" style="display: none">
                        <div class="form-group"  >
                            <label class="col-sm-3 control-label">发票抬头</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control invoiceHeader"  readonly >
                            </div>
                            <label class="col-sm-3 control-label">收件人</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control invoiceContact" readonly>
                            </div>
                        </div>
                        <div class="form-group"  >
                            <label class="col-sm-3 control-label">收件人电话</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control invoicePhone"  readonly >
                            </div>
                            <label class="col-sm-3 control-label">收件人地址</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control invoiceAddress" readonly>
                            </div>
                        </div>
                        <div class="form-group"  >
                            <label class="col-sm-3 control-label">税号</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control invoiceDuty"  readonly >
                            </div>
                        </div>
                    </div>

                    <div class="form-group"  >
                        <label class="col-sm-3 control-label">车队报价</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control feetMoney"  readonly >
                        </div>
                        <label class="col-sm-3 control-label">车队报价时间</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control feetTime" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">车队报价备注</label>
                        <div class="col-sm-6">
                            <textarea  style="margin: 0px; width: 100%; height: 100px;" class="feetRemarks" readonly></textarea>
                        </div>
                    </div>
                    <div class="form-group"  >
                        <label class="col-sm-3 control-label">平台报价</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control auditMoney">
                        </div>
                        <label class="col-sm-3 control-label">平台报价时间</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control auditTime" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">平台报价备注</label>
                        <div class="col-sm-6">
                            <textarea  style="margin: 0px; width: 100%; height: 100px;" class="auditRemarks" ></textarea>
                        </div>
                    </div>
                </form>
                <div class="auditButton" style="display: none">
                    <div class="text-center " >
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary btn-lg" id="okOne">
                                确定报价
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
            platform.getDatatableSettings('/order/system/dataGrid',
                //查询条件
                'queryForm',
                //对应上面thead里面的序列
                [
                    {"data": "orderUuid"},
                    {"data": "typeName"},
                    {
                        "data": 'status',
                        "render": function (data, type, full, callback) {
                            var st = "";
                            if(data == '0') {
                                st = "预订单";
                            } else if (data == '1') {
                                st = "等待报价";
                            }else if (data == '2') {
                                st = "等待客户确认报价";
                            }else if (data == '3') {
                                st = "行驶中";
                            }else if (data == '4') {
                                st = "已完成";
                            }
                            return st;
                        }
                    },
                    {"data": "contactName"},
                    {"data": "contactTel"},
                    {"data": "fromTime"},
                    {"data": "toTime"},
                    {
                        "data": 'fromProvince',
                        "render": function (data, type, full, callback) {
                            return full.fromProvince + full.fromCity + full.fromAddress;
                        }
                    },
                    {
                        "data": 'toProvince',
                        "render": function (data, type, full, callback) {
                            return full.toProvince + full.toCity + full.toAddress;
                        }
                    },
                    {"data": "useNumber"},
                    {
                        "data": 'busNumber',
                        "render": function (data, type, full, callback) {
                            return (Number(full.busNumber1) + Number(full.busNumber2) + Number(full.busNumber3)) + '座*' + data  + "辆";
                        }
                    },
                    {"data": "isInvoice"},
                    {"data": "remarks"},
                    {"data": "nickname"},
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

        //审核通过按钮
        $("#okOne").on("click", function () {
            layer.confirm('<span style="color:red">确定报价吗？</span>', {
                title:"审核",
                btn: ['确认'] //按钮
            }, function(index){
                changeTradeHecStatus("2");
                layer.close(index);
            });

        });

        ///查看详情
        $("#dataTable tbody").on("click", ".audit", function () {
            var data = tables.api().row($(this).parents("tr")).data();
            $(".orderUuid").val(data.orderUuid);
            $(".uuid").val(data.uuid);
            $(".fromTime").val(data.fromTime);
            $(".toTime").val(data.toTime);
            $(".fromAddress").val(data.fromProvince + data.fromCity + data.fromAddress);
            $(".toAddress").val(data.toProvince + data.toCity + data.toAddress);
            $(".address").val(data.address);
            $(".contactName").val(data.contactName);
            $(".contactTel").val(data.contactTel);
            if(data.isInvoice == '是') {
                $(".invoice").show();
                $(".invoiceHeader").val(data.invoiceHeader);
                $(".invoiceContact").val(data.invoiceContact);
                $(".invoicePhone").val(data.invoicePhone);
                $(".invoiceAddress").val(data.invoiceAddress);
                $(".invoiceDuty").val(data.invoiceDuty);
            }
            $(".isInvoice").val(data.isInvoice);
            $(".useNumber").val(data.useNumber);
            var busNumber = Number(data.busNumber1) + Number(data.busNumber2) + Number(data.busNumber3) + '座*' + data.busNumber  + "辆";
            $(".busNumber").val(busNumber);
            $(".feetMoney").val(data.feetMoney);
            $(".feetTime").val(data.feetTime);
            $(".feetRemarks").val(data.feetRemarks);
            $(".auditRemarks").val(data.auditRemarks);
            $(".auditMoney").val(data.auditMoney);
            $(".auditTime").val(data.auditTime);
            var st = "";
            if(data.status == '0') {
                st = "预订单";
            } else if (data.status == '1') {
                st = "等待报价";
            }else if (data.status == '2') {
                st = "等待客户确认报价";
            }else if (data.status == '3') {
                st = "行驶中";
            }else if (data.status == '4') {
                st = "已完成";
            }
            $(".status").val(st);
            if(data.status == '1') {
                $(".auditButton").show();
            }else{
                $(".auditButton").hide();
            }
            $("#editModal").modal("show");

        });

        function changeTradeHecStatus(status){
            var auditMoney = $(".auditMoney").val();
            if(auditMoney == null || auditMoney == ''){
                layer.msg("平台报价不能为空", {icon: 2});
                return;
            }
            $.ajax({
                type: "POST",
                url: platform.CONSTS.URL_BASE_CMS + "order/system/audit",
                data: {
                    "auditBy": '<shiro:principal property="id"/>',
                    "orderUuid": $(".orderUuid").val(),
                    "auditMoney": auditMoney,
                    "status" : status,
                    "uuid": $(".uuid").val(),
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
