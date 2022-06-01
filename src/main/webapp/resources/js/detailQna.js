/**
 * 
 */
 
	let pnQ = 1;
	$("#qnaList").on("click", ".pager", function(){
		let checkPn = $(this).attr("data-pn");
		if(checkPn > 0){
			pnQ = checkPn
			//분류 후 페이저 처리(아직 고민)
			getQnaList();	
		}else{
			//이전 블럭과 다음 블럭이 없다
			alert('마지막 페이지 입니다');
		}
	
	});
	
	
	getQnaList();
	//처음
	function getQnaList(){
		
		let productNum = $('#productNum').val();
		
		$.ajax({
			type: "GET",
			url: "./qnaList",
			data:{
				pn:pnQ,
				perPage:10,
				productNum: productNum,
			},
			success:function(data){
				$("#qnaList").html(data.trim());
			}
		
		});
	}
	
	getQnaSort();
	//1) 분류클릭시(id)
	function getQnaSort(selector){//여기새로추가해봄
		$("#qnaList").on("click", ".sort", function(){
		let dataNum = $(this).attr("data-num");
			
		if(dataNum == 2){
			alert("로그인 후 이용 가능합니다");
			return;
		}
		
		let num = selector;//여기새로추가해봄
		let productNum = $('#productNum').val();
		let id = $('#id').val();

			$.ajax({
				type: "GET",
				url: "./qnaSort",
				data:{
					pn:pnQ,
					perPage:10,
					productNum:productNum,
					dataNum:dataNum,
					id:id,
					num:num // 여기새로추가해봄
				},
				success:function(data){
					$("#qnaList").find('.listView').html(data.trim());//내용 최신화
				}
			});
		})
		
	}
	
	
	//2) 분류된것(분류 후 pager 클릭시)
	function getQnaSortPager(){
		let dataNum = $("#qnaList").find('.listView').find('.pager').attr("data-num");
		let productNum = $('#productNum').val();
		let id = $('#id').val();
		//console.log(dataNum);
		$.ajax({
			type: "GET",
			url: "./qnaSort",
			data:{
				pn:pnQ,
				perPage:10,
				productNum:productNum,
				dataNum:dataNum,
				id:id
			},
			success:function(data){
				$("#qnaList").find('.listView').html(data.trim());//일단 여기 부분 봐야함 나중에 일단 가능함!
				
			}
		});
	}
	
	//getQnaReplyList();
	//판매자 qnaReply add시 호출 함수 아직안씀
	function getQnaReplyList(selector){
		
		let num = selector;
		
		$.ajax({
			type: "GET",
			url: "./qnaReplyList",
			data:{
				num: num
			},
			success:function(data){
				$("#qnaList").find('.listView').find('.replyResult'+num).html(data.trim());//일단 여기 부분 봐야함 나중에 일단 가능함!
			}
		
		});
	}
	

	
	
	