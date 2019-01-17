<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function replyInsert() {
	$.ajax({
		type : "Post",
		url : "Ireplyinsert",
		data:{
			content : $('#content').val(),
			wid : $('#wid').val()
		},
		success : function(result) {
				$("#inquiry").html(result);
		}// success
	});
}
</script>
<body>
	<div style="position:relative; display:block; border:0px solid black; height:400px;width:540px; margin:0 auto;top:30px;">
		<form>	
			<table width=540>
	
				<tr height="10"></tr>
				<tr>
					<input type="text" id="wid" value="${adminID.wid}" name="wid" style="width:425px;display:none;">
					<td style="width:60px;background-color:black;color:white;text-align:center;font-size:13px;border-radius:20px;border:0px;">내용<input type="text" id="wid" value="${adminID.wid}" name="wid" style="width:425px;display:none;"></td>
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
						<input type="button" value="등록" onclick="replyInsert()" style="width:200px;height:30px; font-size:15px; color:white;background-color:black;border-radius:20px;border:0;">
						<input type="button" value="취소" onclick="inqueryList()" style="width:200px;height:30px; font-size:15px; color:white;background-color:black;border-radius:20px;border:0;">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>