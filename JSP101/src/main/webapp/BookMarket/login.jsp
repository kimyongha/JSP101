<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="resource/css/bootstrap.min.css" />
<script src="resource/js/bootstrap.min.js"></script>
</head>
<body>


	<div class="container py-4">


		<%@ include file="inc/header.jsp"%>



		<div class="p-5 mb-4 bg-body-tertiary rounded-3">

			<div class="container-fluid py-5">

				<h1 class="display-5 fw-bold">로그인</h1>

				<p class="col-md-8 fs-4">Login</p>

			</div>

		</div>
		<!-- //sub visual -->



		<div class="row align-items-md-strectch text-center">

			<div class="row justify-content-center align-items-center">

				<div class="h-100 p-5 col-md-6">
					<h3>Please Sign In</h3>



					<%
					String error = request.getParameter("error");
					if (error != null) {

						out.println("<div class='alert alert-danger'>");
						out.println("아이디와 비밀번호를 확인해 주세요");
						out.println("</div>");

					}
					%>


					<form action="j_security_check" method="post" class="form-signin">

						<div class="form-floating mb-3 row">
							<input type="text" name="j_username" required autofocus class="form-control"/> <label
								for="floatingInput">ID</label>
						</div>


						<div class="form-floating mb-3 row">

							<input type="password" name="j_password" id=""  class="form-control"/> <label
								for="floatingInput">Password</label>
						</div>


						<button class="btn btn-lg btn-success" type="submit">로그인</button>


					</form>



				</div>
			</div>
		</div>


		<%@ include file="inc/footer.jsp"%>

	</div>
	<!-- //container -->



</body>
</html>