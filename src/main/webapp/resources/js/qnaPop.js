/**
 * 
 */
//판매자용 qnaReply도 포함

//창 이동
//소비자
//qna 등록창
$('#qnaList').on("click", ".add_reply_wrap", function(e){
	//로그인 확인
	if($('#id').val() == null){
		alert("로그인 후 이용 가능합니다");
		return;
	}
	
	e.preventDefault();	
	let id = $('#id').val(); //멤버아이디랑
	let productNum = $('#productNum').val(); //상품번호 갖고와야함
	//product에서 처리
	let popUrl = "/product/qnaAdd/" + id + "?productNum=" + productNum;
	console.log(popUrl);
	let popOption = "width = 600px, height=800px, top=400px, left=400px, scrollbars=yes";
	
	window.open(popUrl,"QNA 쓰기",popOption);

});

//qna 수정창
$('#qnaList').on("click", ".update_qna_btn", function(e){
	
	e.preventDefault();
	
	let id = $('#id').val(); //멤버아이디랑
	let productNum = $('#productNum').val(); 
	let num = $('#num').val(); 	
	
	let popUrl = "/product/qnaUpdate?num=" + num + "&productNum=" + productNum + "&id=" + id;	
	let popOption = "width = 600px, height=800px, top=400px, left=400px, scrollbars=yes"	
	
	window.open(popUrl,"QNA 수정",popOption);		
	 
 });

//qna 삭제(여기서 클릭하는 법을 찾아야함 위랑 동일)
$('#qnaList').on("click", ".delete_qna_btn", function(e){
	e.preventDefault();
	
	let num = $('#num').val();
	
	let check = window.confirm("QNA를 삭제 시 복구 및 재작성이 불가능합니다.\n정말 삭제하시겠습니까?"); //check에 boolean 담김
	
	if(!check){
		return;
	}
	
	$.ajax({
		data : {
			num : num
		},
		
		url : '/qna/delete',//위에 add랑 update랑 다른점은 바로 qnaController 접속
		type : 'GET',
		success : function(result){
			alert('삭제가 완료 되었습니다.');
			location.reload();
		},
		error : function(){
			alert('요청실패');
		}
	});		
	 
 });
 

//창에서 작동 
//취소 버튼 
$(".cancel_btn").on("click", function(e){
	window.close();
});	

//등록 버튼
$(".add_btn").on("click", function(){
	
	let check = window.confirm("이대로 등록하시겠습니까?");
    if(!check){
        return;
    }
    
	let secret = $('input:checkbox[id="secret"]').is(":checked");
	if(secret){
		secret = 1;
	}else{
		secret = 2;
	}
	console.log(secret);
	let productNum = $(".productNum").val();
	let id = $(".id").val();
	let contents = $(".contents").val();
	//let secret = $(".secret").val();
	
	$.ajax({
		type : 'post',
		url : '/qna/add',
		data : {
			productNum:productNum,
			id:id,
			contents:contents,
			secret:secret
		},
		
		success : function(){
			alert("등록성공!");
			$(".productNum").val("");
			$(".id").val("");
			$(".contents").val("");
			opener.parent.location.reload();
			window.close();
		},
		
		error : function(){
			alert("서버요청 실패");
		}
		
	});		
});

//버튼 활성화/비활성화 코드(add)
check();
function check(){
	
	$("#contents").on("keyup", function(){
		
		if($(this).val().length > 0){
			$(".add_btn").attr("disabled", false);
			
			let blank_pattern = /^\s+|\s+$/g; // 공백체크
			//앞뒤 문자 다 없애고 공백만 남겼을때 공백만 있으면 발동
			if($(this).val().replace(blank_pattern, '').length == 0){
				//일단 맨 앞에 공백있어도 넘어가게 해놓음
				alert('공백만 입력되었습니다');//alert 버그 있는데 모르겠음
				$(this).val(null);
				$(".add_btn").attr("disabled", true);
			}
			
		}else{
			$(".add_btn").attr("disabled", true);
		}		
	});
}

//수정 버튼
$(".update_btn").on("click", function(){
	
	let check = window.confirm("이대로 수정하시겠습니까?");
    if(!check){
        return;
    }
    
	let secret = $('input:checkbox[id="secret"]').is(":checked");
	if(secret){
		secret = 1;
	}else{
		secret = 2;
	}
	console.log(secret);
	let productNum = $(".productNum").val();
	let id = $(".id").val();
	let contents = $(".contents").val();
	let num = $(".num").val();
	
	$.ajax({
		type : 'post',
		url : '/qna/update',
		data : {
			productNum:productNum,
			id:id,
			contents:contents,
			secret:secret,
			num:num
		},
		
		success : function(){
			alert("수정성공!");
			$(".productNum").val("");
			$(".id").val("");
			$(".contents").val("");
			opener.parent.location.reload();
			window.close();
		},
		
		error : function(){
			alert("서버요청 실패");
		}
		
	});		
});


//버튼 활성화/비활성화 코드(update)
function updateCheck(){
	
	$("#contents").on("keyup", function(){
		
		if($(this).val().length > 0){
			$(".update_btn").attr("disabled", false);
			
			let blank_pattern = /^\s+|\s+$/g; // 공백체크
			//앞뒤 문자 다 없애고 공백만 남겼을때 공백만 있으면 발동
			if($(this).val().replace(blank_pattern, '').length == 0){
				//일단 맨 앞에 공백있어도 넘어가게 해놓음
				alert('공백만 입력되었습니다');//alert 버그 있는데 모르겠음
				$(this).val(null);
				$(".update_btn").attr("disabled", true);
			}
			
		}else{
			$(".update_btn").attr("disabled", true);
		}		
	});
}


//판매자
//qna 답글창
$('#qnaList').on("click", ".seller_add_reply_wrap", function(e){
	//로그인 확인 필요없을듯 판매자가 들어올때만 확인할거라서
/*	if($('#id').val() == null){
		alert("로그인 후 이용 가능합니다");
		return;
	}*/
	
	e.preventDefault();	
	let id = $('#id').val(); //멤버아이디랑
	let productNum = $('#productNum').val(); 
	let num = $(this).attr("data-num"); //리뷰 num 누른거의 값?
	//console.log(id);
	//console.log(productNum);
	//console.log(num);
	//product에서 처리
	let popUrl = "/product/qnaSellerAdd?id=" + id + "&num=" + num + "&productNum=" + productNum;
	//console.log(popUrl);
	let popOption = "width = 600px, height=800px, top=400px, left=400px, scrollbars=yes";
	
	window.open(popUrl,"QNA 쓰기",popOption);

});


//등록 버튼
$(".seller_add_btn").on("click", function(){
	
	let check = window.confirm("이대로 등록하시겠습니까?");
    if(!check){
        return;
    }
    
	let id = $(".id").val();
	let contents = $(".contents").val();
	let productNum = $(".productNum").val();
	let num = $(".num").val();
	let replyCheck = 2;//값부여
		
	$.ajax({
		type : 'post',
		url : '/qna/reply',//여기야여기!!
		data : {
			id:id,
			contents:contents,
			replyCheck:replyCheck,
			productNum:productNum,
			num: num
		},
		
		success : function(){
			alert("등록성공!");
			$(".id").val("");
			$(".contents").val("");
			opener.parent.location.reload();
			//opener.parent.getQnaReplyList(num);
			//opener.parent.getQnaSort(num);
			window.close();
		},
		
		error : function(){
			alert("서버요청 실패");
		}
		
	});		
});



//버튼 활성화/비활성화 코드(add)
sellerCheck();
function sellerCheck(){
	
	$("#contents").on("keyup", function(){
		
		if($(this).val().length > 0){
			$(".seller_add_btn").attr("disabled", false);
			
			let blank_pattern = /^\s+|\s+$/g; // 공백체크
			//앞뒤 문자 다 없애고 공백만 남겼을때 공백만 있으면 발동
			if($(this).val().replace(blank_pattern, '').length == 0){
				//일단 맨 앞에 공백있어도 넘어가게 해놓음
				alert('공백만 입력되었습니다');//alert 버그 있는데 모르겠음
				$(this).val(null);
				$(".seller_add_btn").attr("disabled", true);
			}
			
		}else{
			$(".seller_add_btn").attr("disabled", true);
		}		
	});
}