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

	<script type="text/javascript">
	
	// 웹사이트에 요청을 보내는 XMLHttpReqeust() 생성
	var request = new XMLHttpRequest();
	
	function searchFunction(){
		request.open("post", "./UserSearchServlet?userName=" + encodeURIComponent(document.getElementById("userName").value), true);
		request.onreadystatechange = searchProcess;
		request.send(null);
	}
	
	function searchProcess(){
		// 출력할 위치 지정
		var table = document.getElementById("ajaxTable");
			table.innerHTML = ""; // 내부 정보 다 지워서 초기화
			
			if(request.readyState == 4 && request.status == 200){
				var object = eval('(' + request.responseText + ')'); // 서버에서 받은 JSON 데이터 담기
				var result = object.result; // 받은 JSON 안에서 result 관련 데이터만 추림
				
				for(var i=0; i<result.length; i++){
					var row = table.insertRow(0); // 테이블 행 삽입
					for(var j=0; j<result[i].length; j++){ // 각 행에 입력될 탐색
						var cell = row.insertCell(j); // 테이블 열 삽입
						cell.innerHTML = result[i][j].value; // 데이터 삽입
					}
				}
			}
		}
	
	// / / / / / / 회원 등록  / / / / / / //
	
	var registerRequest = new XMLHttpRequest();
	
	function registerFunction(){
		registerRequest.open("post", "./UserRegisterServlet?registerName=" + encodeURIComponent(document.getElementById("registerName").value) +
				"&registerAge=" + encodeURIComponent(document.getElementById("registerAge").value) +
				"&registerGender=" + encodeURIComponent($('input[name=registerGender]:checked').val()) +
				"&registerEmail=" + encodeURIComponent(document.getElementById("registerEmail").value), true);
		
		// 통신이 성공적으로 이뤄지면 다음 명령 실행
		registerRequest.onreadystatechange = registerProcess;
		registerRequest.send(null);
	}
	
	function registerProcess(){
		if(registerRequest.readyState == 4 && registerRequest.status == 200){
			var result = registerRequest.responseText;
			if(result != 1){
				alert("등록에 실패했습니다!")
			} else{
				var userName = document.getElementById("userName");
				var registerName = document.getElementById("registerName");
				var registerAge = document.getElementById("registerAge");
				var registerEmail = document.getElementById("registerEmail");
				userName.value = "";
				registerName.value = "";
				registerAge.value = "";
				registerEmail.value = "";
			}
		}
	}
	
	// 페이지가 열리자 마자 실행 
	window.onload = function(){
		searchFunction();
	}
	</script>
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
	
	<div class="container">
		<table class="table" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="2" style="background-color: #fafafa; text-align:center;">회원 등록 양식</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="background-color: #fafafa; text-align: center;"><h5>이름</h5></td>
					<td><input class="form-control" type="text" id="registerName" size="20"></td>
				</tr>
				<tr>
					<td style="background-color: #fafafa; text-align: center;"><h5>나이</h5></td>
					<td><input class="form-control" type="text" id="registerAge" size="20"></td>
				</tr>
				<tr>
					<td style="background-color: #fafafa; text-align: center;"><h5>성별</h5></td>
					<td>
						<div class="form-group" style="text-align: center; margin:0 auto;">
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-primary active">
									<input type="radio" name="registerGender" autocomplete="off" value="남자" checked>남자
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="registerGender" autocomplete="off" value="여자">여자
								</label>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color: #fafafa; text-align: center;"><h5>이메일</h5></td>
					<td><input class="form-control" type="text" id="registerEmail" size="20"></td>
				</tr>
				<tr>
					<td colspan="2"><button class="btn btn-primary pull-right" onclick="registerFunction();">등록</button>
				</tr>								
			</tbody>
		</table>
	</div>
</body>
</html>