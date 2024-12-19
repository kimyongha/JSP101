package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardDeleteProService;
import vo.ActionForward;

public class BoardDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		ActionForward forward = null;
		int bo_num = Integer.parseInt(request.getParameter("bo_num"));
		
		String nowPage = request.getParameter("page");
		
		
		BoardDeleteProService boardDeleteProService = new BoardDeleteProService();
		boolean isArticleWriter = boardDeleteProService.isArticleWriter(bo_num, request.getParameter("bo_pass"));
		
				
		if(isArticleWriter) {
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			String msg = "<script>";
			msg += "alert('삭제할 권한이 없습니다.'); ";
			msg += "history.back(); ";
			msg += "</script>;";
			
			out.println(msg);
			out.close();
			
			
		} else {
			
			boolean isDeleteSuccess = boardDeleteProService.removeArticle(bo_num);
			
			
			
			if(!isDeleteSuccess) {
				
				
				response.setContentType("text/html; charset=UTF-8");
				
				PrintWriter out = response.getWriter();
				
				String msg = "<script>";
				msg += "alert('삭제에 실패하였습니다.'); ";
				msg += "history.back(); ";
				msg += "</script>;";
				
				out.println(msg);
				out.close();
				
				
			} else {
				
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("/boardList.bo?page=" + nowPage);
						
			}
			
		}
		
		
		return forward;
		
	}

}
