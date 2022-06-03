
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
	 //3:방문완료 4:미방문
	
		$.ajax({
			type:"POST",
			url:"./setUpdateResState",
			data:{
				resNum:resNum,
				resState:resState
			},
			success:function(data){
			if(data.trim()==1){
				
					getOverdue(pn,perPage)
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




// 기한지나고 예약승인된 예약리스트 
	function getOverdue(pn,perPage){
		$.ajax({
			type:"GET",
			url:"./ajaxOverdueList",
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


getOverdue(1,5);