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
				$("#member").html(result);
		}// success
	});
}
function memberDel(s) {
	$.ajax({
		type : "Post",
		url : "TDelte",
		data:{
			id : s
		},
		success : function(result) {
				$("#member").html(result);
		}// success
	});
}
</script>
<body>
<table width=600 style="margin-top:20px;">
		<tr style="font-weight:bold;">
			<td>아이디</td><td>이름</td><td>비밀번호</td><td>생년월일</td><td>성별</td>
		</tr>
		<tr height="20"></tr>
		<c:forEach var="tm" items="${Tmember}">
			<tr>
				<td style="width: 150px;">${tm.id}</td>
				<td>${tm.name}</td>
				<td>${tm.password}</td>
				<td>${tm.birthd}</td>
				<td>
					<c:choose>
						<c:when test="${tm.gender=='M'}">남자</c:when>
						<c:when test="${tm.gender=='W'}">여자</c:when>
					</c:choose>
				</td>
				<td style="width:45px;">
					<button onclick="memberDel('${tm.id}')" style="background-color:black;color:white;border:0;border-radius:10px;">삭제</button>
				</td>
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