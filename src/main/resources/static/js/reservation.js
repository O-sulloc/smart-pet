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

const res_btn=document.getElementById("res_btn");
const frm=document.getElementById("frm");
const resDate=document.getElementById("resDate");
const resTime=document.getElementById("resTime");



res_btn.addEventListener("click",function(){
	
	if(resDate.value==''){
		alert("예약날짜를 선택하세요.");
		return;
	}
	
	if(resTime.value==''){
		alert("예약시간을 선택하세요.");
		return;
		
	}
	frm.submit();
	alert("예약 승인 검토 중 입니다. 빠른 시일 내로 확답 드리겠습니다. 기다려주셔서 감사합니다. ");
	
	
})