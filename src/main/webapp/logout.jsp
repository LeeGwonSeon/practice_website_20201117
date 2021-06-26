<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		HttpSession userSession = request.getSession();
		userSession.invalidate(); 
        response.sendRedirect("index.jsp"); 
    %>
</body>
</html>