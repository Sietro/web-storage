<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<base href="/">
<title>FindUser</title>
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<style>
	.find-form{
		padding: 0px;
		display: inline-block;
	}
</style>
</head>
<body class="bg-gradient-primary">
	<div class="container">
		<div class="row justify-content-center">
	  	<div class="col-xl-10 col-lg-12 col-md-9">
	    	<div class="card o-hidden border-0 shadow-lg my-5">
	      	<div class="card-body p-0">
	        	<div class="row">
	          	<div class="col-lg-12">
	            	<div class="p-5">
	              <div class="text-center">
	                <h1 class="h1 text-gray-900 mb-4">Fine ID&Password</h1>
	              </div>
	            	<div class="row justify-content-around">
		              <div class="col-lg-5 find-form">
			             	<form class="user">
			             		<h2 class="text-center">Find ID</h2>
											<div class="form-group">
												<div class="col-xs-6">
													<input id="name" name="name" class="form-control form-control-user" placeholder="Name" />
												</div>
											</div>
											<div class="form-group">
												<div class="col-xs-6">
													<input id="phone_id" name="phone_id" class="form-control form-control-user" placeholder="PhoneNum" />
												</div>
											</div>
											<div class="form-group">
												<div class="col-xs-6">
													<input id="email_id" name="email_id" class="form-control form-control-user" placeholder="Email" />
												</div>
											</div>
											<div class="form-group">
												<div class="col-xs-4 col-xs-offset-4">
													<button type="button" id="id-btn" class="btn btn-success btn-user btn-block" onclick="findId();">
														Send Email
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
		              <div class="col-lg-5 find-form">
			             	<form class="user">
			             		<h2 class="text-center">Find Password</h2>
											<div class="form-group">
												<div class="col-xs-6">
													<input id="id" name="id" class="form-control form-control-user" placeholder="ID" />
												</div>
											</div>
											<div class="form-group">
												<div class="col-xs-6">
													<input id="phone_pwd" name="phone_pwd" class="form-control form-control-user" placeholder="PhoneNum" />
												</div>
											</div>
											<div class="form-group">
												<div class="col-xs-6">
													<input id="email_pwd" name="email_pwd" class="form-control form-control-user" placeholder="Email" />
												</div>
											</div>
											<div class="form-group">
												<div class="col-xs-4 col-xs-offset-4">
													<button type="button" id="pwd-btn" class="btn btn-success btn-user btn-block" onclick="findId();">
														Send Email
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
	              <div class="row justify-content-center">
	              	<div class="col-lg-6">
		                <a href="/" class="btn btn-primary btn-user btn-block">Go Signin</a>
	              	</div>
	              </div>
	             </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="/js/sb-admin-2.min.js"></script>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 	<script>
 		function findId(){
 			$("#id-btn").attr("disabled","disabled");
 			$("#id-btn").text("Transmit...");
 			$.ajax({
 				url:"/user/finduser/id",
 				type:"post",
 				data:{name:$("input[name=name]").val(), 
 							phone:$("input[name=phone_id]").val(), 
 							email:$("input[name=email_id]").val()},
				beforeSend: function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}")
				},
 				success:function(data){
 					if(data == "fail"){
 						alert('전송실패, 존재하지 않는 회원입니다.');
 					}else if(data == "success"){
 						alert('전송성공, 이메일을 확인해주세요.');
 					}else if(data == "error"){
 						alert('전송실패, 오류입니다. 관리자에게 문의하세요');
 					}
 					$("#id-btn").removeAttr("disabled");
					$("#id-btn").text("Send Email");
 				}
 			});
 		}
 		
 		function findPassword(){
 			$("#pwd-btn").attr("disabled","disabled");
 			$("#pwd-btn").text("Transmit...");
 			$.ajax({
 				url:"/user/finduser/password",
 				type:"post",
 				data:{id:$("input[name=id]").val(), 
 							phone:$("input[name=phone_pwd]").val(), 
 							email:$("input[name=email_pwd]").val()},
				beforeSend: function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}")
				},
 				success:function(data){
 					if(data == "fail"){
 						alert('전송실패, 존재하지 않는 회원입니다.');
 					}else if(data == "success"){
 						alert('전송성공, 이메일을 확인해주세요.');
 					}else if(data == "error"){
 						alert('전송실패, 오류입니다. 관리자에게 문의하세요');
 					}
 					$("#pwd-btn").removeAttr("disabled");
					$("#pwd-btn").text("Send Email");
 				}
 			});
 		}
 	</script>
</body>
</html>