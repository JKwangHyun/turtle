<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

</head>
<body>
	<c:if test="${idcheck.id != null}">
		<script>setTimeout("location.href='tHome'",1000*0.1);</script>
	</c:if>
	<c:if test="${idcheck.id == 'admin'}">
		<script>setTimeout("location.href='admin'",1000*0.1);</script>
	</c:if>
	<c:if test="${idcheck.id == null}">
		<span style="color:red;font-weight:normal;font-size:12px;">
			아이디 또는 비밀번호를 다시 확인하세요.<br>
			네이버에 등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.
		</span>
	</c:if>
</body>
</html>