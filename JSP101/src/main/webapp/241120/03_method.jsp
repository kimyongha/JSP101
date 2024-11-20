<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>method</title>
</head>
<body>


<%!

int sum(int a, int b){
	
	return a+b;
	
}


%>


<%

out.println( "10 + 100 = " + sum(10,100));

%>

<ul>

<% for(int i=0;i<5;i++) { %>

<li><%=i %></li>

<% } %>

</ul>



</body>
</html>