

//배송지 선택
$("#selectBox").change(function(){
    let uname=$("#userName").attr("data-name");
    let uaddress=$("#userAddress").attr("data-address");
    let uphone=$("#userPhone").attr("data-phone");

	if(this.value==0){
    $("#payFrm").empty();

    let f='<form action="./pay_form" method="post" id="payFrm" style="padding-top: 50px;">';
        f= f+'<div class="form-group row info">';
        f= f+'<label class="col-sm-5">수령인</label>';
        f= f+'<div class="col-sm-4">';
        f= f+'<input type="text" name="recipient" id="recipient" value="'+uname+'" class="form-control" readonly="readonly" />';
        f= f+'</div>';
        f= f+'</div>';
        f= f+'<div class="form-group row info">';
        f= f+'<label class="col-sm-5">배송지</label>';
        f= f+'<div class="col-sm-4">';
        f= f+'<input type="text" name="arrive" id="arrive" value="'+uaddress+'" class="form-control" readonly="readonly" />';
        f= f+'</div>';
        f= f+'</div>';
        f= f+'<div class="form-group row info">';
        f= f+'<label class="col-sm-5">전화번호</label>';
        f= f+'<div class="col-sm-4">';
        f= f+'<input type="text" name="recipientPhone" id="recipientPhone" value="'+uphone+'" class="form-control" readonly="readonly" />';
        f= f+'</div>';
        f= f+'</div>';
        f= f+'</form>';
        $("#payFrm").append(f);
    }
    if(this.value==1){
        $("#payFrm").empty();

        let f='<form action="./pay_form" method="post" id="payFrm" style="padding-top: 50px;">';
            f= f+'<div class="form-group row info">';
            f= f+'<label class="col-sm-5">수령인</label>';
            f= f+'<div class="col-sm-4">';
            f= f+'<input type="text" name="recipient" id="recipient" value="" class="form-control"/>';
            f= f+'</div>';
            f= f+'</div>';
            f= f+'<div class="form-group row info">';
            f= f+'<label class="col-sm-5">배송지</label>';
            f= f+'<div class="col-sm-4">';
            f= f+'<input type="text" name="arrive" id="arrive" value="" class="form-control"/>';
            f= f+'</div>';
            f= f+'</div>';
            f= f+'<div class="form-group row info">';
            f= f+'<label class="col-sm-5">전화번호</label>';
            f= f+'<div class="col-sm-4">';
            f= f+'<input type="text" name="recipientPhone" id="recipientPhone" value="" class="form-control"/>';
            f= f+'</div>';
            f= f+'</div>';
            f= f+'</form>';
            $("#payFrm").append(f);
                        //주소 api
	document.getElementById("arrive").addEventListener("click", function(){
		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
				// 예제를 참고하여 다양한 활용법을 확인해 보세요.
				document.getElementById("arrive").value=data.address;
			}
		}).open();
	})
        }	
});
//총 결제금액 계산

let countBtn = $(".countBtn");
let totalSum = 0;

for (cb of countBtn) {
	let cartNum = cb.getAttribute("data-pNum");
    let totalP = $("#priceResult" + cartNum).val();
    totalSum += parseInt(totalP);
    let tp=$("#totalResult").val(totalSum);
    $('#payBtn').text(tp.val()+'원 결제'); 
    
}

let totalCount =0;
//총 상품수량 계산
for (cb of countBtn) {
    let cartNum = cb.getAttribute("data-pNum");
    let totalC = $(".numBox" + cartNum).val();
    totalCount += parseInt(totalC);
    $("#countResult").val(totalCount);
}



//결제 AJAX
const total=$("#totalResult");
const cart=document.getElementsByClassName("cartNum")

$("#payBtn").click(function(){
    let price =0;
    let cartNum=[];
    let id = $(this).attr("data-id");  
    let tPrice=$("#totalResult").val();
    let tCount=$("#countResult").val();
    for(c of cart){
        cartNum.push(c.value);
    }
    $.ajax({
        type:"POST",
        url:"../pay/pay_form",
        data:{

            recipient:$("#recipient").val(),
            recipientPhone:$("#recipientPhone").val(),
            arrive:$("#arrive").val(),
            id:id,
            cartNum:cartNum,
            totalPrice:tPrice,
            totalCount:tCount
        },
        success:function(data){
            if(data.trim()=='1'){
                alert("결제 성공했습니다.")
            }
        },
        error:function(){
            alert("결제 실패하셨습니다.")
        }
    })
     
})