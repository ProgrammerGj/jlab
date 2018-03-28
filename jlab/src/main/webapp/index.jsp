<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#btnLogIn").on("click", function() {
			LoginCheck();
		});
		$("#btnSingUp").on("click", function(){
			location.href= "/signUp.do";
		});
	});
</script>
<style type="text/css">
	#block {
		width: 970px;
		margin: auto;
		text-align: center;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>
	<div id="block">
		<div class="form-horizontal">
			<div class="form-group">
				<div class="col-sm-5">
					<input type="text" class="form-control input-sm" id="txtId"
						placeholder="ID">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-5">
					<input type="password" class="form-control input-sm" id="txtPW"
						placeholder="Password">
				</div>
			</div>
			<div class="form-group">
				<div class="brn-group">
					<button id="btnLogIn" class="col-sm-3 btn btn-success">Log-In</button>
					<button id="btnSingUp" class="col-sm-3 btn btn-primary">Sign-Up</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function LoginCheck() {
		var id = $("#txtId").val();
		var pass = $("#txtPW").val();

		if (id.length < 1) {
			alert("아이디를 입력하지 않았습니다.");
			return false;
		}
		if (pass.length < 1) {
			alert("비밀번호를 입력하지 않았습니다.");
			return false;
		}
		$.ajax({
			url : "/loginCheck.do",
			type : 'POST',
			dataType : 'json',
			data : {
				id : id,
				pass : pass
			},
			success : function(result) {
				$("#txtId").val("");
				$("#txtPW").val("");
				location.href = "/memberList.do?parentNo=" + result.data.parentNo;
			}
		});
	}
</script>
</html>