<%@ page contentType="text/html;charset=utf-8"%>
<%
	// 检查cookie
	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(Cookie ck : cookies){
			if("user".equals(ck.getName())){
				session.setAttribute("user",ck.getValue());
				response.sendRedirect("welcome.jsp");
				return;
			}
		}
	}
	///String name = (String)session.getAttribute("name");	
	//String name = request.getParameter("name");
	String name = (String)request.getAttribute("name");
	if(name==null) name = "";
%>
<html>
	<head>
		<meta charset="utf-8"/>
		<title>登录页面</title>
	</head>
	<body>
		<div>
			<h1>登录用户</h1>
			<form action="login_check.jsp">
				<table>
					<tr>
						<td>用户名：</td>
						<td><input type="text" name="name" value="<%=name%>"/></td>  
					</tr>
					<tr>
						<td>密码：</td>
						<td><input type="password" name="pwd"/></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="登录"/>&nbsp;
							<input type="reset" value="取消"/>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>