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


%>


<div id="wrap">



<div class="inner_wrap">


	<section id="boardView">
	
		
			<ul>
				<li>제목</li>
				<li><input type="text" name="bo_subject" id="" /> </li>
			</ul>
		
			<ul>
				<li>작성자</li>
				<li><input type="text" name="bo_name" id="" /> </li>
			</ul>
		
			<ul>
				<li>내용</li>
				<li><textarea name="bo_content" id="" cols="30" rows="10"></textarea> </li>
			</ul>
		
		
			<ul class="attach">
				<li>첨부파일</li>
				<li><input type="file" name="bo_file" id="" /> </li>
			</ul>
		
		
		<ul class="view_btns">
		<li><a href="boardReplyForm.bo?bo_num=<%= article.getBo_num() %>">답변</a></li>
		<li><a href="boardModifyForm.bo?bo_num=<%= article.getBo_num() %>">수정</a></li>
		<li><a href="boardDeleteForm.bo?bo_num=<%= article.getBo_num() %>">삭제</a></li>
		<li><a href="boardList.bo?bo_num=<%= article.getBo_num() %>">목록</a></li>
		
		</ul>
	
	</section>

</div>


</div>






</body>
</html>