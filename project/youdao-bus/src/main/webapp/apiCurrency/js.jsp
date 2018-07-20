<%@ page import="com.platform.commons.utils.SystemConfig" %>
<!-- jQuery 2.2.3 -->
<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="../../plugins/daterangepicker/moment.js"></script>
<%--<script src="../../dist/js/app.min.js"></script>--%>
<script src="../../layer/2.1/layer.js"></script>
<script src="../../layer/2.1/extend/layer.ext.js"></script>
<script src="../../qrcode/jquery.qrcode.min.js"></script>

<script src="../../apiresources/js/platform.all.js"></script>
<script src="../../apiresources/js/jquery.form.js"></script>
<script type="text/javascript">
    platform.CONSTS.URL_BASE_IMG = "<%=SystemConfig.getInstance().getURL_BASE_IMG()%>";
    platform.CONSTS.URL_BASE_API = "<%=SystemConfig.getInstance().getURL_BASE_API()%>";
    platform.CONSTS.URL_BASE_CMS = "<%=SystemConfig.getInstance().getURL_BASE_CMS()%>";
</script>