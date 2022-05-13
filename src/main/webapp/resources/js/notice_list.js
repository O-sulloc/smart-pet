
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

$('#search').focus().select();
//$('#search').trigger("focus");

$('#search').blur(function(){
	console.log($(this).val());
    var search = $('#search').val();
    $("#title:contains('"+search+"')").each(function () {
        var regex = new RegExp(search,'gi');
        $(this).html($(this).text().replace(regex, "<span class='text-red'>"+search+"</span>") );
    });
});