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
</style>
<script src="resources/tjs/jquery-3.2.1.min.js"></script>
<script>
	function joincheck() {
		var id= $('#id').val();
		var password= $('#password').val();
		var password1= $('#password1').val();
		var name= $('#name').val();
		var gender= $('#gender').val();
		if(id.length=='') {
			$('#resultArea').html('필수 정보 ');
		}
		if(id.length<4 || id.replace(/[a-z.0-9]/g,'').length>0) {
			$('#resultArea').html('5~20자 영문,숫자만 사용 가능합니다.');
		}
		
		if(password.length=='') {
			$('#resultArea1').html('필수 정보 ');
		}
		if(password.length<8 || password.replace(/[a-z.0-9]/g,'').length>0) {
			$('#resultArea1').html('8~16자 영문,숫자만 사용 가능합니다.');
		}
		
		if(password1.length=='') {
			$('#resultArea4').html('필수 정보 ');
		}
		if(password != password1) {
			$('#resultArea4').html('비밀번호가 일치하지 않습니다.');
		}
		
		if(name.length=='') {
			$('#resultArea2').html('필수 정보 ');
		}
		if(name.replace(/[가-힣.a-z]/g,'').length>0) {
			$('#resultArea2').html('한글,영어만 사용 가능합니다.');
		}
		
		if(gender=='g') {
			$('#resultArea3').html('필수 정보 ');
			return;
		}
		$('form').submit();
	}

	$(document).ready(function(){
		$('#id').focusout(function(){
			var id= $('#id').val();
			if(id.length=='') {
				$('#resultArea').html('필수 정보 ');
				return;
			}
			if(id.length<4 || id.replace(/[a-z.0-9]/g,'').length>0) {
				$('#resultArea').html('5~20자 영문,숫자만 사용 가능합니다.');
				return;
			}
			$.ajax({
				type : 'Get',
				url : "joincheck",
				data : {
					id : $('#id').val(),
				},
				success : function(result) {
					$('#resultArea').html(result)
				}
			});
		});
		$('#password').focusout(function(){
			var password= $('#password').val();
			if(password.length=='') {
				$('#resultArea1').html('필수 정보 ');
				return;
			}
			if(password.length<8 || password.replace(/[a-z.0-9]/g,'').length>0) {
				$('#resultArea1').html('8~16자 영문,숫자만 사용 가능합니다.');
				return;
			}else $('#resultArea1').html('<font color="green">사용가능한 비밀번호입니다.</font>');

		});
		$('#password1').focusout(function(){
			var password= $('#password').val();
			var password1= $('#password1').val();
			if(password1.length=='') {
				$('#resultArea4').html('필수 정보 ');
				return;
			}
			if(password != password1) {
				$('#resultArea4').html('비밀번호가 일치하지 않습니다.');
				return;
			}else $('#resultArea4').html('<font color="green">비밀번호가 일치합니다.</font>');

		});
		$('#name').focusout(function(){
			var name= $('#name').val();
			if(name.length=='') {
				$('#resultArea2').html('필수 정보 ');
				return;
			}
			if(name.replace(/[가-힣.a-z]/g,'').length>0) {
				$('#resultArea2').html('한글,영어만 사용 가능합니다.');
				return;
			}else $('#resultArea2').html('');

		});
		$('#gender').focusout(function(){
			var gender= $('#gender').val();
			if(gender=='g') {
				$('#resultArea3').html('필수 정보 ');
				return;
			}else $('#resultArea3').html('');
		});
	});
	
</script>

<body>
<div align="center" style="margin-top:30px;">
<a href="tHome"><img src="resources/image/logo.png"/></a>
<form action="tjoin" method="post">
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
	<td colspan="3"><input name="password" id="password" type="password" value="" maxlength="20" style="width:500px;height:45px;padding-left:15px;font-size:17px;"/></td>
</tr>
<tr height="30"><td id="resultArea1" style="color:red;font-weight:normal;font-size:12px;"></td></tr>
<tr height="30"> <td colspan="3">비밀번호 재확인</td></tr>
<tr>
	<td colspan="3"><input name="password1" id="password1" type="password" value="" style="width:500px;height:45px;padding-left:15px;font-size:17px;"/></td>
</tr>
<tr height="30"><td id="resultArea4" style="color:red;font-weight:normal;font-size:12px;"></td></tr>
<tr height="30"><td colspan="3">이름</td></tr>
<tr>
	<td colspan="3"><input name="name" id="name" type="text" value="" style="width:500px;height:45px;padding-left:15px;font-size:17px;"/></td>
</tr>
<tr height="30"><td id="resultArea2" style="color:red;font-weight:normal;font-size:12px;"></td></tr>
<table>
<tr height="30"><td colspan="3">생년월일</td></tr>
<tr>
	<td><input name="birthd" id="birthd" type="text" placeholder="년(4자)" maxlength="4" style="width:155px;height:45px;padding-left:15px;font-size:17px;"/></td>
	<td><select id="birthd1" name="birthd1" style="width:165px;height:50px;padding-left:5px;font-size:17px;">
			<option value="" selected="selected">월</option>
			<option value="01">1</option><option value="02">2</option><option value="03">3</option><option value="04">4</option><option value="05">5</option><option value="06">6</option>
			<option value="07">7</option><option value="08">8</option><option value="09">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
		</select>
	</td>
	<td><input name="birthd2" id="birthd2" type="text" placeholder="일" maxlength="2" style="width:155px;height:45px;padding-left:15px;font-size:17px;"/></td>
</tr>
<tr height="30"><td id="resultArea2" style="color:red;font-weight:normal;font-size:12px;"></td></tr>
</table>
<table>
<tr height="30"><td colspan="3">성별</td></tr>
<tr>

	<td colspan="3"><select id="gender" name="gender" style="width:520px;height:50px;padding-left:5px;font-size:17px;">
			<option value="g" selected="selected">성별</option>
			<option value="M">남자</option>
			<option value="W">여자</option>
		</select>
	</td>
</tr>
<tr height="30"><td id="resultArea3" style="color:red;font-weight:normal;font-size:12px;"></td></tr>
<tr>
	<td><input type="button" value="가입하기" onclick="joincheck()" style="width:520px;height:60px;background-color:black;color:white;border:0px;font-size:20px;"/>&nbsp;&nbsp;&nbsp;

</tr>
</table>
</form>
</div>
</body>
</html>