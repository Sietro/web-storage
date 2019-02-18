<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
	<div class="content">
		<div class="container">
			<div class="row" style="padding-bottom:20px">
				<h2 class="text-center" style="padding-bottom:10px">Notice</h2>
			</div>
			<div class="row">
				<table class="table table-hover table-board">
					<thead>
						<tr>
							<th width="10%">번호</th>
							<th width="40%">제목</th>
							<th width="20%">작성자</th>
							<th width="20%">작성일</th>
							<th width="10%">조회수</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="board" items="${boardList}">
						<tr style="cursor:pointer;" onclick="location.href='/board/notice/view?id=${board.id}'">
							<td>${board.id }</td>
							<td>${board.title }</td>
							<td>${board.users_id }</td>
							<td>${board.regdate }</td>
							<td>${board.hit }</td>
						</tr>
					</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5" class="text-right">
								<a href="/board/notice/insert" class="btn btn-primary">글쓰기</a>
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



