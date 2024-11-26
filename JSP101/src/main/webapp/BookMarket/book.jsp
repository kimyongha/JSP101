<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="dto.Book" %>
<%@ page import ="dao.BookRepository" %>

<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session"/>

    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보</title>

<link rel="stylesheet" href="resource/css/bootstrap.min.css" />

</head>
<body>


<div class="container py-4">


<%@ include file="inc/header.jsp" %>



<div class="p-5 mb-4 bg-body-tertriary rounded-3">

<div class="container-fluid py-5">

<h1 class="display-5 fw-bold">도서정보</h1>

<div class="col-md-8 fs-4">BookInfo</div>


</div>

</div>


<%


String id = request.getParameter("id");

BookRepository dao = BookRepository.getInstance();

Book book = dao.getBookById(id);


%>



<div class="row align-items-md-strectch">


	<div class="col-md-5">
	<img src="resource/images/<%=book.getFilename() %>" alt="" />
	</div>
	
	<div class="col-md-6">
	
		<h3><b><%=book.getName() %></b></h3>

				
		<p><%=book.getDescription() %></p>
		<p><b>도서 코드 </b> : <span class="badge text-bg-danger"><%=book.getBookId() %></span></p>
		<p><b>저자 </b> : <%=book.getAuthor() %></p>
		<p><b>출판사 </b> : <%=book.getPublisher() %></p>
		<p><b>출판일 </b> : <%=book.getReleaseDate() %></p>
		<p><b>분류 </b> : <%=book.getCategory() %></p>
		<p><b>재고수 </b> : <%=book.getUnitsInStock() %></p>
	
	</div>


</div>












<%@ include file="inc/footer.jsp" %>



</div>







</body>
</html>