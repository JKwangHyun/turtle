<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>turtle member join</title>
</head>
<style>
	body {
		margin:0 auto;
		width:500px;
		background-color:#f2f2f2;
	}
	td {
		font-weight: bold;
	}
	.bar{
	display: inline-block;
	width: 2px;
	height: 20px;
	text-indent: -999em;
	background: #e4e4e5;
	}
	.hello{
	margin-top: 20px;
	text-align: center;
	opacity: 0.7;
	display: inline-block;
	line-height: 13px;
	font-size: 15px;
	}
	a{
		color:black;
	}
</style>
<script src="resources/tjs/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	
		function check1() {
			var id=$('#id').val();
			var password=$('#password').val();
			if ( id.length<1 ) {
				$('#resultArea').html('아이디를 입력해주세요.');
				return; 
			}
			if ( password.length<1 ) {
				$('#resultArea1').html('비밀번호를 입력해주세요.');
				return;
			}
 	 		$.ajax({
				type : "Post",
				url : "tlogin",
				data:{
					 id: $("#id").val(), 
					  password:$("#password").val(), 	
				},
				success : function(result) {
						$("#resultArea1").html(result);
				}// success
			});
			$('#resultArea').html('');
		} //  click
		
</script>

<body>

<div align="center" style="margin-top:30px;">
<a href="tHome"><img src="resources/image/logo.png"/></a>
<form action="" method="post" >
<table style="width:500px;">
<tr height="30"><td colspan="3">아이디</td></tr>
<tr>
	<td colspan="3">
		<input name="id" id="id" type="text" value="" style="width:500px;height:45px;padding-left:15px;font-size:17px;"/>
	</td>
</tr>
<tr height="30"><td id="resultArea" style="color:red;font-weight:normal;font-size:12px;"></td></tr>
<tr height="30"> <td colspan="3">비밀번호</td></tr>
<tr>
	<td colspan="3"><input name="password" id="password" type="password" value="" style="width:500px;height:45px;padding-left:15px;font-size:17px;"/></td>
</tr>
</table>
<table>
<tr height="30"><td id="resultArea1" style="color:red;font-weight:normal;font-size:12px;"></td></tr>
<tr>
	<td><input type="button" value="로그인" onclick="check1()" style="width:520px;height:60px;background-color:black;color:white;border:0px;font-size:20px;"/>
</tr>
</table>
</form>
</div>
<br>
<hr style="width: 520px;">
<div align="center">
<span class="hello">아이디 찾기</span>
<span class="bar">|</span>
<span class="hello">비밀번호 찾기</span>
<span class="bar">|</span>
<a href="checkForm"><span class="hello">회원가입 </span></a> 
</div>
</body>
</html>