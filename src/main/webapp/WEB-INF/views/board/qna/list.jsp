<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Web-Storage</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<style>
	.table-board{
		background-color:white;
	}
	.table-board>thead>tr>th, .table-board>tbody>tr>td{
		text-align: center;
		padding: 20px 0;
	}
	tfoot{
		text-align: center;	
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
	<sec:authentication property="principal.username" var="username"/>
	<div class="content">
		<div class="container">
			<div class="row" style="padding-bottom:20px">
				<h2 class="text-center" style="padding-bottom:10px">QnA</h2>
			</div>
			<div class="row">
				<table class="table table-hover table-board">
					<thead>
						<tr>
							<c:if test="${username eq 'admin'}">
							<th width="10%">번호</th>
							<th width="40%">제목</th>
							<th width="20%">작성자</th>
							<th width="20%">작성일</th>
							<th width="10%">조회수</th>
							</c:if>
							<c:if test="${username ne 'admin'}">
							<th width="40%">제목</th>
							<th width="20%">작성자</th>
							<th width="20%">작성일</th>
							<th width="10%">조회수</th>
							</c:if>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="board" items="${boardList}">
						<tr style="cursor:pointer;" onclick="location.href='/board/qna/view?id=${board.id}'">
							<c:if test="${username eq 'admin'}">
							<td>${board.id }</td>
							<td>${board.title }</td>
							<td>${board.users_id }</td>
							<td>${board.regdate }</td>
							<td>${board.hit }</td>
							</c:if>
							<c:if test="${username ne 'admin'}">
							<td>${board.title }</td>
							<td>${board.users_id }</td>
							<td>${board.regdate }</td>
							<td>${board.hit }</td>
							</c:if>
						</tr>
					</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5" class="text-right">
								<a href="/board/qna/insert" class="btn btn-primary">글쓰기</a>
							</td>
						</tr>
						<tr>
							<td colspan="5" style="border-top:none;">
								<ul class="pagination">
									${pageHTML }
								</ul>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>



