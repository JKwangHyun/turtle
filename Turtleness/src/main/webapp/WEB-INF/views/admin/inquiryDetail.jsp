<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function inquiryreply() {
	$.ajax({
		type : "Post",
		url : "Ireply",
		data:{
			wid : $('#wid').val()
		},
		success : function(result) {
				$("#inquiry").html(result);
		}// success
	});
}

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

</script>
<body>
	<div style="position:relative; display:block; border:0px solid black; height:400px;width:540px; margin:0 auto;top:50px;">
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
						<input type="text" id="wid" value="${Inquiry.wid}" name="wid" style="width:425px;display:none;">					
						<input type="text" id="seq" value="${Inquiry.seq}" name="seq" style="width:425px;display:none;">
						<input type="text" id="title" value="${Inquiry.title}" name="title"  readonly="readonly" style="width:425px;">
					</td>
				</tr>
				<tr height="10"></tr>
				<tr>
					<td style="width:60px;background-color:black;color:white;text-align:center;font-size:13px;border-radius:20px;border:0px;">내용</td>
				</tr>
				<tr height="10"></tr>
				<tr>
					<td colspan="2">
						<textarea cols="80" rows="15" id="content"  name="content" readonly="readonly">${Inquiry.content}</textarea>
					</td>
				</tr>
				<tr height="50"></tr>
				<tr align="center">
					<td colspan="2">
						<input type="button" value="답글" onclick="inquiryreply()" style="width:133px;height:30px; font-size:15px; color:white;background-color:black;border-radius:20px;border:0;">
						<input type="button" value="삭제" onclick="inquiryDelete()" style="width:133px;height:30px; font-size:15px; color:white;background-color:black;border-radius:20px;border:0;">
						<input type="button" value="취소" onclick="inqueryList()" style="width:133px;height:30px; font-size:15px; color:white;background-color:black;border-radius:20px;border:0;">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>