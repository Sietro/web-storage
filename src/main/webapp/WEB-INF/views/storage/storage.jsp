<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
	<h1>Storage</h1>
	<sec:authentication property="principal.username" var="username"/>
	<p>${username }님 안녕하세요</p>
	<%-- <ul>
		<c:forEach items="${storageList }" var="storage">
			<c:if test="${storage.fs_pid != null }">
			<li><a href="/storage/parent?fs_pid=${storage.fs_pid }">..</a></li>
			</c:if>
			<c:if test="${storage.type eq 'd' }">
			<li><a href="/storage/sub?fs_uid=${storage.fs_uid }">${storage.name }</a></li>
			</c:if>
			<c:if test="${storage.type eq 'f' }">
			<li><a href="/storage/file">${storage.name }</a></li>
			</c:if>
		</c:forEach>
	</ul> --%>
	<ul>
		<c:forEach items="${storageList }" var="storage">
			<c:if test="${storage.fs_pid != null }">
			<li>
				<form:form action="/storage/parant" method="post" modelAttribute="storage">
					<sec:csrfInput/>
					<form:hidden path="users_id" value="${storage.users_id }"/>
					<form:hidden path="fs_uid" value="${storage.fs_uid }"/>
					<form:hidden path="fs_pid" value="${storage.fs_pid }"/>
					<form:hidden path="name" value="${storage.name }"/>
					<form:hidden path="type" value="${storage.type }"/>
					<button type="submit">..</button>
				</form:form>
			</li>
			</c:if>
			<c:if test="${storage.type eq 'd' }">
			<li>
				<form:form action="/storage/sub" method="post" modelAttribute="storage">
					<sec:csrfInput/>
					<form:hidden path="users_id" value="${storage.users_id }"/>
					<form:hidden path="fs_uid" value="${storage.fs_uid }"/>
					<form:hidden path="fs_pid" value="${storage.fs_pid }"/>
					<form:hidden path="name" value="${storage.name }"/>
					<form:hidden path="type" value="${storage.type }"/>
					<button type="submit">${storage.name }</button>
				</form:form>
			</li>
			</c:if>
			<c:if test="${storage.type eq 'f' }">
			<li>
				<form:form action="/storage/file" method="post" modelAttribute="storage">
					<sec:csrfInput/>
					<form:hidden path="users_id" value="${storage.users_id }"/>
					<form:hidden path="fs_uid" value="${storage.fs_uid }"/>
					<form:hidden path="fs_pid" value="${storage.fs_pid }"/>
					<form:hidden path="name" value="${storage.name }"/>
					<form:hidden path="type" value="${storage.type }"/>
					<button type="submit">${storage.name }</button>
				</form:form>
			</li>
			</c:if>
		</c:forEach>
	</ul>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>