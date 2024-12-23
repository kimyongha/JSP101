package svc;

import static db.JdbcUtil.getConnection;
import java.sql.Connection;
import dao.LoginDAO;
import vo.Member;

public class LoginService {
	
	
	
	public Member getLoginMember(String mb_id, String mb_passwd) {
		
		
		LoginDAO loginDAO = LoginDAO.getInstance();
		
		Connection conn = getConnection();
		loginDAO.setConnection(conn);
		
		Member loginMember = loginDAO.selectLoginMember(mb_id, mb_passwd);
		
		return loginMember;
		
	}
	
	
	
	

}
