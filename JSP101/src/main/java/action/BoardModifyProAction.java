package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;
import vo.BoardBean;

public class BoardModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		boolean isModifySuccess = false;
		
		int bo_num = Integer.parseInt(request.getParameter("bo_num"));
		
		BoardBean article = new BoardBean();
		
		BoardModifyProService boardModifyProService = new BoardModifyProService();
		
		boolean isWriteUser = boardModifyProService.isArticleWriter(bo_num, request.getParameter("bo_pass"));
		
		
		if(!isWriteUser) {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			String msg = "<script>";
			msg += "alert('수정할 권한이 없습니다.'); ";
			msg += "history.back(); ";
			msg += "</script>";
			out.println(msg);
			out.close();
			
			
		} else {
			
			
			article.setBo_num(bo_num);
			article.setBo_subject(request.getParameter("bo_subject"));
			article.setBo_content(request.getParameter("bo_content"));
			
			isModifySuccess = boardModifyProService.modifyArticle(article);
			
			
			if(!isModifySuccess) {
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				
				String msg = "<script>";
				msg += "alert('수정에 실패하였습니다.'); ";
				msg += "history.back(); ";
				msg += "</script>";
				out.println(msg);
				out.close();
				
				
			} else {
				
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("/boardList.bo?bo_num=" + article.getBo_num());
				
			}
			
			
		}
		
		
		return forward;
		
	}
	
	
	
	
	
	

}
