<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>HashMap 게시판</h1>
<form action="SearchList">
	<select name="st">
		<option value="na">이름</option>
		<option value="ti">제목</option>
		<option value="co">내용</option>
	</select>
	<input type="text" id="keyword" name="keyword">
	<input type="submit" value="검색">
</form>
<table width=600 style="margin-top:20px;margin-left: 30px;">
		<tr align="center" style="font-weight:bold;">
			<td>번호</td><td>작성자</td><td>제목</td><td>작성일</td>
		</tr>
		<tr height="20"></tr>
		<c:forEach var="ti" items="${Tinquiry}">
			<tr>
				<c:if test="${ti.INDENT>0}">
					<td align="center"></td>
					<td align="center"></td>
					<td><a href="#" onclick="inquiryDetail(${ti.SEQ})" style="text-decoration:none;color:black;">
					<c:if test="${ti.INDENT>0}">
						<c:forEach begin="1" end="${ti.INDENT}">
						<span>&nbsp;&nbsp;</span>
						</c:forEach>
						<span style="color:red">└</span>
					</c:if>
					<span style="font-size:13px;font-weight:bold;">${ti.TITLE}</span></a></td>
					<td align="center">${ti.REGDATE}</td>
				</c:if>
				<c:if test="${ti.INDENT==0}">
					<td align="center">${ti.SEQ}</td>
					<td align="center">${ti.WID}</td>
					<td><a href="#" onclick="inquiryDetail(${ti.SEQ})" style="text-decoration:none;color:black;">
					${ti.TITLE}</a></td>
					<td align="center">${ti.REGDATE}</td>
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