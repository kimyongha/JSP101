package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardDetailService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardReplyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		String nowPage = request.getParameter("page");
		
		int bo_num = Integer.parseInt(request.getParameter("bo_num"));
		
		BoardDetailService boardDetailService = new BoardDetailService();
		BoardBean article = boardDetailService.getArticle(bo_num);
		
		request.setAttribute("article", article);
		request.setAttribute("page", nowPage);
		forward.setPath("/241218/board/qna_board_reply.jsp");
		
		return forward;
		
	}
	
	
	
	
	
	
	
	

}
