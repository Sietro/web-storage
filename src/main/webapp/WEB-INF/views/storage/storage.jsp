<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<base href="/">
<title>Main</title>
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<style>
	.change_button{
		border: none;
		background-color: white;
		padding: 5px;
		color: blue;
		outline: white;
	}
	form{
		display: inline-block;
	}
	.filebox label { 
		display: inline-block; 
		padding: .5em .75em; 
		font-size: inherit; 
		line-height: normal; 
		vertical-align: middle; 
		cursor: pointer; 
		border: 1px solid #ebebeb; 
		border-bottom-color: #e2e2e2; 
		border-radius: .25em; 
	} 
	.filebox input[type="file"] { 
		/* 파일 필드 숨기기 */
		position: absolute; 
		width: 1px; 
		height: 1px; 
		padding: 0; 
		margin: -1px; 
		overflow: hidden; 
		clip:rect(0,0,0,0); 
		border: 0; 
	}
</style>
</head>
<body id="page-top">
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
	   <div id="content-wrapper" class="d-flex flex-column">
	     <div id="content">
	     	<jsp:include page="/WEB-INF/views/common/topbar.jsp"/>
	       <div class="container-fluid">
	         <div class="d-sm-flex align-items-center justify-content-between mb-4">
	           <h1 class="h3 mb-0 text-gray-800">Storage</h1>
	         </div>
	         <div class="row">
						<div class="row-fluid">
							<div class="btn-group">
			        	<div class="col-xl-2">
				         	<form action="/storage/file/upload?${_csrf.parameterName }=${_csrf.token }" method="post" enctype="multipart/form-data">
										<input type="hidden" name="location" value="${sessionScope.location }" />
										<div class="filebox">
											<label for="fileupload" class="mr-3">FileUpload</label>
											<input type="file" 
														 multiple="multiple"
														 title="FileUpload" 
														 id="fileupload"
														 name="fileupload"
														 onchange="this.form.submit()" />
										</div>
										<c:if test="${upload != null}">
											<script>
												alert('같은 이름이 존재합니다.');
											</script>
										</c:if>
									</form>
			        	</div>
			        	<div class="col-xl-4">
			        		<div class="btn-group">
				        		<label for="checkbox_all" class="btn btn-outline-success mb-0">
											<input type="checkbox" 
														 name="checkbox_all" 
														 id="checkbox_all" 
														 onchange="checkAllBox()"
														 autocomplete="off">
											<span class="glyphicon glyphicon-ok"></span>전체선택
										</label>
										<button type="button" onclick="del()" class="btn btn-outline-danger">삭제</button>
			        		</div>
			        	</div>
			        	<div class="col-xl-6">
									<form action="/storage/mkdir" method="post">
										<sec:csrfInput/>
										<input type="hidden" name="location" value="${sessionScope.location }" />
										<div class="form-group">
											<div class="col-xs-3">
												<div class="input-group">
													<input name="dirName" class="form-control" placeholder="폴더 이름을 입력하세요." />
													<span class="input-group-btn">
														<button type="submit" class="btn btn-outline-primary">폴더 생성</button>
													</span>
												</div>
												<c:if test="${mkdir != null}">
													<script>
														alert('같은 이름이 존재합니다.');
													</script>
												</c:if>
											</div>
										</div>
									</form>
			        	</div>
			        </div>
						</div>
	         <div class="row row-fluid w-100">
	           <div class="col-lg-12">
	             <div class="card shadow mb-4">
	               <div class="card-body">
	               	<div class="row">
	               		<c:if test="${sessionScope.location == '' && storageList == '[]'}">
											<p>파일이 하나도 없습니다! 업로드 하세요.</p>
										</c:if>
										<c:if test="${sessionScope.location != null && sessionScope.location != '' && sessionScope.location != 'root' }">
										<div class="col-md-2 col-sm-3 col-xs-4">
											<form:form action="/storage/parent" method="post" modelAttribute="storage" class="w-100">
												<sec:csrfInput/>
												<form:hidden path="users_id" value="${username }"/>
												<form:hidden path="fs_pid" value="${sessionScope.location }"/>
												<div class="form-header">
												<span></span>
												</div>
												<div class="form-content">
													<button type="submit" class="change_button btn-block">
														<img src="/image/goparents.jpg" alt=".." class="img-fluid" />
														<br />
														<span>상위폴더</span>
													</button>
												</div>
												<div class="form-footer">
												<span></span>
												</div>
											</form:form>
										</div>
										</c:if>
										<c:forEach items="${storageList }" var="storage" varStatus="status">
											<c:if test="${storage.type eq 'd' }">
											<div class="col-md-2 col-sm-3 col-xs-4">
												<form:form action="/storage/sub" method="post" modelAttribute="storage" class="w-100">
													<sec:csrfInput/>
													<form:hidden path="users_id" value="${storage.users_id }"/>
													<form:hidden path="fs_uid" value="${storage.fs_uid }"/>
													<form:hidden path="fs_pid" value="${storage.fs_pid }"/>
													<form:hidden path="type" value="${storage.type }"/>
													<form:hidden path="name" value="${storage.name }"/>
													<div class="form-header">
														<input type="checkbox" name="checkbox" id="checkbox" onclick="checkboxChecker(this.form)" />
													</div>
													<div class="form-content">
														<button type="submit" class="change_button btn-block text-truncate">
															<img src="/image/folder.jpg" alt="${storage.name }" class="img-fluid" />
															<br />
															<span>${storage.name }</span> 
														</button>
													</div>
													<hr />
													<div class="form-footer">
														<button type="button" class="btn btn-info" onclick="updateName(this.form);">수정</button>
														<div class="form-group update-name"  style="display:none;">
															<div class="col-xs-3">
																<div class="input-group">
																	<input type="text" class="form-control" name="newName" value="${storage.name }"/>
																	<span class="input-group-btn">
																		<button type="button" 
																						class="btn btn-primary"
																						onclick="sendUpdate(this.form);">수정하기</button>
																	</span>
																</div>
															</div>
														</div>
													</div>
												</form:form>
											</div>
											</c:if>
											<c:if test="${storage.type eq 'f' }">
											<div class="col-md-2 col-sm-3 col-xs-4">
												<form:form action="/storage/file" method="post" modelAttribute="storage" class="w-100">
													<sec:csrfInput/>
													<form:hidden path="users_id" value="${storage.users_id }"/>
													<form:hidden path="fs_uid" value="${storage.fs_uid }"/>
													<form:hidden path="fs_pid" value="${storage.fs_pid }"/>
													<form:hidden path="type" value="${storage.type }"/>
													<form:hidden path="name" value="${storage.name }"/>
													<div class="form-header">
														<input type="checkbox" name="checkbox" id="checkbox" onclick="checkboxChecker(this.form);" />
													</div>
													<div class="form-content">
														<button type="submit" class="change_button btn-block text-truncate">
															<img src="/image/file.jpg" alt="${storage.name }" class="img-fluid" />
															<br />
															<span>${storage.name }</span> 
														</button>
													</div>
													<hr />
													<div class="form-footer">
														<button type="button" class="btn btn-info" onclick="updateName(this.form);">수정</button>
														<div class="form-group update-name" style="display:none;">
															<div class="col-xs-3">
																<div class="input-group">
																	<input type="text" class="form-control" name="newName" value="${storage.name }"/>
																	<span class="input-group-btn">
																		<button type="button" 
																						class="btn btn-primary"
																						onclick="sendUpdate(this.form);">수정하기</button>
																	</span>
																</div>
															</div>
														</div>
													</div>
												</form:form>
											</div>
											</c:if>
										</c:forEach>
	               	</div>
	               </div>
	             </div>
	           </div>
	         </div>
	       </div>
	     </div>
	     <!-- Footer -->
	     <footer class="sticky-footer bg-white">
	       <div class="container my-auto">
	         <div class="copyright text-center my-auto">
	           <span>Copyright &copy; Your Website 2019</span>
	         </div>
	       </div>
	     </footer>
	     <!-- End of Footer -->
	   </div>
	   <!-- End of Content Wrapper -->
	 </div>
	 <!-- End of Page Wrapper -->
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
 	<script>
		function del(){
			var forms = $('form[name=checked]');
			var alertMsg = "";
			var count = 0;
			for(var i = 0; i < forms.length; i++){
				 $.ajax({
					url:"/storage/delete",
					type:"post",
					data:{fs_uid:forms[i].fs_uid.value, 
								users_id:forms[i].users_id.value, 
								location:forms[i].fs_pid.value,
								name:forms[i].name.value},
					beforeSend: function(xhr){
						xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}")
					},
					success:function(data){
						if(data.isSuccess == 'true'){
							alertMsg = data.name+" "+alertMsg;
							count++;
							console.log(count);
						}
						if(count == forms.length){
							alert(alertMsg+" complete delete");
							location.href="/main";
						}
					}
				});
			}
			
		}
		
		function checkboxChecker(thisform){
			if ($('input[name=checkbox]').is(":checked")) {
					$(thisform).attr('name','checked');
			} else {
			    $(thisform).removeAttr('name');
			}
		}
		
		function updateName(thisform){
			$(thisform).find('.update-name').toggle();
		}
		
		function sendUpdate(thisform){
			$.ajax({
				url:"/storage/update",
				type:"post",
				data:{fs_uid:thisform.fs_uid.value, 
							users_id:thisform.users_id.value, 
							location:thisform.fs_pid.value,
							name:thisform.name.value,
							newName:thisform.newName.value},
				beforeSend: function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}")
				},
				success:function(data){
					if(data == 'success'){
						location.href="/main";
					}else{
						alert("변경 실패, 같은 이름이거나 오류가 발생하였습니다.");
					}
				}
			});
		}
		
		function checkAllBox(){
			$('input[name=checkbox]').click();
		}
 	</script>
</body>
</html>