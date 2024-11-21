<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Include example</title>
</head>
<body>


<%@ include file="header.jsp" %>


<style>
#contents {background:#ddd}
</style>
<section id="contents">
<h2>콘텐츠 영역 </h2>

</section>



<%@ include file="footer.jsp" %>

</body>
</html>