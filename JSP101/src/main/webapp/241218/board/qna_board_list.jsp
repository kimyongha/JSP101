<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="vo.PageInfo" %>
<%@ page import="vo.BoardBean" %>
<%@ page import="dao.BoardDAO" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/common.css" />
</head>
<body>



<%

ArrayList<BoardBean> articleList = (ArrayList<BoardBean>) request.getAttribute("articleList");
PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");

int listCount = pageInfo.getListCount();
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();

%>



<div id="wrap">

<div class="inner_wrap">




<section id="board" class="list">


<table>

<tr>
<th>번호</th>
<th>제목</th>
<th>작성자</th>
<th>조회수</th>
<th>등록일</th>
</tr>

<% if(articleList != null && listCount > 0 ) { %>




	<% for(int i=0;i<articleList.size(); i++) { %>
	
	<tr>
	
		<td><%= articleList.get(i).getBo_num() %></td>
		
		<td>
		<% if(articleList.get(i).getBo_re_lev() != 0) { %>
		
		
			<% for(int a=0; a<=articleList.get(i).getBo_re_lev() *2; a++) { %>
			
				&nbsp;
				
			<% } // endfor; %>
			
			 ▶
			
		<% } else { %>
		
			 ▶
		
		<% } // endif; %>
		
		
		<a href="boardDetail.bo?board_num=<%=articleList.get(i).getBo_num()%>&page=<%=nowPage%>"><%= articleList.get(i).getBo_subject() %></a>
	
		</td>
		
		<td><%= articleList.get(i).getBo_name()%></td>
		<td><%= articleList.get(i).getBo_readcount()%></td>
		<td><%= articleList.get(i).getBo_date()%></td>
		
	
	</tr>
	
	<% } //endfor;  %>
	


<% } else { %>

<tr>
	<td colspan="5" class="no-data">등록된 게시글이 없습니다.</td>
</tr>

<% } //endif;  %>





</table>



<div class="pagination">

<ul>

	<% if(nowPage <= 1) { %>
	
	<li><a href="javascipt:;">[이전]</a></li>
	
	<% } %>
	
	<% if(nowPage >= 2) { %>
	
	<li><a href="boardList.bo?page=<%= nowPage - 1%>">[이전]</a></li>
	
	<% } %>
	
	<% for(int a=startPage; a<=startPage; a++) { %>
	
		<% if(a == nowPage) { %>
		
		<li><a href="javascript:;">[<%=a %>]</a></li>
		
		<% } else { %>
		
		<li><a href="boardList.bo?page=<%=a%>">[<%=a %>]</a></li>
		
		<% } %>
	
	<% } %>
	
	
	<% if(nowPage >= maxPage) { %>
	
		<li><a href="javascript:;">[다음]</a></li>
		
	<% } else { %>
	
		<li><a href="boardList.bo?page=<%= nowPage+1 %>">[다음]</a></li>
	
	<% } %>
</ul>


</div>





</section>





</div>


</div>














</body>
</html>