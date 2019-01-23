<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a href="/main" class="navbar-brand">WebStorage</a>
		</div>
		<div class="collapse navbar-collapse" id="navbar">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/main"><span class="glyphicon glyphicon-cloud"></span> Storage</a></li>
				<li><a href="/board/notice"><span class="glyphicon glyphicon-list"></span> Notice</a></li>
				<li><a href="/board/qna"><span class="glyphicon glyphicon-list"></span> QnA</a></li>
				<sec:authorize access="hasRole('ROLE_USER')">
				<li><a href="/user/mypage"><span class="glyphicon glyphicon-user"></span> Mypage</a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
				<li><a href="/manage"><span class="glyphicon glyphicon-wrench"></span> Manage</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
				<form hidden="true" action="/user/signout" method="post" id="signoutForm">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
				<li><a href="javascript:formSubmit()"><span class="glyphicon glyphicon-log-out"></span> SignOut</a></li>
				</sec:authorize>
			</ul>
		</div>
	</div>
</div>
<script>
	function formSubmit() {
		$("#signoutForm").submit();
	}
</script>