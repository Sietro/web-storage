<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
	             <h6 class="m-0 font-weight-bold text-primary">문의게시판</h6>
	           </div>
	           <div class="card-body">
	             <div class="table-responsive">
	               <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
	                   <tr class="text-primary" style="cursor:pointer;" onclick="location.href='/board/qna/view?id=${board.id}'">
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
											<td colspan="5" style="border-top:none;margin: 0 auto;">
												<div>
													<ul class="pagination" style="justify-content: center;">
														${pageHTML }
													</ul>
												</div>
												<div class="text-right">
													<c:if test="${sessionScope.user.id ne 'admin'}">
													<a href="/board/qna/insert" class="btn btn-primary">글쓰기</a>
													</c:if>
												</div>
											</td>
										</tr>
									</tfoot>
	               </table>
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
</body>
</html>



