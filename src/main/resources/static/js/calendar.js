/**
 * 
 */
 
let CDate = new Date(); 
let today = new Date();
let selectCk = 0;

let buildcalendar = function(){
	let htmlDates = ''; 
	let prevLast = new Date(CDate.getFullYear(), CDate.getMonth(), 0); //지난 달의 마지막 날 
	let thisFirst = new Date(CDate.getFullYear(), CDate.getMonth(), 1); //이번 달의 첫쨰 날
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
	
	for(let i = 0; i < 42; i++){
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


	let year = CDate.getFullYear();
	let month = CDate.getMonth() + 1;
	let date_txt = "";
	let d="";
function fn_selectDate(date){
	
	
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
		
		$("#period_1").val(year+"-"+month+"-"+date);
		
		selectCk = date;
		d=date;
		console.log(selectCk);
		console.log(year+"-"+month+"-"+date);
		
			
		
	}else{
		$("#date_"+date).css("background-color", "white");
		$("#date_"+date).css("color", "black");		
	
		console.log(selectCk);
		selectCk = 0;
	}
	
}

buildcalendar();