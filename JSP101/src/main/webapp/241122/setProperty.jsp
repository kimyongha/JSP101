<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>





<jsp:useBean id="person" class="dao.Person" scope="request" ></jsp:useBean>


<jsp:setProperty property="person" name="id" value="1324" />
<jsp:setProperty property="person" name="name" value="유재석" />



<% out.println("1234"); %>






</body>
</html>