<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>



<style>


</style>


<form action="post_write_process.jsp" method="post">


<table>

<tr>
	<th>제목</th>
	<td><input type="text" name="bo_title" id="" /></td> 
</tr>
<tr>
	<th>작성자</th>
	<td><input type="text" name="bo_writer" id="" /></td> 
</tr>
<tr>
	<th>내용</th>
	<td><textarea name="bo_content" id="" cols="30" rows="10"></textarea></td> 
</tr>


</table>



<input type="submit" value="등록" />

</form>





</body>
</html>