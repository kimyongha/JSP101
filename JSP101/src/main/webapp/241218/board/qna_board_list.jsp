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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
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


<colgroup>
<col style="width:10%"/>
<col style="width:*"/>
<col style="width:10%"/>
<col style="width:10%"/>
<col style="width:15%"/>


</colgroup>

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
		
		<td class="sbjct">
		<% if(articleList.get(i).getBo_re_lev() != 0) { %>
		
		
			<% for(int a=0; a<=articleList.get(i).getBo_re_lev() *2; a++) { %>
			
				&nbsp;
				
			<% } // endfor; %>
			
			 ▶
			
		<% } else { %>
		
			 ▶
		
		<% } // endif; %>
		
		
		<a href="boardDetail.bo?bo_num=<%=articleList.get(i).getBo_num()%>&page=<%=nowPage%>"><%= articleList.get(i).getBo_subject() %></a>
	
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



<ul class="list_btns">

<li><a href="boardWriteForm.bo">등록</a></li>
</ul>





<%

String url = "boardList.bo";
String firstLink = url + "?page=1";
String prevLink = (nowPage > 1) ? url + "?page=" + (nowPage - 1) : "";
String nextLink = (nowPage < endPage) ? url + "?page=" + (nowPage + 1) : "";
String endLink = url + "?page=" + endPage;


%>

<nav aria-label="Page navigation example" class="board_pagination">
	<ul class="pagination">
	
	
		<li class="page-item">
		<a class="page-link" href="<%= firstLink %>"
			aria-label="fisrt"> 
			<span aria-hidden="true">&laquo;</span>
		</a>
		</li>
		
		
		<li class="page-item"><a class="page-link" href="<%= prevLink %>"
			aria-label="Previous"> <span aria-hidden="true">&lsaquo;</span>
		</a></li>
	
	<% for(int i=startPage; i<=endPage; i++) { %>

		<li class="page-item <% if(i == nowPage) { %>on<%} %>"><a href="boardList.bo?page=<%= i%>" class="page-link"><%= i %></a></li>
		
	<% } %>
	
		
		
		
		<li class="page-item"><a class="page-link" href="<%= nextLink %>"
			aria-label="Next"> <span aria-hidden="true">&rsaquo;</span>
		</a></li>

		<li class="page-item"><a class="page-link" href="<%= endLink %>"
			aria-label="end"> <span aria-hidden="true">&raquo;</span>
		</a></li>

	</ul>
</nav>




</section>





</div>


</div>














</body>
</html>