<%@page import="javax.swing.border.Border"%>
<%@page import="testserver.member.model.SyouhinDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function printName()  {
  var quantity = document.getElementById('quantity').value;
  var price = document.getElementById('price').value;
  document.getElementById("result").innerText = quantity*price;
}
</script>
<body>
<%
	String st = request.getParameter("syouhinmei");
	SyouhinDAO manager = SyouhinDAO.getInstance();
	SyouhinDAO board = manager.getsyouhin(st);
	System.out.println("here");
%>
	<div style="text-align : center;">
	<form action="kessai.jsp">
		<h3><%=st %></h3>
		<br><img src="cola.png" width="120" height="120"></img>
		<p>
			Price : <%=	board.gettn()%>
			<br>	
			Stock : <%= board.getts_count() %>
			<br><br>		
		</p>
		<label for="quantity">Quantity : </label>
		<input type="hidden" name="syouhinmei" id="syouhinmei" value="<%=st%>">
		<input type="hidden" name="price" id="price" value="<%=board.gettn()%>">
  		<input type="number" id="quantity" name="quantity" min="1" max="<%=board.getts_count()%>" onkeyup='printName()'>
  		<input type="submit" value="Submit">
  		<br>
  		<span>
  			Total Price : 
  			<label id="result"></label>
  		</span>
	</form>		
		
	</div>
</body>
</html>