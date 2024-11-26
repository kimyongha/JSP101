<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script src="resource/js/validation.js"></script>
</head>
<body>



<fmt:setLocale value="<%=request.getParameter(\"lang\") %>" />

<fmt:bundle basename="bundle.message">



<div class="container py-4">
<%@ include file="inc/header.jsp" %>



<div class="p-5 mb-4 bg-body-teritiary rounded-3">

<div class="container-fluid py-5">

<h1 class="display-5 fw-bold"><fmt:message key="title" /></h1>

<p class="col-md-8 fs-4">Book Addition</p>

</div>


</div>






		<div class="row align-items md-stretch">
		
		
		<div class="text-end">
		
		<a href="?lang=ko">Korean</a> | <a href="?lang=en">English</a> 
		
		<a href="logout.jsp" class="btn btn-sm btn-success pull right">Logout</a>
		
		</div>
		
		
		

			<form action="./processAddBook.jsp" method="post" name="newBook" class="form-horizontal" enctype="multipart/form-data" >
			


				<div class="mb-3 row">
					<label for="" class="col-sm-2"><fmt:message key="bookId"/> </label>
					<div class="col-sm-3">
						<input type="text" id="bookId" name="bookId" class="form-control">
					</div>
				</div>



				<div class="mb-3 row">
					<label for="" class="col-sm-2"><fmt:message key="name"/></label>
					<div class="col-sm-3">
						<input type="text" id="name" name="name" class="form-control">
					</div>
				</div>


				<div class="mb-3 row">
					<label for="" class="col-sm-2"><fmt:message key="unitPrice"/></label>
					<div class="col-sm-3">
						<input type="text" id="unitPrice" name="unitPrice" class="form-control">
					</div>
				</div>

				<div class="mb-3 row">
					<label for="" class="col-sm-2"><fmt:message key="author"/></label>
					<div class="col-sm-3">
						<input type="text" name="author" class="form-control">
					</div>
				</div>


				<div class="mb-3 row">
					<label for="" class="col-sm-2"><fmt:message key="publisher"/></label>
					<div class="col-sm-3">
						<input type="text" name="publisher" class="form-control">
					</div>
				</div>


				<div class="mb-3 row">
					<label for="" class="col-sm-2"><fmt:message key="releaseDate"/></label>
					<div class="col-sm-3">
						<input type="text" name="releaseDate" class="form-control">
					</div>
				</div>



				<div class="mb-3 row">
					<label for="" class="col-sm-2"><fmt:message key="description"/></label>
					<div class="col-sm-3">
						<textarea name="description" id="description" cols="50" rows="2"  class="form-control" placeholder="100자 이상 작성"></textarea>
					</div>
				</div>
				
				
				
				<div class="mb-3 row">
					<label for="" class="col-sm-2"><fmt:message key="category"/></label>
					<div class="col-sm-3">
						<input type="text" name="category" class="form-control">
					</div>
				</div>

				
								
				<div class="mb-3 row">
					<label for="" class="col-sm-2"><fmt:message key="unitsInStock"/></label>
					<div class="col-sm-3">
						<input type="text" id="unitsInStock" name="unitsInStock" class="form-control">
					</div>
				</div>
				
				
				
				<div class="mb-3 row">
					<label for="" class="col-sm-2"><fmt:message key="condition"/></label>
					<div class="col-sm-5">
						<input type="radio" name="condition" value="New"/> <fmt:message key="condition_New"/>
						<input type="radio" name="condition" value="Old"/> <fmt:message key="condition_Old"/>
						<input type="radio" name="condition" value="Ebook"/> <fmt:message key="condition_Ebook"/>
					</div>
				</div>
				
								
								
				<div class="mb-3 row">
					<label for="" class="col-sm-2"><fmt:message key="bookImage"/></label>
					<div class="col-sm-5">
						<input type="file" name="bookImage" class="form-control">
					</div>
				</div>
				

				
				<div class="mb-3 row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="button"  class="btn btn-primary" value="<fmt:message key="button"/>"  onclick="checkAddBook()">
					</div>
				</div>
				
								
				
				
				
				
				
				
				
				
				
				
				


			</form>



		</div>











		<%@ include file="inc/footer.jsp" %>
</div>

</fmt:bundle>







</body>
</html>