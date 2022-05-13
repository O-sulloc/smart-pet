/**
 *reservation
 */
 
 $("#reservation").click(function(){
	let serNum = $(this).attr("data-sn");
	console.log(serNum);
	let resDate=year+"-"+month+"-"+d;
	$.ajax({
		type:"POST",
		url:"../reservation/"+serNum+"/"+resDate,
		success:function(data){
			console.log("Data:",data);
			if(data!=''){
				let check = confirm("예약 완료");
				
			}else{
				alert("예약 실패");
			}
		}
	})
	
})