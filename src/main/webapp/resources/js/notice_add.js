
//add js


//카테고리 리스트 호출
//호출해야 작동함
function makeList(cateList) {

	//타입 관련 JQUERY
	let typeList = JSON.parse(cateList);

	let type1Array = new Array();
	let type2Array = new Array();

	let type1Obj = new Object();
	let type2Obj = new Object();


	let typeSelect1 = $(".type1");
	let typeSelect2 = $(".type2");


	//타입 배열 초기화 메서드
	function makeTypeArray(obj, array, typeList, cateLevel) {
		for (let i = 0; i < typeList.length; i++) {
			if (typeList[i].cateLevel === cateLevel) {
				obj = new Object();

				obj.cateName = typeList[i].cateName;
				obj.grade = typeList[i].grade;
				obj.gradeRef = typeList[i].gradeRef;

				array.push(obj);
			}
		}
	}

	// 배열 초기화
	makeTypeArray(type1Obj, type1Array, typeList, 1);
	makeTypeArray(type2Obj, type2Array, typeList, 2);

	// 대분류 <option> 태그
	for (let i = 0; i < type1Array.length; i++) {
		typeSelect1.append("<option value='" + type1Array[i].grade + "'>"
		+ type1Array[i].cateName + "</option>");
	}

	// 중분류 <option> 태그
	$(typeSelect1).on("change",function() {
		let selectVal1 = $(this).find("option:selected").val();
		
		typeSelect2.children().remove();
		
		typeSelect2.append("<option value='none'>선택</option>")

		for (let i = 0; i < type2Array.length; i++) {
			if (selectVal1 === type2Array[i].gradeRef) {
				typeSelect2.append("<option value='" + type2Array[i].grade + "'>"
				+ type2Array[i].cateName + "</option>");
			}
		}
	});
}
//카테고리 리스트 호출 끝



//유효성 검사 시작

//전역변수로 설정
let typeCheck1 = false;
let typeCheck2 = false;
let writerCheck = false;
let titleCheck = false;
let checkTitle = false; //중복
let contentsCheck = false;

	
function totalCheck(){
	
	//제목 중복체크
	$('.title_check').focusout(function(){
		let title = $(this).val();
		$.ajax({	
			url : "./titleCheck",
			type : "post",
			data : {title : title},
			dataType : 'json',
			success : function(result){
				//console.log(result);
				if(result == 0){
					$("#checkTitle").html('사용할 수 있는 제목입니다.');
					$("#checkTitle").attr('color','green');
					checkTitle = true;
				}else{
					$("#checkTitle").html('사용할 수 없는 제목입니다.');
					$("#checkTitle").attr('color','red');
				}
	
			},
			error : function(){
				alert("서버 요청 실패");
			}
		});
	});

	//중분류 태그
	$('.type1').change(function(){
		//console.log("change");
		//console.log($(this).val());
		let t1 = $(this).val();
		//console.log(t1);
		if(t1 =='none'){
			typeCheck1 = false; 
			//console.log("none");
		}else{
			//console.log("yes");
			typeCheck1 = true;
			//중간에 변경시 add 되는 오류잡기
			typeCheck2 = false;
		}
	});

	//소분류 태그
	$('.type2').change(function(){
		//console.log("change");
		//console.log($(this).val());
		let t2 = $(this).val();
		//console.log(t1);
		if(t2 =='none'){
			typeCheck1 = false; 
			//console.log("none");
		}else{
			//console.log("yes");
			typeCheck1 = true;
			//중간에 변경시 add 되는 오류잡기
			typeCheck2 = true;
		}
	});

	//작성자 체크 일단 빼볼것 자동으로 넣고 readonly
	$('#id').focus();
	$('#id').blur(function(){
		if($(this).val() == ''){
			writerCheck = false;
		}else{
			writerCheck = true;
		}
	});

	//제목 공백 체크
	$('#title').blur(function(){
		console.log("title");
		let blank_pattern = /^\s+|\s+$/g; // 공백체크
			if($(this).val() == ''){
				titleCheck = false;
			}else{
				//앞뒤 문자 다 없애고 공백만 남겼을때 공백만 있으면 발동
				if($(this).val().replace(blank_pattern, '').length == 0){
					//일단 맨 앞에 공백있어도 넘어가게 해놓음
					alert('공백만 입력되었습니다');
					$(this).val(null);
					titleCheck = false;
				}else{
					titleCheck = true;
				}
			}
	});

	/*$('#contents').blur(function(){
		if($(this).val() == ''){
			contentsCheck = false;
		}else{
			contentsCheck = true;
		}
	});
*/
	//write 버튼 클릭
	$("#btn").click(function(){

		if(!typeCheck1){
			alert("카테고리 항목 선택해주세요");
			$('.type1').focus();
			return;
		}

		if(!typeCheck2){
			alert("카테고리 항목 선택해주세요");
			$('.type2').focus();
			return;
		}

		if(!writerCheck){
			alert("작성자를 입력해주세요");
			$('#id').focus();
			return;
		}
		
		if(!titleCheck){
			alert("제목을 입력해주세요");
			$('#title').focus();
			return;
		}

		if(!checkTitle){
			alert("다른 제목을 입력해주세요");
			$('#title').focus();
			return;
		}

		/*if(!contentsCheck){
			alert("내용을 입력해주세요");
			$('#contents').focus();
			return;
		}*/

		//모두 체크시(카테고리 수정 막아버릴까?)
		let check = window.confirm("카테고리는 수정이 어렵습니다. 이대로 작성하시겠습니까?"); //check에 boolean 담김
		if(!check){
			return;
		}else{
			//form add
			$(".frm").submit();
		}

	});
}
//유효성 검사 끝


