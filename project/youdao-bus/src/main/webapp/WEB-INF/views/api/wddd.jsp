<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../../apiCurrency/top.jsp" %>
<body>
    <div  class="wddd_div" style="overflow-y: scroll;height: 590px;">
         <div class="wddd_div_title">
             <ul>
                 <li class="wddd_div_li" onclick="orderstatus('1',this)">报价中(<span style="color: red;" id="bj"></span>)</li>
                 <li class="wddd_div_li" onclick="orderstatus('2',this)">已预定(<span style="color: red;" id="yj"></span>)</li>
                 <li class="wddd_div_li" onclick="orderstatus('3',this)">行驶中(<span style="color: red;" id="xs"></span>)</li>
                 <li class="wddd_div_li" onclick="orderstatus('4',this)">已完成(<span style="color: red;" id="wc"></span>)</li>
             </ul>
             <div style="width: 20%;float: right;text-align: center;">
                 <img src="">
                 <a>服务热线</a>
             </div>
         </div>

         <div class="wddd_div_table">
             <table>
                 <tbody class="orderlist">
                     <tr>
                         <td>用车类型</td>
                         <td>出发地</td>
                         <td>目的地</td>
                         <td>联系人</td>
                         <td>手机号码</td>
                         <td>用车人数</td>
                         <td>用车数量</td>
                         <td>车辆座位</td>
                         <td>出发时间</td>
                         <td>结束时间</td>
                     </tr>
                 </tbody>
             </table>
         </div>
    </div>
</body>
</html>
<!-- jQuery 2.2.3 -->
<%@ include file="../../../apiCurrency/js.jsp" %>
<script>

    function orderstatus(type,obj) {
        $(".wddd_div_li").css("background-color","#fcfffb");
        $(obj).css("background-color","#06dc00");
        //清空td，ajax获取数据展示


    }



</script>