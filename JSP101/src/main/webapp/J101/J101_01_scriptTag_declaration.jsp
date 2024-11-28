<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 태그</title>
</head>
<body>

<%!

int a = 10;
int b = 20;
int c = 0;

public int sum(int a, int b){
		
	return a + b;
	
}


%>



<%

int result = sum(a, b);
out.println("sum 메소드 실행 결과 : " + result);

%>

<p>두 수의 합 : <%= a+b %></p>

<p>새로고침 횟수 : <%= c++ %></p>



</body>
</html>