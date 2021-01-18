<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scal=1">
	<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP AJAX</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</head>
<body>
<br>
	<div class="container">
		<div class="form-group row pull-right">
			<div class="col-xs-8">
				<!-- onkeypu = 입력할 때마다 메소드 실행 -->
				<input class="form-control" id="userName"  onkeyup="searchFunction()" type="text" size="20">
			</div>
			<div class="col-xs-2">
				<!-- onclick = 입력하면 메소드 실행 -->
				<button class="btn btn-primary" onclick="searchFunction();" type="button">검색</button>
			</div>
		</div>
		
		<table class="table" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th style="background-color: #fafafa; text-align: center;">이름</th>
					<th style="background-color: #fafafa; text-align: center;">나이</th>
					<th style="background-color: #fafafa; text-align: center;">성별</th>
					<th style="background-color: #fafafa; text-align: center;">이메일</th>
				</tr>
			</thead>
			<tbody id="ajaxTable">
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>