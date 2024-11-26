<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>




<div class="container py-4">
<%@ include file="inc/header.jsp" %>



<div class="p-5 mb-4 bg-body-teritiary rounded-3">

<div class="container-fluid py-5">

<h1 class="display-5 fw-bold">도서 등록</h1>

<p class="col-md-8 fs-4">Book Addition</p>

</div>



</div>






		<div class="row align-items md-stretch">

			<form action="./processAddBook.jsp" method="post" name="newBook">


				<div class="mb-3 row">
					<label for="" class="col-sm-2">도서코드</label>
					<div class="col-sm-3">
						<input type="text" name="bookId" class="form-control">
					</div>
				</div>



				<div class="mb-3 row">
					<label for="" class="col-sm-2">도서명</label>
					<div class="col-sm-3">
						<input type="text" name="name" class="form-control">
					</div>
				</div>


				<div class="mb-3 row">
					<label for="" class="col-sm-2">가격</label>
					<div class="col-sm-3">
						<input type="text" name="unitPrice" class="form-control">
					</div>
				</div>

				<div class="mb-3 row">
					<label for="" class="col-sm-2">저자</label>
					<div class="col-sm-3">
						<input type="text" name="author" class="form-control">
					</div>
				</div>


				<div class="mb-3 row">
					<label for="" class="col-sm-2">출판사</label>
					<div class="col-sm-3">
						<input type="text" name="publisher" class="form-control">
					</div>
				</div>


				<div class="mb-3 row">
					<label for="" class="col-sm-2">출판일</label>
					<div class="col-sm-3">
						<input type="text" name="releaseDate" class="form-control">
					</div>
				</div>



				<div class="mb-3 row">
					<label for="" class="col-sm-2">상세정보</label>
					<div class="col-sm-3">
						<textarea name="description" id="" cols="50" rows="2"  class="form-control" placeholder="100자 이상 작성"></textarea>
					</div>
				</div>
				
				
				
				<div class="mb-3 row">
					<label for="" class="col-sm-2">분류</label>
					<div class="col-sm-3">
						<input type="text" name="category" class="form-control">
					</div>
				</div>

				
								
				<div class="mb-3 row">
					<label for="" class="col-sm-2">재고수</label>
					<div class="col-sm-3">
						<input type="text" name="unitsInStock" class="form-control">
					</div>
				</div>
				
				
				
				<div class="mb-3 row">
					<label for="" class="col-sm-2">상태</label>
					<div class="col-sm-5">
						<input type="radio" name="condition" value="New"/>신규도서
						<input type="radio" name="condition" value="Old"/>중고도서
						<input type="radio" name="condition" value="Ebook"/>E-Book
					</div>
				</div>
				
				
				
				
				<div class="mb-3 row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit"  class="btn btn-primary" value="등록">
					</div>
				</div>
				
								
				
				
				
				
				
				
				
				
				
				
				


			</form>



		</div>











		<%@ include file="inc/footer.jsp" %>
</div>









</body>
</html>