package svc;


import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BoardDAO;

public class BoardDeleteProService {
	
	
	
	
	public boolean isArticleWriter(int bo_num, String Pass) throws Exception {
		
		
		boolean isArticleWriter= false;
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		
		isArticleWriter = boardDAO.isArticleBoardWriter(bo_num, Pass);
		
		close(conn);
		
		return isArticleWriter;
		
		
	}
	
	
	public boolean removeArticle(int bo_num) throws Exception {
		
		boolean isRemoveSuccess = false;
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		
		int deleteCount = boardDAO.deleteArticle(bo_num);
		
		if(deleteCount > 0) {
			
			commit(conn);
			isRemoveSuccess = true;
			
		} else {
			
			rollback(conn);
			
		}
		
		
		
		return isRemoveSuccess;
		
	}
	
	
	
	
	

}
