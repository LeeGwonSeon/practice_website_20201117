<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="testserver.member.model.SyouhinDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
        String quantity= request.getParameter("quantity");
        String syouhinmei = request.getParameter("syouhinmei");
        
        System.out.println(quantity);
        System.out.println(syouhinmei);
        
        SyouhinDAO dao = SyouhinDAO.getInstance();
        int result = dao.updateSyouhin(Integer.parseInt(quantity), syouhinmei);
        
        if(result != 0){
        	response.sendRedirect("syouhin.jsp");	
        }else{
        	out.println("<script>alert('Fail Update')</script>");
        	response.sendRedirect("syouhin.jsp");
        }
        
 %>
 	<div style="text-align : center;">
 		<h4>Success!</h4>
 		<h2>Thank you !</h2>
 	</div>
</body>
</html>