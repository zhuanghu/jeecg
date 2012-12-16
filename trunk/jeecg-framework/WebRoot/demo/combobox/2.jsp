<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<script type="text/javascript">
	var loginComboboxName;
	$(function() {
		$('#cc2').combobox({
			url : '/sshe/userAction!loginCombobox.action',
			valueField : 'cid',
			textField : 'cname',
			onSelect : function(record) {
				console.info(record);
			}
		});

		loginComboboxName = $('#loginComboboxName').combobox({
			required : false,
			url : '/sshe/userAction!loginCombobox.action',
			textField : 'cname',
			valueField : 'cname',
			mode : 'remote',
			panelHeight : 'auto',
			delay : 500,
			value : '',
			onBeforeLoad : function(param) {
				console.info(param);
			}
		});
	});
</script>
</head>
<body>
	<input id="cc" class="easyui-combobox" name="dept" data-options="valueField:'cid',textField:'cname',url:'/sshe/userAction!loginCombobox.action',onSelect:function(record){console.info(record);}" />

	<br />
	<br />
	<br />
	<br />

	<input id="cc2" />

	<br />
	<br />
	<br />
	<br />
	<br />
	<select id="loginComboboxName" name="cname" style="display: none;width:157px;"></select>
</body>
</html>
