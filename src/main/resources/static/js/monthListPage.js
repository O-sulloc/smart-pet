console.log("dfsfs")
let pn="";
let perPage="";
let resDate=""

$("#list").on("click",".pager",function(){
	pn=$(this).attr("data-pn");
		if(pn > 0){
			//pn=checkPn;
			getMonthList(pn,perPage,resDate);
			
		}else {
			//이전 또는 다음 Block이 X
			alert("마지막 페이지 입니다");
		}
})

$("#list").on("change",".perPage",function(){
	console.log($(this).val())
	perPage=$(this).val();
	console.log(resDate)
console.log(pn)
console.log(perPage)
	getMonthList(resDate,pn,perPage);	

})

//N월 클릭시 
$(".monthpicker").on("click",".monthBtn",function(){
	let month=$(this).val()
	let year=$("#yearSelect option:selected").val()
	resDate=(year+"-"+month)
	console.log(resDate)
	getMonthList(resDate,pn,perPage)
	getStateCountList(resDate)
})

//해당 월에 해당하는 예약 리스트 가져오기 
function getMonthList(resDate,perPage,pn){
	$.ajax({
			type:"GET",
			url:"./ajaxMonthReservationList",
			data:{
				resDate:resDate,
				pn:pn,
				perPage:perPage
			},
			success:function(data){
				$("#list").html(data.trim());
				
				//perPage 5로 초기화 되는것 방지 코드 
				if(perPage=="5"){
		       	 	$('#5').attr('selected',true);      
			    } else if(perPage=="10"){
			        $('#10').attr('selected',true);
			    }else if(perPage==15){
			        $('#15').attr('selected',true);
			    }else if(perPage==20){
			        $('#20').attr('selected',true);
			    } else{
			        $('#25').attr('selected',true);
			    }
			},
			error:function(){
				alert('실패')
			}
		})//ajax로 데이터 전송 	 
}

//
function getStateCountList(resDate){
	$.ajax({
			type:"GET",
			url:"./ajaxMonthCountList",
			data:{
				resDate:resDate
			},
			success:function(data){
				console.log(data)
				$("#count").html(data.trim());
			
			},
			error:function(){
				alert('count 가져오기 실패')
			}
		})//ajax로 데이터 전송 	 
}



//예약상태 변경 버튼 클릭시 
$("#list").on("click",".modalBtn",function(){
 	$('#myModal').modal('show')
 	resNum=$(this).attr("data");
 	console.log("resNum:"+resNum)
})


 //모달창 변경버튼 -> 데이터 보내기 
$('.modalSubmit').click(function(){
	 let resState= $('input[name="resState"]:checked').val()
	 console.log("resState:"+resState)
	 console.log("resNum:"+resNum)
	 //1:승인 2:거절 
	
		$.ajax({
			type:"POST",
			url:"./setUpdateResState",
			data:{
				resNum:resNum,
				resState:resState
			},
			success:function(data){
			if(data.trim()==1){
				if(resState==1){//승인시에 이메일 보내기 
					$.ajax({
						type:"POST",
						url:"./sendEmail",
						data:{
							resNum:resNum,
						},
						
					})
				}
				getDayList(resDate)
			}else{
				alert("변경 실패했습니다. 다시 시도해주십시오.")
			}
				
			}
		})//ajax로 데이터 전송 	 
		
	
		
	$('#myModal').modal('hide')
	

})//저장버튼 클릭시 

//모달창 닫기 
$('.modalClose').click(function(){
	 $('#myModal').modal('hide')
})

//사이드바에서 예약리스트 눌렀을때 상태1로 변경하기 
$('#reservationList').click(function(){
	state=1;
})


