/**
 * 
 */
 $("#buttons").hide();
 $("#buttons2").hide();
 
let CDate = new Date(); //현재 날짜 및 시간
let today = new Date(); //현재 날짜 및 시간
let selectCk = 0;
// console.log(CDate);
// console.log(today);

//전역
let year = CDate.getFullYear();
let month = CDate.getMonth() + 1;
let date_txt = "";


let lastday=today.getDate()-1;
console.log(lastday);


console.log($("#holiday").val());

// 달력안에 숫자 만들기
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
	
	for(let i = 0; i < 42; i++){
		
		// 휴무일 체크용
		function getInputDayLabel() { 
	 	let week = new Array('일', '월', '화', '수', '목', '금', '토');     
	 	
	 	let dayCheck = new Date("'"+year+"-"+month+"-"+dates[i]+"'").getDay();  

	 	console.log(year+"-"+month+"-"+dates[i]);
		let todayLabel = week[dayCheck];
		      
		return todayLabel;
		}

			
		
		if(i < thisFirst.getDay()){
			htmlDates += '<div class="date last">'+dates[i]+'</div>'; // 달력 처음 시작할 때 전달 날짜 클릭 X
		}else if(i<lastday&&today.getMonth()==CDate.getMonth() && today.getFullYear()==CDate.getFullYear()) {  // 당일로부터 지난날 클릭 X 
			htmlDates += '<div class="date last" disabled>'+dates[i]+'</div>'; 
		
		}else if($("#holiday").val().includes(getInputDayLabel())){ // 휴무일 지정 클릭 X
			htmlDates += '<div class="date last" disabled>'+dates[i]+'</div>';
			
		}else if(today.getDate()==dates[i] && today.getMonth()==CDate.getMonth() && today.getFullYear()==CDate.getFullYear()){ // 오늘 날짜
			 htmlDates += '<div id="date_'+dates[i]+'" class="date today" onclick="fn_selectDate('+dates[i]+');">'+dates[i]+'</div>'; 
		}else if(i >= thisFirst.getDay() + thisLast.getDate()){ // 달력 다음 달로 넘어가는 날짜 클릭 X
			 htmlDates += '<div class="date next">'+dates[i]+'</div>'; 
		}else{
			htmlDates += '<div id="date_'+dates[i]+'" class="date" onclick="fn_selectDate('+dates[i]+');">'+dates[i]+'</div>'; // 오늘 이후 날짜 클릭 O
		}
		
		
		
		
	 } 
document.querySelector(".dates").innerHTML = htmlDates; 




} 




//전달 달력
function prevCal(){
	console.log("달력 달:"+CDate.getMonth());
	console.log("달력 년도:"+CDate.getFullYear());
	console.log("현재 달:"+today.getMonth());
	console.log("현재 년도:"+today.getFullYear());
	// 다음 년도에서 전년도로 넘어갈때 
	if(month==1){
		year--;
		CDate.setFullYear(CDate.getFullYear()-1);
		CDate.setMonth(12);
		month=13; //아래에서 한번 차감됨
		// buildcalendar();
		}
	// 년도가 크면 달 비교 x 빌드캘린더, 년도가 같으면 달을 비교 o
	if(CDate.getFullYear()>today.getFullYear()){ 
		 CDate.setMonth(CDate.getMonth()-1);
		 month--;
		 buildcalendar(); 
	}else if(CDate.getFullYear()==today.getFullYear()){
		if(CDate.getMonth()-1>=today.getMonth()){
		 CDate.setMonth(CDate.getMonth()-1);
		 month--;
		 buildcalendar(); 
		 }else{
			console.log("월: 예약은 금일기준 다음날부터 가능합니다.");
			alert("예약은 금일기준 다음날부터 가능합니다.");
		}
		
	}else{
		console.log("년도: 예약은 금일기준 다음날부터 가능합니다.");
		alert("예약은 금일기준 다음날부터 가능합니다.");
	}
	
} 

//다음달 달력
function nextCal(){
	
	 CDate.setMonth(CDate.getMonth()+1);
	//다음 달 버튼 클릭하면 달이 +1 되도록 
	 month++;
	 if(month==13){
		month=1;
		year++;
	}	
	 buildcalendar(); 
}


function fn_selectDate(date){
	//지역변수
	let year = CDate.getFullYear();
	let month = CDate.getMonth() + 1;
	let date_txt = "";

	if(CDate.getMonth + 1 < 10){
		month = "0" + (CDate.getMonth() + 1);
	}
/*	if(date < 0){
		date_txt = "0" + date;
	}*/
	
	//활성화된 날짜 클릭시 
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
		
		//토요일 구분 
		let day=new Date(year,month-1,date);
		const WEEKDAY = ['일', '월', '화', '수', '목', '금', '토'];
		let week = WEEKDAY[day.getDay()];
		
		if(week=="토"){
			$("#buttons").hide();
			$("#buttons2").show();
		}else if(week!="토"){
			$("#buttons").show();
			$("#buttons2").hide();
		}
	}/*else if(today){
		$("#date_"+date).css("background-color", "white");
		$("#date_"+date).css("color", "gray");		
	}*/

	

}

buildcalendar();


$(".dateInfo_btn").click(function() {
		$(".calendar").slideToggle();

			});
			


//특정날짜 요일 가지고 오기 (휴일 표시용)
/*function getInputDayLabel() { 
 	let week = new Array('일', '월', '화', '수', '목', '금', '토');       
 	let today = new Date('2022-05-28').getDay();    
	let todayLabel = week[today];        
	return todayLabel;
	}  
	console.log(getInputDayLabel());*/
	
	/*if(getInputDayLabel()==$("#holiday").val()){
		htmlDates += '<div class="holiday" disabled>'+dates[i]+'</div>'
		
		
	}
    */