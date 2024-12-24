package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.BoardWriteProService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {


		ActionForward forward = null;
		BoardBean boardBean = null;
		
		String realFolder = "";
		String saveFolder = "/241218/boardUpload";;
		
		int fileSize = 5 * 1024 * 1024;

		ServletContext context = request.getServletContext();
		//realFolder = context.getRealPath(saveFolder);
		realFolder = "C:\\Users\\kj\\Desktop\\myGit\\JSP101\\JSP101\\src\\main\\webapp\\241218\\boardUpload";  // 로컬 경로 지정

		
		
		MultipartRequest multi = new MultipartRequest(request,realFolder,fileSize,"UTF-8",new DefaultFileRenamePolicy());
		
		
		boardBean = new BoardBean();
		boardBean.setBo_name(multi.getParameter("bo_name"));
		boardBean.setBo_pass(multi.getParameter("bo_pass"));
		boardBean.setBo_subject(multi.getParameter("bo_subject"));
		boardBean.setBo_content(multi.getParameter("bo_content"));
		
		boardBean.setBo_file(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
		
		BoardWriteProService boardProService = new BoardWriteProService();
		boolean isWriteSuccess = boardProService.registArticle(boardBean);
		
		
		if(!isWriteSuccess) {
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			String msg = "<script>";
			msg += "alert('등록실패');";
			msg += "history.back();";
			msg += "</script>";
			out.println(msg);
	
			
		} else {
			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("/241218/board/boardList.bo");
			
		}
		
		return forward;
		
		
	}
	
	
	

}
