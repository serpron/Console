<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*,com.bean.*,com.dao.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<meta charset="utf-8"/>
		<base href="<%=basePath %>admin/topic/"/>
		<title>登录页面</title>
		<link href="../resource/css/style.css" rel="stylesheet" type="text/css"/>
		<link href="../resource/css/main.css" rel="stylesheet" type="text/css"/>
		<link href="../resource/css/page.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript" src="../resource/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#deleteBtn").click(function(){
					$("#op").val("delete");
					$("#form1").submit();
				});
			});
		</script>
	</head>
	<body>
		<div>
				
			<div class="sitemap">
				<ul>
					<li><strong>位置：</strong></li>
					<li>首页&gt;</li>
					<li>信息管理&gt;</li>
					<li>主题管理</li>
				</ul>
			</div>
			<form action="control.jsp" method="post" id="form1">
				<input type="hidden" name="op" id="op"/>
				<div class="toolbar">
					<ul>
						<li><a href="#" class="button"><img src="../resource/images/add.png"/>添加</a></li>
						<li><a href="#" class="button"><img src="../resource/images/edit_pen.png"/>修改</a></li>
						<li><a href="javascript:void(0)" class="button" id="deleteBtn"><img src="../resource/images/worry.png"/>删除</a></li>
						<li><a href="#" class="button"><img src="../resource/images/form.png"/>统计</a></li>
						<li class="right"><a href="" class="button"><img src="../resource/images/setting.png"/>设置</a></li>
					</ul>
				</div>
				<div class="datagrid">
					<table>
						<thead>
							<tr>
								<th><input type="checkbox" id="check_all"/></th>
								<th>主题编号</th>
								<th>主题名称</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<%
							List<Topic> list = (List<Topic>)request.getAttribute("list");
							for(int i=0;i<list.size();i++){
								Topic topic = list.get(i);
							%>
							<tr>
								<td><input type="checkbox" class="check" name="tid" value="<%=topic.getTid() %>"/></td>
								<td><%=topic.getTid() %></td>
								<td><%=topic.getTname() %></td>
								<td><a href="control.jsp?op=delete&tid=<%=topic.getTid() %>">删除</a><a href="#">详情</a></td>
							</tr>
							<%} %>
						</tbody>
					</table>
				</div>
			</form>
		</div>
	</body>
</html>