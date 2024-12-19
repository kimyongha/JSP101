package svc;

import java.sql.*;

import dao.BoardDAO;
import vo.BoardBean;

import static db.JdbcUtil.*;
public class BoardDetailService {
	
	
	public BoardBean getArticle(int bo_num) throws Exception {
		
		
		BoardBean article = null;
		Connection conn = getConnection();
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		
		int updateCount = boardDAO.updateReadCount(bo_num);
		if(updateCount > 0) {
			
			commit(conn);
			
		} else { 
			
			rollback(conn);
			
		}
		
		
		article = boardDAO.selectArticle(bo_num);
		
		close(conn);
		
		return article;
				
				
		
		
	}
	
	
	
	

}
