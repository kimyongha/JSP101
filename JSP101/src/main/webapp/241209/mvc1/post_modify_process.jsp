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

String bo_id = request.getParameter("bo_id");
String bo_title = request.getParameter("bo_title");
String bo_writer = request.getParameter("bo_writer");
String bo_content = request.getParameter("bo_content");





String sql = "update board set bo_title=?, bo_writer=?, bo_content=? where bo_id=?";


try {

PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1,bo_title);
pstmt.setString(2,bo_writer);
pstmt.setString(3,bo_content);
pstmt.setString(4,bo_id);
pstmt.executeUpdate();


response.sendRedirect("post_list.jsp");



} catch(Exception e){
	
	out.println(e.getMessage());
	
}







%>
