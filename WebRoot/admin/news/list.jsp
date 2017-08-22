<%@ page import="java.util.*,com.bean.*,com.dao.* "language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>数据管理</title>
		<base href="<%=basePath %>admin/news/"/>
		<link rel="stylesheet" href="../resource/css/manage.css" />
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
<div class="all">
		<div class="top">
			<h>位置：</h>首页>新闻管理>新闻数据<span><a href="#">添加</a></span>
		</div>
		<form action="control.jsp" method="post" id="form1">
		<input type="hidden" name="op" id="op"/>
		<div class="center">
			<ul>
				<li><a href="control.jsp?op=toAdd"><img src="../resource/img/add.png"/>添加</a></li>
				<li><a href="#"><img src="../resource/img/edit_pen.png"/>修改</a></li>
				<li><a href="javascript:void(0)" id="deleteBtn"><img src="../resource/img/worry.png"/>删除</a></li>
				<li><a href="#"><img src="../resource/img/form.png"/>统计</a></li>
				<li><a href="#"><img src="../resource/img/setting.png"/>设置</a></li>
			</ul>
		</div>
		<div class="bottom">
			
			<table>
				<thead>
				
				   <tr>
				   
					<th><input type="checkbox"/></th>
					<th><span>新闻编号</span></th>
					<th>主题编号</th>
					<th>新闻标题</th>
					<th>作者</th>
					<th>发布时间</th>
					<!--<th>发布路径</th>
					<th>新闻内容</th> 
					--><th>修改时间</th>
					<th>是否审核</th>
					<th>操作</th>
				</tr>
				 </thead>
				<tbody>
					<%
					 	List<News> list=(List<News>)request.getAttribute("list");
					 	for(int i=0;i<list.size();i++){
					 	News news=list.get(i);
					  %>
					 <tr>
					    <td><input type="checkbox" class="check" name="nId" value="<%=news.getnId() %>"/></td>
					 	<td><%=news.getnId() %></td>
					 	<td><%=news.getnTid() %></td>
					 	<td><%=news.getnTitle() %></td>
					 	<td><%=news.getnAuthor() %></td>
					 	<td><%=news.getnCreateDate() %></td>
					 	
					 	
					 	<td><%=news.getnModifyDate() %></td>
					 	<td><%=news.getnSummary() %></td>
					 	<td><a href="control.jsp?op=delete&nId=<%=news.getnId()%>">删除
					 	</a>&nbsp;<a href="#">查看</a></td>
					 </tr>
					 
					 
					 <%} %>
					
				 </tbody>
			</table>
		</div>
		</form>
	</div>	
	</body>
