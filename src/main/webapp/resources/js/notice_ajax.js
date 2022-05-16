



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
//모달 열기
$('#modifyBtn').click(function(e){
    e.preventDefault();
    $('#modify').modal("show");
});

//모달 닫기
$("#modify").on("click", ".close", function(){
    $('#modify').modal("hide"); //닫기 
})



//모달 수정 ajax
$("#modify").on("click", "#modifyBtn", function(){

    //e.preventDefault(); ?

    let title = $('#title').val();
    let contents = $('#contents').val();
    let num = $('#num').val();
    let grade = $('#grade').val();


    //유효성 검사까지
    let blank_pattern = /^\s+|\s+$/g; // 공백체크

    if(title == ''){
        alert("제목은 필수입니다.")
        $('#title').focus();
        return;
    }else{
        if(title.replace(blank_pattern, '').length == 0){
            alert("공백만 입력되었습니다.");
            $('#title').val(null);
            $('#title').focus();
            return;
        }
    }

    if(contents == ''){
        alert("내용은 필수입니다.")
        $('#contents').focus();
        return;
    }else{
        if(contents.replace(blank_pattern, '').length == 0){
            alert("공백만 입력되었습니다.");
            $('#contents').val(null);
            $('#contents').focus();
            return;
        }
    }

    let titleNow = $('#title').attr("data-title");

    if(title == titleNow){
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
                    $('#modify').modal("hide"); //닫기 
                }else{
                    alert("수정 실패");
                }
                },
                error : function(){
                    alert("서버 요청 실패");
                }
            });
    }else{
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
                                $('#modify').modal("hide"); //닫기 
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

