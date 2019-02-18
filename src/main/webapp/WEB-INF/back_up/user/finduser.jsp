<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>FindUser</title>
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>
	<h1 class="text-center">아이디/암호 찾기</h1>
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<form class="form-horizontal">
					<h2 class="text-center">아이디 찾기</h2>
					<div class="form-group">
						<label class="col-xs-3 control-label">이름</label>
						<div class="col-xs-6">
							<input id="name" name="name" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">전화번호</label>
						<div class="col-xs-6">
							<input id="phone_id" name="phone_id" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">이메일</label>
						<div class="col-xs-6">
							<input id="email_id" name="email_id" class="form-control" />
						</div>
					</div>
					<div class="forum-group">
						<div class="col-xs-4 col-xs-offset-4">
							<button type="button" id="id-btn" class="btn btn-success form-control" onclick="findId();">
								메일로 보내기
							</button>
						</div>
						<div class="col-xs-6 col-xs-offset-4">
							<c:if test="${idError != null }">
						  <span class="text-danger">${idError }</span>
						  </c:if>
						</div>
					</div>
				</form>
			</div>
			<div class="col-sm-6">
				<form action="/user/finduser/password" class="form-horizontal">
					<h2 class="text-center">암호 찾기</h2>
					<div class="form-group">
						<label class="col-xs-3 control-label">아이디</label>
						<div class="col-xs-6">
							<input id="id" name="id" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">전화번호</label>
						<div class="col-xs-6">
							<input id="phone_pwd" name="phone_pwd"  name class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 control-label">이메일</label>
						<div class="col-xs-6">
							<input id="email_pwd" name="email_pwd" class="form-control" />
						</div>
					</div>
					<div class="forum-group">
						<div class="col-xs-4 col-xs-offset-4">
							<button type="button" id="pwd-btn" class="btn btn-success form-control" onclick="findPassword();">
								메일로 보내기
							</button>
						</div>
						<div class="col-xs-6 col-xs-offset-4">
							<c:if test="${passwordError != null }">
						  <span class="text-danger">${passwordError }</span>
						  </c:if>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 	<script>
 		function findId(){
 			$("#id-btn").attr("disabled","disabled");
 			$("#id-btn").text("전송중...");
 			$.ajax({
 				url:"/user/finduser/id",
 				type:"post",
 				data:{name:$("#name").val(), phone:$("#phone_id").val(), email:$("#email_id").val()},
 				success:function(data){
 					if(data == "fail"){
 						alert('전송실패, 존재하지 않는 회원입니다.');
 					}else if(data == "success"){
 						alert('전송성공, 이메일을 확인해주세요.');
 					}else if(data == "error"){
 						alert('전송실패, 오류입니다. 관리자에게 문의하세요');
 					}
 					$("#id-btn").removeAttr("disabled");
					$("#id-btn").text("메일로 보내기");
 				}
 			});
 		}
 		
 		function findPassword(){
 			$("#pwd-btn").attr("disabled","disabled");
 			$("#pwd-btn").text("전송중...");
 			$.ajax({
 				url:"/user/finduser/password",
 				type:"post",
 				data:{id:$("#id").val(), phone:$("#phone_pwd").val(), email:$("#email_pwd").val()},
 				success:function(data){
 					if(data == "fail"){
 						alert('전송실패, 존재하지 않는 회원입니다.');
 					}else if(data == "success"){
 						alert('전송성공, 이메일을 확인해주세요.');
 					}else if(data == "error"){
 						alert('전송실패, 오류입니다. 관리자에게 문의하세요');
 					}
 					$("#pwd-btn").removeAttr("disabled");
					$("#pwd-btn").text("메일로 보내기");
 				}
 			});
 		}
 	</script>
</body>
</html>