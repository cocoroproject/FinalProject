<%@page import="cocoro.user.service.UsersActivityService"%>
<%@page import="cocoro.user.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");

	  
	
	String header = request.getParameter("header");
	String body = request.getParameter("body");
	
	
	if(body!=null){
    System.out.println("body"+body);
	}else{
		
		System.out.println("안됩니다.");
		
	}
    
	if((Users)session.getAttribute("users")!=null){
		header = "../page/headerAfter.jsp";
		if(body == null ){
			body = "../page/Main.jsp";
		}
	}
	if(header == null){
		header = "../page/header.jsp";
	}
	if(body == null){
		System.out.println("null아닙니다.");
		body = "../page/beforeMain.jsp";
	}
	
	//친구 판단
	if(request.getParameter("f_o_id") != null){
		System.out.println("f_o_id아닙니다.");
		int f_o_id = Integer.parseInt(request.getParameter("f_o_id"));
		UsersActivityService activityService = UsersActivityService.getInstance();
		Users fUsers = (Users)activityService.usersInfo(f_o_id);
		session.setAttribute("fUsers", fUsers);
		System.out.println("친구 시군요");
		response.sendRedirect("mainLayout.jsp?body=../page/mypage/mypage.jsp");
	}
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
body{
	width: 100%;
	height: 100%;
	overflow-x: hidden; 
}
</style>
</head>
<body>
	
   <jsp:include page="<%= header %>"></jsp:include>
   <jsp:include page="<%= body %>"></jsp:include>
   <jsp:include page="../page/footer.jsp"></jsp:include>

</body>
</html>