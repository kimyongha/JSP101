<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.Date, java.lang.Math" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%

Date date= new Date();
double pow = Math.pow(5,2);

%>


<p>현재 날짜 : <%= date %></p>
<p>5의 제곱 : <%= pow %></p>


</body>
</html>