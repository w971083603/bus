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
            <a href="company.jsp" class="apiTitle">首页</a>
            <a href="company.jsp" class="apiTitle">发布行程</a>
            <a href="company.jsp" class="apiTitle">车队入住</a>
            <a href="company.jsp" class="apiTitle">关于我们</a>
            <a href="company.jsp" class="apiTitle">在线客服</a>
        </div>
        <div class="index_title_three">
            <img src="../../../api/img/web/header.png" class="user_head">
            <div class="index_login">
                <a href="company.jsp" class="indexcolor">13616524441</a>
                <span class="indexcolor"> &nbsp;&nbsp;/&nbsp;&nbsp;</span>
                <a href="company.jsp" class="indexcolor">退出</a>
            </div>
        </div>
    </div>
</div>

<form>
    <div class="fbxc_div">
        <div class="fbxc_div_one">
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
        </div>
        <div class="fbxc_div_two">
            <div class="fbxc_div_content">
                <div class="fbxc_div_title">&nbsp;&nbsp;&nbsp;&nbsp;包车服务-填写用车信息（请信息填写完成以便车队报价准确）</div>
                <div class="fbxc_div_content_content" style="">
                    <ul>
                        <li style="">
                            <span style=""><span style="color: red;">*</span>出发时间</span>
                            <input type="date"  style="width: 50%;"/>
                        </li>
                        <li style="">
                            <span style=""><span style="color: red;">*</span>结束时间</span>
                            <input type="date"   style="width: 50%;"/>
                        </li>
                        <li style="">
                            <span style=""><span style="color: red;">*</span>出发&nbsp;地</span>
                            <input type="text"  style="width: 50%;"/>
                        </li>
                        <li style="">
                            <span style=""><span style="color: red;">*</span>目的&nbsp;地</span>
                            <input type="text"  style="width: 50%;"/>
                        </li>
                        <li style="">
                            <span style="">途径&nbsp;地</span>
                            <input type="text"  style="width: 50%;"/>
                        </li>
                        <li style="">
                            <span style=""><span style="color: red;">*</span>联系&nbsp;人</span>
                            <input type="text"  style="width: 50%;"/>
                        </li>
                        <li style="">
                            <span style=""><span style="color: red;">*</span>手机号码</span>
                            <input type="text"  style="width: 50%;"/>
                        </li>
                        <li style="">
                            <span style=""><span style="color: red;">*</span>用车人数</span>
                            <input type="number"  style="width: 50%;"/>
                        </li>
                        <li style="">
                            <span style=""><span style="color: red;">*</span>用车数量</span>
                            <input type="number"  style="width: 50%;"/>
                        </li>
                        <li style="">
                            <span style=""><span style="color: red;">*</span>车辆座位</span>
                            <input type="number"  style="width: 50%;"/>
                        </li>
                        <li style="">
                            <span style=""><span style="color: red;">*</span>&nbsp;&nbsp;备注</span>
                            <textarea type="number"  style="width: 50%;height: 50px;"></textarea>
                        </li>
                        <li style="">
                            <span style="">需要发票</span>
                            <input type="radio" checked />是
                            <input type="radio" />否
                        </li>
                        <li style="">
                            <span style="color: red;">带*必填</span>
                        </li>
                    </ul>
                </div>
            </div>
            <div style="background-color:#80c369;/* height: 45px; */width: 80px;margin: 10px auto;padding:  10px;" onclick="next('3')">预览订单</div>
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


</script>