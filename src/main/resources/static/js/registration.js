//진료과목 on/off
//샵 클릭시 div 숨기고 value="" 로 변경하기  
console.log(12312)

$("input[name='serKind']").change(function() {
	
	let kind = $("input[name='serKind']:checked").val();

	if (kind == 2) {
		$("#hospital").hide();
		$("input[name='hospitalField'").val("");
	} else {
		$("#hospital").show();
	}

});


