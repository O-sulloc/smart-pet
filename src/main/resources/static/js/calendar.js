/**
 * 
 */
 $("#buttons").hide();
 $("#buttons2").hide();
 
let CDate = new Date(); //현재 날짜 및 시간
let today = new Date(); //현재 날짜 및 시간
let selectCk = 0;
let clickDay="";

let capacityCkReturn='';


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
		}else if(i<lastday+3&&today.getMonth()==CDate.getMonth() && today.getFullYear()==CDate.getFullYear()) {  // 당일로부터 지난날 클릭 X 
			htmlDates += '<div class="date last" disabled>'+dates[i]+'</div>'; 
		
		}else if($("#holiday").val().includes(getInputDayLabel())){ // 휴무일 지정 클릭 X
			htmlDates += '<div class="date last" disabled>'+dates[i]+'</div>';
			
		}/*else if(today.getDate()==dates[i] && today.getMonth()==CDate.getMonth() && today.getFullYear()==CDate.getFullYear()){ // 오늘 날짜
			 htmlDates += '<div id="date_'+dates[i]+'" class="date today" onclick="fn_selectDate('+dates[i]+');">'+dates[i]+'</div>'; 
		}*/else if(i >= thisFirst.getDay() + thisLast.getDate()){ // 달력 다음 달로 넘어가는 날짜 클릭 X
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
		CDate.setDate(1)
		CDate.setFullYear(CDate.getFullYear()-1);
		CDate.setMonth(12);
		month=13; //아래에서 한번 차감됨
		// buildcalendar();
		}
	// 년도가 크면 달 비교 x 빌드캘린더, 년도가 같으면 달을 비교 o
	if(CDate.getFullYear()>today.getFullYear()){
		 CDate.setDate(1); 
		 CDate.setMonth(CDate.getMonth()-1);
		 month--;
		 buildcalendar(); 
	}else if(CDate.getFullYear()==today.getFullYear()){
		if(CDate.getMonth()-1>=today.getMonth()){
		 CDate.setDate(1); 
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
	
	 //31일이 없는 달이 있기 때문에 1일로 맞춰주고 (이전달 버튼 클릭시에도 마찬가지)
	 CDate.setDate(1);
	 
	 //다음 달 버튼 클릭하면 달이 +1 되도록 
	 CDate.setMonth(CDate.getMonth()+1);
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
	if(date < 0){
		date_txt = "0" + date;
	}
	
	
	//활성화된 날짜 클릭시 
	if(selectCk == 0){  
		$(".date").css("background-color", "");
		$(".date").css("color", "");
		$("#date_"+date).css("background-color", "red");
		$("#date_"+date).css("color", "white");
	
		$("#resDate").val(year+"-"+(month<10?"0"+month:month)+"-"+(date<10?"0"+date:date));
		
		selectCk = year+"-"+(month<10?"0"+month:month)+"-"+(date<10?"0"+date:date);
		console.log(selectCk)
		
		clickDay=year+"-"+(month<10?"0"+month:month)+"-"+(date<10?"0"+date:date);
		console.log(clickDay)
		d=date;
		clickDay=selectCk;
		// console.log(clickDay);
		selectCk = 0;
		
		//토요일 구분 
		let day=new Date(year,month-1,date);
		const WEEKDAY = ['일', '월', '화', '수', '목', '금', '토'];
		let week = WEEKDAY[day.getDay()];
		
		if(week=="토"||week=="일"){
		weekend()
		}else if(week!="토"){
		weekday()
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
			

//===============================================================================================
//===============================================================================================
//===============================================================================================
//===============================================================================================
//===============================================================================================
//===============================================================================================




let openTime0=$("#openTime0").val()
let closeTime0=$("#closeTime0").val()
let openTime1=$("#openTime1").val()
let closeTime1=$("#closeTime1").val()
let term=parseInt($("#term").val())
let capacity=$("#capacity").val();
let holiday=$("#holiday").val();
let startBreaktime=$("#startBreaktime").val();
let endBreaktime=$("#endBreaktime").val();

//현재시간
let thours = ('0' + today.getHours()).slice(-2); 
let tminutes = ('0' + today.getMinutes()).slice(-2);
let tseconds = ('0' + today.getSeconds()).slice(-2); 

let timeString = thours + ':' + tminutes  + ':' + tseconds;

console.log("현재시간"+timeString);



//점심시간 텀단위로 구해서 배열에 집어넣기  -> ar: 점심시간인 예약시간 배열 
//ex ) 13~14 term:30  13:00,13:30,14:00
	let ar=[];
	let brResult=""
	ar.push(hy(startBreaktime))
	for(i=0;i<20;i++){
		let brResult=plusTerm(ar[ar.length-1]+":00");
			 if(brResult==hy(endBreaktime)){
				break;
			 }
		ar.push(brResult)
	 }






//Date타입으로 변환해주는 함수 
function getDate(time){ 
    let d1 = new Date(); // Creates a Date Object using the clients current time
    let [hours, minutes, seconds] = time.split(':');
    d1.setHours(+hours); // Set the hours, using implicit type coercion
    d1.setMinutes(minutes); // can pass Number or String - doesn't really matter
    d1.setSeconds(seconds);

    return d1; //Tue May 17 2022 09:00:00 GMT+0900 (한국 표준시)
}

//date 형식을 HH:mm 으로 변환해주는 함수 
function getFormatTime(date){ 
    let HH= date.getHours();
    HH=HH>=10?HH:'0'+HH;
    let mm= date.getMinutes();
    mm=mm>=10?mm:'0'+mm;

    return HH+':'+mm;
}

function hy(time){ //Date Type으로 변환 후  HH:mm 형식으로 변환 
    let d1 = new Date(); // Creates a Date Object using the clients current time
    let [hours, minutes, seconds] = time.split(':');
    d1.setHours(+hours); // Set the hours, using implicit type coercion
    d1.setMinutes(minutes); // can pass Number or String - doesn't really matter
    d1.setSeconds(seconds);

    let HH= d1.getHours();
    HH=HH>=10?HH:'0'+HH;
    let mm= d1.getMinutes();
    mm=mm>=10?mm:'0'+mm;

    return HH+':'+mm;
}
//순서 주의 
// console.log(getFormatTime(getDate(openTime0))) 
// console.log(getDate(openTime0).setMinutes(30)) //1652747400579
// console.log(getDate(openTime0).getMinutes()+70) //30


//term 만큼 더해주는 함수(매개변수는 Stirng)
function plusTerm(time){
    var time = new Date(getDate(time).setMinutes(getDate(time).getMinutes()+term))
    time=getFormatTime(time)
    //getDate(time)                         :string->date 
    //getDate(time).getMinutes()+term       :term만큼 분 추가 //30
    //getDate(time).setMinutes(getDate(time).getMinutes()+term)     :분추가 한것을 저장 ->//1652747400579
    //var time = new Date()                 :밀리세컨즈숫자를 date로 변환
    //getFormatTime(time)                   :변환환것을 다시 미리생성해둔 HH:mm 포맷으로 변경 

    return time;
}


//예약한 인원 수 리턴 
function capacityCk(resDate,resTime){
	let capacityCkReturn="";
		
		$.ajax({
			type:"GET",
			url:"./resCount",
			 async: false,
			data:{
				resDate:resDate,
				resTime:resTime
			},
			success:function(data){
		
				capacityCkReturn=data.trim()

			}
		})

		
	return capacityCkReturn;
}


function weekday(){
			
	$("#buttons").empty()
	$("#buttons2").empty()
	
// 평일일 경우 예약시간 뿌리기 


let result=openTime0; //09:00:00

for(let i=0;i<40;i++){
	
	
	
    if(i==0){
        // <button type="button" name="resTime" class="btn btn-outline-primary">09:30</button>
   

        let button = document.createElement('button')
        button.setAttribute("type","button")
        button.setAttribute("id","timeButton")
        button.setAttribute("name","resTime")

           	if(capacityCk(clickDay,openTime0)>=capacity){
				button.setAttribute("class","btn btn-outline-secondary")
					button.setAttribute("disabled",true)
			}else{
				 button.setAttribute("class","btn btn-outline-primary")
			}
       
        button.innerHTML=hy(openTime0);

        $("#buttons").append(button) 
        
    //    console.log(hy(openTime0))
    //    console.log("=========================")
    }
    if(i!=0){
        // console.log("result:"+result)
        // console.log("Date로 변환:"+getDate(result))
		
      		  result=plusTerm(result);
        	
       			
		        let button = document.createElement('button')
		        button.setAttribute("type","button")
		        button.setAttribute("id","timeButton")
		        button.setAttribute("name","resTime")
		        //점심시간일경우 안보이게 
		     
		        
		        if(ar.includes(result)){ 
		       	 	button.setAttribute("class","btn btn-outline-secondary lunchTime")
					button.setAttribute("hidden",true)
					console.log(result)
				//아니면 추가 
				
				}else if(capacityCk(clickDay,result)>=capacity){
				
					button.setAttribute("class","btn btn-outline-secondary")
					button.setAttribute("disabled",true)
				}else{
					button.setAttribute("class","btn btn-outline-primary")
				}
		       
			    button.innerHTML=result;
      	 	 $("#buttons").append(button) 
      	 	 	
			
       

        // console.log("plusTerm result:"+result); //09:30

        result=result+":00"
        // console.log("=========================")
    }

    if(result==closeTime0){
        break;
    }
    
}
	$("#buttons").show();
}


function weekend(){
	$("#buttons").empty()
	$("#buttons2").empty()
// 주말일 경우 예약시간 뿌리기 
let result2=openTime1; //09:00:00
for(let i=0;i<40;i++){
    if(i==0){
        // <button type="button" name="resTime" class="btn btn-outline-primary">09:30</button>
    
        let button = document.createElement('button')
        button.setAttribute("type","button")
        button.setAttribute("id","timeButton")
        button.setAttribute("name","resTime")
        console.log(capacityCk(clickDay,openTime1))
       	if(capacityCk(clickDay,openTime1)>=capacity){
	
				button.setAttribute("class","btn btn-outline-secondary")
				button.setAttribute("disabled",true)
			}else{
				 button.setAttribute("class","btn btn-outline-primary")
			}
        button.innerHTML=hy(openTime1);

        $("#buttons2").append(button) 
        
    //    console.log(hy(openTime0))
    //    console.log("=========================")
    }
    if(i!=0){


        // console.log("result:"+result)
        // console.log("Date로 변환:"+getDate(result))

        result2=plusTerm(result2);
    
	        let button = document.createElement('button')
	        button.setAttribute("type","button")
	        button.setAttribute("id","timeButton")
	        button.setAttribute("name","resTime")
	        button.setAttribute("id","timeButton")
	        
	        
	        if(ar.includes(result2)){//점심시간일경우 회색으로 변경
	       	 	button.setAttribute("class","btn btn-outline-secondary")
				button.setAttribute("hidden",true)
	       	 
			
			}else if(capacityCk(clickDay,result2)>=capacity){
				button.setAttribute("class","btn btn-outline-secondary")
				button.setAttribute("disabled",true)
 			}else{
				button.setAttribute("class","btn btn-outline-primary")
				
			}
	        
	        button.innerHTML=result2;
	        $("#buttons2").append(button) 
	
        // console.log("plusTerm result:"+result); //09:30
        result2=result2+":00"
        // console.log("=========================")
    }

    if(result2==closeTime1){
        break;
    }
}
	$("#buttons2").show();
		
}

//점심시간일 경우 값이 들어가지 않도록
/*$(".lunchTime").on("click",function(){
	alert("점심시간은 예약이 불가능합니다. 다른 시간을 선택해주세요.");
	
})*/




$("#buttons").on("click","#timeButton",function(){
   console.log($(this).html());
   time=$(this).html();
   $("#resTime").val(time);
})



    