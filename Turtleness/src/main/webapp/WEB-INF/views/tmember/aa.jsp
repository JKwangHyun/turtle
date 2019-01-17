<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.box {
			background-color: #009ac8;
			border:0px;width:50px;height:50px;
		}
	.change_color {
			background-color: #ff3494;
		}
</style>
<script src="resources/tjs/jquery-3.2.1.min.js"></script>
<script>
var seat = [];
var count = 0 ;
var seat1 = [];
Array.prototype.remove = function() {
    var what, a = arguments, L = a.length, ax;
    while (L && this.length) {
        what = a[--L];
        while ((ax = this.indexOf(what)) !== -1) {
            this.splice(ax, 1);
        }
    }
    return this;
};

function bc(n) {
	if($('#b'+n).hasClass('change_color')==true) {
	    $('#b'+n).removeClass('change_color');
	    count--;
	    seat.remove(n);
	    seat.sort(function(a, b) {
	        return a - b;
	    });
	    alert(seat);
	}
	else if($('#b'+n).hasClass('change_color')==false) {
		if(count>=3){
	          return;
	       }
	    $('#b'+n).addClass('change_color');
	    count++;
	    seat[count-1] = n;
	    seat.sort(function(a, b) {
	        return a - b;
	    });
	    alert(seat);
	}
}

function gae() {
	/* var str = "1,2,3,4";
	var str1 = "5,6,7";
	seat1 = str.split(",");
	seat2 = str1.split(",");
	for(var i=0; i<;i++) {
		for(var j=0; j<seat.length; j++)
		$('#b'+seat1[i]).css('background','red');
		$('#b'+seat2[i]).css('background','red');
	} */
	var str = new Array('1,2,3','4,5,6','7,8,9');
	alert(str);
	var seat1 ="";
	var str1 = [];
	for(var i=0; i<str.length; i++) {
		if(i==0) 
			seat1 += str[i];
		else
			seat1 += ","+str[i];
	}
	for(var i=0; i<str.length; i++) {
		str1 = seat1.split(',');
	}
	
	for(var i=0; i<str1.length; i++) {
		$('#b'+str1[i]).css('background','red');
	}
	
}
</script>
<body>
<input type="button" id="b1" class="box" onclick="bc(1)" value="1">
<input type="button" id="b2" class="box" onclick="bc(2)" value="2">
<input type="button" id="b3" class="box" onclick="bc(3)" value="3">
<input type="button" id="b5" class="box" onclick="bc(5)" value="5">
<input type="button" id="b6" class="box" onclick="bc(6)" value="6">
<input type="button" id="b7" class="box" onclick="bc(7)" value="7">
<input type="button" id="b8" class="box" onclick="bc(8)" value="8">
<input type="button" id="b9" class="box" onclick="bc(9)" value="9">
<input type="button" id="b10" class="box" onclick="bc(10)" value="10">
<input type="button" id="b11" class="box" onclick="bc(11)" value="11">
<input type="button" id="b12" class="box" onclick="bc(12)" value="12">
<input type="button" id="b13" class="box" onclick="bc(13)" value="13">
<input type="button" id="b14" class="box" onclick="bc(14)" value="14">
<input type="button" id="b15" class="box" onclick="bc(15)" value="15">
<input type="button" id="b16" class="box" onclick="bc(16)" value="16">
<input type="button" id="b17" class="box" onclick="bc(17)" value="17">
<input type="button" id="b18" class="box" onclick="bc(18)" value="18">
<input type="button" id="b19" class="box" onclick="bc(19)" value="19">
<input type="button" id="gae" class="box" onclick="gae()" value="계산22">
</body>
</html>