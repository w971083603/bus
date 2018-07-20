<%@ page import="com.platform.commons.utils.SystemConfig" %>
<!-- jQuery 2.2.3 -->
<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<%--<script src="../../bootstrap/js/bootstrap.js"></script>--%>
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<script src="../../bootstrap/js/bootstrapValidator.js"></script>
<!--switch-->
<%--<script src="../../switch/docs/js/jquery.min.js"></script>--%>
<%--<script src="../../switch/docs/js/bootstrap.min.js"></script>--%>
<%--<script src="../../switch/docs/js/highlight.js"></script>--%>
<%--<script src="../../switch/js/bootstrap-switch.js"></script>--%>
<%--<script src="../../switch/docs/js/main.js"></script>--%>
<!-- Slimscroll -->
<script src="../../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="../../plugins/fastclick/fastclick.js"></script>
<script src="../../plugins/datatables/jquery.dataTables.js"></script>
<script src="../../plugins/datatables/dataTables.bootstrap.js"></script>
<script src="../../plugins/datepicker/js/bootstrap-datepicker.js"></script>
<script src="../../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="../../plugins/daterangepicker/moment.js"></script>
<script src="../../plugins/daterangepicker/daterangepicker.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/app.js"></script>
<script src="../../dist/js/demo.js"></script>
<script src="../../dist/js/app_iframe.js"></script>
<%--<script src="../../dist/js/app.min.js"></script>--%>
<script src="../../layer/2.1/layer.js"></script>
<script src="../../layer/2.1/extend/layer.ext.js"></script>
<script src="../../qrcode/jquery.qrcode.min.js"></script>
<!--  -->
<script src="../../apiresources/js/platform.all.js"></script>
<script src="../../apiresources/js/jquery.form.js"></script>
<script src="../../apiresources/js/DateUtility.js"></script>
<script src="../../apiresources/music/iNotify.js"></script>
<script src="../../apiresources/socket/sockjs.min.js"></script>
<script src="../../time/js/timePicker.min.js"></script>
<script src="../../plugins/echarts/echarts.js"></script>

<script type="text/javascript">
    platform.CONSTS.URL_BASE_IMG = "<%=SystemConfig.getInstance().getURL_BASE_IMG()%>";
    platform.CONSTS.URL_BASE_API = "<%=SystemConfig.getInstance().getURL_BASE_API()%>";
    platform.CONSTS.URL_BASE_CMS = "<%=SystemConfig.getInstance().getURL_BASE_CMS()%>";
</script>