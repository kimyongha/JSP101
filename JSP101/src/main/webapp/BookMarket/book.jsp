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

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

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

	<div class="col-md-12">
	
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