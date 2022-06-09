$(".pdetail").click(function(){
    let num= $(this).attr("data-num");
    console.log(num);
    location.href="./detail?productNum="+num
    });
    
 