<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




<style>

* {margin:0;padding:0}
ul {list-style:none;}
ul, li {margin:0;padding:0}


form {width:100%;max-width:768px;margin:0 auto;padding:40px;border:1px solid #ccc;border-radius:10px;}
form fieldset {border:none}
form legend {display:none;border:none}
form ul {display:flex;}
form ul li {padding:10px;}
form ul li:first-child {min-width:80px;font-weight:bold;}
form ul li input {border:1px solid #ccc;padding:5px;border-radius:5px;height:25px;vertical-align:middle;}

form ul li input[type=radio],
form ul li input[type=checkbox] {margin:0 5px}
form ul li input[type=button] {background:#000;color:#fff;margin:0 0 0 5px;height:37px;cursor:pointer}
form ul.tel li span {padding:0 5px;}

form .frm_btns {text-align:center;}
</style>

<form action="javascript:;" method="post">

<fieldset>

<legend>회원가입 폼</legend>


<ul>
    <li>아이디</li>
    <li><input type="text" autofocus><input type="button" value="아이디 중복 검사"></li>
</ul>


<ul>
    <li>비밀번호</li>
    <li><input type="password" name="" id=""></li>
</ul>


<ul>
    <li>이름</li>
    <li><input type="text"></li>
</ul>

<ul class="tel">
    <li>연락처</li>
    <li><input type="text"><span>-</span><input type="text"><span>-</span><input type="text"></li>
</ul>


<ul>
    <li>성별</li>
    <li><input type="radio" name="gender" value="M" id="genderM" checked><label for="genderM">남성</label><input type="radio" name="gender" value="F" id="genderF"><label for="genderF">여성</label></li>
</ul>

<ul>
    <li>취미</li>
    <li><label for="hobby1">독서</label> <input type="checkbox" name="hobby[]" value="독서" id="hobby1"> 
        <label for="hobby2">운동</label> <input type="checkbox" name="hobby[]" value="운동" id="hobby2"> 
        <label for="hobby3">영화</label> <input type="checkbox" name="hobby[]" value="영화" id="hobby3"> </li>
</ul>


<div class="frm_btns">
    <input type="submit" value="가입하기 ">
    <input type="reset" value="다시 쓰기">
</div>


</fieldset>

</form>




</body>
</html>