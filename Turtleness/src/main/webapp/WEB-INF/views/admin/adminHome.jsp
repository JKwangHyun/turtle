<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<link rel="stylesheet" href="resources/tcss/index.css">
<script src="resources/tjs/jquery-3.2.1.min.js"></script>

<style>
body {
		width:700px;
		margin:0 auto;
		background-color:black;
	}
.tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
    box-shadow:0px 0px 40px white;
    border-top-left-radius:20px;
    border-top-right-radius:20px;
    border-bottom:none;
}

/* Style the buttons inside the tab */
.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 13.77px;
    font-weight:bold;
}

/* Change background color of buttons on hover */
.tab button:hover {
    background-color: white;
}

/* Create an active/current tablink class */
.tab button.active {
    background-color: white;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
    box-shadow:0px 0px 40px white;
    border-bottom-left-radius:20px;
    border-bottom-right-radius:20px;
    background-color:white;
    height:550px;
}
</style>
<script>
function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
    
    if(cityName == "member") {
	    $.ajax({
			type : "Post",
			url : "TAList",
			data:{
			},
			success : function(result) {
					$("#member").html(result);
			}// success
		});
    }
    else if(cityName == "inquiry") {
	    $.ajax({
			type : "Post",
			url : "TIList",
			data:{
			},
			success : function(result) {
					$("#inquiry").html(result);
			}// success
		});
    }
    else if(cityName == "board") {
	    $.ajax({
			type : "Post",
			url : "HashMapList",
			data:{
			},
			success : function(result) {
					$("#board").html(result);
			}// success
		});
    }
    	
}
$(document).ready(function(){
// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
});


</script>
</head>
<body>
<div align="center">
		<h1 style="color:white;">TURTLENESS</h1>
	</div>
<div class="tab">
  <button class="tablinks" onclick="openCity(event, 'member')" id="defaultOpen">회원 관리</button>
  <button class="tablinks" onclick="openCity(event, 'inquiry')">1:1문의 관리</button>
  <button class="tablinks" onclick="openCity(event, 'board')">게시판 관리</button>
  <button class="tablinks" onclick="openCity(event, 'exercise1')">운동 관리</button>
  <button class="tablinks" onclick="openCity(event, 'st')">스트레칭 관리</button>
  <button class="tablinks" onclick="openCity(event, 'gaehal')">재활 관리</button>
  <button class="tablinks" onclick="openCity(event, 'food')">음식 관리</button>
</div>

<div id="member" class="tabcontent" align="center">
</div>

<div id="inquiry" class="tabcontent" align="center">
</div>

<div id="board" class="tabcontent">
</div>

<div id="exercise1" class="tabcontent">
  <h3>Tokyo</h3>
  <p>Tokyo is the capital of Japan.</p>
</div>
<div id="st" class="tabcontent">
  <h3>Tokyo</h3>
  <p>Tokyo is the capital of Japan.</p>
</div>
<div id="gaehal" class="tabcontent">
  <h3>Tokyo</h3>
  <p>Tokyo is the capital of Japan.</p>
</div>
<div id="food" class="tabcontent">
  <h3>Tokyo</h3>
  <p>Tokyo is the capital of Japan.</p>
</div>

</body>
</html>