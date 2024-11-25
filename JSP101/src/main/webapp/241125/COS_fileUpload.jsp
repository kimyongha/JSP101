<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 </title>
</head>
<body>


<form action="COS_fileUploadProcess.jsp" method="post" enctype="multipart/form-data">


이름 : <input type="text" name="user_name" />

<br />

제목 : <input type="text" name="title"/>

<br />

첨부파일 : <input type="file" name="attach_file" />

<br />

<input type="submit" value="전송" />

</form>

</body>
</html>