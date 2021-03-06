<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../../apiCurrency/topapp.jsp" %>
<body style="  background: none; background-color: #fdfdfd;">
<header class="ptm-bar ptm-bar-nav  ptm-fix">
    <a class="back ptm-pull-left" onclick="appTz('/api/app_grzx')" style="margin: 16px;"></a>
    <div class="ptm-title">发布行程</div>
    <a class="ptm-pull-right"></a>
</header>
<div class="ptm-content" style="margin-top:40px;">
    <form id="saveForm" method="post">
        <input type="hidden" name="type" id="type" value="1">
        <div class="fbxc_div">
            <div class="fbxc_div_one fbxc_div_all">
                <div class="demand_list">
                    <ul style="padding-top: 26px;">
                        <li class="firs_one" id="dancheng" style="text-indent: 10px" onclick="next('fbxc_div_two','1')">
                          <a style="">选择包车</a>
                        </li>
                        <li class="firs_one" id="duori" onclick="next('fbxc_div_two','2')">
                            <a style="">选择单接送</a>
                        </li>
                        <div style="clear: both;"></div>
                    </ul>
                    <div style="margin: 20px auto;width: 200px;text-align: center;">请选择包车模式</div>
                </div>
            </div>
            <div class="fbxc_div_two fbxc_div_all">
                <div class="fbxc_div_content">
                    <div class="fbxc_div_content_content" style="">
                        <ul>
                            <li style="">
                                <div class="fbxcSpanRed"><img src="../../../api/img/app/time.png"></div>
                                <div class="fbxcSpanRed_nextdiv">
                                    <span class="fbxcSpanName">出发时间</span>
                                    <input type="text" class="fbxcInputTime" id="fromTime" name="fromTime" placeholder="请选择出发时间"/>
                                </div>
                            </li>
                            <li style="" class="toTimeForDjs">
                                <div class="fbxcSpanRed"><img src="../../../api/img/app/time.png"></div>
                                <div class="fbxcSpanRed_nextdiv">
                                    <span class="fbxcSpanName">结束时间</span>
                                    <input type="text" class="fbxcInputTime" id="toTime" name="toTime"  placeholder="请选择结束时间"/>
                                </div>
                            </li>
                            <li style="">
                                <div class="fbxcSpanRed"><img src="../../../api/img/app/address.png"></div>
                                <div class="fbxcSpanRed_nextdiv">
                                        <span class="fbxcSpanName">出&nbsp;&nbsp;&nbsp;发地</span>
                                        <input type="text" name="fromAddress" class="fbxcInputTime fbxcSelect_input"/>
                                        <select name="fromCity" class="fbxcSelect">
                                            <option selected="selected" value="">请选择</option>
                                        </select>
                                        <select name="fromProvince" class="fbxcSelect" onchange="getFromCity(this)">
                                            <option selected="selected" value="">请选择</option>
                                        </select>
                                </div>
                            </li>
                            <li style="">
                                <div class="fbxcSpanRed"><img src="../../../api/img/app/address.png"></div>
                                <div class="fbxcSpanRed_nextdiv">
                                    <span class="fbxcSpanName">目&nbsp;&nbsp;&nbsp;的地</span>
                                    <input type="text" name="toAddress" class="fbxcInputTime fbxcSelect_input"/>
                                    <select name="toCity" class="fbxcSelect">
                                        <option selected="selected" value="">请选择</option>
                                    </select>
                                    <select name="toProvince" class="fbxcSelect" onchange="getToCity(this)">
                                        <option selected="selected" value="">请选择</option>
                                    </select>
                                </div>
                            </li>
                            <li id="wayid">
                                <div class="fbxcSpanRed"><img src="../../../api/img/app/+.png"></div>
                                <div class="fbxcSpanRed_nextdiv">
                                    <span class="fbxcSpanName fbxcTjBtn" onclick="addmidway()" id="tjOk">新增途径地</span>
                                    <input type="hidden" name="road" id="road">
                                    <div id="tjaddress" style="width: 100%;">

                                    </div>
                                </div>
                            </li>
                            <li style="">
                                <div class="fbxcSpanRed"><img src="../../../api/img/app/lxr.png"></div>
                                <div class="fbxcSpanRed_nextdiv">
                                    <span class="fbxcSpanName">联&nbsp;&nbsp;&nbsp;系人</span>
                                    <input type="text" name="contactName" class="fbxcInputTime" placeholder="请请输入联系人"/>
                                </div>
                            </li>
                            <li style="">
                                <div class="fbxcSpanRed"><img src="../../../api/img/app/lxr.png"></div>
                                <div class="fbxcSpanRed_nextdiv">
                                    <span class="fbxcSpanName">手机号码</span>
                                    <input type="text" name="contactTel" class="fbxcInputTime" placeholder="请输入手机号码"/>
                                </div>
                             </li>
                            <li style="">
                                <div class="fbxcSpanRed"><img src="../../../api/img/app/rs.png"></div>
                                <div class="fbxcSpanRed_nextdiv">
                                    <span class="fbxcSpanName">用车人数</span>
                                    <input type="number" name="useNumber" class="fbxcYcrs" placeholder="人数"/>
                                    <span class="fbxcSpanName">用车数量</span>
                                    <select name="busNumber" class="fbxcSelect" id="busNumber">
                                        <option value="">辆</option>
                                        <option value="1">1辆</option>
                                        <option value="2">2辆</option>
                                        <option value="3">3辆</option>
                                        <option value="4">>3辆</option>
                                    </select>
                                </div>
                            </li>
                            <li style="">
                                <div class="fbxcSpanRed"><img src="../../../api/img/app/zw.png"></div>
                                <div class="fbxcSpanRed_nextdiv">
                                    <span class="fbxcSpanName">车辆座位</span>
                                    <select name="busNumber1" class="fbxcSelect">
                                        <option value="">座</option>
                                        <option value="4">4座</option>
                                        <option value="6">6座</option>
                                        <option value="9">9座</option>
                                        <option value="12">12座</option>
                                        <option value="15">15座</option>
                                        <option value="18">18座</option>
                                        <option value="21">21座</option>
                                        <option value="24">24座</option>
                                        <option value="28">28座</option>
                                        <option value="34">34座</option>
                                        <option value="38">38座</option>
                                        <option value="46">46座</option>
                                        <option value="50">50座</option>
                                        <option value="54">54座</option>
                                    </select>
                                    <select name="busNumber2" class="fbxcSelect" id="busNumber2">
                                        <option value="">座</option>
                                        <option value="4">4座</option>
                                        <option value="6">6座</option>
                                        <option value="9">9座</option>
                                        <option value="12">12座</option>
                                        <option value="15">15座</option>
                                        <option value="18">18座</option>
                                        <option value="21">21座</option>
                                        <option value="24">24座</option>
                                        <option value="28">28座</option>
                                        <option value="34">34座</option>
                                        <option value="38">38座</option>
                                        <option value="46">46座</option>
                                        <option value="50">50座</option>
                                        <option value="54">54座</option>
                                    </select>
                                    <select name="busNumber3" class="fbxcSelect" id="busNumber3">
                                        <option value="">座</option>
                                        <option value="4">4座</option>
                                        <option value="6">6座</option>
                                        <option value="9">9座</option>
                                        <option value="12">12座</option>
                                        <option value="15">15座</option>
                                        <option value="18">18座</option>
                                        <option value="21">21座</option>
                                        <option value="24">24座</option>
                                        <option value="28">28座</option>
                                        <option value="34">34座</option>
                                        <option value="38">38座</option>
                                        <option value="46">46座</option>
                                        <option value="50">50座</option>
                                        <option value="54">54座</option>
                                    </select>
                                </div>
                            </li>
                            <li style="">
                                <div class="fbxcSpanRed"><img src="../../../api/img/app/bz.png"></div>
                                <div class="fbxcSpanRed_nextdiv">
                                    <span class="fbxcSpanName">备&nbsp;&nbsp;&nbsp;&nbsp;注</span>
                                    <input type="text" name="remarks" class="fbxcRemarks" placeholder="请请输入备注"/>
                                </div>
                             </li>
                            <li style="">
                                <div class="fbxcSpanRed"><img src="../../../api/img/app/fp.png"></div>
                                <div class="fbxcSpanRed_nextdiv">
                                    <span class="fbxcSpanName">需要发票</span>
                                    <input class="fbxcRedio" name="isInvoice" type="radio" value="否" checked/><span
                                        class="fbxcRedioName">否</span>
                                    <input class="fbxcRedio" name="isInvoice" type="radio" value="是"/><span
                                        class="fbxcRedioName">是</span>
                                    <ul id="invoice" style="display: none;width: 100%;">
                                        <li style="">
                                            <div class="fbxcSpanRed_nextdiv">
                                            <span class="fbxcSpanName">发票抬头</span>
                                            <input type="text" class="fbxcInputTime input_not_paddingleft" id="invoiceHeader" name="invoiceHeader"/>
                                            </div>
                                        </li>
                                        <li style="">
                                            <div class="fbxcSpanRed_nextdiv">
                                            <span class="fbxcSpanName">收&nbsp;&nbsp;&nbsp;&nbsp;件人</span>
                                            <input type="text" class="fbxcInputTime input_not_paddingleft" id="invoiceContact" name="invoiceContact"/>
                                            </div>
                                        </li>
                                        <li style="">
                                            <div class="fbxcSpanRed_nextdiv">
                                               <span class="fbxcSpanName">联系方式</span>
                                            <input type="text" class="fbxcInputTime input_not_paddingleft" id="invoicePhone" name="invoicePhone"/>
                                            </div>
                                        </li>
                                        <li style="">
                                            <div class="fbxcSpanRed_nextdiv">
                                            <span class="fbxcSpanName">收件地址</span>
                                            <input type="text" class="fbxcInputTime input_not_paddingleft" id="invoiceAddress" name="invoiceAddress"/>
                                            </div>
                                        </li>
                                        <li style="">
                                            <div class="fbxcSpanRed_nextdiv">
                                            <span class="fbxcSpanName">税&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</span>
                                            <input type="text" class="fbxcInputTime input_not_paddingleft" id="invoiceDuty" name="invoiceDuty"/>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <div class="app_buttom_ls"  id="ok" >预览订单</div>
                            </li>
                        </ul>
                    </div>
                </div>
                <%--<div style="background-color:#80c369;/* height: 45px; */width: 80px;margin: 10px auto;padding:  10px;" id="ok">预览订单</div>--%>
            </div>
            <div class="fbxc_div_three fbxc_div_all">
                <div class="fbxc_div_content" style="">
                    <div class="fbxc_div_content_content">
                        <ul>
                            <li style="">
                                你的用车类型：<span class="type"></span>
                            </li>
                            <li style="padding-left: 20px;">
                                出发时间：<span class="fromTime"></span>
                            </li>
                            <li style="padding-left: 20px;" class="toTimeTitel">
                                结束时间：<span class="toTime"></span>
                            </li>
                            <li style="padding-left: 20px;">
                                出发地：<span class="fromAddress"></span>
                            </li>
                            <li style="padding-left: 20px;">
                                目的地：<span class="toAddress"></span>
                            </li>
                            <li style="padding-left: 20px;" class="roadTitel">
                                途径地：<span class="road"></span>
                            </li>
                            <li style="padding-left: 20px;">
                                联系人：<span class="contactName"></span>
                            </li>
                            <li style="padding-left: 20px;">
                                手机号码：<span class="contactTel"></span>
                            </li>
                            <li style="padding-left: 20px;">
                                用车人数：<span class="useNumber"></span>
                            </li>
                            <li style="padding-left: 20px;">
                                用车数量：<span class="busNumber"></span>
                            </li>
                            <li>
                                <ul class="invoiceTitel">
                                    <li style="padding-left: 20px;">
                                        发票抬头：<span class="invoiceHeader"></span>
                                    </li>
                                    <li style="padding-left: 20px;">
                                        收件人：<span class="invoiceContact"></span>
                                    </li>
                                    <li style="padding-left: 20px;">
                                        收件人联系方式：<span class="invoicePhone"></span>
                                    </li>
                                    <li style="padding-left: 20px;">
                                        收件人地址：<span class="invoiceAddress"></span>
                                    </li>
                                    <li style="padding-left: 20px;">
                                        税号：<span class="invoiceDuty"></span>
                                    </li>
                                </ul>
                            </li>
                            <li style="">
                                <input type="checkbox"> 我已同意<a href="#" style="color: red;">《就道巴士服务协议》</a>
                            </li>
                            <li style="">
                                <div class="app_buttom_ls"  id="isOk" >确认发布</div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <input type="hidden" name="orderUuid" id="orderUuid">
            <div class="fbxc_div_four fbxc_div_all">
                <div style="padding-top: 29%;width: 71%;margin: auto;text-align: center;">
                    <img src="../../../api/img/web/myorder.png">
                    <p>发布成功，等待报价</p>
                    <span>我们正将你的需求发送给车队，一大群车队正在纷纷赶来报价</span>
                </div>
                <div align="center">
                    <div class="app_buttom_ls"   onclick="tzUrl('/api/app_wddd')">查看我的行程</div>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>
<!-- jQuery 2.2.3 -->
<%@ include file="../../../apiCurrency/js.jsp" %>
<script>
    $(function () {
        $(".fbxc_div_one").show();
        $('#fromTime').datetimepicker({
            language: "zh-CN", //语言
            todayHighlight: true, //是否今日高亮
            format: 'yyyy-mm-dd hh:ii', //点击月份后显示在input中的格式
            // keyboardNavigation:true,
            // startView:2,
            // minView: 1,
            todayBtn: true,
            autoclose: true //是否开启自动关闭
        });
        $('#toTime').datetimepicker({
            language: "zh-CN", //语言
            todayHighlight: true, //是否今日高亮
            format: 'yyyy-mm-dd hh:ii', //点击月份后显示在input中的格式
            // startView:2,
            // keyboardNavigation:true,
            todayBtn: true,
            // minView: 1,
            autoclose: true //是否开启自动关闭
        });

        $.each(citydata, function (key, value) {
            //根据数据创建option并追加到select上
            var option = "<option value=" + key + ">" + key + "</option>";
            $("[name='fromProvince']").append(option);
        });

        $.each(citydata, function (key, value) {
            //根据数据创建option并追加到select上
            var option = "<option value=" + key + ">" + key + "</option>";
            $("[name='toProvince']").append(option);
        });
        $("#isOk").click(function () {
            $("#saveForm").ajaxSubmit({
                url: platform.CONSTS.URL_BASE_CMS + 'api/updateOrder',
                type: "POST",//提交类型
                dataType: "json",
                cache: false,
                ifModified: true,
                success: function (data) {
                    if (data.success == true) {
                        next('fbxc_div_four', $(".type").val());
                    } else {
                        layer.msg(data.message, {icon: 2});
                        return;
                    }
                }
            });
        });
        $("#ok").click(function () {
            var road = "";
            $('.tjaddress').each(function () {
                road += "," + $(this).val();
            });
            $("#road").val(road);
            $("#saveForm").ajaxSubmit({
                url: platform.CONSTS.URL_BASE_CMS + 'api/create',
                type: "POST",//提交类型
                dataType: "json",
                cache: false,
                ifModified: true,
                success: function (data) {
                    if (data.success == true) {
                        next('fbxc_div_three', $(".type").val());
                        var result = data.data;
                        $("#orderUuid").val(result.orderUuid);
                        $(".fromTime").html(result.fromTime);
                        $(".toTime").html(result.toTime);
                        $(".fromAddress").html(result.fromProvince + result.fromCity + result.fromAddress);
                        $(".toAddress").html(result.toProvince + result.toCity + result.toAddress);
                        $(".contactTel").html(result.contactTel);
                        $(".contactName").html(result.contactName);
                        $(".invoiceHeader").html(result.invoiceHeader);
                        $(".invoiceContact").html(result.invoiceContact);
                        $(".invoicePhone").html(result.invoicePhone);
                        $(".invoiceAddress").html(result.invoiceAddress);
                        $(".invoiceDuty").html(result.invoiceDuty);
                        $(".useNumber").html(result.useNumber);
                        var busNumber = Number(result.busNumber1) + Number(result.busNumber2) + Number(result.busNumber3) + '座*' + result.busNumber + "辆";
                        $(".busNumber").html(busNumber);
                        var typeName = result.typeName;
                        if (typeName == '包车服务') {
                            $(".toTimeTitel").show();
                            var roadList = result.roadList;
                            if (roadList != '' && roadList.length > 0) {
                                var road = "";
                                for (var i = 0; i < roadList.length; i++) {
                                    if (road == '') {
                                        road = roadList[i].address;
                                    } else {
                                        road += "，" + roadList[i].address;
                                    }
                                }
                                $(".road").html(road);
                                $(".roadTitel").show();
                            } else {
                                $(".roadTitel").hide();
                            }
                        } else {
                            $(".toTimeTitel").hide();
                            $(".roadTitel").hide();
                        }
                        var isInvoice = result.isInvoice;
                        if (isInvoice == '是') {
                            $(".invoiceTitel").show();
                        } else {
                            $(".invoiceTitel").hide();
                        }
                    } else {
                        layer.msg(data.message, {icon: 2});
                        return;
                    }
                }
            });
        });

        $("#busNumber").change(function () {
            var busNumber = $(this).children('option:selected').val();
            if (busNumber == "1") {
                $("#busNumber2").hide();
                $("#busNumber3").hide();
            } else if (busNumber == "2") {
                $("#busNumber2").show();
                $("#busNumber3").hide();
            } else if (busNumber == "3") {
                $("#busNumber2").show();
                $("#busNumber3").show();
            } else if (busNumber == "4") {
                layer.msg("请联系客服");
                return;
            }
        });

        $("input[name='isInvoice']").change(function () {
            var isInvoice = $("input[name='isInvoice']:checked").val();
            if (isInvoice == '是') {
                $("#invoice").show();
            } else {
                $("#invoice").hide();
            }
        });


    });

    function getFromCity(pro) {
        var province = $(pro).val();
        var city = $("[name='fromCity']");
        //找到市的信息
        var citys = citydata[province];
        //删除原来市的信息
        city.empty();
        city.append("<option value=''>请选择</option>");
        //添加option
        $.each(citys, function (index, item) {
            city.append("<option value='" + item + "'>" + item + "</option>");
        });
    }

    function getToCity(pro) {
        var province = $(pro).val();
        var city = $("[name='toCity']");
        //找到市的信息
        var citys = citydata[province];
        //删除原来市的信息
        city.empty();
        city.append("<option value=''>请选择</option>");
        //添加option
        $.each(citys, function (index, item) {
            city.append("<option value='" + item + "'>" + item + "</option>");
        });
    }

    /**
     * 开启下一步
     * @param id
     * @param value
     */
    function next(id, value) {
        if ($("#uuid").val() == "") {
            tzUrl('/api/login');
        }
        $("#type").val(value);
        $(".fbxc_div_all").hide();
        if (value == "2") {
            $(".toTimeForDjs").hide();
            $("#wayid").hide();
            $(".ptm-title").html("单接送服务");
        }else{
            $(".ptm-title").html("包车服务");
        }
        $("." + id).show();
    }

    /**
     * 新增途径: 获取方式 tjaddress 的class循环获取值
     * @type {number}
     */
    function addmidway() {
        // var html = "<li><span class=\"fbxcSpanName\">途&nbsp;&nbsp;&nbsp;径地</span><input type=\"text\" class=\"fbxcInputTime\" id=\"toTime\" name=\"toTime\" /></li>";
        midwayhtml = "<input type=\"text\" class=\"tjaddress fbxcDel_address\" placeholder=\"请输入途径地\"  style=\"\" autocomplete=\"off\"><button type='button' class='fbxcDelBtn' onclick='removemidway(this);' >删除</button><br><div id=\"automidway\" style=\"display:none;\" class=\"automidways\"></div>";
        midwayheight = $("#wayid").height() + 35;
        $("#tjaddress").append(midwayhtml);
        $("#wayid").css("height", midwayheight + "px");
    }

    function removemidway(obj) {
        $(obj).prev().remove();
        $(obj).next('br').remove();
        $(obj).next().remove();
        $(obj).remove();
        midwayheight = $("#wayid").height() - 35;
        $("#wayid").css("height", midwayheight + "px");
    }
</script>