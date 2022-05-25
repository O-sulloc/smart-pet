
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
					getResStateIs0List(pn,perPage)
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




let pn=1;
let perPage=5;




// 대기중인 예약 리스트 가져오는ajax 
	function getResStateIs0List(pn,perPage){
		$.ajax({
			type:"GET",
			url:"./ajaxgetResStateIs0List",
			data:{
				pn:pn,
				perPage:perPage
			},
			success:function(data){
				console.log(data)
				$("#list").html(data.trim());
				
			}
		})	
}


getResStateIs0List(1,5);



















