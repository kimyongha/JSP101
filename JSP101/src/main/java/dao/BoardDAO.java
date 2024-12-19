package dao;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import vo.BoardBean;

public class BoardDAO {

	
	DataSource ds;
	Connection conn;
	private static BoardDAO boardDAO;
	
	
	private BoardDAO() {}
	
	public static BoardDAO getInstance() {
		
		if(boardDAO == null) boardDAO = new BoardDAO();
		return boardDAO;
		
	}
	
	
	
	public void setConnection (Connection conn) {
		
		this.conn = conn;
		
	}
	
	
	public int selectListCount() {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			
			String sql = "select count(*) as cnt from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) listCount = rs.getInt(1);
			
			
		} catch (Exception e) {
			
			System.out.println("getListCount에서 오류 발생 ");
			
		} finally {
			
			close(rs);
			close(pstmt);
			
		}
		
		return listCount;
		
	}
	
	
	
	
	public ArrayList<BoardBean> selectArticleList(int page, int limit) {
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from board order by board_re_ref desc ";
		sql += "board_re_seq asc limit ?, 10";
		
		
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		
		BoardBean board = null;
		
		
		
		int startRow = (page - 1) * 10;
		
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			rs = pstmt.executeQuery();
			
			
			
			while(rs.next()) {
				
				board = new BoardBean();
				board.setBo_num(rs.getInt("bo_num"));
				board.setBo_name(rs.getString("bo_name"));
				board.setBo_pass(rs.getString("bo_pass"));
				board.setBo_subject(rs.getString("bo_subject"));
				board.setBo_content(rs.getString("bo_content"));
				board.setBo_file(rs.getString("bo_file"));
				board.setBo_re_ref(rs.getInt("bo_re_ref"));
				board.setBo_re_lev(rs.getInt("bo_re_lev"));
				board.setBo_re_seq(rs.getInt("bo_re_seq"));
				board.setBo_readcount(rs.getInt("bo_name"));
				board.setBo_date(rs.getDate("bo_date"));
				
			}
			
			
		} catch (Exception e) {
			
			System.out.println("selectArticleList 에러 발생" + e);
			
		} finally {
			
			close(rs);
			close(pstmt);
			
		}
		
		return articleList;
		
	}
	
	
	
	
	
	
	// 게시글 내용 보기 
	
	public BoardBean selectArticle(int bo_num) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardBean boardBean = null;
		
		String sql = "select * from board where bo_num=?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bo_num);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				
				boardBean = new BoardBean();
				boardBean.setBo_num(rs.getInt("bo_num"));
				boardBean.setBo_name(rs.getString("bo_name"));
				boardBean.setBo_pass(rs.getString("bo_pass"));
				boardBean.setBo_subject(rs.getString("bo_subject"));
				boardBean.setBo_content(rs.getString("bo_content"));
				boardBean.setBo_file(rs.getString("bo_file"));
				boardBean.setBo_re_ref(rs.getInt("bo_re_ref"));
				boardBean.setBo_re_lev(rs.getInt("bo_re_lev"));
				boardBean.setBo_re_seq(rs.getInt("bo_re_seq"));
				boardBean.setBo_readcount(rs.getInt("bo_name"));
				boardBean.setBo_date(rs.getDate("bo_date"));
				
			}
			
			
			
		} catch (Exception e) {
			
			System.out.println("selectArticle 메소드 에러 : " + e);
			
		} finally {
			
			close(rs);
			close(pstmt);
			
		}
		
		
		return boardBean;
		
	}
	
	
	
	
	
	// 게시글 등록
	public int insertArticle(BoardBean article) {
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		int num = 0;
		int insertCount = 0;
		
		
		
		try {

			String sql = "select max(bo_num) from board";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				num = rs.getInt(1) + 1;
				
			} else {
				
				num = 1;				
				
			}
			
			sql = "insert into board(bo_num, bo_name, bo_pass, bo_subject, bo_content, bo_file, bo_re_ref, bo_re_lev, bo_re_seq, bo_readcount, bo_date) ";
			sql += "values ( ";
			sql += "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW() ";
			sql += ") ";
			

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getBo_name());
			pstmt.setString(3, article.getBo_pass());
			pstmt.setString(4, article.getBo_subject());
			pstmt.setString(5, article.getBo_content());
			pstmt.setString(6, article.getBo_file());
			pstmt.setInt(7, num);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);
			
			
			insertCount = pstmt.executeUpdate();
			
			
			
			
		} catch (Exception e) {
			
			
			System.out.println("insertArticlea 메소드 에러" + e);
			
			
			
		} finally {
			
			close(rs);
			close(pstmt);
			
		}
		
		return insertCount;
		
	}
	
	
	
	/**
	 * 댓글 인서트 기능
	 * param : BoardBean article
	 * 
	 */
	
	
	public int insertReplyArticle(BoardBean article) {
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select max(bo_num) from board ";
		
		int num = 0;
		int insertCount = 0;
		int re_ref = article.getBo_re_ref();
		int re_lev = article.getBo_re_lev();
		int re_seq = article.getBo_re_seq();
		
		
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) num = rs.getInt(1) + 1;
			else num = 1;
			
			sql = "update board set bo_re_seq = bo_re_seq + 1 where bo_re_ref = ? and bo_re_seq > ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, re_ref);
			pstmt.setInt(2, re_seq);
			
			
			int updateCount = pstmt.executeUpdate();
			
			if(updateCount > 0)	commit(conn);
			
			
			re_seq += 1;
			re_lev += 1;
			
			sql = "insert into board (bo_num, bo_name, bo_pass, bo_subject, bo_content, bo_file, bo_re_ref, bo_re_lev, bo_re_seq, bo_readcount, bo_date) ";
			sql += "values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW() )";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getBo_name());
			pstmt.setString(3, article.getBo_pass());
			pstmt.setString(4, article.getBo_subject());
			pstmt.setString(5, article.getBo_content());
			pstmt.setString(6, "");
			pstmt.setInt(7, re_ref);
			pstmt.setInt(8, re_lev);
			pstmt.setInt(9, re_seq);
			pstmt.setInt(10, 0);
			
			insertCount = pstmt.executeUpdate();
			
			
			
		} catch (Exception e) {
			
			System.out.println("insertReplyArticle 메소드 에러 " + e);
			
		} finally {
			
			close(rs);
			close(pstmt);
			
		}
		
		
		return insertCount;
		
	}
	
	
	
	public int updateArticle(BoardBean article) {
		
		
		int updateCount = 0;
		PreparedStatement pstmt = null;

		String sql = "update board set bo_subject=?, bo_content=? where bo_num=? ";
		
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getBo_subject());
			pstmt.setString(1, article.getBo_content());
			pstmt.setInt(1, article.getBo_num());
			updateCount = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			
			System.out.println("updateArticle 메소드 오류 " + e);
			
		} finally {
			
			close(pstmt);
			
		}
		
		return updateCount;
		
	}
	
	
	
	
	public int deleteArticle(int bo_num) {
		
		PreparedStatement pstmt = null;
		
		String sql = "delete from board where bo_num=? ";
		
		int deleteCount = 0;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bo_num);
			deleteCount = pstmt.executeUpdate();
			
		} catch (Exception e) {
			
			System.out.println("deleteArticle 메소드 오류" + e);
			
		} finally {
			
			close(pstmt);
			
		}
		
		return deleteCount;
		
	}
	
	
	
	
	public int updateReadCount(int bo_num) {
		
		
		PreparedStatement pstmt = null;
		int updateCount = 0;
		
		String sql = "update board set bo_readcount = bo_readcount + 1 where bo_num = ? ";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bo_num);
			updateCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			System.out.println("updateReadCount 메소드 에러 : " + e);
			
		}
		
		
		return updateCount;
		
	}
	
	
	
	public boolean isArticleBoardWriter(int bo_num, String pass) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from board where bo_num=? ";
		boolean isWriter = false;
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bo_num);
			rs = pstmt.executeQuery();
			rs.next();
			
			
			if(pass.equals(rs.getString("bo_pass"))) {
				isWriter = true;
			}
			
			
		} catch (Exception e) {
			
			System.out.println("isArticleBoardWriter 메소드 에러" + e);
			
		} finally {
			
			close(rs);
			close(pstmt);
			
		}
		
		return isWriter;
		
		
	}
	
	
	
}
