<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Upload images with Jquery</title>
    <!-- <link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.3.0/bootbox.min.js"></script>
     -->
   
    <c:import url="../temp/header_script.jsp"></c:import>
    <!-- 밑에께 새롭게 추가 -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>
    <style>
    	/* 나중에 css로 옮길것 */
        ul.cvf_uploaded_files {list-style-type: none; margin: 20px 0 0 0; padding: 0;}
        ul.cvf_uploaded_files li {background-color: #fff; border: 1px solid #ccc; border-radius: 5px; float: left; margin: 20px 20px 0 0; padding: 2px; width: 150px; height: 150px; line-height: 150px; position: relative;}
        ul.cvf_uploaded_files li img.img-thumb {width: 150px; height: 150px;}
        ul.cvf_uploaded_files .ui-selected {background: red;}
        ul.cvf_uploaded_files .highlight {border: 1px dashed #000; width: 150px; background-color: #ccc; border-radius: 5px;}
        ul.cvf_uploaded_files .delete-btn {width: 24px; border: 0; position: absolute; top: -12px; right: -14px;}
        .bg-success {padding: 7px;}
    </style>
   <link rel="stylesheet" href="/resources/css/reviewPop.css">
</head>
<body>

	<!-- 상품이름, 상품사진 필요 -->
	<!-- 별점(star), 좋았던점(contents), 사진첨부 -->
	<div class="wrapper_div">
		<div class="subject_div">
			리뷰 등록
		</div>
		
		<div class="input_wrap">			
			<div class="productName_div">
				<h2>${productInfo}</h2>
				<!-- 임시값 -->
				<input type="hidden" class="id" value="${id}">
				<input type="hidden" class="productInfo" value="${productInfo}">
				<!-- 여기까지 -->
			</div>
			
			<!-- 별점부여 -->
			<div class="mb-3" id="myform">
				<div>
					<span class="text-bold">상품을 사용해보셨나요?</span>
				</div>
				<fieldset class="clickStar">
					<input type="radio" name="reviewStar" value="5" id="rate1"><label
						for="rate1">★</label>
					<input type="radio" name="reviewStar" value="4" id="rate2"><label
						for="rate2">★</label>
					<input type="radio" name="reviewStar" value="3" id="rate3"><label
						for="rate3">★</label>
					<input type="radio" name="reviewStar" value="2" id="rate4"><label
						for="rate4">★</label>
					<input type="radio" name="reviewStar" value="1" id="rate5"><label
						for="rate5">★</label>
				</fieldset>	
				<div class="textStar">
					<span>선택해주세요</span><!-- 1점(별로에요) 빨간글씨 2점(그저그래요) 3점(괜찮아요) 4점(좋아요) 5점(최고에요)-->
				</div>
				
				<div class="content_div reviewComment">
					<!-- 동적으로 바뀌기 만족도 1점을 주셨네요. --> <!-- 만족도 3점을 주셨네요. --> <!-- 어떤점이 아쉬웠나요? --> <!-- 어떤점이 좋았나요? -->
					<h4 class="comment">어떤점이 좋았나요?</h4>
				</div>
				
				<div class="content_div">
					<textarea class="col-auto form-control"  id="contents" name="contents"
					placeholder="상품을 받아보시고 만족도에 대한 후기를 남겨주세요.(최소 10자 이상)"></textarea>
				</div>
			</div>			
			
		</div>
		
	

     
        <br />
        <div class = "col-md-6">
           
            <div class = "form-group">
                <label>Select Images</label>
                <input type = "file" name = "upload" multiple = "multiple" class = "form-control user_picked_files" />                 
            </div>                     
           
           <!-- 없어도될듯? -->
            <!-- <div class = "form-group cvf_order">                           
                <label>Order</label>                               
                <input type = "text" class = "form-control cvf_hidden_field" value = "" disabled = "disabled" />   
            </div>   -->                   
           
            <input type = "submit" class = "cvf_upload_btn btn btn-primary" value = "Upload" />
           
            <ul class = "cvf_uploaded_files"></ul>
           
        </div>
 
    
   	<div class="btn_wrap">
		<button class="cancel_btn">취소</button> <button class="add_btn" disabled="true">등록</button>
	</div>

	</div>
    <script type="text/javascript" src="/resources/js/reviewPop.js"></script>
    
     <script type="text/javascript">
     
     check();
     
     
        jQuery(document).ready(function() {        
           
            var storedFiles = [];      
            //$('.cvf_order').hide();
           
            // Apply sort function 
            function cvf_reload_order() {
                var order = $('.cvf_uploaded_files').sortable('toArray', {attribute: 'item'});
                $('.cvf_hidden_field').val(order);
            }
           
            function cvf_add_order() {
                $('.cvf_uploaded_files li').each(function(n) {
                    $(this).attr('item', n);
                });
                console.log('test');
            }
           
           
            $(function() {
                $('.cvf_uploaded_files').sortable({
                    cursor: 'move',
                    placeholder: 'highlight',
                    start: function (event, ui) {
                        ui.item.toggleClass('highlight');
                    },
                    stop: function (event, ui) {
                        ui.item.toggleClass('highlight');
                    },
                    update: function () {
                        //cvf_reload_order();
                    },
                    create:function(){
                        var list = this;
                        resize = function(){
                            $(list).css('height','auto');
                            $(list).height($(list).height());
                        };
                        $(list).height($(list).height());
                        $(list).find('img').load(resize).error(resize);
                    }
                });
                $('.cvf_uploaded_files').disableSelection();
            });
                   
            $('body').on('change', '.user_picked_files', function() {
               
                var files = this.files;
                var i = 0;
                           
                for (i = 0; i < files.length; i++) {
                    var readImg = new FileReader();
                    var file = files[i];
                   
                    if (file.type.match('image.*')){
                        storedFiles.push(file);
                        readImg.onload = (function(file) {
                            return function(e) {
                                $('.cvf_uploaded_files').append(
                                "<li file = '" + file.name + "'>" +                                
                                    "<img class = 'img-thumb' src = '" + e.target.result + "' />" +
                                    "<a href = '#' class = 'cvf_delete_image' title = 'Cancel'><img class = 'delete-btn' src = 'delete-btn.png' /></a>" +
                                "</li>"
                                );     
                            };
                        })(file);
                        readImg.readAsDataURL(file);
                       
                    } else {
                        alert('the file '+ file.name + ' is not an image<br/>');
                    }
                   
                    if(files.length === (i+1)){
                        setTimeout(function(){
                            cvf_add_order();
                        }, 1000);
                    }
                  
                }
            });
           
            // Delete Image from Queue
            $('body').on('click','a.cvf_delete_image',function(e){
                e.preventDefault();
                $(this).parent().remove('');       
               
                var file = $(this).parent().attr('file');
                for(var i = 0; i < storedFiles.length; i++) {
                    if(storedFiles[i].name == file) {
                        storedFiles.splice(i, 1);
                        break;
                    }
                }
               
                //cvf_reload_order();
               
            });
                   
            // AJAX Upload
            $('body').on('click', '.cvf_upload_btn', function(e){
               
                e.preventDefault();
                cvf_reload_order();
               
                //$(".cvf_uploaded_files").html('<p><img src = "loading.gif" class = "loader" /></p>');
                var data = new FormData();
               
                var items_array = $('.cvf_hidden_field').val();
                var items = items_array.split(',');

                for (var i in items){
                    var item_number = items[i];
                    data.append('files' + i, storedFiles[item_number]);
                }
                   
                $.ajax({
                    url: 'upload.php',
                    type: 'POST',
                    contentType: false,
                    data: data,
                    processData: false,
                    cache: false,
                    success: function(response, textStatus, jqXHR) {
                        //$(".cvf_uploaded_files").html('');                                               
                        //bootbox.alert('<br /><p class = "bg-success">File(s) uploaded successfully.</p>');
                        alert(jqXHR.responseText);
                    }
                });
               
            });        

        });
    </script>
</body>
</html>