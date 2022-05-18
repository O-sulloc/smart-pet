$(".detail").click(function(){
    let num= $(this).attr("data-num");
    location.href="./detail?productNum="+num
    });
    
    
    $(document).ready(function(){
        $('.subMenu1').hide();
        $('.mainMenu1').mouseover(function(){
            $('.subMenu2').hide();
            $('.subMenu1').slideDown();
        });
        $('.navbar-nav').mouseleave(function(){
            $('.subMenu1').hide();
        });
    });
    
    $(document).ready(function(){
        $('.subMenu2').hide();
        
        $('.mainMenu2').mouseover(function(){
            $('.subMenu1').hide();
            $('.subMenu2').slideDown();
        });
        $('.navbar-nav').mouseleave(function(){
            $('.subMenu2').hide();
        });
    });

    $(".regdate").click(function(){
        location.href="./regdatelist"
        $(".allMenu").empty();
    });

    $(".lowprice").click(function(){
        location.href="./lowpricelist"
    });

    $(".highprice").click(function(){
        location.href="./highpricelist"
    });