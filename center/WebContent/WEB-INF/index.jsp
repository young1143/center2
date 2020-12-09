<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@inxlude file="static/header.jsp" %>
<%@inxlude file="static/footer.jsp" %>
<section>
	<%
		String sexction = request.getParameter("section") != null ? request.getParameter("section") + "";
	
	
		switch(section){
		case "sale_registration":
			%> <%@include file="page/artist_lookup.jsp" %><% 
			break;
		case "sale_lookup":
		%> <%@include file="page/artist_lookup.jsp" %><% 
			break;
		case "sale_lookup":
		%> <%@include file="page/artist_lookup.jsp" %><% 
			break;
		case "sale_lookup":
		%> <%@include file="page/artist_lookup.jsp" %><% 
			break;
		default:
			%> <%@include file=page/artist_lookup.jsp %><% 
	
	%>
</section>
<%@inxlude file="static/nav.jsp" %>
</body>
</html>

