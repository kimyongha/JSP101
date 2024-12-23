<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>





<a href="/241218/board/boardWriteForm.bo">게시판 등록</a>






<%

String mb_id = (String) session.getAttribute("mb_id");


%>


<% if(mb_id == null) { %>

<a href="/241218/member/login.jsp">로그인</a>

<% } else { %>

<a href="/241218/member/logout.bo">로그아웃</a>

<% } // endif %>







</body>
</html>