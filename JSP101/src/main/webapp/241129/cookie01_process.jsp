<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<%

String id = request.getParameter("id");
String passwd = request.getParameter("passwd");


if(id.equals("admin") && passwd.equals("1234")){
	
	Cookie cookie_id = new Cookie("userID", id);
	Cookie cookie_pw = new Cookie("userPW", passwd);
	
	response.addCookie(cookie_id);
	response.addCookie(cookie_pw);
	
	out.println("쿠키 생성 완료");
	
	
} else {
	
	out.println("쿠키 생성 실패");
	
}





%>



<a href="cookie01_status.jsp">쿠키 정보</a>
</body>
</html>