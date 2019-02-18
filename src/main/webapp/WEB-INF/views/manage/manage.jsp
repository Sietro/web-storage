<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<base href="/">
<title>Manage</title>
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
		<div class="content">
			<div class="panel panel-default">
				<div class="panel-heading">
					<span class="glyphicon glyphicon-user"></span>
					<h4>회원정보 수정</h4>
				</div>
				<div class="panel-body">
					<form:form action="/mypage/update" method="post" modelAttribute="user" class="form-horizontal">
						<sec:csrfInput/>
						<div class="form-group">
							<form:label path="password" class="col-xs-3 col-xs-offset-1 control-label">현재 패스워드</form:label>
							<div class="col-xs-4">
								<form:password path="password" class="form-control" />
								<form:errors path="password" class="text-danger" />
							</div>
						</div>
						<div class="form-group">
							<form:label path="newPassword" class="col-xs-3 col-xs-offset-1 control-label">바꿀 패스워드</form:label>
							<div class="col-xs-4">
								<form:password path="newPassword" class="form-control" />
								<form:errors path="newPassword" class="text-danger" />
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
									value="${requestScope.phone2 }"/>
								</div>
								<div class="col-xs-2">
									<input class="form-control" name="phone3" id="phone3" maxlength="4" onkeyup="makePhone();"
									value="${requestScope.phone3 }"/>
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
					  			value="${requestScope.certifyCode }" />
					  	</div>
					  	<div class="col-xs-4 col-xs-offset-4">
					  		<form:errors path="email" class="text-danger" />
					  		<span id="email-error" class="text-danger"></span>
					  	</div>
				  	</div>
						<div class="row">
							<hr class="col-xs-5 col-xs-offset-3" />
						</div>
						<div class="form-group">
							<div class="col-xs-4 col-xs-offset-4">
								<button type="submit" class="btn btn-success form-control">변경하기</button>
							</div>
						</div>
					</form:form>
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
	<script src="js/sb-admin-2.min.js"></script>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script>
		function makePhone(){
			$("#phone").val($("#phone1").val()+$("#phone2").val()+$("#phone3").val());
		}
	</script>
</body>
</html>





