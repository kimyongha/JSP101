<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<jsp:useBean id="bean" class="dao.Calculator"></jsp:useBean>

<%


int m = bean.process(5);

out.println("5의 2제곱 " + m);


%>



</body>
</html>