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

String id = request.getParameter("user_id");
String passwd = request.getParameter("user_passwd");



%>


<p><%=id %></p>
<p><%=passwd %></p>


</body>
</html>