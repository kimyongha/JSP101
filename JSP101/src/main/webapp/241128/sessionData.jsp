<%@page import="java.util.Enumeration"%>
<%@page import="java.nio.channels.Pipe.SourceChannel"%>
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

session.setAttribute("tmp",1);

String tmp = (String) session.getAttribute("tmp");



%>


<%= tmp %>



<%







Enumeration en = session.getAttributeNames();

while(en.hasMoreElements()){
	
	String name = en.nextElement().toString();
	String value = session.getAttribute(name).toString();
	
	out.println(name + " - " + value);
	out.print("<br>");
	
	
}
















%>

</body>
</html>