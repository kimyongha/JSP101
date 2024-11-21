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

String str = java.net.URLEncoder.encode("테스터");


str = java.net.URLDecoder.decode(str);

out.println(str);

%>
</body>
</html>