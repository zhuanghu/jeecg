<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<script type="text/javascript" charset="utf-8">
	$(function() {
		var ue = new UE.ui.Editor().render('editor');
		var ue2 = new UE.ui.Editor().render('editor2');
	});
</script>
</head>
<body>
	<script type="text/plain" id="editor"></script>
	<script type="text/plain" id="editor2"></script>
</body>
</html>
