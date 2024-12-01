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
	
	session.setAttribute("userID", id);
	session.setAttribute("userPasswd", passwd);
	
	out.println("세선 설정 완료");
	out.println(id + "님 환영~!");
} else {
	
	out.println("세션 저장 실패");
	
}

%>
<a href="sessionData.jsp">session 정보</a>

</body>
</html>