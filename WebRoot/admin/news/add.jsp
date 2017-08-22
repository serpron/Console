<%@ page language="java" import="java.util.*,com.bean.*,com.dao.*"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>新闻添加列表</title>
		<base href="<%=basePath%>admin/news/" />
		<link rel="stylesheet" href="../resource/css/style.css" />
		<link rel="stylesheet" href="../resource/css/page.css" />
		<link rel="stylesheet" href="../resource/css/add.css" />
		<link rel="stylesheet" href="../resource/jquery-ui/jquery-ui.css" />
		<script type="text/javascript" src="../resource/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="../resource/jquery-ui/jquery-ui.min.js"></script>
		<script type="text/javascript" src="../resource/kindeditor/kindeditor-all.js"></script>
		<script type="text/javascript" src="../resource/kindeditor/lang/zh-CN.js"></script>
		<script type="text/javascript">
			    
			$(function() {
				$("#send").click(function() {
					$("#op").val("add");
					editor.sync(); // 同步富文本框数据到文本域中
					$("#form2").submit();
				});
				$("#nCreateDate,#nModifyDate").datepicker({
					dateFormat: "yy-mm-dd",
					appendText: "(yyyy-mm-dd)"
				});
			});
	        KindEditor.ready(function(K) {
	            window.editor = K.create('#editor_id');
	        });
		</script>
	</head>
	<body>
		<div class="all">
			<div class="top">
				<b>位置：</b>
				首页&gt;新闻信息&gt;添加新闻
			</div>
			<div class="center">
				<a href="#">发布通知</a>
				<a href="#">自定义</a>
				<span><a href="#">马上发布</a>
				</span>
			</div>
			<form action="control.jsp" method="post" id="form2">
				<input type="hidden" name="op" id="op" />
				<div class="foot">
					<table>
						<tr>
							<td>
								<label for="nTid">
									主题编号
								</label>
								<br />
								<select name="nTid">
									<%
										List<Topic> list = (List<Topic>)request.getAttribute("list");
										for(int i=0;i<list.size();i++){
											Topic topic = list.get(i);				
									%>
									<option value="<%=topic.getTid() %>"><%=topic.getTname() %></option>
									<%  } %>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<label for="nTitle">
									新闻标题
								</label>
								<br />
								<input type="text" name="nTitle"  style="width:700px;"/><b class="red">*</b>
							</td>
						</tr>
						<tr>
							<td>
								<label for="nAuthor">
									作者
								</label>
								<br />
								<input type="text" name="nAuthor" /><b class="red">*</b>
							</td>
						</tr>
						<tr>
							<td>
								<label for="nCreateDate">
									发布时间
								</label>
								<br />
								<input type="text" name="nCreateDate" id="nCreateDate" /><b class="red">*</b>
							</td>
						</tr>
						<tr>
							<td>
								<label for="nModifyDate">
									修改时间
								</label>
								<br />
								<input type="text" name="nModifyDate" id="nModifyDate"/><b class="red">*</b>
							</td>
						</tr>
						<tr>
							<td>
								<label for="nContent">新闻内容</label><b class="red">*</b><br/>
								<textarea id="editor_id" name="nContent" style="width:700px;height:300px;"></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<label for="nSummary">
									是否审核
								</label>
								<br />
								<select name="nSummary">
									<option value="1">
										是
									</option>
									<option value="2">
										否
									</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<input type="submit" id="send" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</body>
</html>
