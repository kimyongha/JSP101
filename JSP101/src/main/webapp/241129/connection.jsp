<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%

	Connection conn = null;

	String DB_NAME = "test";
	String DB_URL = "jdbc:mysql://localhost:3306/" + DB_NAME;
	String DB_ID = "root";
	String DB_PASSWD = "901217";

	try {
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWD);
		out.println("디비 연결 성공");
		
	} catch (Exception e) {

		out.println("디비 연결 실패");
		//e.printStackTrace();

	}
	
	
%>



</body>
</html>