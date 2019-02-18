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
<body>
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
	<h1>Storage</h1>
	<sec:authentication property="principal.username" var="username"/>
	<p>${username }님 안녕하세요</p>
	<hr />
	<%-- <p>스토리지 리스트 ${storageList }</p>
	<p>세션 ${sessionScope.location }</p>
	<c:out value="세션 ${sessionScope.location }" default="beam" /><br /> --%>
	<form action="/storage/file/upload?${_csrf.parameterName }=${_csrf.token }" method="post" enctype="multipart/form-data">
		<input type="hidden" name="location" value="${sessionScope.location }" />
		<div class="filebox">
			<label for="fileupload">FileUpload</label>
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
	<input type="checkbox" name="checkbox_all" id="checkbox_all" onchange="checkAllBox()" />
	<label for="checkbox_all" >전체선택</label>
	<button type="button" onclick="del()" class="btn btn-danger">삭제</button>
	<form action="/storage/mkdir" method="post">
		<sec:csrfInput/>
		<input type="hidden" name="location" value="${sessionScope.location }" />
		<div class="form-group">
			<div class="col-xs-3">
				<div class="input-group">
					<input name="dirName" class="form-control" placeholder="폴더 이름을 입력하세요." />
					<span class="input-group-btn">
						<button type="submit" class="btn btn-primary">폴더 생성</button>
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
	<c:if test="${sessionScope.location == '' && storageList == '[]'}">
		<p>파일이 하나도 없습니다! 업로드 하세요.</p>
	</c:if>
	<ul>
		<c:if test="${sessionScope.location != null && sessionScope.location != '' }">
		<li>
			<form:form action="/storage/parent" method="post" modelAttribute="storage">
				<sec:csrfInput/>
				<form:hidden path="users_id" value="${username }"/>
				<form:hidden path="fs_pid" value="${sessionScope.location }"/>
				<button type="submit" class="change_button">..</button>
			</form:form>
		</li>
		</c:if>
		<c:forEach items="${storageList }" var="storage" varStatus="status">
			<c:if test="${storage.type eq 'd' }">
			<li>
				<form:form action="/storage/sub" method="post" modelAttribute="storage">
					<sec:csrfInput/>
					<form:hidden path="users_id" value="${storage.users_id }"/>
					<form:hidden path="fs_uid" value="${storage.fs_uid }"/>
					<form:hidden path="fs_pid" value="${storage.fs_pid }"/>
					<form:hidden path="type" value="${storage.type }"/>
					<form:hidden path="name" value="${storage.name }"/>
					<input type="checkbox" name="checkbox" id="checkbox" onclick="checkboxChecker(this.form)" />
					<button type="submit" class="change_button">${storage.name }</button>
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
					<form:hidden path="type" value="${storage.type }"/>
					<form:hidden path="name" value="${storage.name }"/>
					<input type="checkbox" name="checkbox" id="checkbox" onclick="checkboxChecker(this.form);" />
					<button type="submit" class="change_button">${storage.name }</button>
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
				</form:form>
			</li>
			</c:if>
		</c:forEach>
	</ul>
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