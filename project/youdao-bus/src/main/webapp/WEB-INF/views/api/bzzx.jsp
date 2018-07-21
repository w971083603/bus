<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../../apiCurrency/top.jsp" %>
<body>
<div style="width: 100%;margin: 10% 45%;position: absolute;" id="qrcode"></div>
</body>
</html>
<!-- jQuery 2.2.3 -->
<%@ include file="../../../apiCurrency/js.jsp" %>
<script>
    $(function () {
        $("#qrcode").qrcode({
            render: "table",
            width: 400,
            height:400,
            text: ""
        });
    });

</script>