<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%

String msg = (String) request.getAttribute("message");
out.println(msg);

%>