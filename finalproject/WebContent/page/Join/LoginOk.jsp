<%@page import="java.util.HashMap"%>
<%@page import="cocoro.user.model.Users"%>
<%@page import="java.util.List"%>
<%@page import="cocoro.user.service.UsersActivityService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String u_email = request.getParameter("u_email");
	String u_pwd = request.getParameter("u_pwd");
	
	//넘어온 ID Pass를 해쉬맵에 저장
	HashMap<String, String> login = new HashMap<String, String>();
	login.put("u_email",u_email);
	login.put("u_pwd",u_pwd);
	
	//저장한 해쉬맵을 Login 메서드에 넣었습니다
	UsersActivityService activityService = UsersActivityService.getInstance();
	Users users = activityService.usersLogin(login);
 	
	//users 가  null 이란 소리는 디비에서 아무런 값도 못가져왔다는 것이기 떄문에
	if(users == null){
	 	System.out.println("\n로그인 실패");
		response.sendRedirect("../Main.jsp");
	//로그인 성공
	}else{
		session.setAttribute("users",users);
		//세션
		activityService.usersLoginTime(users.getU_id());
 		//인트로가 디폴트 값인 회원은 처음 가입한걸로 간주
 		response.sendRedirect("../../layout/mainLayout.jsp");
 	}
%>    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

</body>
</html>