<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <style>
 header {border-bottom:1px solid #ccc}
 header nav ul {display:flex}
 header nav ul li {}
 </style>
<header>

<%!

int pageCount = 0;

void addCount(){
	
	pageCount++;
	
}

%>
<%

addCount();


%>

	<nav>
		<ul>
			<li><a href="javascript:;">메뉴1</a></li>
			<li><a href="javascript:;">메뉴2</a></li>
			<li><a href="javascript:;">메뉴3</a></li>
			<li><a href="javascript:;">메뉴4</a></li>
			<li><a href="javascript:;">메뉴5</a></li>
		</ul>
	</nav>
	
	<p><%=pageCount %>번 째 방문입니다.</p>
	<p><p><%= new java.util.Date() %></p></p>
</header>

<%//= java.util.Calendar.getInstance().getTime() %>