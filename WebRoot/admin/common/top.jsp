<%@page contentType="text/html;charset=utf-8" import="java.util.*"%>
<div class="logo left">
	<a href="main.html"><img src="../resource/images/smalllogo.png" title="系统首页"></a>
</div>
<ul class="nav left">
	<li><a href="#">
			<img src="../resource/images/modle.png" title="工作台"/>
			<strong>模型管理</strong>
		</a>
	</li>
	<li><a href="#">
			<img src="../resource/images/module.png" title="工作台"/>
			<strong>模块管理</strong>
		</a>
	</li>
	<li><a href="#">
			<img src="../resource/images/common.png" title="工作台"/>
			<strong>常用管理</strong>
		</a>
	</li>
	<li><a href="#">
			<img src="../resource/images/file.png" title="工作台"/>
			<strong>文件管理</strong>
		</a>
	</li>
	<li><a href="#">
			<img src="../resource/images/system.png" title="工作台"/>
			<strong>系统设置</strong>
		</a>
	</li>						
</ul>
<div class="right">
	<div class="about left">
		<ul>
			<li><img src="../resource/images/ask.png">&nbsp;&nbsp;<a href="#">帮助</a></li>
			<li>|</li>
			<li><img src="../resource/images/about.png">&nbsp;&nbsp;<a href="#">关于</a></li>
		</ul>
	</div>
	<div class="info left">
		<img src="../resource/images/admin.png">
		<input type="text" value="<%=session.getAttribute("user") %>">
	</div>
	<div class="close left">
		<a href="#">
			<img src="../resource/images/power.png">
		</a>
	</div>
</div>
