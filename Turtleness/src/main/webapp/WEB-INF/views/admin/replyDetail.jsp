<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function inquiryDelete() {
	$.ajax({
		type : "Post",
		url : "IDelete",
		data:{
			seq : $('#seq').val(),
		},
		success : function(result) {
				$("#inquiry").html(result);
		}// success
	});
}
function inqueryList() {
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
function replyUpdate() {
	$.ajax({
		type : "Post",
		url : "replyUpdate",
		data:{
			content : $('#content').val(),
			seq : $('#seq').val(),
		},
		success : function(result) {
				$("#inquiry").html(result);
		}// success
	});
}
</script>
<body>
	<div style="position:relative; display:block; border:0px solid black; height:400px;width:540px; margin:0 auto;top:0px;">
		<form>	
			<table width=540>
				<tr height="10"></tr>
				<tr>
					<td style="width:25px;border-bottom:1px solid black;font-weight:bold; font-size:13px;">답변</td>
				</tr>
				<tr height="10"></tr>
				<tr>
					<td colspan="2">
					<input type="text" id="seq" value="${Inquiry.seq}" name="seq" style="width:425px;display:none;">
						<textarea cols="80" rows="22" id="content" name="content">${Inquiry.content}</textarea>
					</td>
				</tr>
				<tr height="50"></tr>
				<tr align="center">
					<td colspan="2">
						<input type="button" value="삭제" onclick="inquiryDelete()" style="width:133px;height:30px; font-size:15px; color:white;background-color:black;border-radius:20px;border:0;">
						<input type="button" value="수정" onclick="replyUpdate()" style="width:133px;height:30px; font-size:15px; color:white;background-color:black;border-radius:20px;border:0;">
						<input type="button" value="취소" onclick="inqueryList()" style="width:133px;height:30px; font-size:15px; color:white;background-color:black;border-radius:20px;border:0;">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>