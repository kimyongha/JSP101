<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<jsp:useBean id="person" class="dao.Person" scope="request"></jsp:useBean>


<p><%=person.getId() %></p>
<p><%=person.getName() %></p>


<br />


<%


person.setId(121213);
person.setName("박명수");

int id = person.getId();
String name = person.getName();

%>


<p><%=id %> : <%=name %></p>



</body>
</html>