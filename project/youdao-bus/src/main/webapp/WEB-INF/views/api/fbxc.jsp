<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../../apiCurrency/top.jsp" %>
<body>
<div class="apiHeader">
    <div class="apiLogoDiv">
        <div class="index_title_one">
            <img src="../../../api/img/web/logo.png" class="index_logimage">
        </div>
        <div class="index_title_two">
            <a onclick="tzUrl('/api/busindex')" class="apiTitle">首页</a>
            <c:if test="${empty sessionScope.uuid || sessionScope.type == 1 }">
                <a onclick="tzUrl('/api/fbxc')" class="apiTitle" style=" color: #00B83F;">发布行程</a>
            </c:if>
            <c:if test="${empty sessionScope.uuid}">
                <a onclick="tzUrl('/api/cdrz')" class="apiTitle" >车队登录</a>
            </c:if>
            <a onclick="tzUrl('/api/gywm')" class="apiTitle">关于我们</a>
            <a onclick="tzUrl('/api/zxkf')" class="apiTitle">在线客服</a>
        </div>
        <div class="index_title_three">
            <c:choose>
                <c:when test="${empty sessionScope.uuid}">
                    <div class="index_login">
                        <a onclick="tzUrl('/api/login')" class="indexcolor">登陆</a>
                        <span class="indexcolor"> &nbsp;&nbsp;/&nbsp;&nbsp;</span>
                        <a onclick="tzUrl('/api/register')" class="indexcolor">注册</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <img onclick="tzUrl('/api/busown')" src="${empty sessionScope.headerUrl || sessionScope.headerUrl eq ''?'../../../api/img/web/header.png':sessionScope.headerUrl}" class="user_head">

                    <div class="index_login">
                        <a onclick="tzUrl('/api/busown')" class="indexcolor">${sessionScope.nickname}</a>
                        <span class="indexcolor"> &nbsp;&nbsp;/&nbsp;&nbsp;</span>
                        <a onclick="tzUrl('/api/loginout')" class="indexcolor">退出</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <input id="uuid" type="hidden" value="${sessionScope.uuid}">
</div>
<form  id="saveForm" method="post">
    <input type="hidden" name="type" id="type" value="1">
    <div class="fbxc_div">
        <div class="fbxc_div_one fbxc_div_all">
            <div class="demand_step">
                <ul>
                    <li class="on">
                        <span class="step">1</span><br/>
                        <span>选择用车类型</span>
                    </li>
                    <li>
                        <span class="step">2</span><br/>
                        <span>填写行程信息</span>
                    </li>
                    <li>
                        <span class="step">3</span><br/>
                        <span>发布用车需求</span>
                    </li>
                    <li>
                        <span class="step">4</span><br/>
                        <span>等待车队报价</span>
                    </li>
                </ul>
            </div>
            <div class="demand_list">
                <ul>
                    <li id="dancheng" style="text-indent: 10px"><a onclick="next('fbxc_div_two','1')">包车服务</a></li>
                    <li id="duori"><a onclick="next('fbxc_div_two','2')">单接送服务</a></li>
                    <div style="clear: both;"></div>
                </ul>
            </div>
        </div>
        <div class="fbxc_div_two fbxc_div_all">
            <div class="demand_step">
                <ul>
                    <li class="on">
                        <span class="step">1</span><br/>
                        <span>选择用车类型</span>
                    </li>
                    <li class="on">
                        <span class="step">2</span><br/>
                        <span>填写行程信息</span>
                    </li>
                    <li>
                        <span class="step">3</span><br/>
                        <span>发布用车需求</span>
                    </li>
                    <li>
                        <span class="step">4</span><br/>
                        <span>等待车队报价</span>
                    </li>
                </ul>
            </div>
            <div class="fbxc_div_content">
                <div class="fbxc_div_title">&nbsp;&nbsp;&nbsp;&nbsp;包车服务-填写用车信息（请信息填写完成以便车队报价准确）</div>
                <div class="fbxc_div_content_content" style="">
                    <ul>
                        <li style="">
                            <span><span class="fbxcSpanRed">*</span><span class="fbxcSpanName">出发时间</span></span>
                            <input type="text" class="fbxcInputTime" id="fromTime" name="fromTime"/>
                        </li>
                        <li style="" class="toTimeForDjs">
                            <span><span class="fbxcSpanRed">*</span><span class="fbxcSpanName">结束时间</span></span>
                            <input type="text" class="fbxcInputTime" id="toTime" name="toTime" />
                        </li>
                        <li style="">
                            <span><span class="fbxcSpanRed">*</span><span class="fbxcSpanName">出&nbsp;&nbsp;&nbsp;发地</span></span>
                                <select name="fromProvince" class="fbxcSelect" onchange="getFromCity(this)">
                                    <option selected="selected" value="">请选择</option>
                                </select>
                                <select name="fromCity" class="fbxcSelect">
                                    <option selected="selected" value="">请选择</option>
                                </select>
                            <input type="text" name="fromAddress" class="fbxcInputTime"/>
                        </li>
                        <li style="">
                            <span><span class="fbxcSpanRed">*</span><span class="fbxcSpanName">目&nbsp;&nbsp;&nbsp;的地</span></span>
                            <select name="toProvince" class="fbxcSelect" onchange="getToCity(this)">
                                <option selected="selected" value="">请选择</option>
                            </select>
                            <select name="toCity" class="fbxcSelect">
                                <option selected="selected" value="">请选择</option>
                            </select>
                            <input type="text" name="toAddress" class="fbxcInputTime"/>
                        </li>
                        <li id="wayid">
                            <span class="fbxcSpanName">途&nbsp;&nbsp;&nbsp;径地</span>
                            <button id="tjOk" class="fbxcTjBtn" onclick="addmidway()" type="button">新增途径地</button>
                            <input type="hidden" name="road" id="road">
                            <div id="tjaddress">

                            </div>
                        </li>
                        <li style="">
                            <span><span class="fbxcSpanRed">*</span><span class="fbxcSpanName">联&nbsp;&nbsp;&nbsp;系人</span></span>
                            <input type="text" name="contactName" class="fbxcInputTime"/>
                            <%--<button id="cyOk" class="fbxcTjBtn" type="button" onclick="lxIframe()">常用</button>--%>
                        </li>
                        <li style="">
                            <span><span class="fbxcSpanRed">*</span><span class="fbxcSpanName">手机号码</span></span>
                            <input type="text" name="contactTel" class="fbxcInputTime"/>
                        </li>
                        <li style="">
                            <div>
                                <span><span class="fbxcSpanRed"></span><span class="fbxcSpanName">乘客总数</span></span>
                                <input type="number" name="useNumber" class="fbxcYcrs"/>
                                <span><span class="fbxcSpanRed">*</span><span class="fbxcSpanName">用车数量</span></span>
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

                            <div>
                                <span><span class="fbxcSpanRed">*</span><span class="fbxcSpanName">乘客座位</span></span>
                                <select name="busNumber1" class="fbxcSelect" >
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
                            <span class="fbxcSpanName">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;备注</span>
                            <textarea name="remarks" class="fbxcRemarks"></textarea>
                        </li>
                        <li style="">
                            <span  class="fbxctitleName">带*必填</span>
                        </li>
                        <li style="">
                            <span class="fbxcSpanName">需要发票</span>
                            <input class="fbxcRedio" name="isInvoice" type="radio" value="否" checked /><span class="fbxcRedioName">否</span>
                            <input class="fbxcRedio" name="isInvoice" type="radio" value="是"/><span class="fbxcRedioName">是</span>
                        </li>
                        <div id="invoice" style="display: none">
                            <li style="">
                                <span style="display: inline-block;width:30%;text-align: right;"><span class="fbxcSpanRed">*</span><span class="fbxcSpanName">用车单位名称</span></span>
                                <input type="text" class="fbxcInputTime" id="invoiceHeader" name="invoiceHeader"/>
                            </li>
                            <li style="">
                                <span style="display: inline-block;width:30%;text-align: right;"><span class="fbxcSpanRed">*</span><span class="fbxcSpanName">用车单位纳税人识别号</span></span>
                                <input type="text" class="fbxcInputTime" id="invoiceDuty" name="invoiceDuty" />
                            </li>
                            <li style="">
                                <span style="display: inline-block;width:30%;text-align: right;"><span class="fbxcSpanRed">*</span><span class="fbxcSpanName">用车单位地址,电话 </span></span>
                                <input type="text" class="fbxcInputTime" id="invoiceAddress" name="invoiceAddress" />
                            </li>
                            <li style="">
                                <span style="display: inline-block;width:30%;text-align: right;"><span class="fbxcSpanName">用车单位开户行及账号</span></span>
                                <input type="text" class="fbxcInputTime" id="invoiceContact" name="invoiceContact" />
                            </li>
                            <li style="">
                                <span style="display: inline-block;width:30%;text-align: right;"><span class="fbxcSpanRed">*</span><span class="fbxcSpanName">收票人手机号</span></span>
                                <input type="text" class="fbxcInputTime" id="invoicePhone" name="invoicePhone"/>
                            </li>


                        </div>
                    </ul>
                </div>
            </div>
            <div align="center">
                <button id="ok" type="button" class="fbxcBtn">预览订单</button>
            </div>
            <%--<div style="background-color:#80c369;/* height: 45px; */width: 80px;margin: 10px auto;padding:  10px;" id="ok">预览订单</div>--%>
        </div>
        <div class="fbxc_div_three fbxc_div_all">
            <div class="demand_step">
                <ul>
                    <li class="on">
                        <span class="step">1</span><br/>
                        <span>选择用车类型</span>
                    </li>
                    <li class="on">
                        <span class="step">2</span><br/>
                        <span>填写行程信息</span>
                    </li>
                    <li class="on">
                        <span class="step">3</span><br/>
                        <span>发布用车需求</span>
                    </li>
                    <li>
                        <span class="step">4</span><br/>
                        <span>等待车队报价</span>
                    </li>
                </ul>
            </div>
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
                            乘客总数：<span class="useNumber"></span>
                        </li>
                        <li style="padding-left: 20px;">
                            用车数量：<span class="busNumber"></span>
                        </li>
                        <div class="invoiceTitel">
                            <li style="padding-left: 20px;">
                                用车单位名称：<span class="invoiceHeader"></span>
                            </li>
                            <li style="padding-left: 20px;">
                                用车单位纳税人识别号：<span class="invoiceDuty"></span>
                            </li>
                            <li style="padding-left: 20px;">
                                用车单位开户行及账号：<span class="invoiceContact"></span>
                            </li>
                            <li style="padding-left: 20px;">
                                用车单位地址、电话：<span class="invoiceAddress"></span>
                            </li>
                            <li style="padding-left: 20px;">
                                收票人手机号：<span class="invoicePhone"></span>
                            </li>
                        </div>

                        <li style="">
                            <input type="checkbox" class="isty"> 我已同意<a  href="#" style="color: red;">《就道巴士服务协议》</a>
                        </li>

                    </ul>
                    <div align="center">
                        <button id="isOk" type="button" class="fbxcBtn">确认发布</button>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" name="orderUuid" id="orderUuid">
        <div class="fbxc_div_four fbxc_div_all">
            <div class="demand_step">
                <ul>
                    <li class="on">
                        <span class="step">1</span><br/>
                        <span>选择用车类型</span>
                    </li>
                    <li class="on">
                        <span class="step">2</span><br/>
                        <span>填写行程信息</span>
                    </li>
                    <li class="on">
                        <span class="step">3</span><br/>
                        <span>发布用车需求</span>
                    </li>
                    <li class="on">
                        <span class="step">4</span><br/>
                        <span>等待车队报价</span>
                    </li>
                </ul>
            </div>
            <div style="padding-top: 8%;width: 20%;margin: auto;text-align: center;">
                <img src="../../../api/img/web/myorder.png">
                <p>发布成功，等待报价</p>
                <span>我们正将你的需求发送给车队，一大群车队正在纷纷赶来报价</span>
            </div>
            <div align="center">
                <button type="button" class="fbxcBtn" onclick="tzUrl('/api/busown?type=1')">查看我的行程</button>
            </div>
        </div>
    </div>

</form>
</body>
</html>
<!-- jQuery 2.2.3 -->
<%@ include file="../../../apiCurrency/js.jsp" %>
<script>
    $(function() {
        $(".fbxc_div_one").show();


        $('#fromTime').datetimepicker({
            language: "zh-CN", //语言
            todayHighlight: true, //是否今日高亮
            format: 'yyyy-mm-dd hh:ii', //点击月份后显示在input中的格式
            // keyboardNavigation:true,
            // startView:2,
            // minView: 1,
            todayBtn : true,
            autoclose: true //是否开启自动关闭
        });
        $('#toTime').datetimepicker({
            language: "zh-CN", //语言
            todayHighlight: true, //是否今日高亮
            format: 'yyyy-mm-dd hh:ii', //点击月份后显示在input中的格式
            // startView:2,
            // keyboardNavigation:true,
            todayBtn : true,
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
            //判断是否选中
            if(!$(".isty").is(":checked")){
                layer.msg("请勾选合同同意条款", {icon: 2});
                return;
            }
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
            $('.tjaddress').each(function(){
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
                        next('fbxc_div_three',$(".type").val());
                        var result = data.data;
                        $("#orderUuid").val(result.orderUuid);
                        $(".fromTime").html(result.fromTime);
                        $(".toTime").html(result.toTime);
                        $(".fromAddress").html(result.fromProvince +result.fromCity + result.fromAddress);
                        $(".toAddress").html(result.toProvince +result.toCity + result.toAddress);
                        $(".contactTel").html(result.contactTel);
                        $(".contactName").html(result.contactName);
                        $(".invoiceHeader").html(result.invoiceHeader);
                        $(".invoiceContact").html(result.invoiceContact);
                        $(".invoicePhone").html(result.invoicePhone);
                        $(".invoiceAddress").html(result.invoiceAddress);
                        $(".invoiceDuty").html(result.invoiceDuty);
                        $(".useNumber").html(result.useNumber);
                        var busNumber =    Number(result.busNumber1)+ '座  '
                            + (result.busNumber2 == 0?"": (Number(result.busNumber2)+ '座  '))
                            + (result.busNumber3 == 0?"": (Number(result.busNumber3)+ '座  '));
                        $(".busNumber").html(busNumber);
                        var typeName = result.typeName;
                        if(typeName == '包车服务') {
                            $(".toTimeTitel").show();
                            var roadList = result.roadList;
                            if (roadList != '' && roadList.length > 0) {
                                var road = "";
                                for(var i = 0;i <roadList.length;i++) {
                                    if (road == '') {
                                        road = roadList[i].address;
                                    }else {
                                        road += "，" + roadList[i].address;
                                    }
                                }
                                $(".road").html(road);
                                $(".roadTitel").show();
                            }else {
                                $(".roadTitel").hide();
                            }
                        } else {
                            $(".toTimeTitel").hide();
                            $(".roadTitel").hide();
                        }
                        var isInvoice = result.isInvoice;
                        if (isInvoice == '是') {
                            $(".invoiceTitel").show();
                        }else {
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
            if(isInvoice == '是') {
                $("#invoice").show();
            } else {
                $("#invoice").hide();
            }
        });



    });
    function getFromCity(pro){
        var province = $(pro).val();
        var city = $("[name='fromCity']");
        //找到市的信息
        var citys = citydata[province];
        //删除原来市的信息
        city.empty();
        city.append("<option value=''>请选择</option>");
        //添加option
        $.each(citys, function (index, item) {
            city.append("<option value='"+item+"'>" + item + "</option>");
        });
    }


    function getToCity(pro){
        var province = $(pro).val();
        var city = $("[name='toCity']");
        //找到市的信息
        var citys = citydata[province];
        //删除原来市的信息
        city.empty();
        city.append("<option value=''>请选择</option>");
        //添加option
        $.each(citys, function (index, item) {
            city.append("<option value='"+item+"'>" + item + "</option>");
        });
    }
//    $("[name='fromCity']").click();
//    $("[name='fromCity']").val("浙江");
//    $("[name='fromCity']").click();
//    $("[name='toCity']").val("杭州");
//    $("[name='toCity']").click();


    /**
     * 开启下一步
     * @param id
     * @param value
     */
    function next(id,value) {
        if($("#uuid").val() == ""){
            tzUrl('/api/login');
        }
        $("#type").val(value);
        $(".fbxc_div_all").hide();
        if(value == "2") {
            $(".toTimeForDjs").hide();
            $("#wayid").hide();
        }
        $("." + id).show();
    }

    /**
     * 新增途径: 获取方式 tjaddress 的class循环获取值
     * @type {number}
     */
    function addmidway(){
        // var html = "<li><span class=\"fbxcSpanName\">途&nbsp;&nbsp;&nbsp;径地</span><input type=\"text\" class=\"fbxcInputTime\" id=\"toTime\" name=\"toTime\" /></li>";
        midwayhtml="<input type=\"text\" class=\"tjaddress\" placeholder=\"请输入途径地\"  style=\"margin-left: 84px;margin-right: 4px;margin-top: 5px;width: 403px;height: 33px;\" autocomplete=\"off\"><button type='button' class='fbxcDelBtn' onclick='removemidway(this);' >删除</button><br><div id=\"automidway\" style=\"display:none;\" class=\"automidways\"></div>";
        midwayheight=$("#wayid").height()+35;
        $("#tjaddress").append(midwayhtml);
        $("#wayid").css("height", midwayheight+"px");
    }
    function removemidway(obj){
        $(obj).prev().remove();
        $(obj).next('br').remove();
        $(obj).next().remove();
        $(obj).remove();
        midwayheight=$("#wayid").height()-35;
        $("#wayid").css("height", midwayheight+"px");
    }

</script>