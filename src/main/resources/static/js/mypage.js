
$("#delete").click(function(){
	let check=confirm("삭제시 복구 불가능합니다. 정말로 삭제하시겠습니까?")
	if(!check){
		return;
	}
});

