<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="vo.PageInfo" %>
<%@ page import="vo.BoardBean" %>
<%@ page import="java.util.*" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC MODEL2</title>
<link rel="stylesheet" href="../css/common.css" />
</head>
<body>

<%

BoardBean article = (BoardBean) request.getAttribute("article");
String pageNum = (String) request.getAttribute("page");

%>


<div id="wrap">



<div class="inner_wrap">


	<section id="board" class="view">
	
	<h2 class="sbjct"><%= article.getBo_subject() %> </h2>
	
	<div class="view_info">
	
	<ul>
		<li>작성자</li>
		<li><%= article.getBo_name() %>  </li>
	</ul>
	
	<ul>
		<li>작성일</li>
		<li><%= article.getBo_date() %>  </li>
	</ul>
	
	<ul>
		<li>조회수</li>
		<li><%= article.getBo_readcount() %>  </li>
	</ul>
	
	
	</div>
	
	
	
	<div class="contents">
	
	<%= article.getBo_content() %>
	
	</div>
	



	

		
	<ul class="view_btns">
	
		<li><a href="boardReplyForm.bo?bo_num=<%= article.getBo_num() %>&page=<%= pageNum %>">답변</a></li>
		<li><a href="boardModifyForm.bo?bo_num=<%= article.getBo_num() %>&page=<%= pageNum %>">수정</a></li>
		<li><a href="boardDeleteForm.bo?bo_num=<%= article.getBo_num() %>&page=<%= pageNum %>">삭제</a></li>
		<li><a href="boardList.bo?page=<%= pageNum %>">목록</a></li>
		
	</ul>
	
	</section>

</div>


</div>






</body>
</html>