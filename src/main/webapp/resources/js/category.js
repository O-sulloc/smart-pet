/**
 * 
 */
 function selectCategory(){
	
 $("#pcategoryNum").change(function(){
	if(this.value==1){
	$("#cResult").empty();
	let f='<div class="mb-3" style="width:200px">';
	f=f+'<label>카테고리 분류</label> <select name="categoryNum" class="form-control empty" id="categoryNum">';
	f=f+'<option value="">선택해주세요.</option>';
	f=f+'<option value="100">사료</option>';
	f=f+'<option value="200">간식</option>';
	f=f+'<option value="300">장난감</option>';
	f=f+'<option value="400">건강관리</option>';
	f=f+'<option value="500">용품</option>';
	f=f+'<option value="600">미용/목욕</option>';
	f=f+'<option value="700">하우스</option>';
	f=f+'<option value="800">목줄</option>';
	f=f+'</select>';
	f=f+'</div>';
	$("#cResult").append(f);
}
if(this.value==2){
	$("#cResult").empty();
	let f='<div class="mb-3" style="width:200px">';
	f=f+'<label>카테고리 분류</label> <select name="categoryNum" class="form-control empty" id="categoryNum">';
	f=f+'<option value="">선택해주세요.</option>';
	f=f+'<option value="100">사료</option>';
	f=f+'<option value="200">간식</option>';
	f=f+'<option value="300">장난감</option>';
	f=f+'<option value="400">건강관리</option>';
	f=f+'<option value="500">용품</option>';
	f=f+'<option value="600">미용/목욕</option>';
	f=f+'<option value="700">하우스</option>';
	f=f+'<option value="800">목줄</option>';
	f=f+'</select>';
	f=f+'</div>';
	$("#cResult").append(f);
}
});
}