<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*,com.bean.*,com.dao.*"%>
<%
	// 控制页面，根据用户传递的op参数决定如果操作，具体来说：
	// 1、op=list 查询所有的主题，并跳转到list.jsp进行展示
	// 2、op=add 获取add.jsp传递的参数，添加主题，添加完成跳转到控制页，走1步
	// 3、op=toEdit 获取用户要编辑的主题编号，查询主体对象，跳转到edit.jsp展示查询到的主题信息
	// 4、op=edit 获取edit.jsp提交的参数，修改主题，跳转到控制页，走1步
	// 5、op=delete 获取提交的主题编号，删除主题，跳转到控制页，走1步
	// 6、op=detail 获取提交的主题编号，查询主体，跳转到detail.jsp展示查询到的信息
	String op = request.getParameter("op");
	TopicDao dao = new TopicDao();
	if("list".equals(op)){
		List<Topic> list = dao.findAll();
		request.setAttribute("list",list);
		request.getRequestDispatcher("list.jsp").forward(request,response);
	}
	else if("delete".equals(op)){
		String [] tids = request.getParameterValues("tid");
		dao.delete(tids);
		response.sendRedirect("control.jsp?op=list");
	}
%>
