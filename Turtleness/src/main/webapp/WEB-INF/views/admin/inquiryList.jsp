<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function currpage(m) {
	$.ajax({
		type : "Post",
		url : "TAList",
		data:{
			currPage : m
		},
		success : function(result) {
				$("#inquiry").html(result);
		}// success
	});
}
function inquiryDetail(n) {
	$.ajax({
		type : "Post",
		url : "IDetail",
		data:{
			seq : n
		},
		success : function(result) {
				$("#inquiry").html(result);
		}// success 
	});
}
</script>
<body>
<table width=600 style="margin-top:20px;">
		<tr align="center" style="font-weight:bold;">
			<td>번호</td><td>작성자</td><td>제목</td><td>작성일</td>
		</tr>
		<tr height="20"></tr>
		<c:forEach var="ti" items="${Tinquiry}">
			<tr>
				<c:if test="${ti.indent>0}">
					<td align="center"></td>
					<td align="center"></td>
					<td><a href="#" onclick="inquiryDetail(${ti.seq})" style="text-decoration:none;color:black;">
					<c:if test="${ti.indent>0}">
						<c:forEach begin="1" end="${ti.indent}">
						<span>&nbsp;&nbsp;</span>
						</c:forEach>
						<span style="color:red">└</span>
					</c:if>
					<span style="font-size:13px;font-weight:bold;">${ti.title}</span></a></td>
					<td align="center">${ti.regdate}</td>
				</c:if>
				<c:if test="${ti.indent==0}">
					<td align="center">${ti.seq}</td>
					<td align="center">${ti.wid}</td>
					<td><a href="#" onclick="inquiryDetail(${ti.seq})" style="text-decoration:none;color:black;">
					${ti.title}</a></td>
					<td align="center">${ti.regdate}</td>
				</c:if>	
			</tr>
		</c:forEach>
		</table>	
		
		<table style="position:absolute;top: 610px;left: 750px;">
		<tr>
			<td colspan=5 align="center" height="100px">
				<c:forEach var="i" begin="1" end="${totalPage}">
					<c:choose>
						<c:when test="${i==currPage}">
							<font size=4 color=black>${i}</font>&nbsp;
						</c:when>
						<c:otherwise>
							<%-- <a href="inquiry?currPage=${i}" style="text-decoration:none; color:gray;">${i}</a>&nbsp; --%>
							<a href="#" onclick="currpage(${i})" style="text-decoration:none; color:gray;">${i}</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</td>
		</tr>
	</table>
</body>
</html>