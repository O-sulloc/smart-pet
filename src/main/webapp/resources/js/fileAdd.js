/**
 * 글 작성 시 첨부파일 관리하는 js
 */

 function fileDeleteInit(){
	$(".del").click(function(){
		let check = window.confirm("첨부 사진이 삭제됩니다. 삭제하시겠습니까?");
		if(!check){
			return;
		}
		let fileNum=$(this).attr("data-num");
		let selector=$(this);
		
		$.ajax({
			type:"POST",
			url: "./fileDelete",
			data:{
				fileNum:fileNum
			},
			success:function(data){			
				console.log(selector);
				if(data.trim()=='1'){
					$(selector).parent().remove();
					count--;	
					alert("첨부 사진파일 삭제 성공했습니다.");
				}else{
					alert("첨부 사진파일 삭제 실패했습니다.");
				}
			},
			error:function(){
				alert("첨부 사진파일 삭제 실패했습니다.");
			}
		})
	})
} 
 
let count=0;
function fileAddInit(c){
   count=c;
    $("#fileAdd").click(function(){
           
            if (count > 6) {
                alert('첨부파일은 최대 7개 까지만 가능합니다.');
                return;
            }
            let f = '<div class="col-sm-10">';                                 
            f = f + '<div class="input-group">';
            f = f + '<input type="file" class="form-control files" id="files" name="files" aria-describedby="inputGroupFileAddon04" aria-label="Upload">';
            f = f + '<button class="btn btn-outline-secondary del" type="button" id="inputGroupFileAddon04">X</button>';
            f = f + '</div>';
            f = f + '</div>';
               
            $("#fileResult").append(f)
            count++;
        });
        //속성 안에 ""이 있어서 ''으로 묶는다
       
        $("#fileResult").on("click", ".del", function() {
			console.log($(this).parent());
            $(this).parent().remove();
            count--;
        })
}