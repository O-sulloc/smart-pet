/**
 * 
 */
let CDate = new Date(); 
let today = new Date();
let selectCk = 0;

let buildcalendar = function(){
	let htmlDates = ''; 

	let prevLast = new Date(CDate.getFullYear(), CDate.getMonth(), 0); //지난 달의 마지막 날 
	let thisFirst = new Date(CDate.getFullYear(), CDate.getMonth(), 1); //이번 달의 첫째날
	let thisLast = new Date(CDate.getFullYear(), CDate.getMonth() + 1, 0); //이번 달의 마지막 날
	document.querySelector(".year").innerHTML = CDate.getFullYear() + "년";  // year에 년도 출력
	document.querySelector(".month").innerHTML = (CDate.getMonth() + 1) + "월";  //month에 월 출력


	const dates = []; 
	if(thisFirst.getDay()!=0){ 
		for(let i = 0; i < thisFirst.getDay(); i++){
			dates.unshift(prevLast.getDate()-i); // 지난 달 날짜 채우기
		} 
	} 
	for(let i = 1; i <= thisLast.getDate(); i++){
			 dates.push(i); // 이번 달 날짜 채우기 
	} 
	for(let i = 1; i <= 13 - thisLast.getDay(); i++){ 
			 dates.push(i); // 다음 달 날짜 채우기 (나머지 다 채운 다음 출력할 때 42개만 출력함)
	} 
	
	for(var i = 0; i < 42; i++){
		if(i < thisFirst.getDay()){
			htmlDates += '<div class="date last">'+dates[i]+'</div>'; 
		}else if(today.getDate()==dates[i] && today.getMonth()==CDate.getMonth() && today.getFullYear()==CDate.getFullYear()){
			 htmlDates += '<div id="date_'+dates[i]+'" class="date today" onclick="fn_selectDate('+dates[i]+');">'+dates[i]+'</div>'; 
		}else if(i >= thisFirst.getDay() + thisLast.getDate()){
			 htmlDates += '<div class="date next">'+dates[i]+'</div>'; 
		}else{
			htmlDates += '<div id="date_'+dates[i]+'" class="date" onclick="fn_selectDate('+dates[i]+');">'+dates[i]+'</div>'; 
		}
	 } 
document.querySelector(".dates").innerHTML = htmlDates; 
} 

function prevCal(){
	 CDate.setMonth(CDate.getMonth()-1); 
	 buildcalendar(); 
} 
function nextCal(){
	 CDate.setMonth(CDate.getMonth()+1);
	 buildcalendar(); 
}



function fn_selectDate(date){
	let year = CDate.getFullYear();
	let month = CDate.getMonth() + 1;
	let date_txt = "";
	
	if(CDate.getMonth + 1 < 10){
		month = "0" + (CDate.getMonth() + 1);
	}
	if(date < 10){
		date_txt = "0" + date;
	}
	
	if(selectCk == 0){
		$(".date").css("background-color", "");
		$(".date").css("color", "");
		$("#date_"+date).css("background-color", "red");
		$("#date_"+date).css("color", "white");

		$("#resDate").val(year+"-"+month+"-"+date);

		selectCk = month;
		console.log(selectCk);
		
		d=date;
		
		
			
		
	}else{
		$("#date_"+date).css("background-color", "white");
		$("#date_"+date).css("color", "black");		
	
		selectCk = 0;
	}
	

}

buildcalendar();




$(".res_btn").click(function() {
	let serNum = $(this).attr("data-sn");
	let resDate = year + "-" + month + "-" + d;
	
	console.log(resDate)


}

);

/*const order_btn=document.querySelector(".order_btn");
const calendar=document.querySelector(".calendar");

calendar.addEventListener("click",function(){
	let order_btn=event.target.getAttribute("data-d")
	
})*/

 /*order_btn.addEventListener("click",function(){
	let resDate=year+"-"+month+"-"+d;
	if(resDate.value==''){
		alert("날짜를 선택해주세요.");
		return;
	}
	alert("예약되었습니다.");
	
})*/
 
/*order_btn.addEventListener("click",function(event){
	let order_btn = event.target;
	
	if(order_btn.classList.contains("dates")){
		
	let serNum = $(this).attr("data-sn");
	let resDate=year+"-"+month+"-"+d;
	let resTime="9:00";
	console.log(resDate);
	const xhttp = new XMLHttpRequest();
	
	xhttp.open("POST","../reservation/add");
	xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhttp.send("serNum="+serNum+"&resDate="+resDate+"&resTime"+resTime);
	
	
	xhttp.onreadystatechange=function(){
		if(this.readyState==4&&this.status==200){
			console(this.responseText);
			let result=this.responseText.trim();
			
			if(result=='1'){
				alert("예약 되었습니다.");
			}else if(result=='0'){
				alert("로그인이 필요합니다.");
			}else{
				alert("예약실패");
			}
		}
	}
	
	}
	
});*/
$("#reservation").click(function(){
	
	let serNum = $(this).attr("data-sn");
	let resDate=year+"-"+month+"-"+d;
	console.log(resDate);
	$.ajax({
		type:"POST",
		url:"../reservation/add",
		success:function(data){
			console.log("Data:",data);
			if(data.trim()=='1'){
				alert("예약완료");
						
			}else{
				alert("예약 실패");
			}
		}
	})
	
});

