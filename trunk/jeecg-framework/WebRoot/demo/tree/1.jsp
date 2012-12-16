<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
</head>
<body id="indexLayout" class="easyui-layout">
	<div region="center">
		<ul id="tt" class="easyui-tree">
			<li><span>Folder</span>
				<ul>
					<li><span>Sub Folder 1</span>
						<ul>
							<li><span><a href="#">File 11</a> </span>
							</li>
							<li><span>File 12</span>
							</li>
							<li><span>File 13</span>
							</li>
						</ul>
					</li>
					<li><span>File 2</span>
					</li>
					<li><span>File 3</span>
					</li>
				</ul>
			</li>
			<li><span>File21</span>
			</li>
		</ul>
	</div>
</body>
</html>