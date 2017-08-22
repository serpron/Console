<%@page contentType="text/html;charset=utf-8" import="java.util.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%	//从session中取出登录时的用户名
     String name = (String)session.getAttribute("name");
	 if(name==null) name = "";
	 //检查cookie
	 Cookie[] cookies = request.getCookies();
	 if(cookies!=null){
	 	for(Cookie ck:cookies){
	 		if("user".equals(ck.getName())){
	 			session.setAttribute("user",ck.getValue());
	 			response.sendRedirect("common/main.jsp");
	 			return;
	 		}
	 	}
	 }
    %>
<html>
<head>
    <meta charset="utf-8">
    <base href="<%=basePath %>admin/" />
    <title>欢迎登陆鸿卓国际信息管理系统</title>
    <link href="resource/css/style.css" rel="stylesheet" type="text/css">
    <link href="resource/css/login.css" rel="stylesheet" type="text/css">
</head>
<body style="background-image:url(resource/images/loginbg.png);background-repeat: no-repeat;background-position: center top" >
    <div class="logintop">
        <ul>
            <li><a href="#">English</a></li>
            <li>|</li>
            <li><a href="#">繁体</a></li>
        </ul>
    </div>
    <div class="loginmain">
        <img src="resource/images/logo.png">
        <h1>鸿卓信息管理系统</h1>
        <p>INFORMATION&nbsp;MANAGEMENT&nbsp;SYSTEM&nbsp;INTERFACE</p>
        <form action="login_check.jsp">
            <ul>
                <li><input type="text" name="name" value="<%=name%>"></li>
                <li>
                    <input type="password" name="pwd">
                    <input type="submit"value=">">
                </li>
            </ul>
        </form>
    </div>
    <div class="loginfoot">
        <ul>
            <li><a href="#">立即注册</a></li>
            <li>|</li>
            <li><a href="#">忘记密码?</a></li>
            <li>|</li>
            <li><a href="#">用户隐私</a></li>
            <li>|</li>
            <li><a href="#">用户协议</a></li>
        </ul>
    </div>
</body>
</html>