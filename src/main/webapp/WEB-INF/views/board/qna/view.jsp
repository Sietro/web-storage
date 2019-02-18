<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<base href="/">
<title>QnA</title>
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
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
<body id="page-top">
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
			<jsp:include page="/WEB-INF/views/common/topbar.jsp"/>
			     <!-- Begin Page Content -->
			     <div class="container-fluid">
			       <!-- Page Heading -->
			       <h1 class="h3 mb-2 text-gray-800">QnA</h1>
			       <!-- DataTales Example -->
			       <div class="card shadow mb-4">
				       <div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">${board.title }</h6>
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
			         <div class="card-body" style="height:300px;">
									${board.content }
			         </div>
			         <div class="card-footer text-right" style="padding: 20px;">
			         	<c:if test="${board.users_id eq sessionScope.user.id || sessionScope.user.id eq 'admin'}">
								<a href="/board/qna/update?id=${board.id }" class="btn btn-warning">수정</a>
								<a href="/board/qna/delete?id=${board.id }" class="btn btn-danger">삭제</a>
								</c:if>
								<a href="/board/qna/list?page=${sessionScope.page }" class="btn btn-info">목록</a>
			         </div>
			       </div>
						    <div class="container-fluid" style="width: 80%">
							<div class="reply-form">
								<h4>Leave a Comment</h4>
								<form action="/reply/qna/insert" method="post">
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
											<form action="/reply/qna/rereply" method="post">
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
			     <!-- /.container-fluid -->
			   </div>
	     <!-- End of Main Content -->
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
  				$("#summernote").summernote('editor.insertImage', data.url);
  			},error:function(error){
  				console.error(error);
  			}
  		});
  	}
 </script>
</body>
</html>