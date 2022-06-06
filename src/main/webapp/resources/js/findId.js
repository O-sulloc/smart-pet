const frm = document.getElementById("frm");
const btn = document.getElementById("btn");
const name = document.getElementById("name");
const nameResult = document.getElementById("nameResult");
const email = document.getElementById("email");
const emailResult = document.getElementById("emailResult");
let nameCheck = false;
let emailCheck = false;
		
name.addEventListener("blur", function(){
    let result = name.value;
    if(result ==''){
        nameResult.innerHTML='필수 정보입니다.';
        nameCheck=false;
    }else{
        nameResult.innerHTML='';
        nameCheck=true;
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
	if(nameCheck && emailCheck){
		frm.submit();
	}else if(!nameCheck){
        alert("이름을 입력해주세요.");
	}else if(!emailCheck){
        alert("이메일을 입력해주세요.");
	}
});