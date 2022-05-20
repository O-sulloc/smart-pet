/**
 *  장바구니 js
 */

Number.prototype.formatNumber = function() {

	if (this == 0) return 0;

	let regex = /(^[+-]?\d+)(\d)/;

	let nstr = (this + '');

	while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');

	return nstr;

};
//장바구니 수량변경 업데이트
let countBtn = $(".countBtn");
for (cb of countBtn) {

	let cartNum = cb.getAttribute("data-pNum");
	// + 계산
	$(".plus" + cartNum).click(function() {
		let num = $(".numBox" + cartNum).val();
		let plusNum = Number(num) + 1;
		let sum = 0;

		if (plusNum > $(".pCount" + cartNum).val()) {
			alert("재고가 부족합니다.");

		} else {
			$(".numBox" + cartNum).val(plusNum);
			sum = plusNum * $(".pPrice" + cartNum).val();
			$(".priceResult" + cartNum).val(sum);
			$.ajax({
				url: "./update",
				type: "POST",
				data: {
					productAmount: plusNum,
					cartNum: cartNum
				},
				success: function(data) {
					if (data.trim() == '1') {
					}
				},
				error: function() {
					alert("수량 변경을 실패했습니다.");
				}
			});
		}
	});
	// - 계산
	$(".minus" + cartNum).click(function() {
		let num = $(".numBox" + cartNum).val();
		let minusNum = Number(num) - 1;
		let sum = 0;

		if (minusNum <= 0) {
			alert("더 이상 수량을 줄일 수 없습니다.")
			$(".numBox" + cartNum).val(num);
		} else {
			$(".numBox" + cartNum).val(minusNum);

			sum = minusNum * $(".pPrice" + cartNum).val();
			$(".priceResult" + cartNum).val(sum);

			$.ajax({
				url: "./update",
				type: "POST",
				data: {
					productAmount: minusNum,
					cartNum: cartNum
				},
				success: function(data) {
					if (data.trim() == '1') {
					}
				},
				error: function() {
					alert("수량 변경을 실패했습니다.");
				}
			});

		}
	});

//한상품 삭제
$("#deleteBtn").click(function() {
		let selector = $(this);
		let check = window.confirm("상품을 삭제하시겠습니까?");
		if (!check) {
			return;
		}
		$.ajax({
			type: "POST",
			url: "./delete",
			data: {
				cartNum: cartNum
			},
			success: function(data) {
				if (data.trim() == '1') {
					$(selector).parent().parent().remove();
				}
			},
			error: function() {
				alert("상품 삭제를 실패했습니다.");
			}
		});
	});
}
//선택한 상품 2개이상 삭제
$("#allBtn").click(function() {
	
	$(".check").each(function(idx, item) {
		if ($(this).prop("checked")) {
			
			let selector = $(this);
			let cartNum =$(this).attr("data-check");
			$.ajax({
				type: "POST",
				url: "./delete",
				data: {
					cartNum: cartNum
				},
				success: function(data) {
					if (data.trim() == '1') {
						$(selector).parent().parent().remove();
					}
				},
				error: function() {
					alert("상품 삭제를 실패했습니다.");
				}
			});
		}
	});
});

//전체 선택,해제
$('.checkAll').click(function() {
	$('.check').prop("checked", $('.checkAll').prop("checked"));

	$(".check").each(function(idx, item) {
		if ($(item).attr("data-check")) {
			console.log($(item).attr("data-check"));
		}
	});

})
//선택 후 다 선택하면 전체선택 체크,해제
$('.check').on("click", function() {
	let check = true;

	$(".check").each(function(idx, item) {
		if (!$(item).prop("checked")) {
			check = false;
		}/* //선택한 상품들 총가격 계산
		if ($(this).prop("checked")) {
		let pcartNum1 =$(this).attr("data-check");
		let total=$(".priceResult" + pcartNum1).val();
		total+=total
        console.log(total)
		}*/
	});
	$(".checkAll").prop("checked", check);
});

