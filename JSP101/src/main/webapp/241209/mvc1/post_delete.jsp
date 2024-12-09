<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


Class.forName("com.mysql.cj.jdbc.Driver");
String Dbo_URL = "jdbc:mysql://localhost:3306/post";
String Dbo_ID = "root";
String Dbo_PW = "901217";
Connection conn = DriverManager.getConnection(Dbo_URL, Dbo_ID, Dbo_PW);




try {
	
	String bo_id = request.getParameter("bo_id");

	String sql = "delete from board where bo_id=?";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, bo_id);

	pstmt.executeUpdate();


	response.sendRedirect("post_list.jsp");


	
	
} catch(Exception e){
	
	out.println(e.getMessage());
	
}








%>