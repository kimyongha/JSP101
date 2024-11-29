<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h2>세션 유효시간 변경 전 </h2>
<%

int time = session.getMaxInactiveInterval() / 60;

%>

<p><%= time %>분</p>

<h2>세션 유효시간 변경 후 </h2>



<%
session.setMaxInactiveInterval(60*60);
time=session.getMaxInactiveInterval() / 60;
%>
<p><%= time %>분</p>

</body>
</html>