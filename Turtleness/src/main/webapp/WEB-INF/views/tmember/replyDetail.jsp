<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="position:relative; display:block; border:0px solid black; height:400px;width:540px; margin:0 auto;top:-60px;left:-30px;">
		<form>	
			<table width=540>
				<tr height="10"></tr>
				<tr>
					<td style="width:40px;border-bottom:1px solid black;font-weight:bold; font-size:13px;">답변</td>
				</tr>
				<tr height="10"></tr>
				<tr>
					<td colspan="2">
						<textarea cols="80" rows="22" id="content" name="content" readonly="readonly">${Inquiry.content}</textarea>
					</td>
				</tr>
				<tr height="10"></tr>
				<tr align="center">
					<td colspan="2">
						<input type="button" value="뒤로가기" onclick="inqueryList()" style="width:80px;height:30px; font-size:13px; color:white;background-color:black;border-radius:20px;border:0;">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>