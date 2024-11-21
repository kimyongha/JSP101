<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.Calendar" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




<%@ include file="p118_p9_header.jsp" %>

<%!

Calendar cal = Calendar.getInstance();

%>

<p>현재시간 : <%= cal.getTime() %></p>


</body>
</html>