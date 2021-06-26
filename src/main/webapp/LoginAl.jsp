<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="testserver.member.model.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
  <%
        request.setCharacterEncoding("euc-kr"); 
        
        String id= request.getParameter("id");
        String pw = request.getParameter("password");   
        
        MemberDAO dao = MemberDAO.getInstance();
        int result = dao.loginCheck(id, pw);
        
        System.out.println("result : " + result);
        
        String msg = "";
        
        if(result == 1) // 맞을경우
        {
        	out.println("<script>alert('Login success')</script>");
        	session.setAttribute("sessionID", id);
            msg = "syouhin.jsp";
        }
        else    // 아이디가 틀릴경우
        {
            msg = "index.jsp?msg=0";
        }
        
        response.sendRedirect(msg);
 %>
</body>
</html>