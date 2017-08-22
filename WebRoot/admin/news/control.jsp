<%@page
	import="java.util.*,com.bean.*,com.dao.*,java.text.SimpleDateFormat"
	contentType="text/html;charset=utf-8"%>
<%
	//控制页面，根据用户传递的op参数决定如何操作，具体来说：
	//1、op=list 查所有的主题，并跳转到list.jsp进行展示
	//2、op=add 获取add.jsp传递的参数，添加主题，添加完成跳转到list.jsp
	//3、op=toEdit 获取用户要编辑的主题编号，查询主题对象，跳转到edit.jsp展示查询到的主题信息
	//4、op=edit 获取edit.jsp提交参数，修改主题，跳转到控制页，走1步
	//5、op=delete 获取提交的主题编号，删除主题，跳转到控制页，走1步
	//6、op=detail 获取提交的主题编号，查询主题，跳转到detail.jsp展示查询到的信息
	String op = request.getParameter("op");
	NewsDao dao = new NewsDao();
	News news = new News();
	if ("list".equals(op)) {
		List<News> list = dao.findAll();
		request.setAttribute("list", list);
		request.getRequestDispatcher("list.jsp").forward(request,
				response);
	} else if ("delete".equals(op)) {
		String[] nids = request.getParameterValues("nId");
		dao.delete(nids);
		response.sendRedirect("control.jsp?op=list");
	} 
	else if("toAdd".equals(op)){
		TopicDao topicDao = new TopicDao();
		List<Topic> list = topicDao.findAll();
		request.setAttribute("list",list);
		request.getRequestDispatcher("add.jsp").forward(request,response);
	}
	else if ("add".equals(op)) {

		int nTid = Integer.parseInt(request.getParameter("nTid"));
		String nTitle = request.getParameter("nTitle");
		String nAuthor = request.getParameter("nAuthor");
		String nCreateDate = request.getParameter("nCreateDate");
		String nModifyDate = request.getParameter("nModifyDate");
		String nSummary = request.getParameter("nSummary");
		String nContent = request.getParameter("nContent");
		news.setnTid(nTid);
		news.setnTitle(nTitle);
		news.setnAuthor(nAuthor);
		news.setnContent(nContent);
		System.out.println(nContent);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		news.setnCreateDate(df.parse(nCreateDate));
		news.setnModifyDate(df.parse(nModifyDate));
		news.setnSummary(nSummary);
		dao.add(news);
		response.sendRedirect("control.jsp?op=list");
	}
%>
