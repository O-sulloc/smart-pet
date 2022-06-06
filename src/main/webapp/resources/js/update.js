const btn = document.getElementById("btn");
const frm = document.getElementById("frm");
const address = document.getElementById("address");
const addressResult = document.getElementById("addressResult");
const email = document.getElementById("email");
const emailResult= document.getElementById("emailResult");
const phone = document.getElementById("phone");
const phoneResult = document.getElementById("phoneResult");

let addressCheck = false;
let emailCheck = false;
let phoneCheck = false;
	
document.getElementById("address").addEventListener("click", function(){
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			// 예제를 참고하여 다양한 활용법을 확인해 보세요.
			document.getElementById("address").value=data.address;
		}
	}).open();
})

email.addEventListener("blur", function(){
       let result = email.value;
       if(result ==''){
           emailResult.innerHTML='이메일을 입력하세요';
           emailCheck=false;
       }else{
           emailResult.innerHTML='';
           emailCheck=true;
       }
});

phone.addEventListener("blur", function(){
       let result = phone.value;
       if(result ==''){
           phoneResult.innerHTML='전화번호를 입력하세요';
           phoneCheck=false;
       }else{
           phoneResult.innerHTML='';
           phoneCheck=true;
       }
});

address.addEventListener("blur", function(){
       let result = address.value;
       if(result ==''){
           addressResult.innerHTML='주소를 입력하세요';
           addressCheck=false;
       }else{
           addressResult.innerHTML='';
           addressCheck=true;
       }
});

btn.addEventListener("click", function(){
	if(phoneCheck && emailCheck && addressCheck){
		frm.submit();
	}else if(!emailCheck){
        alert("이메일을 입력해주세요.");
	}else if(!phoneCheck){
        alert("전화번호를 입력해주세요.");
	}else if(!addressCheck){
        alert("주소를 입력해주세요.");
	}
});