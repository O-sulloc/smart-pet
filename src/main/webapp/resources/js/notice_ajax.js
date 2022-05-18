
//삭제코드(일단 이렇게 넘길것, 동기방식이랑 그렇게 차이없는데 왜냐면 reload떄문에 나중 댓글지울땐 태그자체를 지우니까 바로보일듯)
$('.deleteBtn').click(function(){
    let check = window.confirm("영구히 삭제 됩니다. 삭제하시겠습니까?"); //check에 boolean 담김
        if(!check){//사용자를 생각해서 DELETE 잘못 눌렀을때 방지
            return;
        }
    let num = $(this).attr("data-num");

    $.ajax({	
        url : "./delete",
        type : "get",
        data:{
            num:num
        },
        success : function(result){
            //console.log(result);
            if(result == 1){
                alert("삭제가 완료되었습니다.");
                location.reload(true);
                //나중에 글이 많아지거나 하면 클래스명 지정해서 focus를 부여하자 
                //$("").focus();
            }else{
                alert("삭제 실패");
            }
        },
        error : function(){
            alert("서버 요청 실패");
        }
    });
});


//수정코드
//numCatch에 data-num에 vo.num값 넣고 제목 클릭했을때 갖고오게함
$(".numCatch").click(function(){
    let numC = $(this).attr("data-num")
    //console.log(numC);
    //모달 열기
    $('#modifyTotal'+numC).click(function(e){
        e.preventDefault();
        $('#modify'+numC).modal("show");
    });

    //모달 닫기
    $("#modify"+numC).on("click", ".close", function(){
        $('#modify'+numC).modal("hide"); //닫기 
    })

    //update ajax 실행
    $("#modifyBtn"+numC).on("click", function(){
        //e.preventDefault(); ?
    
        let title = $('#title'+numC).val();
        let contents = $('#contents'+numC).val();
        let num = $('#num'+numC).val();
        let grade = $('#grade'+numC).val();
    
    
        //유효성 검사까지
        let blank_pattern = /^\s+|\s+$/g; // 공백체크
    
        if(title == ''){
            alert("제목은 필수입니다.")
            $('#title'+numC).focus();
            return;
        }else{
            if(title.replace(blank_pattern, '').length == 0){
                alert("공백만 입력되었습니다.");
                $('#title'+numC).val(null);
                $('#title'+numC).focus();
                return;
            }
        }
    
        if(contents == ''){
            alert("내용은 필수입니다.")
            $('#contents'+numC).focus();
            return;
        }else{
            if(contents.replace(blank_pattern, '').length == 0){
                alert("공백만 입력되었습니다.");
                $('#contents'+numC).val(null);
                $('#contents'+numC).focus();
                return;
            }
        }
        
        //제목 같은 제목으로 할땐 수정되게하고 다른 제목으로 변경시 값이 중복되면 막아놓음
        let titleNow = $('#title'+numC).attr("data-title");
        if(title == titleNow){
            //console.log("if");
            $.ajax({	
                url : "./update",
                type : "post",
                data:{
                        title:title,
                        contents:contents,
                        num:num,
                        grade:grade
                },
                success : function(result){
                    //console.log(result);
                    if(result == 1){
                        alert("수정이 완료되었습니다.");
                        location.reload(true);
                        //나중에 글이 많아지거나 하면 클래스명 지정해서 focus를 부여하자 
                        //$("").focus();
                        $('#modify'+numC).modal("hide"); //닫기 
                    }else{
                        alert("수정 실패");
                    }
                    },
                    error : function(){
                        alert("서버 요청 실패");
                    }
                });
        }else{
            //console.log("else");
            $.ajax({	
                url : "./titleCheck",
                type : "post",
                data : {title : title},
                dataType : 'json',
                success : function(result){
                    //console.log(result);
                    if(result == 0){
                        $.ajax({	
                            url : "./update",
                            type : "post",
                            data:{
                                    title:title,
                                    contents:contents,
                                    num:num,
                                    grade:grade
                            },
                            success : function(result){
                                //console.log(result);
                                if(result == 1){
                                    alert("수정이 완료되었습니다.");
                                    location.reload(true);
                                    //나중에 글이 많아지거나 하면 클래스명 지정해서 focus를 부여하자 
                                    //$("").focus();
                                    $('#modify'+numC).modal("hide"); //닫기 
                                }else{
                                    alert("수정 실패");
                                }
                                },
                                error : function(){
                                    alert("서버 요청 실패");
                                }
                            });
                    }else{
                        alert("제목이 중복되었습니다. 다른 제목을 입력해주세요");
                    }
        
                },
                error : function(){
                    alert("서버 요청 실패");
                }
            });
        }
    
    });
    
});


