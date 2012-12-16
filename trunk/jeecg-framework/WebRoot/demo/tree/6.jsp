<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<script type="text/javascript">
	$(function() {
		$('#tt').tree({
			data : [ {
				"id" : 1,
				"text" : "Folder1",
				"iconCls" : "icon-save",
				"children" : [ {
					"text" : "File1",
					"checked" : true
				}, {
					"text" : "Books",
					"state" : "open",
					"attributes" : {
						"url" : "/demo/book/abc",
						"price" : 100
					},
					"children" : [ {
						"text" : "PhotoShop",
						"checked" : true
					}, {
						"id" : 8,
						"text" : "Sub Bookds",
						"state" : "closed"
					} ]
				} ]
			}, {
				"text" : "Languages",
				"state" : "closed",
				"children" : [ {
					"text" : "Java"
				}, {
					"text" : "C#"
				} ]
			} ]
		});
	});
</script>
</head>
<body id="indexLayout" class="easyui-layout">
	<div region="center">
		<ul id="tt" checkbox="true"></ul>
	</div>
</body>
</html>