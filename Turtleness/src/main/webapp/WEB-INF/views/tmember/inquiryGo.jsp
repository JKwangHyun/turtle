<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function inquiryInsert() {
	$.ajax({
		type : "Post",
		url : "inquiryInsert",
		data:{
			title : $('#title').val(),
			content : $('#content').val(),
			titleF : $('#titleF').val()
		},
		success : function(result) {
				$(".div_wrap1").html(result);
		}// success
	});
}
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
</script>
<body>
	<div style="position:relative; display:block; border:0px solid black; height:400px;width:540px; margin:0 auto;top:-30px;">
		<form>	
			<table width=540>
				<tr height="10">
					<td style="width:60px;background-color:black;color:white;text-align:center;font-size:13px;border-radius:20px;border:0px;">제목</td>
				</tr>
				<tr height="10"></tr>
				<tr>	
					<td width=100 style="margin-left:10px;text-align:center;">
						<select id="titleF">
							<option value="운동">운동</option>
							<option value="스트레칭">스트레칭</option>
							<option value="음식">음식</option>
						</select>	
					</td>
					<td>
						<input type="text" id="title" name="title" style="width:425px;">
					</td>
				</tr>
				<tr height="10"></tr>
				<tr>
					<td style="width:60px;background-color:black;color:white;text-align:center;font-size:13px;border-radius:20px;border:0px;">내용</td>
				</tr>
				<tr height="10"></tr>
				<tr>
					<td colspan="2">
						<textarea cols="80" rows="15" id="content" name="content"></textarea>
					</td>
				</tr>
				<tr height="20"></tr>
				<tr align="center">
					<td colspan="2">
						<input type="button" value="등록" onclick="inquiryInsert()" style="width:200px;height:30px; font-size:15px; color:white;background-color:black;border-radius:20px;border:0;">
						<input type="button" value="취소" onclick="inqueryList()" style="width:200px;height:30px; font-size:15px; color:white;background-color:black;border-radius:20px;border:0;">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>