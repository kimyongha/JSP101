<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag : Param</title>
</head>
<body>



<h3>fisrt</h3>

<jsp:include page="actionTag_param_data.jsp">

<jsp:param name="date" value="<%=new java.util.Date() %>"/>


</jsp:include>



<p>first lorem</p>


</body>
</html>