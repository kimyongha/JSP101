<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<jsp:forward page="actionTag_param1_data.jsp">

<jsp:param name="id" value="admin" />
<jsp:param name="name" value='<%=java.net.URLEncoder.encode("테스터") %>' />

</jsp:forward>



</body>
</html>