<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<script type="text/javascript">
	var loginComboboxName;
	var d = [ {
		"id" : 1,
		"text" : "text1"
	}, {
		"id" : 2,
		"text" : "text2"
	}, {
		"id" : 3,
		"text" : "text3",
		"selected" : true
	}, {
		"id" : 4,
		"text" : "Text4"
	}, {
		"id" : 5,
		"text" : "text5"
	} ];
	$(function() {
		loginComboboxName = $('#loginComboboxName').combobox({
			data : d,
			textField : 'text',
			valueField : 'id',
			filter : function(q, row) {
				var opts = $(this).combobox('options');
				//return row[opts.textField].indexOf(q) == 0;
				return row[opts.textField].toUpperCase().indexOf(q.toUpperCase()) == 0;
			},
			formatter : function(row) {
				var opts = $(this).combobox('options');
				return row[opts.textField] + "###";
			},
			onBeforeLoad : function(param) {
				console.info(param);
			},
			multiple : true
		});
	});

	function loadData() {
		loginComboboxName.combobox('loadData', [ {
			"id" : 1,
			"text" : "aaaaaa"
		}, {
			"id" : 2,
			"text" : "bbbbb"
		}, {
			"id" : 3,
			"text" : "ccccc",
			"selected" : true
		}, {
			"id" : 4,
			"text" : "ddddd"
		}, {
			"id" : 5,
			"text" : "eeeee"
		} ]);
	}
</script>
</head>
<body>
	<select id="loginComboboxName" name="name" style="display: none;width:157px;"></select>
	<input type="button" onclick="console.info(loginComboboxName.combobox('getData'))" value="getData" />

	<input type="button" onclick="loadData()" value="loadData" />
	<input type="button" onclick="loginComboboxName.combobox('clear')" value="clear" />
</body>
</html>
