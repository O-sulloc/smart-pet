const frm = document.getElementById("frm");
const id = document.getElementById("id");
const idResult= document.getElementById("idResult");
const email = document.getElementById("email");
const emailResult = document.getElementById("emailResult");
let idCheck = false;
let emailCheck = false;
		
id.addEventListener("blur", function(){
    let result = id.value;
    if(result ==''){
        idResult.innerHTML='필수 정보입니다.';
        idCheck=false;
    }else{
        idResult.innerHTML='';
        idCheck=true;
    }
});

email.addEventListener("blur", function(){
       let result = email.value;
       if(result ==''){
           emailResult.innerHTML='필수 정보입니다.';
           emailCheck=false;
       }else{
           emailResult.innerHTML='';
           emailCheck=true;
       }
});
		    
btn.addEventListener("click", function(){
	if(idCheck && emailCheck){
		frm.submit();
	}else if(!idCheck){
        alert("아이디를 입력해주세요.");
	}else if(!emailCheck){
        alert("이메일을 입력해주세요.");
	}
});