<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<c:import url="../temp/header_css.jsp"></c:import>
	<c:import url="../temp/header_script.jsp"></c:import>
	<!-- include summernote css/js -->
	<!-- 위지위그 사용하기 위해 갖고옴 -->
	<c:import url="../temp/summernote.jsp"></c:import>
	
	<title>Insert title here</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>

<div class="container mt-4">
	<div class="row mt-4">
		<div class="alert alert-light" role="alert">
	  		<h4 style="text-transform: uppercase;">${board} Write</h4>
		</div>
	</div>
	
	
	<div class="row mt-4">
		<form action="./add" method="post" class="frm" enctype="multipart/form-data">
			<div class="form_section">
				<div class="row">
					<div class="form_section_content col-lg-12" id="grade">
						<span>카테고리</span> 
						<select class="type1 type2 col-lg-12" name="grade">
							<option selected value="none">선택</option>
							<option value="0">일반</option>
							<option value="1">매장</option>
							<option value="2">이벤트</option>
						</select>
					</div>
				</div>
			</div>

		  <div class="row mb-3">
		    <label for="title" class="col-sm-2 col-form-label">Title</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control title_check" id="title" name="title">
			  <font id="checkTitle" size="2"></font>
		    </div>
		  </div>
		  <div class="row mb-3">
		    <label for="id" class="col-sm-2 col-form-label">Writer</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="id" name="id">
		    </div>
		  </div>
		  <div class="row mb-3">
		    <label for="contents" class="col-sm-2 col-form-label">Contents</label>
		    <div class="col-sm-10">
		      <textarea class="form-control" id="contents" name="contents"></textarea>
		    </div>
		  </div>

		  <button type="button" class="btn btn-primary my-4" id="btn">Write</button>
		</form>
		
	</div>	
</div>	

<script type="text/javascript" src="../resources/js/notice_add.js"></script>
<!-- <script type="text/javascript" src="../resources/js/summernote.js"></script> -->

<script type="text/javascript">
	totalCheck();

	
	/* $('#contents').summernote({ summernote image 수정 에러로 뺌
		height: 300,                 
		placeholder: '내용을 입력하세요',
		callbacks: {
			onImageUpload: function(files){//onImageUpload 시작
				//files upload한 이미지 파일객체	
				let formData = new FormData();
				formData.append("summerFiles", files[0]);
				
				// /board/summerFileUpload
				$.ajax({
					type: "POST",
					url: "../summernote/summerFileUpload",
					processData: false,
				    contentType: false,
					data:formData,
					
					success:function(data){
						//console.log(data.trim());
						//summernote 자체적으로 만들어주는 클래스라서 성공하면 자동적으로 이 클래스 선택해서 값을 지워주는것을 해줘야함
						//첨부파일 안넣었을때 없애주는것
						$(".note-image-input").val('');
						
						$('#contents').summernote('editor.insertImage', data.trim());
						//$('#contents').val($('#contents').summernote('editor.insertImage', data.trim()));
					}

				});
				
			},//onImageUpload 끝
			
			onMediaDelete:function(files){//onMediaDelete 시작
				let fileName = $(files[0]).attr("src");//<img src="">
				//console.log(fileName);
				//console.log("deletin");
				$.ajax({
					type:"GET",
					url:"../summernote/summerFileDelete",
					data:{
						fileName: fileName
					},
					
					success:function(data){
						//console.log(data.trim());
						//$('#contents').val('');
						
					},
					
					error:function(){
						alert("서버요청 실패!");
					}
					
				});
			}//onMediaDelete 끝
			
		}
	}); */
	
</script>

</body>
</html>