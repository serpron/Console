<%@ page contentType="text/html;charset=utf-8"%>
<%
	// 设置字符集
	request.setCharacterEncoding("utf-8");
	// 读取login.jsp提交的表单信息
	// 1、读取姓名
	String name = request.getParameter("name");
	//name = new String(name.getBytes("iso8859-1"),"utf-8");
	// 2、读取密码
	String pwd = request.getParameter("pwd");
	
	// 用户名密码不是admin/admin，重定向到login.jsp
	if(!("admin".equals(name) && "admin".equals(pwd))){
		//session.setAttribute("name",name);   // 登录失败的用户名也存储到session中，key=name 
		//response.sendRedirect("login.jsp");
		request.setAttribute("name",name);
		request.getRequestDispatcher("login.jsp").forward(request,response);
	}
	// 登录成功
	else{
		// 将用户名存储到会话中
		session.setAttribute("user",name);    // key=user,value=name，welcome.jsp使用，session.getAttribute("user")取出用户名进行显示
		// 将用户名写入cookie，有效期为5分钟
		Cookie cookie = new Cookie("user",name);
		cookie.setMaxAge(5*60);
		response.addCookie(cookie);
		response.sendRedirect("common/main.jsp");
	}
%>
