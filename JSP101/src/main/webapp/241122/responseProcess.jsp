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


if(userId.equals("관리자") && userPasswd.equals("1234")){
	
	response.sendRedirect("response_success.jsp");
	
} else {
	
	response.sendRedirect("response_fail.jsp");
	
	
}
%>


<p><%= userId %></p>
<p><%= userPasswd %></p>
<p><%= userName %></p>








</body>
</html>