<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>java.util.Locale 클래스</title>
</head>
<body>
<%

Locale locale = request.getLocale();

String getCountry = locale.getCountry();
String getISO3Country = locale.getISO3Country();
String getDisplayCountry = locale.getDisplayCountry();

String getLanguage = locale.getLanguage();
String getISO3Language = locale.getISO3Language();
String getDisplayLanguage = locale.getDisplayLanguage(); 

%>

<p>getCountry : <%= getCountry %></p>
<p>getISO3Country : <%=getISO3Country %></p>
<p>getDisplayCountry : <%= getDisplayCountry %></p>

<p>getLanguage : <%= getLanguage %></p>
<p>getISO3Language : <%=getISO3Language %></p>
<p>getDisplayLanguage : <%= getDisplayLanguage %></p>

</body>
</html>
