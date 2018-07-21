<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
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
            <a onclick="tzUrl('/api/fbxc')" class="apiTitle" style=" color: #00B83F;">发布行程</a>
            <a onclick="tzUrl('/api/cdrz')" class="apiTitle">车队入住</a>
            <a onclick="tzUrl('/api/gywm')" class="apiTitle">关于我们</a>
            <a onclick="tzUrl('/api/zxkf')" class="apiTitle">在线客服</a>
        </div>
        <div class="index_title_three">
            <img src="../../../api/img/web/header.png" class="user_head">
            <div class="index_login">
                <a onclick="tzUrl('/api/login')" class="indexcolor">登陆</a>
                <span class="indexcolor"> &nbsp;&nbsp;/&nbsp;&nbsp;</span>
                <a onclick="tzUrl('/api/register')" class="indexcolor">注册</a>
            </div>
        </div>
    </div>
</div>

<form  id="saveForm" method="post">
    <div class="fbxc_div">
        <%--<div class="fbxc_div_one">
            <div class="fbxc_div_content">
                <div class="fbxc_div_title" style="">&nbsp;&nbsp;&nbsp;&nbsp;选择用车类型</div>
                <div style="   margin: 124px auto;  width: 51%; ">
                    <select style="width: 100%;height: 37px;">
                        <option>包车</option>
                        <option>单接送</option>
                    </select>
                </div>
            </div>
            <div class="fbxc_div_next" style="" onclick="next('2')">下一步</div>
        </div>--%>
        <input type="hidden" name="type" value="1">
        <div class="fbxc_div_two">
            <div class="fbxc_div_content">
                <div class="fbxc_div_title">&nbsp;&nbsp;&nbsp;&nbsp;包车服务-填写用车信息（请信息填写完成以便车队报价准确）</div>
                <div class="fbxc_div_content_content" style="">
                    <ul>
                        <li style="">
                            <span><span class="fbxcSpanRed">*</span><span class="fbxcSpanName">出发时间</span></span>
                            <input type="text" class="fbxcInputTime" id="fromTime" name="fromTime"/>
                        </li>
                        <li style="">
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
                        <li style="">
                            <span><span class="fbxcSpanRed">*</span><span class="fbxcSpanName">途&nbsp;&nbsp;&nbsp;径地</span></span>
                            <%--<input type="text"  class="fbxcInputTime"/>--%>
                            <button id="tjOk" class="fbxcTjBtn">新增途径地</button>
                            <div id="tjaddress">

                            </div>
                        </li>
                        <li style="">
                            <span><span class="fbxcSpanRed">*</span><span class="fbxcSpanName">联&nbsp;&nbsp;&nbsp;系人</span></span>
                            <input type="text" name="contactName" class="fbxcInputTime"/>
                            <button id="cyOk" class="fbxcTjBtn">常用</button>
                        </li>
                        <li style="">
                            <span><span class="fbxcSpanRed">*</span><span class="fbxcSpanName">手机号码</span></span>
                            <input type="text" name="contactTel" class="fbxcInputTime"/>
                        </li>
                        <li style="">
                            <div>
                                <span><span class="fbxcSpanRed">*</span><span class="fbxcSpanName">用车人数</span></span>
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
                                <span><span class="fbxcSpanRed">*</span><span class="fbxcSpanName">车辆座位</span></span>
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
                                <span><span class="fbxcSpanRed">*</span><span class="fbxcSpanName">发票抬头</span></span>
                                <input type="text" class="fbxcInputTime" id="invoiceHeader" name="invoiceHeader"/>
                            </li>
                            <li style="">
                                <span><span class="fbxcSpanRed">*</span><span class="fbxcSpanName">收&nbsp;&nbsp;&nbsp;&nbsp;件人</span></span>
                                <input type="text" class="fbxcInputTime" id="invoiceContact" name="invoiceContact" />
                            </li>
                            <li style="">
                                <span><span class="fbxcSpanRed">*</span><span class="fbxcSpanName">联系方式</span></span>
                                <input type="text" class="fbxcInputTime" id="invoicePhone" name="invoicePhone"/>
                            </li>
                            <li style="">
                                <span><span class="fbxcSpanRed">*</span><span class="fbxcSpanName">收件地址</span></span>
                                <input type="text" class="fbxcInputTime" id="invoiceAddress" name="invoiceAddress" />
                            </li>
                            <li style="">
                                <span class="fbxcSpanName">税&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</span>
                                <input type="text" class="fbxcInputTime" id="invoiceDuty" name="invoiceDuty" />
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
        <div class="fbxc_div_three">
            <div class="fbxc_div_content" style="">
                <div class="fbxc_div_content_content">
                    <ul>
                        <li style="">
                            你的用车类型：<span></span>
                        </li>
                        <li style="padding-left: 20px;">
                            出发时间：<span></span>
                        </li>
                        <li style="padding-left: 20px;">
                            出发地：<span></span>
                        </li>
                        <li style="padding-left: 20px;">
                            目的地：<span></span>
                        </li>
                        <li style="padding-left: 20px;">

                        </li>
                        <li style="padding-left: 20px;">
                            联系人：<span></span>
                        </li>
                        <li style="padding-left: 20px;">
                            手机号码：<span></span>
                        </li>
                        <li style="padding-left: 20px;">
                            用车人数：<span></span>
                        </li>
                        <li style="padding-left: 20px;">
                            用车数量：<span></span>
                        </li>
                        <li style="padding-left: 20px;">
                            车辆座位：<span></span>
                        </li>
                        <li style="padding-left: 20px;">

                        </li>
                        <li style="">
                            <input type="checkbox"> 我已同意<a  href="#" style="color: red;">《就道巴士服务协议》</a>
                        </li>
                        <li style="">
                            <div style="background-color:#80c369;width: 80px;margin: 10px auto;padding:10px;float: left;" onclick="next('4')">确认发布</div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="fbxc_div_four">
            <div style="padding-top: 8%;width: 20%;margin: auto;text-align: center;">
                <img src="../../../api/img/web/header.png">
                <p>发布成功，等待报价</p>
                <span>我们正将你的需求发送给车队，一大群车队正在纷纷赶来报价</span>
            </div>
            <div style="background-color:#80c369;width: 80px;margin: 10px auto;padding:  10px;" onclick="next('5')">等待报价</div>
        </div>
    </div>
</form>
</body>
</html>
<!-- jQuery 2.2.3 -->
<%@ include file="../../../apiCurrency/js.jsp" %>
<script>
    $(function() {
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
        $("#ok").click(function () {
            $("#saveForm").ajaxSubmit({
                url: platform.CONSTS.URL_BASE_CMS + 'api/create',
                type: "POST",//提交类型
                dataType: "json",
                cache: false,
                ifModified: true,
                success: function (data) {
                    if (data.success == true) {
                        alert(1111);
                        // window.location.href = platform.CONSTS.URL_BASE_CMS + "api/owntwo";
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

</script>