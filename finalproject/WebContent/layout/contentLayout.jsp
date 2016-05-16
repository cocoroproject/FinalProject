<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String header = request.getParameter("header");
	String body = request.getParameter("body");
	String side = request.getParameter("side");
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

	 
			<jsp:include page="../page/header.jsp"></jsp:include>
		
		
			<jsp:include page="<%= side %>" ></jsp:include>
	
			<%-- <jsp:include page="<%= body %>" ></jsp:include> --%>
		
		<%-- 	<jsp:include page="footer.jsp" flush="true"></jsp:include> --%>
	
</body>
</html>