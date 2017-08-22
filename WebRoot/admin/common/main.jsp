<%@ page contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<meta charset="utf-8"/>
		<base href="<%=basePath %>admin/common/" target="mainFrame"/>
		<title>登录页面</title>
		<!-- 导入样式表 -->
		<link href="../resource/css/style.css" rel="stylesheet" type="text/css"/>
		<link href="../resource/css/main.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript" src="../resource/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript">
			$(function(){
				// 获取浏览器的高度
				var height = $(window).height() - 106 - 28;
				//alert(height);
				$("#right iframe").height(height);
			});
		</script>
	</head>
	<body>
		<div id="wrap">
			<div id="top">
				<jsp:include page="top.jsp"></jsp:include>
			</div>
			<div id="main">
				<div id="left">
					<jsp:include page="left.jsp"></jsp:include>
				</div>
				<div id="right">
					<iframe name="mainFrame" frameborder="0"></iframe>
				</div>
			</div>
		</div>
	</body>
</html>