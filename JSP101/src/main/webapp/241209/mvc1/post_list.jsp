<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>post list</title>
</head>
<body>


<%

try{
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	String Dbo_URL = "jdbc:mysql://localhost:3306/post";
	String Dbo_ID = "root";
	String Dbo_PW = "901217";
	Connection conn = DriverManager.getConnection(Dbo_URL, Dbo_ID, Dbo_PW);
	

	
	
	String page_param = request.getParameter("page_no");
	
	int page_no = 0;
	if(page_param == null){
		
		page_no = 1;
		response.sendRedirect(request.getRequestURL()+"?page_no="+page_no);
		
	} else {
		
		page_no = Integer.parseInt(page_param);
		
	}
	
	
	int offset = 0;
	int rows = 3;
	
	
	String sql = "select * from board order by bo_id desc limit ?,?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setInt(1, offset);
	pstmt.setInt(2, rows);

	ResultSet rs = pstmt.executeQuery();
	
	
	

	
%>



<style>

a {text-decoration:none;color:#333}
table {width:100%;max-width:1200px;border-collapse:collapse;border-spacing:0;text-align:center;border-top:2px solid #333;margin:0 auto 10px}
table th, table td {border:1px solid #ccc;border-left:0;border-right:0;padding:10px}
table th {background:#f9f9f9;}


.board_btm {text-align:right;width:100%;max-width:1200px;margin:0 auto}

.board_btm a {display:inline-block;padding:10px 20px;background:#ddd;color:#333;border-radius:5px;font-weight:bold}


</style>





<table>

<colgroup>
<col style="width:10%">
<col style="width:*">
<col style="width:15%">
<col style="width:21%">
<col style="width:15%">
</colgroup>

<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>작성일</th>
	<th>관리</th>
</tr>

<% 

SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");


while(rs.next()) { %>
<tr>
	<td><%=rs.getString("bo_id") %></td>
	<td><a href="post_read.jsp?bo_id=<%=rs.getString("bo_id") %>"><%=rs.getString("bo_title") %></a></td>
	<td><%=rs.getString("bo_writer") %></td>
	<td><%=sf.format(rs.getTimestamp("bo_datetime"))  %></td>
	<td>
	
	<a href="post_modify.jsp?bo_id=<%=rs.getString("bo_id") %>">수정</a>
	<a href="post_delete.jsp?bo_id=<%=rs.getString("bo_id") %>">삭제</a>
	
	</td>
</tr>

<% } //end-while %>

</table>




<style>

ul.pagination {text-align:center}
ul.pagination li {display:inline-block}
ul.pagination li a {display:block;padding:10px;border:1px solid #ccc;border:1px solid #ccc;border-radius:5px}


</style>
<ul class="pagination">

<li><a href="">이전</a></li>
<li><a href="">1</a></li>
<li><a href="">2</a></li>
<li><a href="">3</a></li>
<li><a href="">다음</a></li>

</ul>

<div class="board_btm">
<a href="post_write.jsp">글쓰기</a>
</div>






<%

	
} catch(Exception e){
	
	
	out.println(e.getMessage());
	
	
	
}


%>








</body>
</html>