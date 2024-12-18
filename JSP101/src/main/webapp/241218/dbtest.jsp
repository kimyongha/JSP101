<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.Connection" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%


Connection conn = null;

String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/model2";

Boolean connect = false;



try {
	
	Class.forName(driver);
	conn = DriverManager.getConnection(url, "root", "901217");
	
	connect = true;
	conn.close();
	
	
	
} catch(Exception e){
	
	connect = false;
	e.printStackTrace();
	
	
}




%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%


out.println(connect);


%>


<br />
<br />



<c:set var="connect" value="<%=connect %>"></c:set>




<c:if test="${connect==true}">
연결 성공1
</c:if>

<br />

<c:if test="${connect eq true}">
연결 성공2
</c:if>

<br />



<c:if test="${connect != false}">
연결 성공3
</c:if>

<br />

<c:if test="${connect ne false}">
연결 성공4
</c:if>

<br />

</body>
</html>