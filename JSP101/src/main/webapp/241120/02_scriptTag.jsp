<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>script tag</title>
</head>


<%!

int count = 100;

%>




<body>

<% 

out.println("count의 값 : " + (count+=100));
// 주석 
/* 주석 */

%>

<%-- 주석 --%>




<h2>선언문</h2>
<p> /head와 body 사이에 선언</p>

 <%! 
int a = 10;
int b = 20;
int rs = a + b;
 %>
 
 
 <h2>스크립틀릿</h2>
 <%
 
	for(int i=0;i<5;i++){
	 
	 out.println(i);
 }
 
 %>
 
 <br />
 
 
 <%= rs %>
 
</body>
</html>