<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<script type="text/javascript">
	$(function() {
		$('#tt').tree({
			url : 'menuAction!ctrlTree.action',
			checkbox : true,
			onLoadSuccess : function(node, data) {
				var n = $(this).tree('find', 'sqljk');
				if (n) {
					$(this).tree('check', n.target);
				}
			}
		});
	});
</script>
</head>
<body id="indexLayout" class="easyui-layout">
	<div region="center">
		<ul id="tt"></ul>
	</div>
</body>
</html>