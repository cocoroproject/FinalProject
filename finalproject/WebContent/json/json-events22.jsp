<%@page import="cocoro.studygroup.service.StudyDetailService"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//String id = (String) session.getAttribute("id");
	String sid = request.getParameter("s_id");
	if(sid !=null){
		int g =Integer.parseInt(sid);
		StudyDetailService service = StudyDetailService.getInstance();
		Object obj = service.listCalendarService(g);
		out.print(obj);
	}
 
%>

