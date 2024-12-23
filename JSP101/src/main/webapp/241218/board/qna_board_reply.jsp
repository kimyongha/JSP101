<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="vo.BoardBean"%>

<%
BoardBean article = (BoardBean) request.getAttribute("article");
String nowPage = (String) request.getAttribute("page");
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/common.css" />
</head>
<body>



<div id="wrap">
	<div class="inner_wrap">

		<section id="board" class="reply">


			<form action="/241218/board/boardReplyPro.bo" method="post"
				enctype="mulipart/form-data" name="boardform">

				<input type="hidden" name="page" value="<%= nowPage %>" />
				<input type="hidden" name="bo_num" value="<%= article.getBo_num() %>" />
				<input type="hidden" name="bo_subject" value="<%= article.getBo_subject() %>" />
				<input type="hidden" name="bo_re_ref" value="<%= article.getBo_re_ref() %>" />
				<input type="hidden" name="bo_re_lev" value="<%= article.getBo_re_lev() %>" />
				<input type="hidden" name="bo_re_seq" value="<%= article.getBo_re_seq() %>" />
				
				
				<fieldset>
					<legend>댓글 등록 폼</legend>

					<ul>
						<li>작성자</li>
						<li><input type="text" name="bo_name" id="" /></li>
					</ul>

					<ul>
						<li>비밀번호</li>
						<li><input type="password" name="bo_pass" id="" /></li>
					</ul>
					
					<ul>
						<li>내용</li>
						<li><textarea name="bo_content" id="" cols="30" rows="10"></textarea>
						</li>
					</ul>


				</fieldset>


				<ul class="form_btns">

					<li><input type="submit" value="등록" /></li>
					<li><input type="reset" value="취소" /></li>

				</ul>



			</form>




		</section>

	</div>
</div>




</body>
</html>