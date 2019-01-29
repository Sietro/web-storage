<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="row">
				<h2 class="text-center">회원 가입</h2>
			</div>
			<div class="row">
				<form:form action="/user/signup" method="post" modelAttribute="user" class="form-horizontal">
					<sec:csrfInput/>
					<div class="form-group">
						<form:label path="id" class="col-xs-3 col-xs-offset-1 control-label">아이디</form:label>
						<div class="col-xs-4">
							<div class="input-group">
								<form:input path="id" class="form-control" id="id" />
								<span class="input-group-btn">
									<button type="button" class="btn btn-info" onclick="dualCheck();">중복확인</button>	
								</span>
							</div>
							<form:errors path="id" class="text-danger" />
						</div>
					</div>
					<div class="form-group">
						<form:label path="password" class="col-xs-3 col-xs-offset-1 control-label">패스워드</form:label>
						<div class="col-xs-4">
							<form:password path="password" id="" class="form-control" />
							<form:errors path="password" class="text-danger" />
						</div>
					</div>
					<div class="form-group">
						<form:label path="passwordchk" class="col-xs-3 col-xs-offset-1 control-label">패스워드확인</form:label>
						<div class="col-xs-4">
							<form:password path="passwordchk" id="" class="form-control" />
							<form:errors path="passwordchk" class="text-danger" />
						</div>
					</div>
					<div class="form-group">
						<form:label path="name" class="col-xs-3 col-xs-offset-1 control-label">이름</form:label>
						<div class="col-xs-4">
							<form:input path="name" class="form-control" />
							<form:errors path="name" class="text-danger" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 col-xs-offset-1 control-label">성별</label>
						<div class="col-xs-4">
							<label for="male" class="radio-inline">
								<form:radiobutton path="gender" value="m" />남성
							</label>
							<label for="female" class="radio-inline">
								<form:radiobutton path="gender" value="f" />여성
							</label>
						</div>
						<div class="col-xs-8 col-xs-offset-4">
							<form:errors path="gender" class="text-danger" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-3 col-xs-offset-1 control-label">전화번호</label>
						<div class="col-xs-8">
							<div class="col-xs-2 phone" style="padding-left: 0;">
								<select id="phone1" class="form-control" onchange="makePhone();">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="019">016</option>
								</select>
							</div>
							<div class="col-xs-2">
								<input class="form-control" name="phone2" id="phone2" maxlength="4" onkeyup="makePhone();"
								value="<%=request.getParameter("phone2") %>"/>
							</div>
							<div class="col-xs-2">
								<input class="form-control" name="phone3" id="phone3" maxlength="4" onkeyup="makePhone();"
								value="<%=request.getParameter("phone3") %>"/>
							</div>
						</div>
						<div class="col-xs-6 col-xs-offset-4">
							<form:hidden path="phone" id="phone" value="${requestScope.phone }" />
							<form:errors path="phone" class="text-danger" />
						</div>
					</div>
					<div class="form-group">
			  		<form:label path="email" class="col-xs-3 col-xs-offset-1 control-label">Email</form:label>
				  	<div class="col-xs-4">
				  		<div class="input-group">
					  		<form:input path="email" id="email" class="form-control"/>
					  		<span class="input-group-btn">
									<button type="button" class="btn btn-info btn-block" id="email-btn" onclick="emailCertify();">
						  			인증메일 발송
						  		</button>
								</span>
				  		</div>
				  	</div>
				  	<div class="col-xs-2">
				  		<input name="certifyCode" class="form-control" placeholder="인증코드 입력"
				  			value="<%=request.getParameter("certifyCode") %>" />
				  	</div>
				  	<div class="col-xs-4 col-xs-offset-4">
				  		<form:errors path="email" class="text-danger" />
				  		<span id="email-error" class="text-danger"></span>
				  	</div>
			  	</div>
					<div class="form-group">
						<label class="col-xs-3 col-xs-offset-1 control-label">주소</label>
						<div class="col-xs-4">
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
							value="<%=request.getParameter("address1") %>" />
							<br />
							<input class="form-control" name="address2" id="address2" placeholder="상세주소" 
							onkeyup="makeAddress();" value="<%=request.getParameter("address2") %>"/>
							<form:hidden path="address" id="address" value="${requestScope.address }" />
							<form:errors path="address" class="text-danger"  />
						</div>
					</div>
					<div class="row">
						<hr class="col-xs-5 col-xs-offset-3" />
					</div>
					<div class="form-group">
						<div class="col-xs-2 col-xs-offset-4">
							<button type="submit" class="btn btn-success form-control">가입하기</button>
						</div>
						<div class="col-xs-2">
							<a href="/user/signin" class="btn btn-danger form-control">취소</a>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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