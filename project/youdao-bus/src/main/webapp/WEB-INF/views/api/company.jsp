<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../../currency/top.jsp" %>
<body class="hold-transition login-box-body">
<form  class="form-horizontal" id="saveForm"  method="post">
    <input type="hidden" name="type" value="2"/>
    <section class="content">
        <div class="form-group">
            <label class="col-sm-12 control-label">主购房者信息</label>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" >公司名称</label>
            <div class="col-sm-9" >
                <input type="text" class="form-control name" name="name" placeholder="请输入公司名称">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">证件类型</label>
            <div class="col-sm-9">
                <select class="form-control cardType" name="cardType">
                    <option value="新版营业执照">新版营业执照</option>
                    <option value="旧版营业执照">旧版营业执照</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">营业执照号</label>
            <div class="col-sm-9" >
                <input type="text" class="form-control cardNumber" name="cardNumber" placeholder="请输入营业执照号">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">营业执照</label>
            <div class="col-sm-9">
                <div id="cardUrl" >
                    <img class="cardUrl" name="cardUrl" style="height: 80px;"
                         layer-src="../../apiresources/img/add.png" src="../../apiresources/img/add.png"
                         onclick="changeImage('cardUrl')" />
                    <input type="hidden" class="form-control QcardUrl" name="cardUrl" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label text-left">法人代表证明</label>
            <div class="col-sm-9" >
                <div id="leadUrl">
                    <img class="leadUrl" name="leadUrl" style="height: 80px;"
                         layer-src="../../apiresources/img/add.png" src="../../apiresources/img/add.png"
                         onclick="changeImage('leadUrl')"/>
                    <input type="hidden" class="form-control QleadUrl" name="leadUrl" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label text-left">公司委托法人办理的委托书<font color="#F79F81">(必须包含住购房人、未成年子女及其他购房人查询信息，15天内有效)</font></label>
            <div class="col-sm-9">
                <div id="leadEntrustUrl">
                    <img class="leadEntrustUrl" name="leadEntrustUrl" style="height: 80px;"
                         layer-src="../../apiresources/img/add.png" src="../../apiresources/img/add.png"
                         onclick="changeImage('leadEntrustUrl')"/>
                    <input type="hidden" class="form-control QleadEntrustUrl" name="leadEntrustUrl" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label text-left">法人委托个人办理的委托书<font color="#F79F81">(非必填)</font></label>
            <div class="col-sm-9">
                <div id="entrustUrl">
                    <img class="entrustUrl" name="entrustUrl" style="height: 80px;"
                         layer-src="../../apiresources/img/add.png" src="../../apiresources/img/add.png"
                         onclick="changeImage('entrustUrl')"/>
                    <input type="hidden" class="form-control QentrustUrl" name="entrustUrl" />
                </div>
            </div>
            <label class="col-sm-12 control-label "><font color="#cccccc">法人前来，则不用提供。</font></label>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label text-left">资金冻结证明</label>
            <div class="col-sm-9">
                <div id="accountUrl">
                    <img class="accountUrl" name="accountUrl" style="height: 80px;"
                         layer-src="../../apiresources/img/add.png" src="../../apiresources/img/add.png"
                         onclick="changeImage('accountUrl')"/>
                    <input type="hidden" class="form-control QaccountUrl" name="accountUrl" />
                </div>
            </div>
            <label class="col-sm-12 control-label text-left"><font color="#cccccc">根据政策规定，以公司名义购房，必须全额一次性付清，需上传指定银行330万及以上资金冻结证明图片。如不清楚，可查看登记须知。</font></label>
        </div>
        <div class="form-group">
            <div class="col-sm-12">
                <button type="button" class="btn btn-info btn-block btn-flat" id="btn-query" onclick="okToCheck()">
                    提交审核
                </button>
            </div>
        </div>
    </section>
</form>

<form  class="form-horizontal" id="imageForm" enctype="multipart/form-data" method="post">
    <input type="file" class="upLoadImage" name="upLoadImage" style="display: none" onchange="downImage(this)"/>
</form>

</body>
</html>
<%@ include file="../../../currency/js.jsp" %>
<script>
    document.title="房登易线上系统";
    //提交审核
    function okToCheck() {
        var name = $("#name").val();
        var cardNumber= $("#cardNumber").val();
        if (name == "") {
            layer.msg("公司名称不能为空", {icon: 2});
            return;
        }
        if (cardNumber == "") {
            layer.msg("营业执照不能为空", {icon: 2});
            return;
        }
        var url = platform.CONSTS.URL_BASE_CMS +'api/create';
        $("#saveForm").ajaxSubmit({
            url :url ,
            type: "POST",//提交类型
            dataType:"json",
            cache:false,
            ifModified :true,
            success:function(data){
                console.log(data)
                if (data.success == true) {
                    alert("发布成功，请等待审核");
                    window.location.href =   platform.CONSTS.URL_BASE_CMS + "api/companyExamine?uuid=" + orderUuid;
                } else {
                    if(data.code == "999")  window.location.href = platform.CONSTS.URL_BASE_CMS + "api/login";
                    layer.msg(data.message, {icon: 2});
                    return;
                }
            }
        });
    }

    //class的唯一标示
    var classId="";
    //上传按钮点击
    function changeImage(value){
        classId=value;
        $(".upLoadImage").click();
    }

    //下载图片
    function downImage(obj) {
        //ajaxForm表单提交
        if(!validaImage(obj)){
            return;
        }else{
            var url =  platform.CONSTS.URL_BASE_CMS + 'order/saveImage?tm='+new Date().getTime();
            $("#imageForm").ajaxSubmit({
                url :url ,
                type: "POST",//提交类型
                dataType:"json",
                cache:false,
                ifModified :true,
                success:function(data){
                    console.log(data)
                    if (data.success == true) {
                        var backurl=data.data  ;
                        $("."+classId).attr("src", backurl);
                        $("."+classId).attr("layer-src", backurl);
                        $(".Q"+classId).val(backurl);
                        classId="";
                    } else {
                        layer.msg(data.message, {icon: 2});
                        return;
                    }
                }
            });
        }
    }
    //判断图片是否符合格式-图片大小
    function validaImage(obj){
        var filename=/\.[^\.]+$/.exec(obj.value);
        if('.gif.png.jpg.jpeg'.indexOf(filename)<0&&'.GIF.PNG.JPG.JPEG'.indexOf(filename)<0){
            alert("请上传照片gif,png,jpg,jpeg格式");
            return false;
        }else{
            if(((obj.files[0].size).toFixed(2))>=(2*1024*1024)){
                alert("请上传小于2M的图片");
                return false;
            }
        }
        return true;
    }
    
    
</script>