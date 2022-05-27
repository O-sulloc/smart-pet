/**
 *  
 */
/**/

//재고 수량 관리
// +
$(".plus").click(function() {
	let num = $(".numBox").val();
	let plusNum = Number(num) + 1;
	let sum = 0;

	if (plusNum > $(".pCount_hidden").val()) {
		alert("재고가 부족합니다.")

	} else {
		$(".numBox").val(plusNum);
			sum = plusNum * $('.tPrice_hidden').val()
			$(".priceResult").val(sum);
	}
});

//  -
$(".minus").click(function() {
	let num = $(".numBox").val();
	let minusNum = Number(num) - 1;
	let sum = 0;

	if (minusNum <= 0) {
		alert("더 이상 수량을 줄일 수 없습니다.")
		$(".numBox").val(num);
	} else {
		$(".numBox").val(minusNum);
		sum = minusNum * $('.tPrice_hidden').val()
		$(".priceResult").val(sum);
		
	}
});

//장바구니 담기
$(".addToCart").click(function(){
	let pCount = $(".numBox").val();   
	let userid=$(this).attr("data-id");
	let pNum=$(this).attr("data-pNum");
  
	$.ajax({
	 url : "../cart/add",
	 type : "POST",
	 data:{
		   	 id:userid,
			 productNum:pNum,
			 productAmount:pCount
	  },
	 success : function(data){
		if(data.trim()=='1'){
		   let check=confirm("장바구니 담기 성공하였습니다. 장바구니로 이동 하겠습니까?")
		   $(".numBox").val("1");
		   if(check){
		   location.href="../cart/list";
		   }
		   
		}else if(data.trim()=='2'){
		   alert("로그인이 필요합니다.");
		   $(".numBox").val("1");
		   location.href="../user/login";
		}else if(data.trim()=='3'){
			let check=confirm("이미 장바구니에 추가되었습니다. 장바구니로 이동 하겠습니까?")
			if(check){
			location.href="../cart/list";
			}
		}
	 },
	 error : function(){
	  alert("장바구니 담기 실패하였습니다.");
	 }
	});
   });