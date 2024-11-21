<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>

	<div class="container py-4">


	<%@ include file="inc/header.jsp" %>


	<%!

String greeting = "도서 쇼핑몰에 오신 것을 환영합니다";
String tagline = "Welcome to Web Market!";

%>


	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold"><%=greeting%></h1>
			<p class="col-md-8 fs-4">BookMarket</p>
		</div>
	</div>


	<div class="row align-items-md-stretch text-center">
		<div class="col-md-12">
			<div class="h-100 p-5">
				<h3><%=tagline%></h3>
				
				
				<%
				
				Date day = new Date();
				String am_pm;
				
				int hour = day.getHours();
				int minute = day.getMinutes();
				int second = day.getSeconds();
				
				if(hour / 12 == 0){
					
					am_pm = "AM";
					
				} else {
					
					am_pm = "PM";
					hour -= 12;
					
				}
						
				
				String crntTime = hour + ":" + minute + ":" + second + " " + am_pm;
				
				out.println("현재 접속 시간 " + crntTime);
				
				
				%>
				
				
				
				
			</div>
		</div>
	</div>


	<%@ include file="inc/footer.jsp" %>

	</div>
	<!-- //container -->
</body>
</html>