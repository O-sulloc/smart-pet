/**
 *reservation
 */
 
 console.log("예약js");
 $("#res_btn").click(function(){
	console.log("예약을 진행하시겠습니까?")
			
	let confirm_val=confirm("예약하시겠습니까?");
	if(confirm_val==false){
		return false;
	}			
	
			
});
		
 $(".res_update").click(function(){
			
	confirm_val=confirm("예약 변경하시겠습니까?");
		if(confirm_val==false){
		return false;
	}	
	
			
});
		

 $(".res_delete").click(function(){
			
	confirm_val=confirm("예약을 취소하면 복구할 수 없습니다. 그래도 취소하시겠습니까?");
		if(confirm_val==false){
		return false;
	}
	
			
});