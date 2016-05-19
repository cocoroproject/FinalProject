<%@page import="java.io.PrintWriter"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="cocoro.user.service.UsersActivityService"%>
<%@page import="cocoro.user.model.Message"%>
<%@page import="cocoro.user.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	System.out.println("오케이 ??");
	
	UsersActivityService activityService = UsersActivityService.getInstance();
	Users users = (Users)session.getAttribute("users");
	
	Message message = new Message();
	
	//메세지가 인설트인지 삭제인지 판단 값이 넘어오면  인설트
	String message_insert =  null;
	if(request.getParameter("message_insert") != null){
		
		int message_o_id = Integer.parseInt(request.getParameter("message_o_id"));
		String message_comment = request.getParameter("message_comment");
		
		message.setMessage_u_id(users.getU_id());
		message.setMessage_o_id(message_o_id);
		message.setMessage_Comment(message_comment);
		
		System.out.println(users.getU_id());
		System.out.println(message_o_id);
		System.out.println(message_comment);
		
		int re = activityService.sendMessage(message);
		
		if(re > 0){
			System.out.println("성공");
		}else{
			System.out.println("실패");
		}
	}
	%>
</body>
</html>