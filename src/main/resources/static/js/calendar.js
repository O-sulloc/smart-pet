/**
 * 
 */
let CDate = new Date(); 
let today = new Date();
let selectCk = 0;


console.log(today);


let lastday=today.getDate()-1;
console.log(lastday);


console.log($("#holiday").val());
let buildcalendar = function(){
	let htmlDates = ''; 

	let prevLast = new Date(CDate.getFullYear(), CDate.getMonth(), 0); //지난 달의 마지막 날 
	let thisFirst = new Date(CDate.getFullYear(), CDate.getMonth(), 1); //이번 달의 첫째날
	let thisLast = new Date(CDate.getFullYear(), CDate.getMonth() + 1, 0); //이번 달의 마지막 날
	document.querySelector(".year").innerHTML = CDate.getFullYear() + "년";  // year에 년도 출력
	document.querySelector(".month").innerHTML = (CDate.getMonth() + 1) + "월";  //month에 월 출력


	// 휴일 체크용 여기 하는중
	function getInputDayLabel() { 
 	let week = new Array('일', '월', '화', '수', '목', '금', '토');       
 	let today = new Date('year+"-"+month+"-"+date').getDay();    
	let todayLabel = week[today];        
	return todayLabel;
	}
	
	
	//console.log(getInputDayLabel());



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
		}else if(i<lastday&&today.getMonth()==CDate.getMonth()) {
			htmlDates += '<div class="date last" disabled>'+dates[i]+'</div>'; 
		
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




//전달 달력
function prevCal(){
	
	if(CDate.getMonth()>today.getMonth()){
	 CDate.setMonth(CDate.getMonth()-1); 
	 buildcalendar(); 
	 }else{
		alert("예약은 금일기준 다음날부터 가능합니다.");
	}
} 

//다음달 달력
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
/*	if(date < 0){
		date_txt = "0" + date;
	}*/
	
	if(selectCk == 0){
		$(".date").css("background-color", "");
		$(".date").css("color", "");
		$("#date_"+date).css("background-color", "red");
		$("#date_"+date).css("color", "white");
	
		$("#resDate").val(year+"-"+month+"-"+date);
		
		selectCk = year+"-"+month+"-"+date;
		console.log(selectCk);
		
		d=date;


		selectCk = 0;
		
			

		
	}else if(today){
		$("#date_"+date).css("background-color", "white");
		$("#date_"+date).css("color", "gray");		

	}
	

}

buildcalendar();


$(".dateInfo_btn").click(function() {
		$(".calendar").slideToggle();

			});

//특정날짜 요일 가지고 오기 (휴일 표시용)
function getInputDayLabel() { 
 	let week = new Array('일', '월', '화', '수', '목', '금', '토');       
 	let today = new Date('2022-05-28').getDay();    
	let todayLabel = week[today];        
	return todayLabel;
	}  
	console.log(getInputDayLabel());
	
	/*if(getInputDayLabel()==$("#holiday").val()){
		htmlDates += '<div class="holiday" disabled>'+dates[i]+'</div>'
		
		
	}
    */