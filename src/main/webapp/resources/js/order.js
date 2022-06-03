let ship = $(".orderInfo");
for (sb of ship) {
	let onum = sb.getAttribute("data-oNum");
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


$("#ship2btn" + onum).click(function() {
    let orderNum = $(this).attr("data-oNum");
            $.ajax({
                url: "../order/update",
                type: "POST",
                data: {
                    shipState: 2,
                    orderNum: orderNum
                },
                success: function(data) {
                    if (data.trim() == '1') {
                        alert("배송이 완료됐습니다.")
                        window.location.reload();
                    }
                },
                error: function() {
                    alert("배송 업데이트 실패했습니다.");
                }
            });
         });
    }
