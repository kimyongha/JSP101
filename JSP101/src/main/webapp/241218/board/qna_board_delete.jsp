<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import="vo.BoardBean" %>   
    
 <%
 
 
 int bo_num = (Integer) request.getAttribute("bo_num");
 String nowPage = (String) request.getAttribute("page");
 
 %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<div id="wrap">
	<div class="inner_wrap">
	
		<section id="board" class="delete">
		
		
		<form action="boardDeletePro.bo?bo_num=<%= bo_num %>" method="post">
		
		<input type="hidden" name="page" value="<%=nowPage %>" />
		
		<p>게시글 비밀번호 </p>
		
		<input type="password" name="bo_pass" id="" />
		
		
		
		
		<input type="submit" value="확인" />
		<input type="button" value="돌아가기" onclick="javascript:history.back();" />
		
		</form>
		
		
		
		</section>
	
	
	</div>
</div>




</body>
</html>