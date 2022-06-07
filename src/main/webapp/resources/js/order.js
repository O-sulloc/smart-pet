let order = $(".orderInfo");

for (odn of order) {
	let onum = odn.getAttribute("data-oNum");
$("#ship1btn" + onum).click(function() {
let orderNum = $(this).attr("data-oNum");
		$.ajax({
			url: "../order/update",
			type: "POST",
			data: {
				shipState: 1,
				orderNum: orderNum
			},
			success: function(data) {
				if (data.trim() == '1') {
                    alert("배송이 시작됩니다.")
                    window.location.reload();
				}
			},
			error: function() {
				alert("배송 업데이트 실패했습니다.");
			}
		});
     });
            
         //환불
         $("#refund"+onum).click(function(){
            let orderNum = $(this).attr("data-oNum");

            $.ajax({
                url: "../order/refund",
                type: "POST",
                data: {
                    orderNum: orderNum
                },
                success: function(data) {
                    if (data.trim() == '1') {
                        alert("환불 완료됐습니다.")
                        window.location.reload();
                    }
                },
                error: function() {
                    alert("환불 실패했습니다.");
                }
            });

        });
    }
