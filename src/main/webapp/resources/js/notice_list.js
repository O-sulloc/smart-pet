
$(".notice").click(function(){
	console.log("click");
	location.href="/notice/list";
})

$(".faq").click(function(){
	location.href="/faq/list?gradeRef=400";
})

$(".faqList").click(function(){
	location.href="/faq/list?gradeRef=400";
})

//창 실행될때 search에 값이 있으면 그 값에 하이라이트 주는 코드
window.addEventListener('DOMContentLoaded', function(){
	console.log("hi");
	if($('#search').val()){
		console.log("gihi")
		var search = $('#search').val();
		$(".title:contains('"+search+"')").each(function () {
			var regex = new RegExp(search,'gi');
			$(this).html($(this).text().replace(regex, "<span class='text-red'>"+search+"</span>") );
		});
	}
});


//search 버튼 클릭시 검색어 없을때 작동 막아주는 코드
$(".searchBtn").click(function(){
	if(!$('#search').val()){
		alert("검색어를 입력하세요");
	}else{
		$('.searchFrm').submit();
	}
});


// keyWord누를때 자동으로 값 넣어서 serch 이벤트 발생하는 코드
function searchKey(searchKey){
	//여기서 if문써서 searchKey값이 없으면 다 지우는 코드도 작성 가능
	
	console.log($(searchKey).text());
	
	$('#search').val($(searchKey).text());
	
	//이벤트 강제 부텨
	$(".searchBtn").trigger("click");
	
}


