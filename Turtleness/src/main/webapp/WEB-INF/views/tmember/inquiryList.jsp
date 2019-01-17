<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script>
function currpage(m) {
	$.ajax({
		type : "Post",
		url : "inquiry",
		data:{
			currPage : m
		},
		success : function(result) {
				$(".div_wrap1").html(result);
		}// success
	});
}
function inqueryGo() {
	$.ajax({
		type : "Post",
		url : "inquiryGo",
		data:{
		},
		success : function(result) {
				$(".div_wrap1").html(result);
		}// success
	});
}
function inquiryDetail(n,m) {
	$.ajax({
		type : "Post",
		url : "inquiryDetail",
		data:{
			seq : n,
			indent : m
		},
		success : function(result) {
				$(".div_wrap1").html(result);
		}// success 
	});
}
</script>
<body>
		<form>
		<div id="aaa" style="margin-left: 70px;margin-top: 30px;">
		<div style="position:relative;top:-60px;left:590px;"><input type="button" value="문의하기" onclick="inqueryGo()" style="color:white;background-color:black;border-radius:20px;border:0;"></div>
		<h5 style="margin-top:-60px;">문의 내역</h5>
			<table width=700 style="margin-top:-10px;">
				<tr align="center" height="20" style="color:black;font-size:10px;border:1px solid black;border-top:1px solid black; border-bottom:1px solid black;">
					<td width=50>번호</td><td width=500>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제목</td><td>작성날짜</td><td width=10></td>
				</tr>	
				<c:forEach var="ti" items="${inquiry}">
					<tr height="20">
						<c:if test="${ti.indent>0}">
							<td align="center"></td>
							<td><a href="#" onclick="inquiryDetail(${ti.seq},${ti.indent})" style="text-decoration:none;color:black;">
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
							<td><a href="#" onclick="inquiryDetail(${ti.seq},${ti.indent})" style="text-decoration:none;color:black;">
							${ti.title}</a></td>
							<td align="center">${ti.regdate}</td>
						</c:if>	
					</tr>
				</c:forEach>
			</table>
		<table style="position:absolute;top:280px;left: 390px;">
				<!-- Paging Code 추가 -->
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
			</div>
		</form>
</body>
</html>