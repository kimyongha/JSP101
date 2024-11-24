<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

request.setCharacterEncoding("utf-8");
String userId = request.getParameter("user_id");
String userPasswd = request.getParameter("user_passwd");
String userName = request.getParameter("user_name");



%>


<p><%= userId %></p>
<p><%= userPasswd %></p>
<p><%= userName %></p>








</body>
</html>