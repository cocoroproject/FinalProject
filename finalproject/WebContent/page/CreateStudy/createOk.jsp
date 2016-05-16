<%@page import="java.sql.Timestamp"%>
<%@page import="cocoro.studygroup.service.StudyCRUDService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>    
<jsp:useBean id="studygroup" class="cocoro.studygroup.model.StudyGroup"></jsp:useBean>    
<jsp:setProperty property="*" name="studygroup"/>
<%

	/* time_set */ 

	String start = request.getParameter("t_start");
	
	int s_t_start = 0;
	int s_t_end = 0;
	
	  
	
	if(start != null)
	{
		String s_hour = start.substring(0,2);
		int s_t_hour = 0;
		s_t_hour = Integer.parseInt(s_hour);
	
		String s_min = start.substring(3,5);
		int s_t_min = 0;
		s_t_min = Integer.parseInt(s_min);
		
		s_t_start = s_t_hour*60 + s_t_min;
		
	}
	else if(start == null)
	{
		s_t_start = 0;
	}
	
	String end = request.getParameter("t_end");
	
	if(end != null)
	{
		String e_hour = end.substring(0,2);
		int e_t_hour = 0;
    	e_t_hour = Integer.parseInt(e_hour);

		String e_min = end.substring(3,5);
		int e_t_min = 0;
    	e_t_min = Integer.parseInt(e_min);
	
        s_t_end = e_t_hour*60 + e_t_min;
	}
	else if(end == null)
	{
		  s_t_end = 0;
	}
	
	studygroup.setS_t_start(s_t_start);
	studygroup.setS_t_end(s_t_end);
	
	/* online check */
	
	String s_online = "";
	String s_offline = "";
	
	String online = request.getParameter("online");
	if(online != null)
	{
		if(online.equals("T"))
		{
			s_online = "T";
			s_offline = "F";
		}
		else if(online.equals("F"))
		{
			s_online = "F";
			s_offline ="T";
		}
	}
	
	String online_check = request.getParameter("online_check");
	if(online_check != null)
	{
		if(online_check.equals("T"))
		{
			s_online = "T";
			s_offline = "T";
		}
	}
	
	
	studygroup.setS_online(s_online);
	studygroup.setS_offline(s_offline);

	
	/* abil_check */
	
	String abil_check = request.getParameter("s_abil_check");
	int s_abil_check = 0;
	
	if(abil_check != null)
	{
		s_abil_check = Integer.parseInt(abil_check);
	}
	
	if(s_abil_check == -1)
	{
		String abil = request.getParameter("s_abil");
		if(abil != null)
		{
			s_abil_check = Integer.parseInt(abil);
		}
	}
	
	studygroup.setS_abil_check(s_abil_check);
%>
<%
	StudyCRUDService service = StudyCRUDService.getInstance();
	int re = service.createStudyGruopService(studygroup);
	
	if(re > 0)
	{
		response.sendRedirect("../../jsp/studydetail.jsp");
	}
	else
	{
		response.sendRedirect("CreateStudyForm1.jsp");
	}

%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>