/**
 * 
 */
 
 
 
 //상품페이지로 옮길것
	//add.jsp안에 paging 처리
	//전역변수로 먼저 선언해서 pn 오류 안생기게 만들기
	let pn = 1;
	
	$("#list").on("click", ".pager", function(){
		//console.log($(this).attr("data-pn"));
		let checkPn = $(this).attr("data-pn");
		if(checkPn > 0){
			pn = checkPn
			//분류 후 페이저 처리
			getSortPagerList();
			//getList(checkPn);			
		}else{
			//이전 블럭과 다음 블럭이 없다
			alert('마지막 페이지 입니다');
		}
	
	});
	
	
	//list ajax url: ajaxList, Get
	//매개변수로 쓸땐 먼저 1 선언해줘야함 pn 값 미리 넣어놓기
	getList();//1);
	
	
	//분류전
	function getList(){//pn){
		
		let productNum = $('#productNum').val();
		let starAvg = $('#starAvg').val();
		//console.log(productNum);
		$.ajax({
			type: "GET",
			url: "./reviewList",
			data:{
				pn:pn,
				perPage:5,
				productNum: productNum,
				starAvg : starAvg
			},
			success:function(data){
				$("#list").html(data.trim());
			}
		
		});
	}
	
	
	//1) 분류된것(분류 클릭시)
	getSortList();
	
	function getSortList(){
		$("#list").on("click", ".sort", function(){	
			let dataNum = $(this).attr("data-num");
			let productNum = $('#productNum').val();
			//console.log(dataNum);
			$.ajax({
				type: "GET",
				url: "./reviewSort",
				data:{
					pn:pn,
					perPage:5,
					productNum:productNum,
					dataNum:dataNum
				},
				success:function(data){
					$("#list").find('.listView').html(data.trim());//일단 여기 부분 봐야함 나중에 일단 가능함!
					
				}
			
			});
		})
	}
	
	
	//2) 분류된것(분류 후 pager 클릭시)
	function getSortPagerList(){
		let dataNum = $("#list").find('.listView').find('.pager').attr("data-num");
		//console.log(dataNum);
		//let dataNum = $(this).attr("data-num");
		let productNum = $('#productNum').val();
		
		//console.log(dataNum);
		$.ajax({
			type: "GET",
			url: "./reviewSort",
			data:{
				pn:pn,
				perPage:5,
				productNum:productNum,
				dataNum:dataNum
			},
			success:function(data){
				$("#list").find('.listView').html(data.trim());//일단 여기 부분 봐야함 나중에 일단 가능함!
				
			}
		});
	}
	
	
	
	
	
	//상품페이지로 옮길것끝