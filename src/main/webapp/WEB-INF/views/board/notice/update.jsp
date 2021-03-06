<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<base href="/">
<title>Notice</title>
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
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
	         <h1 class="h3 mb-2 text-gray-800">Notice</h1>
	         <!-- DataTales Example -->
	         <div class="card shadow mb-4">
	           <div class="card-header py-3">
	             <h6 class="m-0 font-weight-bold text-primary">글수정</h6>
	           </div>
	           <div class="card-body" id="summernote">
          		<form:form action="/board/notice/update" method="post" modelAttribute="board">
								<sec:csrfInput/>
								<form:hidden path="id" />
								<div class="form-group">
									<form:input class="form-control" path="title" placeholder="제목을 입력해 주세요"/>
									<form:errors path="title" class="error text-danger" />
								</div>
								<hr />
								<div class="form-group">
									<form:textarea class="form-control" 
															 id="content" 
															 path="content"
															 style="height: 500px;"
								 							 placeholder="내용을 입력해 주세요"></form:textarea>
								<form:errors path="content" class="error text-danger" />
								</div>
								<div class="form-group text-right">
									<button class="btn btn-primary" type="submit">수정</button>
								</div>
							</form:form>
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
	 			alert("제목을 입력해 주세요");
	 			f.title.focus();
	 			return;
	 		}
	 		if(f.content.value == ""){
	 			alert("내용을 입력해 주세요");
	 			$(".note-editable").focus();
	 			return;
	 		}
	 		f.submit();
	 	}
	 
	 	$("#summernote").summernote({
	  		height:450,
	  		disableResizeEditor:true,
	  		lang: 'ko-KR',
	 		  popover: {
	 	         image: [],
	 	         link: [],
	 	         air: []
	 	    },
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
	 				$("#summernote").summernote('editor.insertImage', data.url);
	 			},error:function(error){
	 				console.error(error);
	 			}
	 		});
	 	}
	 </script>
</body>
</html>



