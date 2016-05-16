<%@page import="java.util.List"%>
<%@page import="cocoro.studygroup.model.StudyGroup"%>
<%@page import="cocoro.studygroup.service.StudyCRUDService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% 
	request.setCharacterEncoding("utf-8");
	StudyCRUDService service = StudyCRUDService.getInstance();
	StudyGroup studygroup = new StudyGroup();
	List<StudyGroup> list = service.listStudyGroupService(studygroup);
	request.setAttribute("list", list);
%>   
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:forEach var="studygroup" items="${list}">
	<a href="previewStudy.jsp?s_id=${studygroup.s_id}">상효스터디</a>
	<p>${studygroup.s_id}</p>
	<p>${studygroup.s_name}</p>
	<p>${studygroup.s_intro}</p>
	<p>${studygroup.s_tag}</p>
	<p>${studygroup.s_address}</p>
	</c:forEach>
</body>
</html>