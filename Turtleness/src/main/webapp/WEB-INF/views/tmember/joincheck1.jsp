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
			<c:if test="${idresult==1}">
				<script>
					opener.document.getElementById('id').value="";
				</script>
				이미 사용중이거나 탈퇴한 아이디입니다.
			</c:if>
			<c:if test="${idresult==0}">
				<font color="green">사용 가능한 아이디입니다.</font>
			</c:if>	
</body>
</html>