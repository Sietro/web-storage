<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" 
 	  content="width=device-width, initial-scale=1">
<title>ItTem</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<link rel="stylesheet" href="/public/css/shop.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4>카테고리</h4>
						</div>
						<div class="panel-body">
							<ul class="list-group">
							<c:forEach var="category" 
									   items="${categoryList}">
								<li class="list-group-item">
									<div class="input-group">
										<input type="text" value="${category }"
											   class="form-control"
											   id="input_${category }"/>
										<span class="input-group-btn">
											<button type="button"
													class="btn btn-warning"
													onclick="updateCategory('${category}')">수정</button>
											<button type="button"
													class="btn btn-danger"
													onclick="deleteCategory('${category}');">삭제</button>
													delete from category where category = 'outer'
										</span>
									</div>
								</li>
							</c:forEach>
							</ul>
							<form action="/manage/category/insert" method="post">
								<div class="input-group">
									<input type="text" class="form-control" 
										   name="category" />
									<span class="input-group-btn">
										<button class="btn btn-default"
												type="submit">추가</button>
									</span>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4>상품추가</h4>
						</div>
						<div class="panel-body">
							<form action="/manage/product/insert"
								  method="post"
								  class="form-horizontal"
								  enctype="multipart/form-data">
								  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"> 
								<div class="form-group">
									<label for="model" 
										   class="col-xs-2 control-label">모델명</label>
									<div class="col-xs-10">
										<div class="input-group">
											<input type="text" 
											   class="form-control" name="model" onchange="isDuplicated = true" />
											<span class="input-group-btn">
												<button type="button"
														onclick="dualcheck(this.form);"
														class="btn btn-default">중복확인</button>
											</span>
										</div>
										
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-xs-2 control-label">카테고리</label>
									<div class="col-xs-10">
										<select name="category" class="form-control">
										<c:forEach var="category" 
												   items="${categoryList }">
											<option value="${category }">${category }</option>
										</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-xs-2 control-label">제조사</label>
									<div class="col-xs-10">
										<input type="text" class="form-control" 
											   name="manufacturer"/>
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-xs-2 control-label">이미지</label>
									<div class="col-xs-10">
										<label class="btn btn-default" for="image">
											<input type="file" name="image_file" id="image" style="display:none"
							   			onchange="$('#file-info').text(this.files[0].name)"/>파일선택
										</label>
										<span class="label label-default" id="file-info"></span>
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-xs-2 control-label">내용</label>
									<div class="col-xs-10">
										<input type="text" class="form-control" 
											   name="content"/>
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-xs-2 control-label">가격</label>
									<div class="col-xs-10">
										<input type="text" class="form-control" 
											   name="price"/>
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-xs-2 control-label">할인율</label>
									<div class="col-xs-10">
										<input type="text" class="form-control" 
											   name="discount"
											   placeholder="ex) 0.15"/>
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-xs-2 control-label">수량</label>
									<div class="col-xs-10">
										<input type="text" class="form-control" 
											   name="count"/>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-10 col-xs-offset-2">
										<button type="button"
												class="btn btn-primary btn-block"
												onclick="checkForm(this.form);">
											추가
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		var isDuplicated = true;
		function dualcheck(f){
			$.ajax({
				type:"post",
				url:"/manage/product/dualcheck",
				data:{model:f.model.value},
				success:function(data){
					if(data == 'duplicated'){
						alert("중복된 모델명입니다.");
					}else{
						alert("사용 가능한 모델명입니다.");
						isDuplicated = false;
					}
				},error:function(error){
					console.error(error);
				}
			});
		}
		
		function checkForm(f){
			if(isDuplicated){
				alert("중복확인을 체크해주세요");
				return;
			}
			
			if(!/^[-a-z0-9]{2,30}$/.test(f.model.value)){
				alert("모델명이 형식에 어긋납니다\n소문자 및 숫자 및 특수문자(-)에 2~30글자 사이");
				f.model.focus();
				return;
			}
			
			if(!/^[()a-zA-Z0-9가-힣]{2,10}$/.test(
								f.manufacturer.value)){
				alert("제조사가 형식에 어긋납니다\n대소문자, 숫자, "+
					  "특수문자( (,) ), 한글에 2~30글자 사이");
				f.manufacturer.focus();
				return;
			}
			if(!/^.{1,30}\..{1,20}$/.test(
					f.image.value)){
				alert("파일이름형식이 올바르지 않습니다\n"
					  +"ex) apple.jpg");
				return;
			}
			if(!/^.{1,500}$/.test(f.content.value)){
				alert("1~500글자 이내의 문자를 입력해 주세요");
				f.content.focus();
				return;
			}
			if(!/^[1-9][0-9]{0,9}$/.test(f.price.value)){
				alert("1이상의 양수를 입력해 주세요");
				f.price.focus();
				return;
			}
			if(!/^(0|0\.[0-9]?[1-9])$/.test(f.discount.value)){
				alert("0 또는 0.01 ~ 0.99이내의 숫자를 입력해 주세요");
				f.discount.focus();
				return;
			}
			if(!/^[1-9][0-9]{0,4}$/.test(f.count.value)){
				alert("1이상의 양수를 입력해 주세요");
				f.count.focus();
				return;
			}
			f.submit();
		}
		
		function deleteCategory(category){
			location.href = "/manage/category/delete?category="+category;
		}
		
		function updateCategory(category){
			var newCategory = $("#input_"+category).val();
			location.href = "/manage/category/update?category="+category+"&new="+newCategory;
		}
	</script>
</body>
</html>






