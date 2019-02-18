<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Web-Storage</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<style>
	.reply{
		padding: 10px;
		border: 1px solid white;
		border-radius: 3px;
	}
	.reply+.reply{
		margin-top: 10px;
	}
	.reply-header{
		color:#286090;
	}
	.reply-body{
		padding: 10px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
	<div class="content">
		<div class="container-fluid" style="width: 80%">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4>${board.title }</h4>
					<hr style="margin: 5px 0" />
					<div class="text-right">
						<span class="glyphicon glyphicon-user"></span>
						${board.users_id }
						&nbsp;&nbsp;
						<span class="glyphicon glyphicon-time"></span>
						${board.regdate }
						&nbsp;&nbsp;
						<span class="badge">${board.hit }</span>
					</div>
				</div>
				<div class="panel-body">
					${board.content }
				</div>
				<div class="border-footer text-right" style="padding: 20px;">
				<c:if test="${board.users_id eq sessionScope.user.id || sessionScope.user.id eq 'admin'}">
					<a href="/board/notice/update?id=${board.id }" class="btn btn-warning">수정</a>
					<a href="/board/notice/delete?id=${board.id }" class="btn btn-danger">삭제</a>
				</c:if>
					<a href="/board/notice/list?page=${sessionScope.page }" class="btn btn-info">목록</a>
				</div>
			</div>
			<div class="reply-form">
				<h4>Leave a Comment</h4>
				<form action="/reply/notice/insert" method="post">
					<sec:csrfInput/>
					<input type="hidden" name="board_id" value="${board.id }"/>
					<div class="form-group">
						<textarea name="content" rows="3" class="form-control" required></textarea>
					</div>
					<div class="form-group text-right">
						<button type="submit" class="btn btn-info">등록</button>
					</div>
				</form>
				<div class="reply-list">
					<p>
						<span class="badge">${fn:length(board.replyList) }</span> Comment(s) exist
					</p>
					<c:forEach var="reply" items="${board.replyList }">
					<div class="reply" style="margin-left:${reply.depth*30}px">
						<div class="reply-header">
							<span class="glyphicon glyphicon-user"></span> ${reply.users_id } &nbsp;&nbsp;
							<span class="glyphicon glyphicon-time"></span> ${reply.regdate } &nbsp;&nbsp;
							<button type="button" class="btn btn-info btn-xs" data-toggle="collapse"
								data-target="#form_${reply.id }">
								댓글
							</button>							
						</div>
						<div class="reply-body">
							<c:if test="${reply.depth != 0 }">
								<i class="fas fa-reply" style="transform: rotate(180deg)"></i>
							</c:if>
							${reply.content }
						</div>
						<div class="rereply-form collapse" id="form_${reply.id }" >
							<form action="/reply/notice/rereply" method="post">
								<input type="hidden" name="board_id" value="${board.id }"/>
								<input type="hidden" name="ref" value="${reply.id }"/>
								<sec:csrfInput/>
								<div class="form-group">
									<textarea name="content" rows="3" class="form-control" required></textarea>
								</div>
								<div class="form-group text-right">
									<button type="submit" class="btn btn-info">댓글등록</button>
								</div>
							</form>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/lang/summernote-ko-KR.min.js"></script>
  <script>
  	function checkForm(f){
  		if(f.title.value == ""){
  			alert("제목을 입력하세요.");
  			f.title.focus();
  			return
  		}
  		if(f.content.value ==""){
  			alert("내용을 입력하세요.");
  			$(".note-editable").focus();
  			return
  		}
  		f.submit();
  	}
  
  	$("#content").summernote({
  		height:400,
  		disableResizeEditor:true,
  		lang: 'ko-KR',
  		callbacks:{
  			onImageUpload:sendFile,
  			onMediaDelete:deleteFile
  		}
  	});
  	
  	function deleteFile(target){
  		var src = target[0].src.substring(21);
  		console.log("src",src);
  		$.ajax({
  			url:"/filedelete",
  			type:"post",
  			data:{src:src},
  			success:function(data){
  				console.log(data);
  			}
  		});
  	}
  	
  	function sendFile(files, editor, welEditable){
  		var data = new FormData();
  		data.append('upload', files[0]);
  		$.ajax({
  			url:"/fileupload",
  			contentType:false,
  			processData:false,
  			data:data,
  			type:"post",
  			success:function(data){
  				$("#content").summernote('editor.insertImage', data.url);
  			},error:function(error){
  				console.error(error);
  			}
  		});
  	}
 </script>
</body>
</html>