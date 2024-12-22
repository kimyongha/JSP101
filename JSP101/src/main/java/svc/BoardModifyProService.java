package svc;


import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BoardDAO;
import vo.BoardBean;


public class BoardModifyProService {

	
	
	public boolean isArticleWriter(int bo_num, String pass) {
		
		boolean isArticleWriter = false;
		Connection conn = getConnection();
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		
		isArticleWriter = boardDAO.isArticleBoardWriter(bo_num, pass);
		close(conn);
		
		return isArticleWriter;
		
	}
	
	
	
	public boolean modifyArticle(BoardBean article) throws Exception {
		
		
		boolean isModifySuccess = false;
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		
		int updateCount = boardDAO.updateArticle(article);
		
		if(updateCount > 0) {
			
			commit(conn);
			isModifySuccess = true;
			
		} else {
			
			rollback(conn);
			
		}
		
		return isModifySuccess;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
