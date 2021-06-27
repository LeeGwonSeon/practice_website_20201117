<%@page import="testserver.member.model.SyouhinDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<%
	int pageSize = 6; 

	String pageNum = request.getParameter("pageNum");
	if (pageNum == null){ 
		pageNum = "1";
	}

	int currentPage = Integer.parseInt(pageNum);


	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;

	int count = 0;
	SyouhinDAO manager = SyouhinDAO.getInstance();
	count = manager.getCount(); 
	System.out.println("here");
	List<SyouhinDAO> list = null;
	if (count > 0) {
		list = manager.getlist(startRow, endRow);
	}
%>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
        
        function logoutPro(){
        	console.log("logout")
            location.href="logout.jsp";
        }
    </script>
</head>
<body>	
	<div style="text-align : center;">
		<h3>Product Main</h3>
		<table style="text-align : center; margin-left: auto; margin-right: auto;" border="1" width="900">
			<tr>
				<td width="10%">Num</td>
				<td width="15%">Product</td>
				<td width="30%">Image</td>
				<td width="20%">Price</td>
				<td width="10%">Stock</td>
			</tr>
			<%
				if (count > 0) { /
					int number = count - (currentPage - 1) * pageSize;
					for (int i = 0; i < list.size(); i++) {
						SyouhinDAO board = list.get(i);
			%>
			<tr>
				<td><%=i+1%></td>
				<td><%=board.getts()%></td>
				<td>
					<a href="#" onClick="location.href='syouhin_info.jsp?syouhinmei=<%=board.getts()%>'"><img src="cola.png" width="90" height="90"></img></a>
				</td>
				<td><%=board.gettn() %></td>
				<td><%=board.getts_count() %></td>
			</tr>
			<%
					}
				} else { 
			%>
			<tr>
				<td colspan="6" align="center">게시글이 없습니다.</td>
			</tr>
				<%
					}
				%>
			<tr>
				<td colspan="6" align="right">
					<input type="button" value="update"	onclick="location.href='writeForm.jsp'">
				</td>
			</tr>
			<tr>
				<td colspan="6" align="center">
					<%	
						if(count > 0){
							int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
							int pageBlock = 6;
							int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
							int endPage = startPage + pageBlock - 1;
							
							if(endPage > pageCount){
								endPage = pageCount;
							}
							
							if(startPage > pageBlock){ 
					%>
								<a href="list.jsp?pageNum=<%=startPage - 6%>">[이전]</a>	
					<%			
							}
							
							for(int i=startPage; i <= endPage; i++){ 
								if(i == currentPage){ 
					%>
									[<%=i %>]
					<%									
								}else{ 
					%>
									<a href="list.jsp?pageNum=<%=i%>">[<%=i %>]</a>
					<%	
								}
							} 
							
							if(endPage < pageCount){ 
					%>
								<a href="list.jsp?pageNum=<%=startPage + 6 %>">[다음]</a>
					<%			
							}
						}
					%>
				</td>
			</tr>
		</table>
	</div>
    <input type="button" value="logout" onclick="logoutPro()" />
</body>
</html>