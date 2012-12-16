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
			onClick : function(node) {
				//var p = $(this).tree('getParent', node.target);
				//console.info(p);

				//var c = $(this).tree('getChildren', node.target);
				//console.info(c);
				
				
				var c = $(this).tree('getChecked', node);
				console.info(c);
			},
			onContextMenu : function(e, node) {
				e.preventDefault();
				// select the node
				$('#tt').tree('select', node.target);
				// display context menu
				$('#mm').menu('show', {
					left : e.pageX,
					top : e.pageY
				});
			}
		});
	});
</script>
</head>
<body id="indexLayout" class="easyui-layout">
	<div region="center">
		<ul id="tt"></ul>
		<div id="mm" class="easyui-menu" style="width:120px;">
			<div onclick="append()" iconCls="icon-add">Append</div>
			<div onclick="remove()" iconCls="icon-remove">Remove</div>
		</div>
	</div>
</body>
</html>