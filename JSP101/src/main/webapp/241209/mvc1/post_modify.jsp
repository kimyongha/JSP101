<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>


<%


Class.forName("com.mysql.cj.jdbc.Driver");
String Dbo_URL = "jdbc:mysql://localhost:3306/post";
String Dbo_ID = "root";
String Dbo_PW = "901217";
Connection conn = DriverManager.getConnection(Dbo_URL, Dbo_ID, Dbo_PW);



String bo_id = request.getParameter("bo_id");
String sql = "select * from board where bo_id = ? ";

PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, bo_id);

ResultSet rs = pstmt.executeQuery();


%>
<% while(rs.next()) {  %>

<form action="post_modify_process.jsp" method="post">

<input type="hidden" name="bo_id"  value="<%=rs.getString("bo_id") %>"/>

<table>

<tr>
	<th>제목</th>
	<td><input type="text" name="bo_title" value="<%=rs.getString("bo_title") %>" /></td> 
</tr>
<tr>
	<th>작성자</th>
	<td><input type="text" name="bo_writer" id=""   value="<%=rs.getString("bo_writer") %>"/></td> 
</tr>
<tr>
	<th>내용</th>
	<td><textarea name="bo_content" id="" cols="30" rows="10"><%=rs.getString("bo_content") %></textarea></td> 
</tr>


</table>



<input type="submit" value="등록" />

</form>

<% } //end-while %>



</body>
</html>