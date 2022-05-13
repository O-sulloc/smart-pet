
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
