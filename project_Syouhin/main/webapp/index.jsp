<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
        <form name="loginInfo" method="post" action="LoginAl.jsp" onsubmit="return checkValue()">
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type="text" name="id" maxlength="50"></td>
                </tr>
                <tr>
                    <td>password</td>
                    <td><input type="password" name="password" maxlength="50"></td>
                </tr>
            </table>
            <br>
            <input type="submit" value="Login"/>
            <%--<input type="button" value="회원가입" onclick="goJoinForm()" /> --%>
        </form>
        <% 
            String msg=request.getParameter("msg");
            //String msg=request.getParameter("Loginresult");
            //out.println("result : " + msg);
            if(msg!=null && msg.equals("1")) 
            {
                out.println("<script>alert('Login success')</script>");
                //out.println("<font color='red' size='5'>ID Error</font>");
            }
            else if(msg!=null && msg.equals("0"))
            {    
            	out.println("<script>alert('Login Fail')</script>");
                //out.println("<font color='red' size='5'>Password Error</font>");
                //String lik = "index.jsp";
            }
        %>   
    </div>
</body>
</html>