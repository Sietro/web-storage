<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<base href="/">
<title>Sign Up</title>
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body class="bg-gradient-primary">
	<div class="container">
		<div class="row justify-content-center">
	  	<div class="col-xl-10 col-lg-12 col-md-9">
	    	<div class="card o-hidden border-0 shadow-lg my-5">
	      	<div class="card-body p-0">
	        	<div class="row justify-content-center">
	          	<div class="col-lg-9">
	            	<div class="p-5">
		              <div class="text-center">
		                <h1 class="h1 text-gray-800 mb-4">Sign Up</h1>
		              </div>
		              <form:form action="/user/signup" method="post" modelAttribute="user">
									<sec:csrfInput/>
									<div class="form-group">
										<div class="input-group">
											<form:input path="id" class="form-control form-control-user" placeholder="Enter ID" />
											<span class="input-group-btn">
												<button type="button" class="btn btn-info" onclick="dualCheck();">중복확인</button>	
											</span>
										</div>
										<form:errors path="id" class="text-danger" />
									</div>
									<div class="form-group">
										<form:password path="password" id="" class="form-control form-control-user" placeholder="Password" />
										<form:errors path="password" class="text-danger" />
									</div>
									<div class="form-group">
										<form:password path="passwordchk" id="" class="form-control form-control-user" placeholder="Password Confirm" />
										<form:errors path="passwordchk" class="text-danger" />
									</div>
									<div class="form-group">
										<form:input path="name" class="form-control form-control-user" placeholder="Name" />
										<form:errors path="name" class="text-danger" />
									</div>
									<div class="form-group">
										
										<label class="control-label">Gender  </label>
										<div class="btn-group" data-toggle="buttons">
											<label class="btn">
												<span class="icon text-gray-600">
													<form:radiobutton path="gender" value="m" />남성
		                    </span>
											</label>
											<label class="btn">
												<span class="icon text-gray-600">
													<form:radiobutton path="gender" value="f" />여성
		                    </span>
											</label>
										</div>
										<div class="form-group">
											<form:errors path="gender" class="text-danger" />
										</div>
									</div>
									<div class="form-group">
										<div class="row justify-content-around">
											<div class="col-xl-2" style="padding: 0;">
												<label class="control-label">전화번호</label>
											</div>
											<div class="col-xl-3 d-inline-block" style="padding: 1px;">
												<select id="phone1" class="form-control" onchange="makePhone();">
													<option value="010">010</option>
													<option value="011">011</option>
													<option value="019">016</option>
												</select>
											</div>
											<div class="col-xl-3 d-inline-block" style="padding: 1px;">
												<input class="form-control" name="phone2" id="phone2" maxlength="4" onkeyup="makePhone();"
												value="${requestScope.phone2 }"/>
											</div>
											<div class="col-xl-3 d-inline-block" style="padding: 1px;">
												<input class="form-control" name="phone3" id="phone3" maxlength="4" onkeyup="makePhone();"
												value="${requestScope.phone3 }"/>
											</div>
										</div>
										<form:hidden path="phone" id="phone" value="${requestScope.phone }" />
										<form:errors path="phone" class="text-danger" />
									</div>
									<div class="form-group">
								 		<div class="input-group">
								  		<form:input path="email" 
								 								id="email" 
								 								class="form-control form-control-user"
								 								placeholder="E-mail"/>
									 		<span class="input-group-btn">
												<button type="button" 
																class="btn btn-info btn-block" 
																id="email-btn" 
																onclick="emailCertify();">
									  			Send Code
									  		</button>
											</span>
											<div class="col-lg-3">
											<input name="certifyCode"
														 class="form-control" 
													 	 placeholder="Certify Code"
														 value="${requestScope.certifyCode }" />
											</div>
										</div>
								  	<div>
								  		<form:errors path="email" class="text-danger" />
								  		<span id="email-error" class="text-danger"></span>
								  	</div>
							  	</div>
									<div class="form-group">
										<label class="control-label">주소</label>
										<div class="col-lg-12">
											<div class="input-group">
												<form:input path="postcode" id="postcode" class="form-control" 
																		placeholder="우편번호" readonly="true" />
												<span class="input-group-btn">
													<button type="button" class="btn btn-info" onclick="daumPostcode()">검색</button>
												</span>
											</div>
											<form:errors path="postcode" class="text-danger" />
											<br />
											<input class="form-control" name="address1" id="address1" readonly="readonly" 
											value="${requestScope.address1 }" />
											<br />
											<input class="form-control" name="address2" id="address2" placeholder="상세주소" 
											onkeyup="makeAddress();" value="${requestScope.address2 }"/>
											<form:hidden path="address" id="address" value="${requestScope.address }" />
											<form:errors path="address" class="text-danger"  />
										</div>
									</div>
									<div class="row justify-content-around">
										<div class="col-lg-10">
											<button type="submit" class="btn btn-success btn-user btn-block">가입하기</button>
										</div>
									</div>
									<br />
									<div class="row justify-content-around">
										<div class="col-lg-10">
											<a href="/user/signin" class="btn btn-danger btn-user btn-block">취소</a>
										</div>
									</div>
								</form:form>
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
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js" ></script>
 	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
 	<script>
 		function makePhone(){
 			$("#phone").val($("#phone1").val()+$("#phone2").val()+$("#phone3").val());
 		}
 		
 		function makeAddress(){
 			$("#address").val($("#address1").val()+" "+$("#address2").val());
 		}
 	
 		function dualCheck(){
 			$.ajax({
				url:"/user/dualcheck",
				type:"post",
				data:{id:$("#id").val()},
				beforeSend: function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}")
				},
				success:function(data){
					if(data == 'exist'){
						alert("존재하는 아이디 입니다.");
					}else if(data == 'notexist'){
						alert("사용 가능한 아이디 입니다.");
					}else if(data == 'null'){
						alert("아이디를 입력해주세요.");
					}
				}
 			});
 		}
 		
 		function emailCertify(){
 			$("#email-btn").attr("disabled","disabled");
 			$("#email-btn").text("전송중...");
 			$.ajax({
 				url:"/user/emailcertify",
 				type:"post",
 				data:{email:$("#email").val()},
 				beforeSend: function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}")
				},
 				success:function(data){
					if(data == 'null'){
						$("#email-error").text("이메일을 입력해주세요.");
					}else if(data == 'duplicated'){
						$("#email-error").text("이미 가입되어있는 이메일 주소입니다.");
					}else if(data == 'error'){
						$("#email-error").text("이메일 형식이 올바르지 않습니다.");
					}else if(data == 'success'){
						alert("발송완료");
					}
					$("#email-btn").removeAttr("disabled");
					$("#email-btn").text("인증메일 발송");
 				}
 			});
 		}
 	
	 	function daumPostcode(){
			new daum.Postcode({
				oncomplete:function(data){
					$("#postcode").val(data.zonecode);
					$("#address1").val(data.roadAddress+"("+data.buildingName+")");
					$("#address").append($("#address1").val());
				}
			}).open();
		}
 	</script>
</body>
</html>