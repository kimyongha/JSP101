<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지 예]</title>
</head>
<body>

<%

out.println(3/0);

/* String str = null;
out.println(str.toString()); */

%>

</body>
</html>