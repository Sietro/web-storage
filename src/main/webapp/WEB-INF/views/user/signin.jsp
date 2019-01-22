<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	<div class="header">
		<h1 class="text-center">Web Storage</h1>
	</div>
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-sm-5 col-sm-offset-3">
					<form:form action="/user/signin" method="post" modelAttribute="user" class="form form-horizontal">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
						<c:if test="${fail != null }">
				  	<script>
				  		alert('${fail}');
				  	</script>
						</c:if>
						<c:if test="${signout != null }">
				  	<script>
				  		alert('${signout}');
				  	</script>
						</c:if>
						<div class="col-xs-9">
							<div class="row">
								<div class="form-group">
									<form:label path="id" class="control-label col-xs-4 text-center">아이디</form:label>
									<div class="col-xs-8">
										<form:input path="id" name="id" class="form-control" />
										<form:errors path="id" class="text-danger"/>											
									</div>
								</div>	
							</div>
							<div class="row">
								<div class="form-group">
									<form:label path="password" class="control-label col-xs-4 text-center" >암호</form:label>
									<div class="col-xs-8">
										<form:password path="password" name="password" class="form-control" />
										<form:errors path="password" class="text-danger"/>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-5 col-xs-offset-2 text-right">
									<a href="/user/signup">회원가입</a>
								</div>
								<div class="col-xs-5">
									<a href="/user/finduser">아이디/암호 찾기</a>
								</div>
							</div>
						</div>
						<div class="col-xs-3">
							<div class="form-group">
								<button class="btn btn-info btn-block">로그인</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
	</div>
	
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>