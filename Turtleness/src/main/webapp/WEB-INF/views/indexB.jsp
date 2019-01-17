<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/tcss/index1.css">
<script src="resources/tjs/jquery-3.2.1.min.js"></script>
<script src="resources/tjs/index1.js"></script>
<script> 
$(document).ready(function(){
$("#popup_open").click(function(){ 
$("#popup_wrap").css("display", "block"); 
$("#mask").css("display", "block"); 
}); 
$("#popup_close").click(function(){ 
$("#popup_wrap").css("display", "none"); 
$("#mask").css("display", "none"); 
}); 

$("#popup_open1").click(function(){ 
$("#popup_wrap1").css("display", "block"); 
$("#mask").css("display", "block");
$("#tgender option[value!="+data.data.result.tgender+"]").remove();
}); 

$("#popup_close1").click(function(){ 
$("#popup_wrap1").css("display", "none"); 
$("#mask").css("display", "none"); 
}); 

$("#popup_open2").click(function(){ 
$("#popup_wrap2").css("display", "block"); 
$("#mask").css("display", "block");
}); 

$("#popup_close2").click(function(){ 
$("#popup_wrap2").css("display", "none"); 
$("#mask").css("display", "none"); 
});

$("#popup_open3").click(function(){ 
$("#popup_wrap3").css("display", "block"); 
$("#asd").click();
$("#mask").css("display", "block"); 
}); 
$("#popup_close3").click(function(){ 
$("#popup_wrap3").css("display", "none"); 
$("#mask").css("display", "none"); 
}); 

$("#header_slide").css("display","none");
$("#header_content,#header_slide").mouseout(function() {
	$("#header_slide").stop().slideUp("fast");
});
$("#header_content,#header_slide").mouseover(function() {
	$("#header_slide").stop().slideDown("slow");
});

document.getElementById("defaultopen").click();
});
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
  
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";

}

function check() {
	var gender = $('#gender').val();
	var act = $('#act').val();
	var height = $('#height').val();
	var weight = $('#weight').val();
	var age = $('#age').val();
	
	if(gender=='') {
		alert('성별을 선택해 주세요.');
		return;
	}
	
	if(act=='q') {
		alert('활동량을 선택해 주세요.');
		return;
	}
	
	if(age.replace(/[0-9]/g,'').length>0 || age.length>2 || age=='') {
		alert('나이를 정확히 입력해 주세요.');
		return;
	}
	
	if(height.replace(/[0-9]/g,'').length>0 || height.length>3 || height=='') {
		alert('신장을 정확히 입력해 주세요.');
		return;
	}
	
	if(weight.replace(/[0-9]/g,'').length>0 || weight.length>3 || weight=='') {
		alert('몸무게를 정확히 입력해 주세요.');
		return;
	}
	
	if(gender=='M') {
		var avgH = (height-100)*0.9;
		var basicm = Math.floor(66.47 + (13.75 * weight) + (5 * height) - (6.76 * age));
	} else if(gender=="W") {
		var avgH = (height-100)*0.85;
		var basicm = Math.floor(655.1 + (9.56 * weight) + (1.85 * height) - (4.68 * age));
	}
	
	if(act=='A') {
		var activem = Math.floor(basicm * 0.555);
	} else if(act=='B') {
		var activem = Math.floor(basicm * 0.725);	
	} else if(act=='C') {
		var activem = Math.floor(basicm * 0.9);	
	}
	
	var bmi = ((weight-avgH)/avgH)*100;
	var foodm = Math.floor(((basicm + activem) / 0.9) * 0.1);
	var totalm = basicm + activem + foodm; 
		
	$('#avg').html(avgH + ' kg');
	$('#bmi').html(Math.floor(bmi) + ' %');
	$('#basicm').html(basicm + ' kcal');
	$('#activem').html(activem + ' kcal');
	$('#foodm').html(foodm + ' kcal');
	$('#totalm').html(totalm + ' kcal');
}
function reset1() {
	$('#avg').text('');
	$('#bmi').text('');
	$('#basicm').text('');
	$('#activem').text('');
	$('#foodm').text('');
	$('#totalm').text('');
}

<%-- function bodysave() {
	var height = "<%= session.getAttribute("body") %>"
	
  	if(height == 0)
		location.href='tbjoin';
 	else
 		location.href='tbupdate';
} --%>

function inqueryList() {
	$.ajax({
		type : "Post",
		url : "inquiry",
		data:{
		},
		success : function(result) {
				$(".div_wrap1").html(result);
		}// success
	});
}

var currentPosition = parseInt($("#header2").css("top")); 
$(window).scroll(function() { 
	var position = $(window).scrollTop(); 
	$("#header2").stop().animate({"top":position+currentPosition+"px"},1000);
});


</script>

<style> 
#popup_wrap {width:400px; height:500px; background:#fff; border: 0px solid black; border-radius:20px;position:fixed; top:50%; left:50%; margin:-250px 0 0 -200px; z-index:9999; display:none;} 
#mask {width:100%; height:100%; position:fixed; background:rgba(0,0,0,0.7) repeat; top:0; left:0; z-index:999; display:none;} 
#popup_close {z-index:9999; width: 25px; height: 25px; background-color:black; color:white; text-align: center; border: none; font-size: 18px;position: relative; left:365px;top:-68px;}
#popup_close1 {z-index:9999; width: 25px; height: 25px; background-color:black; color:white; text-align: center; border: none; font-size: 18px;position: relative; left:365px;top:-68px;}
#popup_close2 {z-index:9999; width: 25px; height: 25px; background-color:black; color:white; text-align: center; border: none; font-size: 18px;position: relative; left:765px;top:-68px;}
#popup_wrap1 {width:400px; height:500px; background:#fff; border: 0px solid black; border-radius:20px;position:fixed; top:50%; left:50%; margin:-250px 0 0 -200px; z-index:9999; display:none;} 
#popup_wrap2 {width:800px; height:500px; background:#fff; border: 0px solid black; border-radius:20px;position:fixed; top:50%; left:50%; margin:-250px 0 0 -400px; z-index:9999; display:none;}
#popup_close3 {z-index:9999; width: 25px; height: 25px; background-color:black; color:white; text-align: center; border: none; font-size: 18px;position: relative; left:765px;top:-68px;}
#popup_wrap3 {width:800px; height:500px; background:#fff; border: 0px solid black; border-radius:20px;position:fixed; top:50%; left:50%; margin:-250px 0 0 -400px; z-index:9999; display:none;} 
.popup_title {width:350px;background-color:white;color:black;border-top-left-radius:20px;border-top-right-radius:20px;
			  border-bottom-left-radius:20px;border-bottom-right-radius:20px;text-align:center;font-size:18px;margin-left: 25px;
    		  margin-top: 10px;}
.div_wrap{width:350px; height:440px;margin-top: 20px;margin-left: 30px;}
.hs a {display:block;text-decoration:none;color:#737373; font-weight:bold;}
.hs li{float:left;}
.hs a:hover{font-weight:bold; color:#000000;}

/* w3school */
.mySlides {display: none}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: black;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
  color:white;
}


/* Number text (1/3 etc) */
.numbertext {
  color: #black;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
  right:0;
  font-weight: bold;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
  opacity:0;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}
.mp {
	border-radius:20px;
	width:100%;
	height:195px;
}
@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
.slide_ul>li.banner_1{background-image:url(resources/image/banner1.png);}
.slide_ul>li.banner_2{background-image:url(resources/image/banner2.png);}
.slide_ul>li.banner_3{background-image:url(resources/image/banner4.png);}
.slide_btn>li>a{display:block; width: 14px; height:14px; background: url(resources/image/spr.png) -24px -125px; text-indent: -999em; }
#exercise {
			position:relative;
			top:10px;
			width: 325px;
			display: block; 
			height:195px;
			float:left;
			background-image: url("resources/image/exercise.jpg");
			background-size: 100% 100%;
			border-top-left-radius  : 20px;
			border-top-right-radius  : 20px;
			border-bottom-left-radius  : 20px;
			border-bottom-right-radius  : 20px;
		}
#stretching {
			position:relative;
			top:10px;
			left:7px;
			width: 325px;
			display: block; 
			height:195px;
			float:left;
			background-image: url("resources/image/stretching.jpg");
			background-size: 100% 100%;
			border-top-left-radius  : 20px;
			border-top-right-radius  : 20px;
			border-bottom-left-radius  : 20px;
			border-bottom-right-radius  : 20px;
		}
</style>

<title>TurtleNess</title>
</head>
<body>
<div id="header1">
	<ul>
		<li><a id="popup_open1" href="#">개인정보 ]</a></li>
		<li>|</li>
		<li><a href="tlogout">[ 로그아웃</a></li>
		<li>${Lemon.name} 님</li>
	</ul>
</div> <!-- header1 -->

<!-- 개인정보 팝업 -->
<div id="popup_wrap1">
<div style="position:relative;background-color:black;height:50px; top:-5px; border-top-left-radius:20px;
				border-top-right-radius:20px;"></div>
<div style="position:relative; z-index:20; color:white;font-size:20px; text-align:center;top:-40px;">개인 정보</div>
<input type="button" id="popup_close1" value="×">
	<div class="div_wrap">
		<form action="tupdate" method="post">
			<table style="width:550px;margin-left:-20px">
				<tr>
					<td style="text-align:center;width:80px;font-weight:bold;font-size:15px;padding-left:50px;">아이디</td><td style="padding-right:120px;"><input type="text" name="id" readonly="readonly" value="${Lemon.id}" style="text-align:center; width:170px;border:0px;"></td>
					<td style="width:80px;"></td>				
				</tr><tr height="20"></tr>
				<tr>
					<td style="text-align:center;width:80px;font-weight:bold;font-size:14px;padding-left:50px;">비밀번호</td><td><input type="password" name="password" value="${Lemon.password}" style="text-align:center; width:170px;"></td>
				</tr>
				<tr height="20"></tr>
				<tr>
					<td style="text-align:center;width:80px;font-weight:bold;font-size:14px;padding-left:50px;">이름</td><td><input type="text" name="name" value="${Lemon.name}" style="text-align:center; width:170px;"></td>
				</tr><tr height="20"></tr>
				<tr>
					<td style="text-align:center;width:90px;font-weight:bold;font-size:14px;padding-left:50px;">생일</td><td><input type="text" name="birthd" value="${Lemon.birthd}" readonly="readonly" style="text-align:center; width:170px;border:0px;"></td>
				</tr>
				<tr height="20"></tr>
				<tr>
					<td style="text-align:center;width:90px;font-weight:bold;font-size:15px;padding-left:50px;">성별</td>
					<td style="padding-left:69px;">
						<select name="gender" id="tgender">
							<c:choose>
								<c:when test="${Lemon.gender=='M'}">
									<option value="M" selected="selected">남자</option>
									<option disabled="disabled" value="W">여자</option>
								</c:when>	
								<c:when test="${Lemon.gender=='W'}">
									<option disabled="disabled" value="M">남자</option>
									<option value="W" selected="selected">여자</option>
								</c:when>
							</c:choose>
					</select>
					</td>
				</tr>
				</table>
				<table style="margin-left:-50px">
				<tr height="100"></tr>
				<tr>
					<td align="center" style="width:200px;padding-left:120px;">
						<input class="a" type="submit" value="수정" style="background-color:black;border:1px solid black;font-size:15px;"/>
					</td>
					<td align="center" style="width:200px;padding-right:70px;">
						<a href="tdelete"><input class="a" type="button"value="탈퇴" style="background-color:black;border:1px solid black;font-size:15px;"/></a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
</div> 


<div id="header2">
	<div id="logo">
		<a href="#"><img src="resources/image/logo.png" width="200px" height="60px"/></a>
	</div><!-- logo -->
	
	<div id="header_content">
		<ul>
			<li style="padding-left:30px"><a href="#">회사소개</a></li>
			<li><a href="#">프로그램</a></li>
			<li><a href="#">커뮤니티</a></li>
			<li><a href="#">고객센터</a></li>
		</ul>
	</div> <!-- header_content -->
	
</div> <!-- header2 -->	

<div id="header_slide" style="position:absolute; display:block;opacity:0.7; width:100%;height:250px;background-color:white;z-index:9999;top:115px;">
	<div style="width:1000px;margin:0 auto;">
		<div class="hs" style="padding-left:37%;padding-top:3%">
			<ul>
				<li><a href="#" style="padding-left:0px;">소개</a></li>
				<li><a href="#" style="padding-left:116px;">운동</a></li>
				<li><a href="#" style="padding-left:118px;">운동게시판</a></li>
				<li><a href="#" style="padding-left:73px;padding-right:50px;">Q&A</a></li>
			</ul>
		</div>
		
		<div class="hs" style="padding-left:37%;padding-top:3%">
			<ul>
				<li><a href="#" style="padding-left:0px;">대표의 말</a></li>
				<li><a href="#" style="padding-left:78px;">스트레칭</a></li>
				<li><a href="#" style="padding-left:85.5px;">음식게시판</a></li>
				<li><a href="#" style="padding-left:71px;">신고합니다</a></li>
			</ul>
		</div>
		<div class="hs" style="padding-left:37%;padding-top:3%">
			<ul>
				<li><a href="#" style="padding-left:0px;">찾아오시는 길</a></li>
				<li><a href="#" style="padding-left:45px;">재활운동</a></li>
				<li><a href="#" style="padding-left:86px;">스트레칭게시판</a></li>
				<li><a href="#" style="padding-left:40px;">자주 찾는 질문</a></li>
			</ul>
		</div>
		<div class="hs" style="padding-left:37%;padding-top:3%">
			<ul>
				<li><a href="#" style="padding-left:0px;">행사안내</a></li>
				<li><a href="#" style="padding-left:83px;">음식</a></li>
				<li><a href="#" style="padding-left:118px;">자유게시판</a></li>
			</ul>
		</div>
	</div>
</div>

<div class="slide">
	<ul class="slide_ul">
		<li class="banner_1"><a href="#"></a></li>
		<li class="banner_2"><a href="#"></a></li>
		<li class="banner_3"><a href="#"></a></li>
	</ul>
</div>

<div class="slide_down">
	<div class="slide_down_img1" id="popup_open"><img src="resources/image/측정.png" width="333px" height="200px"/></div>
	<div class="slide_down_img2" id="popup_open2"><img src="resources/image/마이프로그램.png" width="333px" height="200px"/></div>
	<div class="slide_down_img3" id="popup_open3"><img src="resources/image/qa.png" width="333px" height="200px"/></div>
</div>

<div id="popup_wrap">
<div style="position:relative;background-color:black;height:50px; top:-5px; border-top-left-radius:20px;
				border-top-right-radius:20px;"></div>
<div style="position:relative; z-index:20; color:white;font-size:20px; text-align:center;top:-40px;">신체 측정</div>
<input type="button" id="popup_close" value="×">
<div style="margin-top:-35px;margin-right:10px;width:100%;color:gray;text-align:right;font-size:5px;">* 정확하게 기재해주시기 바랍니다.</div>	
	<div class="div_wrap">
		<c:choose>
			<c:when test="${body.id==null}">
				<form action="tbjoin" method="post">	
			</c:when>
			<c:when test="${body.id!=null}">
				<form action="tbupdate" method="post">	
			</c:when>
		</c:choose>
			<table>
				<tr>
					<td style="width:80px;"></td>
					<td style="text-align:center;width:60px;font-weight:bold;font-size:15px">신  장</td><td><input type="text" name="height" value="${body.height}" style="text-align:center; width:50px;border:0px;border-bottom:1px solid black;">cm</td>
					<td style="width:80px;"></td>				
				</tr><tr height="5"></tr>
				<tr>
					<td></td>
					<td style="text-align:center;width:60px;font-weight:bold;font-size:14px">몸 무 게</td><td><input type="text" name="weight" value="${body.weight}" style="text-align:center; width:50px;border:0px;border-bottom:1px solid black;">kg</td>
				</tr>
				<tr height="5"></tr>
				<tr>
					<td></td>
					<td style="text-align:center;width:80px;font-weight:bold;font-size:14px">팔굽혀펴기</td><td><input type="text" name="pushup" value="${body.pushup}" style="text-align:center; width:50px;border:0px;border-bottom:1px solid black;">회</td>
				</tr><tr height="5"></tr>
				<tr>
					<td></td>
					<td style="text-align:center;width:90px;font-weight:bold;font-size:14px">윗몸일으키기</td><td><input type="text" name="situp" value="${body.situp}" style="text-align:center; width:50px;border:0px;border-bottom:1px solid black;">회</td>
				</tr>
				<tr height="10"></tr>
				<tr height="30">
					<td colspan="4" style="text-align:center;width:80px;font-weight:bold;font-size:14px">주 운동횟수</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<c:choose>
							<c:when test="${body.weekexercise=='d'}">
								<input type="radio" name="weekexercise" value="d" checked="checked">0회
								<input type="radio" name="weekexercise" value="c">1~2회
								<input type="radio" name="weekexercise" value="b">3~4회
								<input type="radio" name="weekexercise" value="a">5회이상
							</c:when>
							<c:when test="${body.weekexercise=='c'}">
								<input type="radio" name="weekexercise" value="d">0회
								<input type="radio" name="weekexercise" value="c" checked="checked">1~2회
								<input type="radio" name="weekexercise" value="b">3~4회
								<input type="radio" name="weekexercise" value="a">5회이상
							</c:when>
							<c:when test="${body.weekexercise=='b'}">
								<input type="radio" name="weekexercise" value="d">0회
								<input type="radio" name="weekexercise" value="c">1~2회
								<input type="radio" name="weekexercise" value="b" checked="checked">3~4회
								<input type="radio" name="weekexercise" value="a">5회이상
							</c:when>
							<c:when test="${body.weekexercise=='a'}">
								<input type="radio" name="weekexercise" value="d">0회
								<input type="radio" name="weekexercise" value="c">1~2회
								<input type="radio" name="weekexercise" value="b">3~4회
								<input type="radio" name="weekexercise" value="a" checked="checked">5회이상
							</c:when>
							<c:otherwise>
								<input type="radio" name="weekexercise" value="d">0회
								<input type="radio" name="weekexercise" value="c">1~2회
								<input type="radio" name="weekexercise" value="b">3~4회
								<input type="radio" name="weekexercise" value="a">5회이상
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr height="10"></tr>
				<tr height="30">
					<td colspan="4"style="text-align:center;width:80px;font-weight:bold;font-size:14px">배운 운동</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<c:choose>
							<c:when test="${body.doexercise=='d'}">
								<input type="radio" name="doexercise" value="d" checked="checked">0개
								<input type="radio" name="doexercise" value="c">1~2개
								<input type="radio" name="doexercise" value="b">3~4개
								<input type="radio" name="doexercise" value="a">5개이상
							</c:when>
							<c:when test="${body.doexercise=='c'}">
								<input type="radio" name="doexercise" value="d">0개
								<input type="radio" name="doexercise" value="c" checked="checked">1~2개
								<input type="radio" name="doexercise" value="b">3~4개
								<input type="radio" name="doexercise" value="a">5개이상
							</c:when>
							<c:when test="${body.doexercise=='b'}">
								<input type="radio" name="doexercise" value="d">0개
								<input type="radio" name="doexercise" value="c">1~2개
								<input type="radio" name="doexercise" value="b" checked="checked">3~4개
								<input type="radio" name="doexercise" value="a">5개이상
							</c:when>
							<c:when test="${body.doexercise=='a'}">
								<input type="radio" name="doexercise" value="d">0개
								<input type="radio" name="doexercise" value="c">1~2개
								<input type="radio" name="doexercise" value="b">3~4개
								<input type="radio" name="doexercise" value="a" checked="checked">5개이상
							</c:when>
							<c:otherwise>
								<input type="radio" name="doexercise" value="d">0개
								<input type="radio" name="doexercise" value="c">1~2개
								<input type="radio" name="doexercise" value="b">3~4개
								<input type="radio" name="doexercise" value="a">5개이상
							</c:otherwise>
						</c:choose>
					</td>
				</tr>	
				
				<tr height="50"></tr>
				<tr align="center" height="0">
					<td></td>
					<td align="center" colspan="2">
						<input class="a" type="submit" value="저장" style="background-color:black;border:1px solid black;font-size:14px;"/>
					</td>
					<td></td>
				</tr>
			</table>
		</form>
	</div>
	
</div> 

<!-- 나의 프로그램 -->

<div id="popup_wrap2">
<div style="position:relative;background-color:black;height:50px; top:-5px; border-top-left-radius:20px;
				border-top-right-radius:20px;"></div>
<div style="position:relative; z-index:20; color:white;font-size:20px; text-align:center;top:-40px;">나의 프로그램</div>
<input type="button" id="popup_close2" value="×">
	<form>
	</form>
</div> 

<!-- 나의 프로그램 -->

<!-- 1:1 문의 -->
<div id="popup_wrap3">
<div style="position:relative;background-color:black;height:50px; top:-5px; border-top-left-radius:20px;
				border-top-right-radius:20px;"></div>
<div style="position:relative; z-index:20; color:white;font-size:20px; text-align:center;top:-40px;">1:1문의</div>
<input type="button" id="popup_close3" value="×">
	
	<form>
		<div class="div_wrap1" style="margin-top:10px;position:relative;">
		</div>
		<input type="button" value="보기" id="asd" onclick="inqueryList()" style="display: none;">
	</form>
</div> 
<!-- 1:1문의 끝 -->
<div id="mask"></div> 

<div class="mypage_wrap">
	<div id="mypage">
	<div style="position:relative;background-color:black;opacity:0.9;height:50px; top:0; border-top-left-radius:20px;
				border-top-right-radius:20px;"></div>
				<div style="position:relative; z-index:20; color:white;font-size:20px; text-align:center;top: -35px; ">건강 관리</div>
		<form action="#" method="post">		
			<table width="333px" style="margin-top:0px;">
				<tr>
					<td width="100px" align="center" style="font-size: 15px; font-weight: bold;">성 별</td>
					<td>
						<select id="gender" name="gender">
							<option value="" selected="selected">선택</option>
							<option value="M">남자</option>
							<option value="W">여자</option>
						</select>
					</td>
				</tr>
				<tr height="30">
					<td width="100px" align="center" style="font-size: 15px; font-weight: bold;">활 동</td>
					<td>
						<select id="act" name="act">
							<option value="q" selected="selected">선택</option>
							<option value="A">가벼운 활동</option>
							<option value="B">보통 활동</option>
							<option value="C">활발한 활동</option>
						</select>
					</td>
				</tr>
				<tr>
					<td width="100px" align="center" style="font-size: 15px; font-weight: bold;">나 이</td>
					<td width="60px"><input id="age" type="text" style="border:0px;border-bottom:1px solid black;width: 60px; text-align: center;">세</td>
				</tr>
				<tr height="30">
					<td width="100px" align="center" style="font-size: 15px; font-weight: bold;">신 장</td>
					<td width="60px"><input id="height" type="text" style="border:0px;border-bottom:1px solid black;width: 60px; text-align: center;">cm</td>
					<td width="100px" align="center" style="font-size: 14px; font-weight: bold;">몸무게</td>
					<td width="100px" style="padding-right: 20px;"><input id="weight" type="text" style="border:0px;border-bottom:1px solid black;width: 60px; text-align: center;">kg</td>
				</tr>
				<tr height="20"></tr>
			</table>
			<hr style="background-color:black">
			<div style="display:block; position:relative; z-index:99; top:-20px; background-color:white;width:50px; font-weight:bold; left:140px;">측정표</div>
				<table style="margin-top:0px; margin-left:20px; margin-right:20px;">
					<tr align="center" height="20" bgcolor="black">
						<td class="a" width="80px" colspan="2">표준체중</td><td class="a" width="80px" colspan="2">비 만 도</td>
					</tr>
					<tr align="center" height="20">
						<td id="avg" width="60px" colspan="2" style="font-size:14px;"></td><td id="bmi" width="60px" colspan="2" style="font-size:14px;"></td>
					</tr>
					<tr height="10"></tr>
					<tr align="center" height="20" bgcolor="black">
						<td class="a" width="80px">기초대사량</td><td class="a" width="80px">활동대사량</td>
						<td class="a" width="80px">식품에너지</td><td class="a" width="80px">총필요에너지</td>
					</tr>
					<tr align="center" height="20">
						<td id="basicm" width="60px" style="font-size:12px;"></td><td id="activem" width="60px" style="font-size:12px;"></td>
						<td id="foodm" width="60px" style="font-size:12px;"></td><td id="totalm" width="60px" style="font-size:12px;"></td>
					</tr>
					<tr height="5"></tr>
					<tr align="center" height="0">
						<td colspan="2" align="center" style="padding-left:60px">
							<input class="a" type="button" value="측정" onclick="check()" style="padding:5px 0; width:50px; background-color:black;color:white; border:1px solid black;"/>
						</td>
						<td colspan="2" align="center" style="padding-right:80px">
							<input class="a" type="reset" value="리셋" onclick="reset1()" style="padding:5px 0; width:50px; background-color:black;color:white; border:1px solid black;"/>
						</td>
					</tr>
				</table>
		</form>
	</div>
	
	<div id="function">
		<div id="slidef" >
			<div class="slideshow-container">

				<div class="mySlides fade">
				<div class="numbertext">1 / 3</div>
				  <a href="http://www.dosirakmall.com" target="blank"><img class="mp" src="resources/image/ad3.png"></a>
				</div>
				
				<div class="mySlides fade">
				<div class="numbertext">2 / 3</div>
				  <a href="http://www.imdak.com" target="blank"><img class="mp" src="resources/image/ad2.png"></a>
				</div>
				
				<div class="mySlides fade">
				  <div class="numbertext">3 / 3</div>
				  <a href="http://www.cherem.co.kr" target="blank"><img class="mp" src="resources/image/ad1.png"></a>
				</div>
				
				<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
				<a class="next" onclick="plusSlides(1)">&#10095;</a>
				
				</div>
				<br>
				
				<div style="text-align:center; margin-top:-50px;position: absolute;left:500px;">
				  <span class="dot" id="defaultopen" onclick="currentSlide(1)"></span> 
				  <span class="dot" onclick="currentSlide(2)"></span> 
				  <span class="dot" onclick="currentSlide(3)"></span> 
				</div>
		</div>
		
		<a href="#">
			<div id="exercise">
				<div style="position:relative; z-index:10;background-color:black;opacity:0.7; height:50px; top:145px; border-bottom-left-radius:20px;
				border-bottom-right-radius:20px;"></div>
				<div style="position:relative; z-index:20; color:white;font-size:20px; padding-left:110px; padding-top: 105px; ">무산소운동</div>
			</div></a>
		
		<a href="#"><div id="stretching">
				<div style="position:relative; z-index:10;background-color:black;opacity:0.7; height:50px; top:145px; border-bottom-left-radius:20px;
				border-bottom-right-radius:20px;"></div>
				<div style="position:relative; z-index:20; color:white;font-size:20px; padding-left:110px; padding-top: 105px; ">유산소운동</div>
		</div></a>
	</div>
</div>

<hr width="100%">
<div id="footer">	
	<div id="footer1">
		<ul style="padding-left:0">
			<li><a href="#">고객센터</a></li>
			<li>|</li>		
			<li><a href="#">이용약관</a></li>
			<li>|</li>
			<li><a href="#">개인정보처리방침</a></li>
		</ul>
	</div>
	<div id="footer2">
		<ul>
			<li>Copyright @ TUTLENESS Corporation. All Rights Reserved.</li>
		</ul>
	</div>
</div>
</body>
</html>