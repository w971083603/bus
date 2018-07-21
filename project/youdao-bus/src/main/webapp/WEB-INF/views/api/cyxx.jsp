<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../../apiCurrency/top.jsp" %>
<body>
    <div  class="cyxx_div" style="width: 100%;padding: 40px">
         <ul>
             <li>
                 <div class="change change_lxr zhszType" onclick="changediv(this,'1')">联系人</div>
                 <div class="change change_fp zhszType" onclick="changediv(this,'2')">发票</div>
             </li>
             <li class="ready ready_one">
                 <label>姓名：</label>
                 <input type="text"  placeholder="请输入姓名" id="nickname">
             </li>
             <li class="ready ready_one">
                 <label>手机号：</label>
                 <input type="text" placeholder="请输入手机号" id="tel">
             </li>
             <li class="ready ready_one">
                 <div style="background-color:#80c369;padding:  10px 0;text-align: center;width: 100px;" onclick="saveLxr()">保存</div>
             </li>
             <li class="ready ready_one">
                 <table>
                     <tr>
                         <td>小红</td>
                         <td>15260325468</td>
                         <td>
                             <button style="background-color:#80c369;padding:  10px 0;text-align: center;width: 100px;">修改</button>
                             <button style="background-color:red;padding:  10px 0;text-align: center;width: 100px;">删除</button>
                         </td>
                     </tr>
                 </table>
             </li>

             <li class="ready ready_two">
                 <label>发票抬头：</label>
                 <input type="text"  placeholder="请输入发票抬头"  >
             </li>
             <li class="ready ready_two">
                 <label>收件人：</label>
                 <input type="text"  placeholder="请输入收件人"  >
             </li>
             <li class="ready ready_two">
                 <label>手机号码：</label>
                 <input type="text"  placeholder="请输入手机号码"  >
             </li>
             <li class="ready ready_two">
                 <label>收件地址：</label>
                 <input type="text"  placeholder="请输入收件地址">
             </li>
             <li class="ready ready_two">
                 <label>税号：</label>
                 <input type="text"  placeholder="请输入税号">
             </li>
             <li class="ready ready_two">
                 <div style="background-color:#80c369;padding:  10px 0;text-align: center;width: 100px;" onclick="saveLxr()">保存</div>
             </li>
             <li class="ready ready_two">
                 <table>
                     <tr>
                         <td>发票抬头</td>
                         <td>收件人</td>
                         <td>手机号码</td>
                         <td>收件地址</td>
                         <td>税号</td>
                         <td>
                             <button style="background-color:#80c369;padding:  10px 0;text-align: center;width: 100px;">修改</button>
                             <button style="background-color:red;padding:  10px 0;text-align: center;width: 100px;">删除</button>
                         </td>
                     </tr>
                 </table>
             </li>

         </ul>
    </div>
</body>
</html>
<!-- jQuery 2.2.3 -->
<%@ include file="../../../apiCurrency/js.jsp" %>
<script>
    $(function () {
        $(".change_lxr").click();
    });
    function changediv(obj,type) {
        $(".change").css("background-color","#fcfffb");
        $(obj).css("background-color","#06dc00");
        $(".ready").hide();
        if(type == "1"){
            $(".ready_one").show();
            $(".ready_two").hide();
        }else{
            $(".ready_two").show();
            $(".ready_one").hide();
        }
    }

</script>