<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


Class.forName("com.mysql.cj.jdbc.Driver");
String Dbo_URL = "jdbc:mysql://localhost:3306/post";
String Dbo_ID = "root";
String Dbo_PW = "901217";
Connection conn = DriverManager.getConnection(Dbo_URL, Dbo_ID, Dbo_PW);






request.setCharacterEncoding("UTF-8");

String bo_id = request.getParameter("bo_title");
String bo_writer = request.getParameter("bo_writer");
String bo_content = request.getParameter("bo_content");




// 마지막 인덱스 체크 방법
/* 
int idx = 0;
String tmpSql = "select max(bo_id) from board";
PreparedStatement pstmt1 = conn.prepareStatement(tmpSql);
ResultSet rs1 = pstmt1.executeQuery();

while(rs1.next()){
	
	idx = rs1.getInt("bo_id") + 1;
	
} 
*/






try {
	

String sql = "insert into board (bo_title, bo_writer,bo_content) values (?,?,?)";

PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1,bo_id);
pstmt.setString(2,bo_writer);
pstmt.setString(3,bo_content);
pstmt.executeUpdate();


response.sendRedirect("post_list.jsp");

	
} catch(Exception e) {
	
	
	out.println(e.getMessage());
	
	
}









%>
