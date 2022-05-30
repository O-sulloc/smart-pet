console.log("dfsfs")

let resDate=""

//N월 클릭시 
$(".monthpicker").on("click",".monthBtn",function(){
	let month=$(this).val()
	let year=$("#yearSelect option:selected").val()
	resDate=(year+"-"+month)
	console.log(resDate)
	getDayList(resDate)
	getStateCountList(resDate)
})

//해당 월에 해당하는 예약 리스트 가져오기 
function getDayList(resDate){
	$.ajax({
			type:"GET",
			url:"./ajaxMonthReservationList",
			data:{
				resDate:resDate
			},
			success:function(data){
				$("#list").html(data.trim());
			
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


