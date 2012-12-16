<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<script type="text/javascript" charset="utf-8">
	var cc;
	$(function() {
		cc = $('#cc').combo({
			required : true,
			editable : false,
			panelHeight : 500,
			//panelWidth : 300,
			width : 500,
			//disabled : true
			//hasDownArrow : false
			value : '',
			onChange : function(newValue, oldValue) {
				console.info(newValue);
				console.info(oldValue);
				console.info('-----------------');
			}
			//validType:'email'
		});
		$('#sp').appendTo($('#cc').combo('panel'));
		$('#sp img').click(function() {
			var v = $(this).attr('v');
			var s = $(this).attr('t');
			$('#cc').combo('setValue', v).combo('setText', s).combo('hidePanel');
		});

		//$('.combo-text').click(function() {
		//cc.combo('showPanel');
		//});
	});

	function getV() {
		alert(cc.combo('getValue'));
	}
	function showP() {
		cc.combo('showPanel');
	}
</script>
</head>
<body id="indexLayout" class="easyui-layout">
	<div region="center">
		<select id="cc"></select>
		<div id="sp">
			<div style="color:#99BBE8;background:#fafafa;padding:5px;">选择一个图片</div>
			<div>
				<img src="../../css/images/puppy_dogs_01.png" v="1" t="1图片" />
			</div>
			<div>
				<img src="../../css/images/puppy_dogs_02.png" v="2" t="2图片" />
			</div>
			<div>
				<img src="../../css/images/puppy_dogs_03.png" v="3" t="3图片" />
			</div>
			<div>
				<img src="../../css/images/puppy_dogs_04.png" v="4" t="4图片" />
			</div>
		</div>

		<br />
		<button onclick="getV();">获得值</button>
		<button onclick="alert(cc.combo('getText'));">获得text</button>
		<button onclick="showP();">显示panel</button>
		<button onclick="console.info(cc.combo('options'));">options</button>
		<button onclick="console.info($('#cc').combo('panel'));">panel</button>
		<button onclick="console.info(cc.combo('isValid'));">isValid</button>
		<button onclick="cc.combo('clear');">clear</button>
	</div>
</body>
</html>