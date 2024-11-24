<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Book" %>
    
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session"/>

    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>



<div class="container py-4">

<%@ include file="inc/header.jsp" %>


<div class="p-5 mb-4 bg-body-tertiary rounded-3">

<div class="container-fluid py-5">


<h1 class="display-5 fw-bold">도서목록</h1>

<div class="col-md-8 fs-4">BookList</div>


</div>


</div>




<%

ArrayList<Book> listOfBooks = bookDAO.getAllBooks();

%>



<div class="row align-items md-stretch text-center">


<%

for(int i=0;i<listOfBooks.size();i++){
	
	Book book = listOfBooks.get(i);
			
	
%>
	
	<div class="col-md-4">
	
		<div class="h-100 p-2">
		
		<h5><b><%=book.getName() %></b></h5>
		<p><%=book.getAuthor() %> <br />
		
		<%=book.getPublisher() %> | <%=book.getReleaseDate() %></p>
		
		
		
		<p><%=book.getDescription().substring(0,60) %>...</p>
		<p><%=book.getUnitPrice() %>원</p>
		
		<p><a href="./book.jsp?id=<%= book.getBookId()%>" class="btn btn-secondary" role="button">상세보기</a></p>
		
		
		</div>
	
	
	
	
	
	</div>
	
	
	




	
<%

}

%>




</div>









<%@ include file="inc/footer.jsp" %>
	
	
	
</div>

</body>
</html>