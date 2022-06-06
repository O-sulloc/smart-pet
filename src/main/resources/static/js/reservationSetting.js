console.log("ㄹㅇㄴㅁㄹㄴ")

let term=$("select[name='term']:selected").val();
let capacity=$('input[name=capacity]').val();
let startBreaktime=$('#timepicker5').val();
let endBreaktime=$('input[name=endBreaktime]').val();



$(function() {
	//직접입력 인풋박스 기존에는 숨어있다가
	$("#selboxDirect").hide();

	$("#selbox").change(function() {
	//직접입력을 누를 때 나타남
		if ($("#selbox").val() == "direct") {
			$("#selboxDirect").show();
		} else {
			$("#selboxDirect").hide();
		}
	})
});



$('#datetimepicker').datetimepicker();

function DatetimepickerDefaults(opts) { 
	return $.extend({},{
		 locale: 'ko', 
		 format: 'YYYY-MM-DD HH:mm', 
		 inline: true,
		 sideBySide: true 
		 }, opts);
	 } 
	 
	 // 개별 달력 옵션 설정 
	 $('#date_start').datetimepicker(DatetimepickerDefaults({ 
		sideBySide: true 
		})); 
	$('#date_end').datetimepicker(DatetimepickerDefaults({ 
		sideBySide: true 
		}));

//

	$('#timepicker').timepicki(); 


//설정버튼 눌렀을시 유효성 체크 후 데이터 전송 
$('.btn').click(function(){
	validationCk();
})

function validationCk(){
	if($("#termSelbox option:selected").val()=='예약 시간 단위'){
		alert("예약시간 단위를 선택해주세요.");
		$('#termSelbox').focus();
		return false;
	}
	

	if($("#capacitySelbox option:selected").val()=='수용인원'){
		alert("예약시간 단위당 수용인원을 선택해주세요.");
		$('#capacitySelbox').focus();
		return false;
	}

	if(!$("#timepicker5").val()){
		alert("점심시간 시작시간을 입력해주세요.");
	    $("#timepicker5").focus();
	    return false;
	}
	
	if(!$("#timepicker6").val()){
		alert("점심시간 끝시간을 입력해주세요.");
	    $("#timepicker6").focus();
	    return false;
	}
	
	if(!$("#timepicker1").val()){
		alert("평일 첫 예약 시간을 입력해주세요.");
	    $("#timepicker1").focus();
	    return false;
	}	
	
	if(!$("#timepicker2").val()){
		alert("평일 마지막 예약 시간을 입력해주세요.");
	    $("#timepicker2").focus();
	    return false;
	}	
	if(!$("#timepicker3").val()){
		alert("주말 첫 예약시간을 입력해주세요.");
	    $("#timepicker3").focus();
	    return false;
	}	
	
	if(!$("#timepicker4").val()){
		alert("주말 마지막 예약 시간을 입력해주세요.");
	    $("#timepicker4").focus();
	    return false;
	}	
}




