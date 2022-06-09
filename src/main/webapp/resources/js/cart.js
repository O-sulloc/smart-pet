/**
 *  장바구니 js
 */

$("#shopping").click(function(){
    location.href="../product/list"
    });

$(".psdetail").click(function(){
    let num= $(this).attr("data-num");
    location.href="../product/detail?productNum="+num
    });

//수량 변경  '  -  '
$(".minus").click(function() {
	let cartNum = $(this).attr("data-num");
	let num = $(".numBox" + cartNum).val();
	let minusNum = Number(num) - 1;


	if (minusNum <= 0) {
		alert("더 이상 수량을 줄일 수 없습니다.")
		$(".numBox" + cartNum).val(num);
	} else {
		$(".numBox" + cartNum).val(minusNum);

		sum = minusNum * $(".pPrice" + cartNum).val();
		$("#priceResult" + cartNum).val(sum);

		//수량 - 버튼 변동하면 체크된 상품만 총가격 변동
		let t = 0;
		let a = 0;
		if(t==0){
			$("#totalResult").text("");
		}
		$(".check").each(function(idx, item) {
			if ($(item).prop("checked")) {

				let c = $(item).attr("data-check");
				t = t + $("#priceResult" + c).val() * 1;

				a = a + $(".numBox" + c).val() * 1;
				
			}
		})
		$("#totalResult").val(t);
		$("#amountResult").val(a);

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

//수량 변경  '  +  '
$('.plus').click(function() {
	let cartNum = $(this).attr("data-num");
	let num = $(".numBox" + cartNum).val();
	let plusNum = Number(num) + 1;

	if (plusNum > $(".pCount" + cartNum).val()) {
		alert("재고가 부족합니다.");

	} else {
		$(".numBox" + cartNum).val(plusNum);
		sum = plusNum * $(".pPrice" + cartNum).val();
		$("#priceResult" + cartNum).val(sum);
		//수량 + 버튼 변동하면 체크된 상품만 총가격 변동
		let t = 0;
		let a = 0;
		$(".check").each(function(idx, item) {
			if ($(item).prop("checked")) {

				let c = $(item).attr("data-check");
				t = t + $("#priceResult" + c).val()*1;

				a = a + $(".numBox" + c).val() * 1;
			}
		})

		$("#totalResult").val(t);
		$("#amountResult").val(a);

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

//장바구니 삭제 
let countBtn = $(".countBtn");
for (cb of countBtn) {
	let totalSum = 0;
	let cartNum = cb.getAttribute("data-pNum");

	//한상품 삭제
	$("#deleteBtn" + cartNum).click(function() {
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
					window.location.reload();
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
			let cartNum = $(this).attr("data-check");
			$.ajax({
				type: "POST",
				url: "./delete",
				data: {
					cartNum: cartNum
				},
				success: function(data) {
					if (data.trim() == '1') {
						$(selector).parent().parent().remove();
						window.location.reload();
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
	let totalSum = 0;
	let totalAmount = 0;
	$('.check').prop("checked", $('.checkAll').prop("checked"));

	$(".check").each(function(idx, item) {
		if ($(item).attr("data-check")) {
			let pcartNum = $(item).attr("data-check");
			let total = $("#priceResult" + pcartNum).val();
			totalSum += parseInt(total);
			$("#totalResult").val(totalSum);
			//구매하려는 총 수량
			let c = $(item).attr("data-check");
			let amount= $(".numBox" + c).val();
			totalAmount += parseInt(amount);
			$("#amountResult").val(totalAmount);
		}
	});
	if (!$('.checkAll').prop("checked")) {
		totalSum = 0;
		totalAmount = 0;
		$("#totalResult").val(totalSum);
		$("#amountResult").val(totalAmount);
	}
});

//선택 후 다 선택하면 전체선택 체크,해제
$('.check').on("click", function() {
	let check = true;
	let totalSum = 0;
	let totalAmount = 0;
	//선택 해제
	$(".check").each(function(idx, item) {
		if (!$(item).prop("checked")) {
			check = false;
			$("#totalResult").val(totalSum);
			$("#amountResult").val(totalAmount);

		} //선택한 상품들 총가격 계산
		if ($(this).prop("checked")) {
			let pcartNum = $(this).attr("data-check");
			let total = $("#priceResult" + pcartNum).val();
			totalSum += parseInt(total);
			$("#totalResult").val(totalSum);
			//구매하려는 총 수량
			let c = $(item).attr("data-check");
			let amount= $(".numBox" + c).val();
			totalAmount += parseInt(amount);
			$("#amountResult").val(totalAmount);
		}
	});
	//전체 선택되면 전체 선택 체크
	$(".checkAll").prop("checked", check);
});

//결제 페이지 이동
$('#orderBtn').click(function(){ 
    let price=$("#totalResult").val();
    let cartNum=0;
    let cn='';

    if(price==0){
        alert("상품을 선택해주세요.")
    }else{
        
        $(".check").each(function(idx,item){
            if($(item).prop("checked")){ 
                            
                cartNum = $(item).attr("data-check");
                cn=cn+'&cartNum='+cartNum;
            }
        }) 
        let id = $("#orderBtn").attr("data-id"); 
        location.href='../pay/pay_form?id='+id+cn;
       
    }
})