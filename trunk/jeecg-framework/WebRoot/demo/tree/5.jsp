<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<script type="text/javascript">
	$(function() {
		$('#tt').tree({
			url : 'menuAction!ctrlTree.action',
			onlyLeafCheck : false,
			dnd : true,
			checkbox : true,
			onLoadSuccess : function(node, data) {
				var t = $(this);
				if (data) {
					$(data).each(function(index, d) {
						if (this.state == 'closed') {
							t.tree('expandAll');
						}
					});
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