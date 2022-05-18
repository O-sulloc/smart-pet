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







//버튼 활성화/비활성화 코드
function check(){
	
	let starCheck = false;
	let contentsCheck = false;
	
	$(".clickStar").on("change",function(){
		
		starCheck = true;
		
		if(starCheck && contentsCheck){
			$(".enroll_btn").attr("disabled", false);
		}else{
			$(".enroll_btn").attr("disabled", true);
		}
		
	});
	
	$("#contents").on("keyup", function(){
		
			if($(this).val().length > 10){
				contentsCheck = true;
			}else{
				contentsCheck = false;
			}
		
			if(starCheck && contentsCheck){
				console.log("blur");
				$(".enroll_btn").attr("disabled", false);
			}else{
				$(".enroll_btn").attr("disabled", true);
			}
		
	});
}






/* 등록 버튼 */
$(".enroll_btn").on("click", function(){
	
	let check = window.confirm("이대로 등록하시겠습니까?");
    if(!check){
        return;
    }
	
	//임시로가져옴
	let productNum = $(".productInfo").val();
	let id = $(".id").val();
	//여기까지
	let star = $('input[name="reviewStar"]:checked').val();
	let contents = $("#contents").val();
	
	console.log(productNum);
	console.log(id);
	console.log(star);
	console.log(contents);
	
		
	$.ajax({
		type : 'post',
		url : '/product/review/add',
		data :{
			productNum : productNum,
			id : id,
			star : star,
			contents : contents
		},
		
		success : function(){
			alert("등록성공!");
			window.close();
		},
		
		error : function(){
			alert("서버요청 실패");
		}
		
	});		
	
	
});
