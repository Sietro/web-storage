<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<base href="/">
<title>SignIn</title>
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
	          	<div class="col-lg-8">
	            	<div class="p-5">
		              <div class="text-center">
		                <h1 class="h4 text-gray-900 mb-4">Web Storage</h1>
		              </div>
		             	<form:form action="/user/signin" method="post" modelAttribute="user">
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
			              <div class="form-group">
											<form:input path="id" class="form-control form-control-user" placeholder="Enter ID" />
											<form:errors path="id" class="text-danger"/>											
			              </div>
			              <div class="form-group">
											<form:password path="password" class="form-control form-control-user" placeholder="Password" />
											<form:errors path="password" class="text-danger"/>
			              </div>
			              <div class="form-group">
			                <div class="custom-control custom-checkbox small">
			                  <input type="checkbox" class="custom-control-input" id="customCheck">
			                  <label class="custom-control-label" for="customCheck">Remember Me</label>
			                </div>
			              </div>
									<button class="btn btn-primary btn-user btn-block">Login</button>
			              <hr>
			            </form:form>
				            <hr>
			            <div class="text-center">
			              <a class="small" href="/user/signup">Create an Account!</a>
			            </div>
			            <div class="text-center">
				              <a class="small" href="/user/finduser">Forgot Password?</a>
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
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js" ></script>
</body>
</html>