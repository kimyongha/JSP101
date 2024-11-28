<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>





<form name="loginForm" action="validation04_process.jsp" method="post" >


<p>아이디 : <input type="text" name="user_id" /></p>

<p>비밀번호 : <input type="password" name="user_passwd"/></p>


<p><input type="button" value="전송하기" onclick="checkLogin()"/></p>

</form>



<script>

function checkLogin(){
	
	let form = document.loginForm;
	
	
	for(let i=0;i<form.user_id.value.length;i++){
		
		let ch = form.user_id.value.charAt(i);
		
		
		if( (ch < 'a' || ch > 'z') && (ch > 'A' || ch < 'Z') && (ch > '0' || ch < '9') ){
			
			alert("아이디는 영문 소문자만 입력 가능");
			
			form.user_id.select();
			
			return;
			
			
		}
		
		
		
	}
	
	
	if(isNaN(form.user_passwd.value)){
		
		alert("아이디는 숫자만 입력 가능");
		form.user_passwd.select();
		return;
		
		
		
	}
	
	
	form.submit();
	
	
}




</script>







</body>
</html>