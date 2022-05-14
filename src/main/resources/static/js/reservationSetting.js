console.log("d")


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


/* $(function(){
    $('#datepicker').datepicker();
  })
  
  $.datepicker.setDefaults({
  dateFormat: 'yy-mm-dd',
  prevText: '이전 달',
  nextText: '다음 달',
  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
  showMonthAfterYear: true,
  yearSuffix: '년'
});

$(function () {
  $('.datepicker').datepicker();
});
*/

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








