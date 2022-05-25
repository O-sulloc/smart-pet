/**
 * 
 */
 
 
//값에 따른 글자 변화주기
$(".clickStar").on("click",function(){
	//체크된 값
	let starVal = $('input[name="reviewStar"]:checked').val();
	//리뷰 밑 평점삭제후 재등록
	$(".textStar").children().remove();
	//h4태그 삭제후 재등록
	$("h4").remove(".comment");
	
	if(starVal == 1){
		$(".textStar").append("<span class='text-red'>1점(별로에요)</span>");
		$(".reviewComment").append("<h4 class='comment'>만족도 1점을 주셨네요</h4>");
		$(".reviewComment").append("<h4 class='comment'>어떤점이 아쉬웠나요?</h4>");
	}else if(starVal == 2){
		$(".textStar").append("<span class='text-red'>2점(그저그래요)</span>");
		$(".reviewComment").append("<h4 class='comment'>만족도 2점을 주셨네요</h4>");
		$(".reviewComment").append("<h4 class='comment'>어떤점이 아쉬웠나요?</h4>");
	}else if(starVal == 3){
		$(".textStar").append("<span class='text-red'>3점(괜찮아요)</span>");
		$(".reviewComment").append("<h4 class='comment'>만족도 3점을 주셨네요</h4>");
		$(".reviewComment").append("<h4 class='comment'>어떤점이 좋았나요?</h4>");
	}else if(starVal == 4){
		$(".textStar").append("<span class='text-red'>4점(좋아요)</span>");
		$(".reviewComment").append("<h4 class='comment'>만족도 4점을 주셨네요</h4>");
		$(".reviewComment").append("<h4 class='comment'>어떤점이 좋았나요?</h4>");
	}else{
		$(".textStar").append("<span class='text-red'>5점(최고에요)</span>");
		$(".reviewComment").append("<h4 class='comment'>만족도 5점을 주셨네요</h4>");
		$(".reviewComment").append("<h4 class='comment'>어떤점이 좋았나요?</h4>");
	}
});


/* 취소 버튼 */
$(".cancel_btn").on("click", function(e){
	window.close();
});	







//버튼 활성화/비활성화 코드(add)
function check(){
	
	let starCheck = false;
	let contentsCheck = false;
	
	$(".clickStar").on("change",function(){
		
		starCheck = true;
		
		if(starCheck && contentsCheck){
			$(".add_btn").attr("disabled", false);
		}else{
			$(".add_btn").attr("disabled", true);
		}
		
	});
	
	$("#title").on("keyup", function(){
		
			if($(this).val().length > 10 && $(this).val().length < 31){
				contentsCheck = true;
			}else{
				contentsCheck = false;
			}
		
			if(starCheck && contentsCheck){
				console.log("blur");
				$(".add_btn").attr("disabled", false);
			}else{
				$(".add_btn").attr("disabled", true);
			}
		
	});
}

//버튼 활성화/비활성화 코드(update)

function updateCheck(){
	
	$("#title").focus().select();
	
	let starCheck = true;
	let contentsCheck = true;
	
	$(".clickStar").on("change",function(){
		
		starCheck = true;
		
		if(starCheck && contentsCheck){
			$(".update_btn").attr("disabled", false);
		}else{
			$(".update_btn").attr("disabled", true);
		}
		
	});
	
	$("#title").on({
		
		keyup: function(){
			if($(this).val().length > 10 && $(this).val().length < 31){
				contentsCheck = true;
			}else{
				contentsCheck = false;
			}
		
			if(starCheck && contentsCheck){
				console.log("blur");
				$(".update_btn").attr("disabled", false);
			}else{
				$(".update_btn").attr("disabled", true);
			}
		},
		
		click: function(){
			if($(this).val().length > 10 && $(this).val().length < 31){
				contentsCheck = true;
			}else{
				contentsCheck = false;
			}
		
			if(starCheck && contentsCheck){
				console.log("blur");
				$(".update_btn").attr("disabled", false);
			}else{
				$(".update_btn").attr("disabled", true);
			}
		},
		
	});
}


// 등록 버튼(파일추가)
$(".add_btn").on("click", function(){
	
	let check = window.confirm("이대로 등록하시겠습니까?");
    if(!check){
        return;
    }
	
	let formData = new FormData();
	
	//임시로가져옴
	let productNum = $(".productInfo").val();
	let id = $(".id").val();
	//여기까지
	let star = $('input[name="reviewStar"]:checked').val();
	let title = $("#title").val();
	let contents = $("#contents").val();
	
	
	$(".files").each(function(idx, item) {
		if(item.files.length > 0){				//length가 있는것들, file이 들어온것들 선택
			console.log(idx);					//index 번호
			console.log(item);					//<input type="file">
			console.log(item.files);			//input 태그의 file List
			console.log(item.files[0]);			//file list중 첫번째 파일
			console.log(item.files.length);		//file list중 첫번째 파일의 길이
			console.log(item.files[0].name);	//file list중 첫번째 파일의 이름
			//formData.append("파라미터명", 값);
			formData.append("files", item.files[0]);
		}
	});//each 끝
	
	formData.append('productNum',  productNum);
	formData.append('id', id);
	formData.append('star', star);
	formData.append('title', title);
	formData.append('contents', contents);
		
	$.ajax({
		type : 'post',
		url : '/product/review/add',
		processData: false,
		contentType: false,
		data : formData,
		
		success : function(){
			alert("등록성공!");
			$("#productNum").val("");
			$("#id").val("");
			$("#star").val("");
			$("#title").val("");
			$("#contents").val("");
			$("#fileResult").empty();
			window.close();
		},
		
		error : function(){
			alert("서버요청 실패");
		}
		
	});		
});


// 수정 버튼
$(".update_btn").on("click", function(){
	
	let check = window.confirm("이대로 수정하시겠습니까?");
    if(!check){
        return;
    }
    
    let formData = new FormData();
	
	//let id = $(".id").val();
	//여기까지
	//임시로가져옴 update에선 안넣어도 될듯(이거 넣어야 상품 평균 별점 수정가능)
	//멤버아이디도 넣어야 할수도있음!
	let productNum = $(".productInfo").val();
	let star = $('input[name="reviewStar"]:checked').val();
	let title = $("#title").val();
	let contents = $("#contents").val();
	let replyNum = $(".replyNum").val();
	
	$(".files").each(function(idx, item) {
		if(item.files.length > 0){//length가 있는것들, file이 들어온것들 선택
			//formData.append("파라미터명", 값);
			formData.append("files", item.files[0]);
		}
	});//each 끝

	formData.append('productNum',  productNum);
	//formData.append('id', id);
	formData.append('star', star);
	formData.append('title', title);
	formData.append('contents', contents);	
	formData.append('replyNum', replyNum);
	
	
	//console.log(productNum);
	//console.log(id);
	//console.log(star);
	//console.log(contents);
	
		
	$.ajax({
		type : 'post',
		url : '/product/review/update',
		processData: false,
		contentType: false,
		data : formData,
		
		success : function(){
			alert("등록성공!");
			$("#productNum").val("");
			$("#id").val("");
			$("#star").val("");
			$("#title").val("");
			$("#contents").val("");
			$("#fileResult").empty();
			window.close();
		},
		
		error : function(){
			alert("서버요청 실패");
		}
		
	});		
});






//글 작성 시 첨부파일
let count=0;
function fileAddInit(c){
	
   count=c;
   
   $("#fileAdd").click(function(){
           
        if (count > 4) {
            alert('첨부파일은 최대 5개 까지만 가능합니다.');
            return;
        }
        
                                       
        let file = '<div class="input-group">';
        file = file + '<input type="file" class="form-control files" id="files" name="files" aria-describedby="inputGroupFileAddon04" aria-label="Upload">';
        file = file + '<button class="btn btn-outline-secondary del" type="button" id="inputGroupFileAddon04">X</button>';
        file = file + '</div>';
        
           
        $("#fileResult").append(file)
        
        count++;
    });
 
    $("#fileResult").on("click", ".del", function() {
		console.log($(this).parent());
        $(this).parent().remove();
        count--;
    })
    
}

//update에서 사진삭제시 필요
function fileDeleteInit(){
	
	$(".del").click(function(){
		
		let check = window.confirm("영구히 삭제 됩니다. 삭제하시겠습니까?");
		
		if(!check){
			return;
		}
		
		let fileNum=$(this).attr("data-num");
		let selector=$(this);
		
		$.ajax({
			type:"POST",
			url: "../product/review/fileDelete",
			
			data:{
				fileNum:fileNum
			},
			
			success:function(data){			
				
				if(data.trim()=='1'){
					$(selector).parent().remove();
					count--;	
					alert("사진파일 삭제 성공");
				}else{
					alert("사진파일 삭제 실패");
				}
			},
			error:function(){
				alert("서버요청 실패");
			}
		})
		
	});
} 
