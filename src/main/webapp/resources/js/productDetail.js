/**
 *  상품 디테일 관리하는 js
 */
/* 재고 수량 관리*/

$(".plus").click(function() {
	let num = $(".numBox").val();
	let plusNum = Number(num) + 1;
	let sum = 0;

	if (plusNum > $(".pCount_hidden").val()) {
		alert("재고가 부족합니다.")

	} else {
		$(".numBox").val(plusNum);
		if ($('.rate_hidden').val() == 0) {

			sum = plusNum * $('.oPrice_hidden').val()
			$(".priceResult").val(sum);
		}
		else {

			sum = plusNum * $('.tPrice_hidden').val()
			$(".priceResult").val(sum);
		}
	}
});


$(".minus").click(function() {
	let num = $(".numBox").val();
	let minusNum = Number(num) - 1;
	let sum = 0;

	if (minusNum <= 0) {
		alert("한개 이상 구매 가능합니다.")
		$(".numBox").val(num);
	} else {
		$(".numBox").val(minusNum);
		if ($('.rate_hidden').val() == 0) {

			sum = minusNum * $('.oPrice_hidden').val()
			$(".priceResult").val(sum);
		}
		else {

			sum = minusNum * $('.tPrice_hidden').val()
			$(".priceResult").val(sum);
		}
	}
});

