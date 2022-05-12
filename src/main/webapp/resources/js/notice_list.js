
$(".notice").click(function(){
	console.log("click");
	location.href="/notice/list";
})

$(".faq").click(function(){
	location.href="/faq/list?gradeRef=99";
})



$(document).ready(function(){
	// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
});



// Collapse로 화면이 펼치기 전에 호출
$('.collapse').on('show.bs.collapse', function () {
	// icon을 + 마크로 변경한다.
	var target = $("[href='#"+$(this).prop("id")+"']");
	target.removeClass("fa-plus-square");
	target.addClass("fa-minus-square");
});

// Collapse로 화면이 펼친 후에 호출
$('.collapse').on('shown.bs.collapse', function () {
	// icon을 + 마크로 변경한다.
	var target = $("[href='#"+$(this).prop("id")+"']");
	target.removeClass("fa-plus-square");
	target.addClass("fa-minus-square");
});

// Collapse로 화면에 접기 전에 호출
$('.collapse').on('hide.bs.collapse', function () {
	// icon을 - 마크로 변경한다.
	var target = $("[href='#"+$(this).prop("id")+"']");
	target.removeClass("fa-minus-square");
	target.addClass("fa-plus-square");
});

// Collapse로 화면에 접고 난 후에 호출
$('.collapse').on('hidden.bs.collapse', function () {
	// icon을 - 마크로 변경한다.
	var target = $("[href='#"+$(this).prop("id")+"']");
	target.removeClass("fa-minus-square");
	target.addClass("fa-plus-square");
});
	


