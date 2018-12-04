$(document).ready(function(){
	 //업로드 선택 시, 이미지 or 동영상 임시 업로드.
    $('input[name="prd_upload[]"]').on('change', function(){
        if ($(this).val() === "") { return false; }
        var index = $('input:file[name="prd_upload[]"]').index($(this));		//임시업로드 몇개인지 판단하는듯
        var type = $('input[name="prd_img_type"]').val();		//파라미터 셋팅 기본 IMG 로 되어이씀
        /*if (type == "MV") {
            index = 0;
        }*/ //동영상일경우
        
        
        //$('#file_form').html($(this)[0]);

        //현재 등록 가능 이미지 수 구하기 
        var possible_save_count = 10;
        $('input[name="prd_saved_img[]"]').each ( function (i) {
            //저장 된 이미지가 없으면 카운트 증가 
            if ( $(this).val().trim() != "" || $('input[name="prd_tmp_img[]"]').eq(i).val().trim() != "" ) {
                possible_save_count -= 1;
            }
        });

        //현재 등록 가능 이미지 수 구하기 
        var imgCnt = 0;
        //alert($($(this).parent().parent().parent().parent()).prop('tagName'));
        $('li' , $(this).parent().parent().parent().parent()).each ( function (i,v) {
            var tmp = $('input[name="prd_tmp_img[]"]').eq(i).val();
            var save = $('input[name="prd_saved_img[]"]').eq(i).val();
            if ( tmp != "" || save != "" ) {
                imgCnt += 1;
            }
            imgSaveCnt = 10 - imgCnt;
        });
        console.log("이미지 등록가능한 개수 : " + imgSaveCnt);

        if ($(this).attr('data-change') == "true") {							//기본 false
            _product.prdUploadTemp(index , this.files[0]);
        } else {																//처음 등록할 경우 여길 들어올것임
            var beforeIndex = [];
            console.log("파일길이 : " + this.files.length);						//첫 이미지 올렸다면 1임 최초 1
            
            $.each ( this.files, function (c,v) {								//c : index, v : items
            	console.log("c : " + c + ", v : " + v);							
            	
                $.each ( $('input[name="prd_upload[]"]') , function (i){		//i : index
                	console.log("i : " + i);
                	
                    var tmp = $('input[name="prd_tmp_img[]"]').eq(i).val().trim();		//eq : 선택된 태그들 중에서 순서매겼을때의 i번째해당하는 태그 선택, 순차적 접근가능
                    var save = $('input[name="prd_saved_img[]"]').eq(i).val().trim();		
                    
                    alert(beforeIndex.indexOf(i));
                    if ( tmp != "" || save != "" || beforeIndex.indexOf(i) >= 0) {
                        return true;
                    } else {
                        _product.prdUploadTemp(i , v);
                        beforeIndex.push(i);
                        return false;
                    }		
                });
            });
            if (this.files.length > imgSaveCnt && $(this).attr('data-change') == "false") {
                var overCnt = this.files.length - imgSaveCnt;
                var saveTempCnt = this.files.length - overCnt;
                alert('선택된 이미지가 많습니다.\n갤러리 순서에 따라 '+saveTempCnt+'개 이미지만 등록 합니다.');
            }   
            //input 초기화
            $('input[name="prd_upload[]"]').val('');
        }
    });
});
