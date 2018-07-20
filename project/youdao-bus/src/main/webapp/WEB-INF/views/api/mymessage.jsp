<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../../apiCurrency/top.jsp" %>
<body>
    <div  class="message_div" style="width: 100%">
         <ul>
             <li>
                 <p>我的消息(<span class="message_number"></span>)</p>
             </li>
             <li>
               <table  border="1" cellspacing="0" cellpadding="0" bordercolor="#FF0000">
                   <thead>
                        <tr>
                            <td><input type="checkbox" class="all_checked" onclick="change(this)" >全选</td>
                            <td><button>标记为已读</button> <button>删除已选</button></td>
                            <td>是否已读</td>
                            <td>时间</td>
                        </tr>
                   </thead>
                   <tbody>
                       <tr>
                           <td><input type="checkbox" class="one_checked" value="1">全选</td>
                           <td>内容</td>
                           <td>是否已读</td>
                           <td>时间</td>
                       </tr>
                   </tbody>
               </table>
             </li>
         </ul>
    </div>
</body>
</html>
<!-- jQuery 2.2.3 -->
<%@ include file="../../../apiCurrency/js.jsp" %>
<script>


</script>