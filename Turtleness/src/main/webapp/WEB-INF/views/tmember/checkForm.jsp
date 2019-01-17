<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	input[type=button] {
		background-color:black;
		color:white;
		border:0px;
		padding: 15px 75px;
		font-size:17px;
	}
</style>
<script src="resources/tjs/jquery-3.2.1.min.js"></script>

<script>
/* $(document).ready(function(){
    $("input[type='checkbox']").click(function(){
       if($(this).attr("id") == "totalcheck") {
           $("input[id!='totalcheck']").attr("checked", $(this).is(":checked"));
       } else {
           var checked = $(this).is(":checked");
           if(checked == false) {
               $("#totalcheck").attr("checked", false);
           }
       } 
   }); 
}); */

$(function() {
	$("#totalcheck").change(function() {
		// 전체선택 체크박스의 체크상태 판별
		var is_check = $(this).is(":checked");
		// 하위 체크박스에 체크상태 적용
		$(".check0").prop("checked", is_check);
	});
	$(".check0").change(function() {
		// 전체선택 체크박스의 체크상태 판별
		$("#totalcheck").prop("checked", false);
	});
});

	function checkOk() {
		if($('input:checkbox[id="check1"]').is(":checked")==false 
				|| $('input:checkbox[id="check2"]').is(":checked")==false) {
			$('#checkResult').html('TurtleNess 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.');
			return;
		}
		
		if($('input:checkbox[id="check1"]').is(":checked")==true && 
				$('input:checkbox[id="check2"]').is(":checked")==true) {
			document.getElementById('checkGo').submit();
		}
		
	}
	
</script>

<body>
<div align="center" style="margin-top:30px;">
<a href="tHome"><img src="resources/image/logo.png"/></a>
<form id="checkGo" action="tJoinForm" method="post">
<div style="margin-top:30px;"></div>
<div>
	<input type="checkbox" id="totalcheck" name="totalcheck" value="t">이용약관, 개인정보 수집 및 이용에 모두 동의합니다.

</div>
<div style="margin-top:20px;">
	<input type="checkbox" id="check1" class="check0" name="check1" value="c1" style="margin-left:-148px;">TurtleNess 이용약관 동의<font color="green">(필수)</font>
</div>
<div>
	<textarea rows="6" cols="58">
		
여러분을 환영합니다.

네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다. 

네이버 서비스를 이용하시거나 네이버 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다. 


다양한 네이버 서비스를 즐겨보세요.	
	</textarea>
</div>
<div style="margin-top:20px;">
	<input type="checkbox" id="check2" name="check2" class="check0" value="c2" style="margin-left:-79px;">개인정보 수집 및 이용에 대한 안내<font color="green">(필수)</font>
</div>
<div>
	<textarea rows="6" cols="58">

정보통신망법 규정에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적 바랍니다

1. 수집하는 개인정보
이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.

회원가입 시점에 네이버가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 가입인증 휴대폰번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대폰번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소를 수집합니다.
- 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 가입인증 휴대폰번호를 필수항목으로 수집합니다. 그리고 단체 대표자명, 비밀번호 발급용 멤버 이름 및 이메일주소를 선택항목으로 수집합니다.


	</textarea>
</div>
<div id="checkResult" style="color:red;font-weight:normal;font-size:12px;margin-top:20px;margin-left: 28px;"></div>
<div style="margin-top:20px;">
	<a href="tHome"><input type="button" value="비동의"></a>
	<input type="button" value="동의" onclick="checkOk()" >
	
</div>


</form>

</div>
</body>
</html>