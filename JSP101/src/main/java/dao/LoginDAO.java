package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vo.Member;

public class LoginDAO {
	
	
	Connection conn;
	public static LoginDAO loginDAO;
	
	
	private LoginDAO() {}
	
	public static LoginDAO getInstance() {
		
		if(loginDAO == null) loginDAO = new LoginDAO();
		return loginDAO;
		
	}
	
	
	public void setConnection(Connection conn) {
		
		this.conn = conn;
		
	}
	
	
	
	public Member selectLoginMember(String mb_id, String mb_passwd) {
		
		Member loginMember = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			
			pstmt = conn.prepareStatement("select * from member where mb_id = ? and mb_passwd = ?");
			pstmt.setString(1, mb_id);
			pstmt.setString(2, mb_passwd);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				loginMember = new Member();
				loginMember.setId(rs.getString("mb_id"));
				loginMember.setName(rs.getString("mb_name"));
				loginMember.setAge(rs.getInt("mb_age"));
				loginMember.setGender(rs.getString("mb_gender"));
				loginMember.setEmail(rs.getString("mb_email"));
				loginMember.setAddr(rs.getString("mb_addr"));
				
			}
			
			
		} catch(Exception e) {
			
			
			System.out.println("[LoginDAO] selectLoginMember() : " + e);
			
			
		} finally {
			
			
			try {
				
				close(rs);
				close(pstmt);
				
			} catch (Exception e2) {
				System.out.println("[LoginDAO] selectLoginMember() finally : " + e2);
			}
		
			
			
		}
		
		
		return loginMember;
		
		
		
		
	}
			
			
			
	

}
