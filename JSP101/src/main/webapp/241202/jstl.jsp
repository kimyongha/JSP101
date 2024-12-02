<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Standard Tag Library</title>
</head>
<body>

	<table>
		<c:forEach var="i" begin="2" end="9">
			<tr>

				<c:forEach var="j" begin="1" end="9">
					<td width=100>${i}x ${j} = ${i * j}</td>
				</c:forEach>

			</tr>

		</c:forEach>

	</table>

</body>
</html>