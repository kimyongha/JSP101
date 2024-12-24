<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC MODEL2</title>
<link rel="stylesheet" href="../css/common.css" />
</head>
<body>



<%


Enumeration e = session.getAttributeNames();

while (e.hasMoreElements()) {
	
    String name = (String) e.nextElement();
    Object value = session.getAttribute(name); 
    
    // value가 Integer인 경우, int로 변환
    if (value instanceof Integer) {
    	
        int intValue = (Integer) value;  // Integer -> int로 언박싱
        out.println(name + " : " + intValue);
        
    } else {
    	
        out.println(name + " : " + value);  
        
    }
    
    out.println("<br>");
}



String mb_name = (String) session.getAttribute("mb_name");

%>


<div id="wrap">



<div class="inner_wrap">



	<form action="/241218/board/boardWritePro.bo" method="post" enctype="multipart/form-data" name="boardform">
		
	
	<fieldset>
		<legend>게시판 등록 폼</legend>
	
	
		<ul>
			<li>제목</li>
			<li><input type="text" name="bo_subject" id="" /> </li>
		</ul>
	
		<ul>
			<li>작성자</li>
			<li><input type="text" name="bo_name" id="" value="<% if(mb_name != null) out.println(mb_name); %>"/> </li>
		</ul>
	
		<ul>
			<li>내용</li>
			<li><textarea name="bo_content" id="" cols="30" rows="10"></textarea> </li>
		</ul>
	
	
		<ul class="attach">
			<li>첨부파일</li>
			<li><input type="file" name="bo_file" id="" /> </li>
		</ul>
	
		<ul>
			<li>비밀번호</li>
			<li><input type="password" name="bo_pass" id="" /> </li>
		</ul>
	
	
	
	
	</fieldset>
	
	
	<ul class="form_btns">
	
	<li><input type="submit" value="등록" /></li>
	<li><input type="reset" value="취소" onclick="javascript:history.go(-1);"/></li>
	
	</ul>
		
		
	
	</form>




</div>


</div>






</body>
</html>