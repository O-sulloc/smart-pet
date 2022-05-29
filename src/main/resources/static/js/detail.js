let openTime0=$("#openTime0").val()
let closeTime0=$("#closeTime0").val()
let openTime1=$("#openTime1").val()
let closeTime1=$("#closeTime1").val()
let term=parseInt($("#term").val())
let capacity=$("#capacity").val();
let holiday=$("#holiday").val();
let startBreaktime=$("#startBreaktime").val();
let endBreaktime=$("#endBreaktime").val();


console.log(startBreaktime)
console.log(endBreaktime)
//점심시간 텀단위로 구해서 배열에 집어넣기  -> ar: 점심시간인 예약시간 배열 
//ex ) 13~14 term:30  13:00,13:30,14:00
	let ar=[];
	let brResult=""
	ar.push(hy(startBreaktime))
	for(i=0;i<20;i++){
		let brResult=plusTerm(ar[ar.length-1]+":00");
			 if(brResult==hy(endBreaktime)){
				break;
			 }
		ar.push(brResult)
	 }






//Date타입으로 변환해주는 함수 
function getDate(time){ 
    let d1 = new Date(); // Creates a Date Object using the clients current time
    let [hours, minutes, seconds] = time.split(':');
    d1.setHours(+hours); // Set the hours, using implicit type coercion
    d1.setMinutes(minutes); // can pass Number or String - doesn't really matter
    d1.setSeconds(seconds);

    return d1; //Tue May 17 2022 09:00:00 GMT+0900 (한국 표준시)
}

//date 형식을 HH:mm 으로 변환해주는 함수 
function getFormatTime(date){ 
    let HH= date.getHours();
    HH=HH>=10?HH:'0'+HH;
    let mm= date.getMinutes();
    mm=mm>=10?mm:'0'+mm;

    return HH+':'+mm;
}

function hy(time){ //Date Type으로 변환 후  HH:mm 형식으로 변환 
    let d1 = new Date(); // Creates a Date Object using the clients current time
    let [hours, minutes, seconds] = time.split(':');
    d1.setHours(+hours); // Set the hours, using implicit type coercion
    d1.setMinutes(minutes); // can pass Number or String - doesn't really matter
    d1.setSeconds(seconds);

    let HH= d1.getHours();
    HH=HH>=10?HH:'0'+HH;
    let mm= d1.getMinutes();
    mm=mm>=10?mm:'0'+mm;

    return HH+':'+mm;
}
//순서 주의 
// console.log(getFormatTime(getDate(openTime0))) 
// console.log(getDate(openTime0).setMinutes(30)) //1652747400579
// console.log(getDate(openTime0).getMinutes()+70) //30


//term 만큼 더해주는 함수(매개변수는 Stirng)
function plusTerm(time){
    var time = new Date(getDate(time).setMinutes(getDate(time).getMinutes()+term))
    time=getFormatTime(time)
    //getDate(time)                         :string->date 
    //getDate(time).getMinutes()+term       :term만큼 분 추가 //30
    //getDate(time).setMinutes(getDate(time).getMinutes()+term)     :분추가 한것을 저장 ->//1652747400579
    //var time = new Date()                 :밀리세컨즈숫자를 date로 변환
    //getFormatTime(time)                   :변환환것을 다시 미리생성해둔 HH:mm 포맷으로 변경 

    return time;
}


// 평일일 경우 예약시간 뿌리기 
let result=openTime0; //09:00:00
for(let i=0;i<40;i++){
    if(i==0){
        // <button type="button" name="resTime" class="btn btn-outline-primary">09:30</button>
       
        let button = document.createElement('button')
        button.setAttribute("type","button")
        button.setAttribute("id","timeButton")
        button.setAttribute("name","resTime")
        button.setAttribute("class","btn btn-outline-primary")
        button.innerHTML=hy(openTime0);

        $("#buttons").append(button) 
        
    //    console.log(hy(openTime0))
    //    console.log("=========================")
    }
    if(i!=0){
        // console.log("result:"+result)
        // console.log("Date로 변환:"+getDate(result))
		
      		  result=plusTerm(result);
        
       			
		        let button = document.createElement('button')
		        button.setAttribute("type","button")
		        button.setAttribute("id","timeButton")
		        button.setAttribute("name","resTime")
		        if(ar.includes(result)){ //점심시간일경우 회색으로 변경
		       	 	button.setAttribute("class","btn btn-outline-secondary")
					console.log(result)
				}else{
					button.setAttribute("class","btn btn-outline-primary")
				}
		        button.setAttribute("id","timeButton")
			    button.innerHTML=result;
      	 	 $("#buttons").append(button) 
      	 	 	
			
       

        // console.log("plusTerm result:"+result); //09:30

        result=result+":00"
        // console.log("=========================")
    }

    if(result==closeTime0){
        break;
    }
}




// 주말일 경우 예약시간 뿌리기 
let result2=openTime1; //09:00:00
for(let i=0;i<40;i++){
    if(i==0){
        // <button type="button" name="resTime" class="btn btn-outline-primary">09:30</button>
       
        let button = document.createElement('button')
        button.setAttribute("type","button")
        button.setAttribute("id","timeButton")
        button.setAttribute("name","resTime")
        button.setAttribute("class","btn btn-outline-primary")
        button.innerHTML=hy(openTime1);

        $("#buttons2").append(button) 
        
    //    console.log(hy(openTime0))
    //    console.log("=========================")
    }
    if(i!=0){


        // console.log("result:"+result)
        // console.log("Date로 변환:"+getDate(result))

        result2=plusTerm(result2);
    
	        let button = document.createElement('button')
	        button.setAttribute("type","button")
	        button.setAttribute("id","timeButton")
	        button.setAttribute("name","resTime")
	        if(ar.includes(result2)){//점심시간일경우 회색으로 변경
	       	 	button.setAttribute("class","btn btn-outline-secondary")
				console.log(result2)
			}else{
				button.setAttribute("class","btn btn-outline-primary")
			}
	        button.setAttribute("id","timeButton")
	        button.innerHTML=result2;
	        $("#buttons2").append(button) 
	
        // console.log("plusTerm result:"+result); //09:30
        result2=result2+":00"
        // console.log("=========================")
    }

    if(result2==closeTime1){
        break;
    }
}




/*$("#buttons").on("click","#timeButton",function(){
	console.log($(this).html())
})
*/


$("#buttons").on("click","#timeButton",function(){
   console.log($(this).html());
   let time=$(this).html();
   $("#resTime").val(time);
})


