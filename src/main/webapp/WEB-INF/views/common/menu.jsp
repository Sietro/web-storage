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
				<li><a href="/user/signup"><span class="glyphicon glyphicon-user"></span> Storage</a></li>
				<li><a href="/user/signin"><span class="glyphicon glyphicon-log-in"></span> Board</a></li>
				<li><a href="/user/mypage"><span class="glyphicon glyphicon-menu-hamburger"></span> Mypage</a></li>
				<sec:authorize access="isAuthenticated()">
				<form hidden="true" action="/user/signout" method="post" id="signoutForm">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
				<li><a href="javascript:formSubmit()"><span class="glyphicon glyphicon-log-out"></span> Sign Out</a></li>
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