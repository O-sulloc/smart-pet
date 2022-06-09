
var CDate = new Date(); 
var today = new Date();
var selectCk = 0;
let resDate="";
let resDate2="";
let pn="";
let perPage="";


//pager
$("#list").on("click",".pager",function(){
	pn=$(this).attr("data-pn");
		if(pn >0){
			//pn=checkPn;
			getDayList(resDate,pn,perPage);
			
		}else {
			//이전 또는 다음 Block이 X
			alert("마지막 페이지 입니다");
		}
})

$("#list").on("change",".perPage",function(){
	console.log($(this).val())
	perPage=$(this).val();

	getDayList(resDate,pn,perPage);	

})


//예약 종류별 수 가져오기 
function getStateCountList(resDate2){
	$.ajax({
			type:"GET",
			url:"./ajaxMonthCountList",
			data:{
				resDate:resDate2
			},
			success:function(data){
				console.log(data)
				$("#count").html(data.trim());
			
			},
			error:function(){
				alert('count 가져오기 실패')
			}
		})//ajax로 데이터 전송 	 
}


//날짜별 예약 리스트 가져오기 
function getDayList(resDate,pn,perPage){
	$.ajax({
			type:"GET",
			url:"./ajaxDayReservationList",
			data:{
				resDate:resDate,
				pn:pn,
				perPage:perPage
			},
			success:function(data){
				$("#list").html(data.trim());
			
				//perPage 5로 초기화 되는것 방지 코드 
				if(perPage=="5"){
		       	 	$('#5').attr('selected',true);      
			    } else if(perPage=="10"){
			        $('#10').attr('selected',true);
			    }else if(perPage==15){
			        $('#15').attr('selected',true);
			    }else if(perPage==20){
			        $('#20').attr('selected',true);
			    } else{
			        $('#25').attr('selected',true);
			    }
				
			},
			error:function(){
				alert('실패')
			}
		})//ajax로 데이터 전송 	 
}


var buildcalendar = function(){
	var htmlDates = ''; 
	var prevLast = new Date(CDate.getFullYear(), CDate.getMonth(), 0); //지난 달의 마지막 날 
	var thisFirst = new Date(CDate.getFullYear(), CDate.getMonth(), 1); //이번 달의 첫쨰 날
	var thisLast = new Date(CDate.getFullYear(), CDate.getMonth() + 1, 0); //이번 달의 마지막 날
	document.querySelector(".year").innerHTML = CDate.getFullYear() + "년";  // year에 년도 출력
	document.querySelector(".month").innerHTML = (CDate.getMonth() + 1) + "월";  //month에 월 출력
	const dates = []; 
	if(thisFirst.getDay()!=0){ 
		for(var i = 0; i < thisFirst.getDay(); i++){
			dates.unshift(prevLast.getDate()-i); // 지난 달 날짜 채우기
		} 
	} 
	for(var i = 1; i <= thisLast.getDate(); i++){
			 dates.push(i); // 이번 달 날짜 채우기 
	} 
	for(var i = 1; i <= 13 - thisLast.getDay(); i++){ 
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
	
	var year = CDate.getFullYear();
	var month = CDate.getMonth() + 1;
	var date_txt = "";
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

		selectCk = date;
		    resDate=year+"-"+month+"-"+date
		    resDate2=year+"-"+(month<10?"0"+month:month)+"-"+(date<10?"0"+date:date)
		    console.log("!!!!"+resDate2)
		    
		getDayList(resDate)
		getStateCountList(resDate2)
		selectCk = 0;
	}else{
		$("#date_"+date).css("background-color", "white");
		$("#date_"+date).css("color", "black");		
	
	
		
	}
	
}

buildcalendar();





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
				if(resState==1){//승인시에 이메일 보내기 
					$.ajax({
						type:"POST",
						url:"./sendEmail",
						data:{
							resNum:resNum,
						},
						
					})
				}
				getDayList(resDate)
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

//사이드바에서 예약리스트 눌렀을때 상태1로 변경하기 
$('#reservationList').click(function(){
	state=1;
})


