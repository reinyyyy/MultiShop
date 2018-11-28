var setUnloadEvent = function(type) {
	window.onbeforeunload = function(e){
		window.onbeforeunload = null;
		if (type === true) {
			return '';
		}
	}        
};

(function($) {
	//상품 관련 method.
    _product = {
		//initial method
        init : function() {
            window.onbeforeunload = function(e){
                return '';
            }
			setImgCnt();
			_product.thumbRolling();
			$(window).resize(_product.thumbRolling);

            $('body').on('click', '#all_chk_sto', function(){
                var flag = $(this).is(':checked') == true ? 'Y' : 'N';
                $('input[name="chk_sto[]"]').prop('checked', $(this).is(':checked'));
            });

            $('body').on('click', 'input[name="chk_sto[]"]', function(){
                var count = $('input[name="chk_sto[]"]').size();
                var chk_count = $('input[name="chk_sto[]"]:checked').size();
                if (count > chk_count) {
                    $('#all_chk_sto').prop('checked', false);
                } else {
                    $('#all_chk_sto').prop('checked', true);
                }
            });


            var count       = $('#mix_option_result input[name="chk_sto_unlimit[]"]').size();
            var chk_count   = $('#mix_option_result input[name="chk_sto_unlimit[]"]:checked').size();
            if (count > chk_count) {
                $('#chk_all_opt_unlimit').prop('checked', false);
            } else {
                $('#chk_all_opt_unlimit').prop('checked', true);
            }

            //전체 무제한 선택 
            $('body').on('click', '#chk_all_opt_unlimit', function(){
                var checked = $(this).is(':checked');
                var flag = $(this).is(':checked') == true ? 'Y' : 'N';
				$.each($('#mix_option_result input[name="chk_sto_unlimit[]"]'), function(k, v){
					$(this).prop('checked', checked);
                	$('#mix_option_result input[name="sto_unlimit[]"]').eq(k).val(flag);
					_option.setStockState(k);
				});
            });

            //재고 무제한 선택
            $('body').on('click', 'input[name="chk_sto_unlimit[]"]', function(){
                idx = $('input[name="chk_sto_unlimit[]"]', $('#mix_option_result')).index($(this));
                var flag = $(this).is(':checked') == true ? 'Y' : 'N';
                $('input[name="sto_unlimit[]"]', $('#mix_option_result')).eq(idx).val(flag);
                var count       = $('#mix_option_result input[name="chk_sto_unlimit[]"]').size();
                var chk_count   = $('#mix_option_result input[name="chk_sto_unlimit[]"]:checked').size();
                if (count > chk_count) {
                    $('#chk_all_opt_unlimit').prop('checked', false);
                } else {
                    $('#chk_all_opt_unlimit').prop('checked', true);
                }
				_option.setStockState(idx);
            });

            //선택형 옵션 
            $('.opt-select > li > a').on('click', function(e) {
                var use_flag = $(this).attr("use");
                var prd_id = $('input[name="prd_id"]').val();
                var opt_count = $('#opt_total_count').val();
                $('input[name="prd_opt_use"]').val(use_flag);

                var opt_class = 'tr.opt-select[is-opt="false"]';

                if (use_flag == "Y") {
                    $(this).parents('tr').siblings(opt_class).show();
                    $('.opt-list').show();
                    $('.mobile-stock').hide();
                    $('#stock-use').show();
                } else {
                    $(this).parents('tr').siblings('tr.opt-select').hide();
                    $('.mobile-stock').show();
                    $('#stock-use').hide();
                }
                return false;
            });

            //작성형 옵션
		    $('.opt-fill > li > a').on('click', function(e) {
                var use_flag = $(this).attr("use");
                $('input[name="prd_custom_opt_use"]').val(use_flag);
                if (use_flag == "Y") {
				    $(this).parents('tr').siblings('tr.opt-fill').show();
                } else {
				    $(this).parents('tr').siblings('tr.opt-fill').hide();
                }
                return false;
            });

            //이미지등록/동영상등록 선택
            $('.btn-img-type').click(function(){
                $('input[name="prd_img_type"]').val($(this).attr("use"));
                _product.changeImgType();
                return false;
            });

            //이미지 업로드 후, 삭제 버튼 클릭
            $('body').on('click', '.btn-del-upload', function() {
                $thumb = $(this).parent().parent().parent();
                $('input[name="prd_tmp_img[]"]', $thumb).val('');
                $('input[name="prd_saved_img[]"]', $thumb).val('');
                $('input[name="prd_upload[]"]', $thumb).attr('data-change','false');
                $('input[name="prd_upload[]"]', $thumb).attr('multiple','multiple');
                $('.btn-prd-upload img', $thumb).attr('src', imgPath + '/assets/admin/images/btn/h32_plus.gif');
                /* 18.03.05 수정 */
                $('input[name="prd_upload[]"]', $thumb).val('');
                $(this).parent().remove();
                setImgCnt();
                return false;
            });

            //이미지 업로드 후, 변경 버튼 클릭
            $('body').on('click', '.btn-change-upload', function() {
                $thumb = $(this).parent().parent().parent();
                $('input[name="prd_upload[]"]', $thumb).attr('data-change','true');
                $('input[name="prd_upload[]"]', $thumb).removeAttr('multiple');
                $('input[name="prd_upload[]"]', $thumb).click();
                return false;
            });

            //업로드/경로입력 선택 
            $('.btn-upload-type').click(function(){
                $('input[name="prd_upload_type"]').val($(this).attr("use"));
                _product.changeUpload();
                return false;
            });

            //상품군 선택 시 항목 노출 
            $('select[name="pdt_pci_id"]').change(_product.pciInfo);

            //상품 상세 참조 선택 시, 일괄 입력 
            $('input:checkbox[name="chk_pci_common"]').click(function(){
                var flag = $(this).attr('checked');
                _product.pciCommon(flag);
            });

            // 18.08.27 s 배송 여부 노출 조건
            _product.checkUseDeli();
            $('input[name=prd_use_delivery]').on('change', function(e) {
                _product.checkUseDeli();
            });
            // 18.08.27 e

            //조건비 무료 선택시 배송비 입력박스 노출.
            $('select[name="prd_delivery_type"]').change(function(){
                if ($(this).val() == "N") {
                    $('.delivery.condition1').show();
                } else {
                    $('.delivery.condition1').hide();
                }
                return false;
            });

            //결제 수단 제한 선택 
            $('.btn-pay-type').click(function(){
                $(this).addClass('selected').siblings().removeClass('selected');
                if ($(this).attr("use") == "ALL") {
                    $('#pay_type_box').hide();
                    $('input[name="prd_pay_type"]').val("ALL");
                } else {
                    $('#pay_type_box').show();
                    var chk_value = $('input:checkbox[name="chk_prd_pay_type"]:checked').val();
                    _product.checkPayType();
                }
                return false;
            });

            $('input:checkbox[name="chk_prd_pay_type[]"]').click(_product.checkPayType);

            //부가세 선택 
            $('.btn-vat-type').click(function(){
                $(this).addClass('selected').siblings().removeClass('selected');
                value = $(this).attr("use");
                $('input[name="prd_vat_type"]').val(value);
                return false;
            });

            //상품 청약 철회 선택
            $('.btn-use-recall').click(function(){
                $(this).addClass('selected').siblings().removeClass('selected');
                var value = $(this).attr("use");
                $('input[name="prd_use_recall"]').val(value);
                return false;
            });

            $('#btn_save').click(function(){
                //상품 정보 저장
				//이미지폼 초기화.
				$.each($('.btn-prd-upload'), function(){
					$(this).html('<input type="file" name="prd_upload[]">');
				});
                if (_option.config.resetActive == true && _option.config.resetMixActive == true) {
                    alert('조합 버튼을 눌러서 옵션을 조합해야 저장 할 수 있습니다.');
                    return false;
                }

				unsetFixedHeader();

                // 무제한 disabled save전 해제
                $m('input[name="sto_real_stock[]"]', $m('#mix_option_result')).prop('disabled', false);
                
                $('#product_form').ajaxForm({
                    url : admDir+'/product/manage/save',
                    dataType : 'json',
                    type : 'post',
                    beforeSubmit : function() {
                        if (false === _product.checkSaveParam()) {
							setFixedHeader();
                            return false;
                        }
                    },
                    success : function(res, status) {
                        if (res.result == true) {
                            var btnDelivery = '<a href="'+res.url+'">'+res.btn+'</a>';
                            $('.prd-view-href').attr('href', encodeURI(res.url));

							var page_url = admDir + '/product/manage/modify/' + res.prdid;
							if (is_simple === 'simple') {
								page_url += '?t=simple';
							}

                            $('.prd-manage-href').attr('href', admDir + '/product/manage/lists');
                            $('.pay-url').val(res.url);
                            $('.pay-url-button').val("<a href='"+res.url+"'>"+res.btn['value']+'</a>');
                            $('.pay-url-delivery').val("<a href='"+res.url+"'>"+res.btn['value']+'</a>' + " <a href='"+res.deli_url+"'>배송 조회</a>");
                            $('#pay_url_delivery').val("<a href='"+res.deli_url+"'>배송 조회</a>");

							$('select[name="copy_url"]').attr('url', res.url);
							$('select[name="copy_url"]').attr('deli_url', res.deli_url);
							$('select[name="copy_url"]').attr('btn_txt', res.btn['value']);
							$('select[name="copy_channel"]').attr('url', res.url);
							$('select[name="copy_channel"]').attr('title', res.prdinfo.prd_name);
			
							$.each($('.link-sns > li > a'), function(){
								var sns = $(this).parent().attr('class');
								$(this).attr('href', "javascript:mysoho.utility.sendSns('" + sns + "', '" + res.url + "', '" + res.prdinfo.prd_name + "')");
							});

							$('.overlay').show();

                            $('html, body').css({'overflow': 'hidden', 'height': '100%'}); // 2017.10.02 추가
							$('#registLayer').show();
                            setUnloadEvent(false);
                            $('#registLayer .regist-close-layer').attr('href', page_url);  // 닫기 시 새로고침
                            //popup_saved.dialog('open');
                        } else {
							setFixedHeader();
                            alert(res.msg);
                        }
                        return false;
                    }, 
                    error:function(request,status,error){
						setFixedHeader();
                        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                    }
                }).submit();
            });

            //업로드 선택 시, 이미지 or 동영상 임시 업로드.
            $('input[name="prd_upload[]"]').on('change', function(){
                if ($(this).val() === "") { return false; }
                var index = $('input:file[name="prd_upload[]"]').index($(this));
                var type = $('input[name="prd_img_type"]').val();
                if (type == "MV") {
                    index = 0;
                }
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
                $('li' , $(this).parent().parent().parent().parent()).each ( function (i,v) {
                    var tmp = $('input[name="prd_tmp_img[]"]').eq(i).val();
                    var save = $('input[name="prd_saved_img[]"]').eq(i).val();
                    if ( tmp != "" || save != "" ) {
                        imgCnt += 1;
                    }
                    imgSaveCnt = 10 - imgCnt;
                });

                if ($(this).attr('data-change') == "true") {
                    _product.prdUploadTemp(index , this.files[0]);
                } else {
                    var beforeIndex = [];
                    $.each ( this.files, function (c,v) {
                        $.each ( $('input[name="prd_upload[]"]') , function (i){
                            var tmp = $('input[name="prd_tmp_img[]"]').eq(i).val().trim();
                            var save = $('input[name="prd_saved_img[]"]').eq(i).val().trim();
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

            var prd_name_bytes = getStringBytes($('input[name="prd_name"]').val());
            $('#prd_byte').text(prd_name_bytes);

            //상품명 입력시 글자수 체크.
            $('input[name="prd_name"]').on('input paste', function(){
                var bytes = getStringBytes($(this).val());
                if (bytes > 250) {
                    $(this).val(cutByteLength($(this).val(), 250));
                    return false;
                }
                $('#prd_byte').text(bytes);
            });
    
            //해시태그 입력시 글자수 체크.
            $('input[name="prd_hash_tag"]').keyup(function(){
                var bytes = getStringBytes($(this).val());
                if (bytes > 250) {
                    $(this).val(cutByteLength($(this).val(), 250));
                    return false;
                }
                $('#prd_hash_add_byte').text(bytes);
            });

            var prd_name_add_bytes = getStringBytes($('input[name="prd_name_add"]').val());
            $('#prd_add_byte').text(prd_name_add_bytes);

            //추가문구 입력시 글자수 체크.
            $('input[name="prd_name_add"]').on('input paste', function(){
                var bytes = getStringBytes($(this).val());
                if (bytes > 250) {
                    $(this).val(cutByteLength($(this).val(), 250));
                    return false;
                }
                $('#prd_add_byte').text(bytes);
            });

            var prd_price_bytes = getStringBytes($('input[name="prd_name_add"]').val());
            $('#prd_add_byte').text(prd_name_add_bytes);

            //판매가격 length 체크
            $('input[name="prd_price"]').keyup(function(){
                var bytes = getStringBytes($(this).val());

                if (bytes > 1) {
                    // 맨 앞자리 수 0 체크 
                    var price = $(this).val().replace(/(^0+)/, "");
                    $(this).val(price);
                }

                if (bytes > 9) {
                    $(this).val(cutByteLength($(this).val(), 9));
                    return false;
                }
            });

            //재고 선택에 따라 비활성화 처리 
            $('input[name="prd_stock_type"]').click(function(){
                var type = $(this).val();
                switch (type) {
                    case 'soldout' :
                    case 'unlimit' :
                        $('input[name="prd_stock"]').attr('disabled', true);
                    break;

                    case 'limit' :
                        $('input[name="prd_stock"]').attr('disabled', false);
                    break;
                }
            });

            //해시태그 입력
            $('.MSH-input-hashtag').on('keypress', function(e) {
                if (e.keyCode != 13 && e.keyCode != 32) {
                    return true;
                }
                var hashtag = $(this).val(),
                    isHashtag = false;
                    html = '';

                var regExp = /^[ㄱ-힣a-zA-Z0-9]+$/;
				if ( !regExp.test(hashtag) ) {
					alert('태그는 한글,영어,숫자만 입력 가능합니다.');
                    $(this).val('');
					return false;
				}

                if (hashtag == '') {
                    alert('태그를 입력해주세요.');
                    $(this).val('');
                    return false;
                }

                // 중복검사
                $('input[name="hashtag[]"]').each(function () {
                    if ($(this).val() == hashtag) {
                        isHashtag = true;
                    }
                }); 

                if (isHashtag == true) {
                    alert('이미 추가된 해시태그입니다.');
                    return false;
                }

                html += '<li>';
                html += '<input type="hidden" name="hashtag[]" value="' + hashtag + '">';
                html += '<span class="txt">#' + hashtag + '</span>';
                html += '<a href="javascript:void(0);" class="hashtag-del MSH-btn-hashtag-del">삭제</a>';
                html += '</li>';
                $('.MSH-hashtag-area').append(html);
                $(this).val('');
                return false;
            });

            // 해시태그 삭제
            $(document).on('click', '.MSH-btn-hashtag-del', function() {
                $(this).parent('li').remove();
            });
        },
        prdUploadTemp : function(key, fileArr) {
            var type = $('input[name="prd_img_type"]').val();

            //로딩 이미지 추가 
            /* 18.03.05 수정 */
			$('.btn-prd-upload img').eq(key).attr('src', imgPath + '/assets/admin/images/common/ajax_loader3.gif');
            /* 18.03.05 수정 */
			var save_url = admDir + '/product/manage/saveTemp?type=IMG&key='+key;

			image.uploadAfterCompress(fileArr, 100, 640, key, save_url, _product.productUploadCallback, _product.uploadErrorCallback, 'prdUploadTemp');
			return false;
        },
        uploadLoadingInit : function() {
            // 로딩 이미지 제거.
			$('.btn-prd-upload img').eq(image.params.key).attr('src', imgPath + '/assets/admin/images/btn/h32_plus.gif');
            //TODO:: 기타 추가된 애니메이션 등 제거를 추가해야함.
        },
        //이미지 업로드 callback 함수
        productUploadCallback : function(res) {
			var res = JSON.parse(res);
			if (res.result === false) {
                _product.uploadLoadingInit();
				alert(res.msg);
				return false;
			}

            //selected image index 재설정 //save_url 에서 getParams key로 넘김
            image.params.key = res.key;

			$('input[name="prd_tmp_img[]"]').eq(image.params.key).val(res.data.filename);
			var thumb_url = res.data.url_m.replace(/(http:\/\/)|(https:\/\/)/,'//'); 
			$('.btn-prd-upload img').eq(image.params.key).attr('src', thumb_url);

			//변경,삭제 버튼 노출.
			var btn = '<span class="cover"><a href="#" class="btn-change-upload">변경</a> &nbsp;|&nbsp; <a href="#" class="btn-del-upload">삭제</a></span>';
			$('.change-cover', $('.thumbs > ul > li').eq(image.params.key)).html(btn);

            //이미지 카운팅
            var imgCnt = 0;
			$('.btn-prd-upload').each(function() {
				var tmpImg = $(this).parent().parent('li').find('input[name="prd_tmp_img[]"]').val(),
					saveImg = $(this).parent().parent('li').find('input[name="prd_saved_img[]"]').val();
				if (tmpImg != '' || saveImg != '') {
					imgCnt++;
				}
			});
            $('.MSH-txt-img-cnt').text(imgCnt);
			return false;
		},
		/**
		 * 이미지 업로드 실패 callback 함수!! (마음대로 정의할 것!!)	
		 *  인자값은 ajax 통신 result 값으로 대체됨! (upload 함수 참고)
		 **/
		uploadErrorCallback : function() {
            _product.uploadLoadingInit();
			alert("업로드 도중 실패하였습니다.");
			return false;
		},
        //결제 수단 변경
        checkPayType : function() {
            var values = [];
            $('input:checkbox[name="chk_prd_pay_type[]"]:checked').each(function(k, v){
                values[k] = v.value;
            });
            $('input[name="prd_pay_type"]').val(values.join(","));
        },
        //업로드 유형 선택
        changeImgType: function() {
            var type = $('input[name="prd_img_type"]').val();
            if (type == "MV") {
                $('#upload_img_txt').text("동영상");
				$('a[href="#imgUpload"]').hide(); //업로드 버튼 숨김
				$('a[href="#imgPath"]').addClass('now');
				$('#imgUpload').hide(); //업로드 숨김
				$('#imgPath').show();
				$('.img-path-txt').text('동영상 경로를 입력할 수 있습니다.');
            } else {
                $('#upload_img_txt').text("이미지");
				$('a[href="#imgUpload"]').addClass('now').show();
				$('a[href="#imgPath"]').removeClass('now');
				$('#imgUpload').show();
				$('#imgPath').hide();
				$('.img-path-txt').text('최대 10개 이미지 경로 입력 가능 2개 이상 시, 엔터로 구분하세요.');
            }
			_product.thumbRolling();
            _product.changeUpload();
        },
        //업로드 or URL 유형 선택
        changeUpload : function() {
            //선택된 타입에 따른 노출
            var upload_type = $('input[name="prd_upload_type"]').val();
            var type = $('input[name="prd_img_type"]').val();
            $('input[name="prd_upload_type"]').val(upload_type);
			return false;
        },
        checkUseDeli : function() {
            var val = $('input[name="prd_use_delivery"]:checked').val();            
            if (val == 'Y'){
                $('input[name="prd_use_delivery"]').parents('tr').siblings('tr.delivery').not('tr.bg-yellow').show();
            } else {
                $('input[name="prd_use_delivery"]').parents('tr').siblings('tr.delivery').hide();
            }
        },
        //상품 정보 고시 가져오기
        pciInfo : function() {
            var pci_id = $('select[name="pdt_pci_id"] option:selected').val();
            if (pci_id == '') {
                $('.MSH-chk-pci-common-area').hide();
                $('#pci_info_box > table > tbody').html('');
                return true;
            }
            $.ajax({
                url : admDir+'/product/manage/categoryInfo'
                , data : {pci_id : pci_id}
                , dataType : 'JSON'
                , type : 'POST'
                , success : function(res) {
                    input = "";
                    if (res[0].pci_info !== undefined) {
                        var cate = JSON.parse(res[0].pci_info);
                        for (var i in cate) {
                            input += '<tr>';
                            input += '<th>'+cate[i].name+'</th>';
                            input += '<td><input type="hidden" name="pci_info_id[]" value="'+cate[i].id+'" /><input type="text" name="pci_info_value[]" />';
                            if (cate[i].desc !== '') {
                                input += '<br /><label class="mt-5 fc-blue fs-15">'+cate[i].desc+'</label></td>';
                            } else {
                                input += '</td>';
                            }
                            input += '</tr>';
                        }
                        $('.MSH-chk-pci-common-area').show();
                        $('#pci_info_box > table > tbody').html('<table>'+input+'</table>');
                    }
                }
            });
        },
        //상품 상세 참조 일괄 입력.
        pciCommon : function(flag) {
            $('input[name="pci_info_value[]"]').each(function(){ 
                if (flag === 'checked') {
                    $(this).val("상품 상세 참조");
                } else {
                    $(this).val("");
                }
            });
        },
		//모바일 여부에 따라 상품 썸네일 롤링 
		thumbRolling : function() {
			$('.thumb-box').show();
			if ($('.is-mobile').css('display') == 'block') {
				$('.thumbs').addClass('thumbs-roll');
				// 상품 섬네일 롤링
					var thumbs_roll = new Swiper('.thumbs-roll', {
						slidesPerView: 'auto',
						calculateHeight: true
					});

			} else {
				if (typeof thumbs_roll !== "undefined") {
					thumbs_roll.destroy(true, false);
				}
				$('.thumbs').removeClass('thumbs-roll');
			}

		},
        // 최종 save 전에 check param
        checkSaveParam : function() {

            var prd_name = $.trim($('input[name="prd_name"]').val());
            var prd_price = $.trim($('input[name="prd_price"]').val());
            var prd_stock_type = $('input[name="prd_stock_type"]:checked').val();
            var prd_stock = $.trim($('input[name="prd_stock"]').val());
            //작성형 옵션 사용중인지 체크.
            var is_opt_custom = $('.btn-custom-opt[use="Y"]').hasClass('now');
            //선택형 옵션 사용중인지 체크.
            var is_opt_select = $('.btn-sel-opt[use="Y"]').hasClass('now');

            if (prd_name.length < 1) {
                alert('상품명을 입력하세요.');
                $('input[name="prd_name"]').focus();
                return false;
            }

            if (prd_price.length < 1) {
                alert('판매가격을 입력하세요.');
                $('input[name="prd_price"]').focus();
                return false;
            }

            if (prd_stock_type == "limit" && prd_stock.length < 1) {
                alert('재고 수량을 입력하세요.');
                $('input[name="prd_stock"]').focus();
                return false;
            }

            //작성형 옵션
            if (is_opt_custom === true) {
                var is_flag = true;
                $.each($('#custom_option_tbl input[name="opt_guide[]"]'), function(k, v){
                    if ($.trim(v.value) < 1) {
                        alert('작성형 옵션을 입력하세요.');
                        $(this).focus();
                        is_flag = false;
                        return false;
                    }
                });

                if (is_flag == false) {
                    return false;
                }
            }

            //선택형 옵션
            if (is_opt_select === true) {
                var is_flag = true;
                $.each($('#mix_option input[name="opt_name[]"]'), function(k, v){
                    if ($.trim(v.value) < 1) {
                        alert('선택형 옵션을 입력하세요.');
                        $(this).focus();
                        is_flag = false;
                        return false;
                    }
                });

                if (is_flag == false) {
                    return false;
                }

                var is_flag = true;
                $.each($('#mix_option input[name="opt_value[]"]'), function(k, v){
                    if ($.trim(v.value) < 1) {
                        alert('선택형 옵션을 입력하세요.');
                        $(this).focus();
                        is_flag = false;
                        return false;
                    }
                });

                if (is_flag == false) {
                    return false;
                }

                if ($('#mix_option input[name="opt_value[]"]').length > 0 && $('#mix_option').parent().parent().css('display') !== 'none') {
                    if ($('#mix_option_result table > tbody > tr').length < 1) {
                        alert('옵션 목록을 생성해주세요.');
                        return false;
                    }
                }
            }

            //조건부 무료 선택시 배송비 입력박스 노출.
            if ('N' == $('select[name="prd_delivery_type"]').val()) {
                if (0 == $('input[name=prd_delivery]').val().length || 1 > parseInt($('input[name=prd_delivery]').val())) {
                    alert('배송비는 1원 이상 입력하세요.');
                    $('input[name=prd_delivery]').focus();
                    return false;
                }
                if (0 == $('input[name=prd_delivery_min]').val().length || 1 > parseInt($('input[name=prd_delivery_min]').val())) {
                    alert('결제 조건은 1원 이상 입력하세요.');
                    $('input[name=prd_delivery_min]').focus();
                    return false;
                }
            }

            //결제 수단 제한 체크
            if ($m('.btn-pay-type[use=SEL]').hasClass('now') === true) {
                if ($m('input:checkbox[name="chk_prd_pay_type[]"]:checked').length == 0) {
                    alert('결제 수단을 선택하세요.');
                    return false;
                }
            }


            return true;
        }
    };

	//옵션 관련 method 
	_option = {
		//initial method
        config : {
            resetActive : false,
            resetMixActive : false
        },
        init : function() {
            //옵션 팝업 셋팅.
            popup_opt = $('#popup_option_manage').dialog({
                autoOpen : false,
                height : 400,
                width : 300,
                modal : true,
                buttons : {
                    '닫기' : function() {
                        popup_opt.dialog("close");
                    }
                },
                open : function(event, ui) {
                    $('html, body').css({'overflow': 'hidden', 'height': '100%'}); // 2017.10.02 추가
                    _option.list();
                },
                close : function (event, ui) {
                    $('html, body').css({'overflow': '', 'height': ''}); // 2017.10.02 추가
                }

            });
            //저장된 옵션 리스트 가져오기.
            _option.list(true);
            //사용함 옵션만 보기 
            _option.setStockUseView('Y');
            // 옵션 목록 사용한 옵션만 보기 
            $(document).on('change', '#js-optStoUseView', function() {
                var view = '';
                if ($(this).is(":checked")){
                    view = 'Y';
                } else {
                    view = 'N';
                }
                _option.setStockUseView(view);
            });
            //옵션 재설정 버튼 클릭 이벤트 
            $(document).on('click','#js-optReset', function(){
                if (! confirm('옵션 재설정 시, 가격/재고 등\n모든 설정 값이 초기화 됩니다.\n재설정을 진행하겠습니까?')) return false;
                $('.btnOptReset').hide();
                _option.config.resetActive = true;
                _option.setStockReset();
            });

            //옵션 추가 버튼 클릭 이벤트 
            $('#add_mix_option').on('click', '.btn-add-opt', _option.add);

            //옵션 삭제 버튼 클릭 이벤트 
            $('#add_mix_option').on('click', '.btn-del-opt', function(){
                if (_option.config.resetActive == true) {
                    _option.config.resetMixActive = true;
                }
                $(this).parent().parent().remove();
                return false;
            });

            //조합 버튼 클릭 
            $('body').on('click', '#btn_mix', function(){
	    		var params = $('#mix_option input[name="opt_value[]"]').serialize();
                if ($('#mix_option input[name="opt_value[]"]').size() < 1) {
                    alert("옵션을 추가해주세요.");
                    return false;
                }

                var flag = true;
                $.each($('#mix_option input[name="opt_name[]"]'), function(k, opt){
                    if ($.trim($(this).val()).length < 1) {
                        alert("옵션명을 입력해주세요.");
                        $(this).focus();
                        flag = false;
                        return false;
                    }

                    if ($.trim($('#mix_option input[name="opt_value[]"]').eq(k).val()).length < 1) {
                        alert("옵션값을 입력해주세요.");
                        $('#mix_option input[name="opt_value[]"]').eq(k).focus();
                        flag = false;
                        return false;
                    }
                });

                if (flag === true) {
                    _option.mixOutput(params, true);

                    if (_option.config.resetActive == true && _option.config.resetMixActive == true) {
                        _option.config.resetMixActive = false;
                    }
                }
                return false;
            });

            //옵션관리 버튼 클릭 
            $('body').on('click', '#btn_opt_manage', function(){
                //popup_opt.dialog("open");
                window.open(admDir+'/product/option/manage', 'pop_option_manage', 'width=500, height=550, scrollbars=1');
                return false;
            });

            //숫자만 입력
            $('#mix_option_result').on('keyup', 'input[name="sto_price[]"]', function(){
                $(this).val($(this).val().replace(/[^0-9]/gi, ''));
                return false;
            });

            $('body').on('keyup', '#set_sto_type_price', function(){
                $(this).val($(this).val().replace(/[^0-9]/gi, ''));
                return false;
            });

            $('body').on('keyup', 'input[name="prd_price"]', function(){
                $(this).val($(this).val().replace(/[^0-9]/gi, ''));
                return false;
            });

            $('body').on('keyup', 'input[name="prd_stock"]', function(){
                $(this).val($(this).val().replace(/[^0-9]/gi, ''));
            });

            $('#mix_option_result').on('keyup', 'input[name="sto_real_stock[]"]', function(){
                $(this).val($(this).val().replace(/[^0-9]/gi, ''));
				var idx = $('#mix_option_result input[name="sto_real_stock[]"]').index($(this));
				_option.setStockState(idx);
            });

            $('body').on('keyup', 'input[name="all_sto_price"]', function(){
                $(this).val($(this).val().replace(/[^0-9]/gi, ''));
            });
            
            $('body').on('keyup', 'input[name="all_sto_stock"]', function(){
                $(this).val($(this).val().replace(/[^0-9]/gi, ''));
            });

            $('body').on('keyup', 'input[name="prd_delivery"]', function(){
                $(this).val($(this).val().replace(/[^0-9]/gi, ''));
            });

            $('body').on('keyup', 'input[name="prd_delivery_min"]', function(){
                $(this).val($(this).val().replace(/[^0-9]/gi, ''));
            });

            //옵션 추가 버튼 클릭 이벤트 (작성형)
            $('body').on('click', '.btn-add-custom-opt', _option.addCustom);
            
            //옵션 삭제 버튼 클릭 이벤트 (작성형)
            $('body').on('click', '.btn-del-custom-opt', function(){
                $(this).parent().parent().remove();
                return false;
            });

            //옵션 필수값 선택 이벤트 
            $('#custom_option_tbl').on('click', 'input[name="chk_opt_mandatory[]"]', function(){
                idx = $('#custom_option_tbl input[name="chk_opt_mandatory[]"]').index($(this));
                var flag = $(this).is(':checked') == true ? 'Y' : 'N';
                $('#custom_option_tbl input[name="opt_mandatory[]"]').eq(idx).val(flag);
            });

            //옵션 삭제 버튼 이벤트 
            $('body').on('click', '.btn-del-custom-opt', function(){
                var opt_id = $('input[name="opt_id[]"]', $(this).parent().parent()).val();
                var del_ids = $('input[name="del_opt_ids"]').val();
                $('input[name="del_opt_ids"]').val(del_ids+","+opt_id);
                return false;
            });

            //옵션 재고 삭제 
            $('#btn_del_sto').click(function(){
                var ids = [];
                $('#mix_option_result input[name="chk_sto[]"]:checked').each(function(){
                    ids.push($(this).val());
                    $(this).parent().parent().parent().remove();
                });
                
                $('input[name="del_sto_ids"]').val(ids.join(","));
                return false;
            });

            //옵션값 추가 
            $('#btn_add_opt').click(function(){
                var prd_id = $('input[name="prd_id"]').val();
                var add_opt_id = $('#add_option_id').val();
                var add_opt_value = $('input[name="add_option_value"]').val();
                if (add_opt_id == '0') {
                    alert("옵션을 선택해주세요.");
                    return false;
                }

                if ($.trim(add_opt_value).length < 1) {
                    alert("옵션값을 입력해주세요.");
                    return false;
                }

                var params = "";
                $.each($('input[name="mix_opt_value[]"]'), function(k, sto){
                    var chk_opt_id = $(this).attr('opt-id');
                    if (chk_opt_id == add_opt_id) {
                        params += "&opt_value[]="+add_opt_value+'&add_opt_id='+add_opt_id;
                    } else {
                        params += "&opt_value[]="+sto.value;
                    }
                });

                _option.mixOutput(params, false);
                return false;
            });

            //옵션 불러오기 
            $('#select_rep_list').change(function(){
                _option.repList(false);
                if (_option.config.resetActive == true) {
                    _option.config.resetMixActive = true;
                }
                //옵션 목록 초기화!!!!!!!!!!!!!
            });

            //저장 옵션 삭제하기
            $('body').on('click', '.btn-del-rep', function() {
                var repId = $(this).attr('rep-id');
                _option.deleteRep(repId);  
                return false;
            });

            //옵션 가격 및 재고 일괄 적용. (모바일)
            $('#set_sto_type').change(function(){
                if ($(this).val() === "use") {
                    $('#set_sto_type_use').show();
                    $('#set_sto_type_price').hide();
                } else {
                    $('#set_sto_type_use').hide();
                    $('#set_sto_type_price').show();
                }
            });

            $('#btn_set_sto').click(function(){
                var type = $('#set_sto_type').val();
                $.each($('input[name="chk_sto[]"]:checked'), function(i, sto){
                    var k = $('input[name="chk_sto[]"]').index($(this));
                    switch (type) {
                        case 'price' :
                            var price = $('#set_sto_type_price').val();
                            if ($.trim(price).length > 0) {
                                $('input[name="sto_price[]"]').eq(k).val(price);
                            }
                        break;

                        case 'stock' :
                            var stock = $('#set_sto_type_price').val();
                            if ($.trim(stock).length > 0) {
                                $('input[name="sto_real_stock[]"]').eq(k).val(stock);
                            }
                        break;

                        case 'use' :
                            var use = $('#set_sto_type_use option:selected').val();
                            $('option[value="'+use+'"]', $('select[name="sto_use[]"]').eq(k)).prop('selected', true);
                        break;

                    }
                    _option.setStockState(i);
                });
                return false;
            });

            //옵션 가격 및 재고 일괄 적용.
            $(document).on('click', '#btn_all_sto_set', function(){
                var priceType = $m('select[name="opt_update_price_type"]').val();
                var stockType = $m('select[name="opt_update_stock_type"]').val();
                var price = $('input[name="all_sto_price"]').val();
                var stock = $('input[name="all_sto_stock"]').val();
                var use = $('select[name="all_sto_use"]').val();

				// 일괄 적용 input 검증(숫자만)
				if(price != ""  && /^[0-9]*$/g.test(price) == false) {
					alert("숫자를 입력해주세요");
                	$('input[name="all_sto_price"]').val("");
					$('input[name="all_sto_price"]').focus();
					return false;
				}

				if(stock != ""  && /^[0-9]*$/g.test(stock) == false) {    
					alert("숫자를 입력해주세요");
					$('input[name="all_sto_stock"]').val("");
					$('input[name="all_sto_stock"]').focus();
					return false;
				}

                $.each($('input[name="chk_sto[]"]:checked'), function(i, sto){
                    var k = $('input[name="chk_sto[]"]').index($(this));
                    
                    //금액 타입에 따른 추가, 차감, 재입력
                    switch(priceType) {
						case "reg":
							if ($.trim(price).length > 0) {
								$('input[name="sto_price[]').eq(k).val(price);
							}
						break;
						case "plus":
							var nowPrice = $('input[name="sto_price[]').eq(k).val();
							nowPrice = Number(nowPrice) + Number(price);
							$('input[name="sto_price[]').eq(k).val(nowPrice);
						break;
                        case "minus":
							var nowPrice = $('input[name="sto_price[]').eq(k).val();
							nowPrice = Number(nowPrice) - Number(price);
                            if (nowPrice < 0) {nowPrice = 0;}
							$('input[name="sto_price[]').eq(k).val(nowPrice);
                        break;
                    }

                    //재고 타입에 따른 추가, 차감, 재입력
                    switch(stockType) {
						case "reg":
							if ($.trim(stock).length > 0) {
                                if($('input[name="chk_sto_unlimit[]').eq(k).is(':checked')) {
                                    $('input[name="chk_sto_unlimit[]').eq(k).trigger('click');
                                }
								$('input[name="sto_real_stock[]').eq(k).val(stock);
							}
						break;
						case "plus":
							var nowStock = $('input[name="sto_real_stock[]').eq(k).val();
							nowStock = Number(nowStock) + Number(stock);
                            if($('input[name="chk_sto_unlimit[]').eq(k).is(':checked')) {
                                $('input[name="chk_sto_unlimit[]').eq(k).trigger('click');
                            }
							$('input[name="sto_real_stock[]').eq(k).val(nowStock);
						break;
                        case "minus":
							var nowStock = $('input[name="sto_real_stock[]').eq(k).val();
							nowStock = Number(nowStock) - Number(stock);
                            if($('input[name="chk_sto_unlimit[]').eq(k).is(':checked')) {
								$('input[name="chk_sto_unlimit[]').eq(k).trigger('click');
							}
                            if (nowStock < 0) {nowStock = 0;}
							$('input[name="sto_real_stock[]').eq(k).val(nowStock);
                        break;
                        case "unlimit":
							$('input[name="chk_sto_unlimit[]').eq(k).trigger('click');	
						break;
                    }

                    $('option[value="'+use+'"]', $('select[name="sto_use[]"]').eq(k)).prop('selected', true);

                    _option.setStockState(i);
                });

                //조합옵션 사용안함에 대해서 보여줄지 
                _option.autoSetStockUseView();

                //설정한 옵션 초기화 
                _option.setOptStoAllSetting();

                //체크박스 해제
                $('#all_chk_sto').prop('checked', false);
                $.each($('input[name="chk_sto[]"'), function(){
                    $(this).prop('checked', false);
                });

                return false;
            });

            //조합 옵션 사용 설정에 따른 view 처리
            $(document).on('change', $('select[name="sto_use[]"]'), function(){
                //조합옵션 사용안함에 대해서 보여줄지 
                _option.autoSetStockUseView();
            });
        },

        //Get to saved option
        repList : function() {
            var rep_id = $('#select_rep_list').val();
            $.ajax({
                url : admDir+'/product/option/repList',
                type : 'post',
                dataType : 'json',
                data : {rep_id : rep_id},
                success : function(res) {
                    if (res[0] !== undefined) {
                        options = JSON.parse(res[0].rep_options);
                        if (typeof options !== 'array') {
                            $('#add_mix_option > tbody').html('');
                            for (var i in options) {
                                _option.add();
                                $('#mix_option input[name="opt_name[]"]').eq(i).val(options[i].opt_name);
                                $('#mix_option input[name="opt_value[]"]').eq(i).val(options[i].opt_value);
                            }
                        }
                    }
                }
            });
        },
        //Get option list
        list : function(flag) {
            $.ajax({
                url : admDir+'/product/option/repList'
                , type : 'post'
                , dataType : 'json'
                , data : {}
                , success : function(res) {
                    //저장 옵션 관리 팝업 - 리스트 생성.
                    var $tbl = $('#popup_option_manage > table');
                    var tbody = "";

                    if (res.length > 0) {
                        for (var i in res) {
                            tbody += '<tr>';
                            tbody += '<td class="text-center"><input type="checkbox" name="chk_rep[]" /></td>';
                            tbody += '<td>'+res[i].rep_name+'</td>';
                            tbody += '<td class="text-center"><a href="#" class="btn btn-danger btn-xs btn-del-rep" style="color:#fff" rep-id="'+res[i].rep_id+'">삭제</a></td>';
                            tbody += '</tr>';
            
                            if (flag === true) {
                                //불러오기 select 박스 - 리스트 생성 
                                $('#select_rep_list').append($('<option>', {
                                    value : res[i].rep_id,
                                    text : res[i].rep_name
                                }));
                            }

                        }
                    }
                    $('tbody', $tbl).html(tbody);

                }
            });
        },
		//Add option row
		add : function() {
            if (_option.config.resetActive == true) {
                _option.config.resetMixActive = true;
            }
            var $tbl = $('#add_mix_option > tbody');
            var celHTML = '<tr>';
			celHTML += '<td><input type="text" name="opt_name[]" placeholder="옵션명을 입력하세요. (예시: 색상)" />';
            celHTML += '<input type="hidden" name="opt_id[]" /></td>';
            celHTML += '<input type="hidden" name="opt_guide[]" value="" /></td>';
            celHTML += '<input type="hidden" name="opt_type[]" value="SE" /></td>';
            celHTML += '<input type="hidden" name="opt_mandatory[]" value="" /></td>';
			celHTML += '<td><input type="text" name="opt_value[]" placeholder="옵션값을 입력하세요. 옵션값이 2개 이상일 경우 콤마(,)로 구분해주세요.(예시: 빨강, 노랑)" /></td>';
		    celHTML += '<td><a href="#" class="btn btn-danger btn-sm btn-del-opt"><img src="' + imgPath + '/assets/admin/images/btn/h43_delete.png" alt="삭제" style="width:30px" /></a></td>';
            celHTML += '</tr>';
            $tbl.append(celHTML);
			return false;
		},
        addCustom : function() {
			var $tbl = $('#custom_option_tbl > tbody');
            var celHTML = '<tr>';
            celHTML += '<td><label class="single"><input type="checkbox" name="chk_opt_mandatory[]" value="Y" /><span></span></label>';
            celHTML += '<input type="hidden" name="opt_name[]" value="" /></td>';
            celHTML += '<input type="hidden" name="opt_type[]" value="CT" />';
            celHTML += '<input type="hidden" name="opt_mandatory[]" value="N" /></td>';
			celHTML += '<td><input type="text" name="opt_guide[]" placeholder="구매자에게 작성 요청할 정보를 입력하세요. (예시: 선물 메세지)"/></td>';
            celHTML += '<td><a href="#" class="btn btn-danger btn-sm btn-del-custom-opt"><img src="' + imgPath + '/assets/admin/images/btn/h43_delete.png" alt="삭제" style="width:30px" /></a></td>';
			celHTML += '</tr>';
            $tbl.append(celHTML);
			return false;
        },
		//Mix option
		mixOutput : function(params, is_append) {
			$.ajax({
				url : admDir+'/product/manage/matrix'
				, type : 'post'
				, dataType : 'json'
				, data : params
				, success : function(res) {
				    if (res.success !== true) {
                        alert(res.msg);
                        return false;
                    }

					var $tbl_body = $('#mix_option_result .MSH-opt-body'),
                        $tbl_head = $('#mix_option_result .MSH-opt-head');
                    if (typeof $('tbody', $tbl_body).html() == 'undefined') {
                        var $tbl_ori = $('#mix_option_result');
                        var $tbl_body = $tbl_ori.find('.fht-tbody > table');
                    }


                    //옵션 목록 수 제한
                    var optStoLimit = 1000,
                        currOptSto = $('tr', $tbl_body).length,
                        addOptSto = res.data.length;
                        totalOptSto = parseInt(currOptSto)+parseInt(addOptSto);

                    if (totalOptSto > optStoLimit){
                        alert('선택형 옵션은 '+optStoLimit+'개 까지 등록 가능합니다.');
                        return false;
                    }

                    if (is_append === true) {
                        //table header
                        var cols_count = $('#mix_option input[name="opt_name[]"]').size();
                        var cols_width = cols_count * 100;
                        $('#cols_count').attr("colspan", cols_count);
                        $('#cols_count').css("width", cols_width + 'px');

                        $('thead > tr', $tbl_head).eq(1).remove();
                        $('tbody', $tbl_body).html("");
                
                        var thead = '<tr>';
                        var colgroup = ''
                        $('#mix_option input[name="opt_name[]"]').each(function(k, v){
                            thead += '<th>'+$(this).val()+'</th>';
                            colgroup += '<col style="width:100px" />';
                        });
                        thead += '</tr>';
                        $('thead', $tbl_head).append(thead);

                        // colgroup 수정
                        var tpl_colgroup = $('#tpl_opt_list > colgroup').html();
                        $('colgroup', $tbl_head).html(tpl_colgroup);
                        $('colgroup > col', $tbl_head).eq(1).after(colgroup);
                        $('colgroup', $tbl_body).html(tpl_colgroup);
                        $('colgroup > col', $tbl_body).eq(1).after(colgroup);
                    } else {
                        //저장된 옵션값에 추가된 옵션 값을 콤마(,)로 구분하여 추가함.
                        var add_opt_id = $('#add_option_id').val();
                        var add_opt_value = $('input[name="add_option_value"]').val();
                        var opt_value = $('input[name="mix_opt_value[]"][opt-id="'+add_opt_id+'"]').val();
                        $('input[name="mix_opt_value[]"][opt-id="'+add_opt_id+'"]').val(opt_value+","+add_opt_value);
                        var added_opt_value = $('input[name="opt_value[]"][opt-id="'+add_opt_id+'"]', $('#add_mix_option')).val();
                        $('input[name="opt_value[]"][opt-id="'+add_opt_id+'"]', $('#add_mix_option')).val(added_opt_value + ','+add_opt_value);
                    }

					//table body
                    var optData = res.data 
					if (optData.length > 0) {
						var tbody = '';
						for (var i in optData) {
							if (optData[i].length > 0) {
                                var ids = [];
                                var names = [];
                                var opt_list = '';
								for (var k in optData[i]) {
									opt_list += '<td style="width:100px">'+optData[i][k]['name']+'</td>';
                                    ids[k] = k+":"+optData[i][k]['idx'];
                                    names[k] = optData[i][k]['name'];
								}

								var tpl = $('#tpl_opt_list > tbody').html();
								tpl = tpl.replace(/{{sto_matrix}}/gi, ids.join(','));
								tpl = tpl.replace(/{{sto_opt_values}}/gi, names.join(','));
								tpl = tpl.replace(/{{sto_code}}/gi, '-');
						        $('tbody', $tbl_body).append(tpl);
                                $('tbody > tr:last-child > td', $tbl_body).eq(1).after(opt_list);
                                // 해당 옵션 재고 무한으로 변경
                                $('tbody > tr:last-child', $tbl_body).find('input[name="chk_sto_unlimit[]"]').trigger('click');
							}
						}
					}

                    $('#mix_option_result').show();
				}
			});
            return false;
		},

        deleteRep : function(repId) {
            if (confirm("삭제하시겠습니까?") === false) {
                return false;
            }
            
            $.ajax({
                url : admDir+'/product/option/delRep/',
                type : 'post',
                dataType : 'json',
                data : {rep_id : repId},
                success : function(res) {
                    alert(res.msg);
                    if (res.result == true) {
                        _option.list(true);
                    }
                    return false;
                }
            });
        },
		//재고 상태값 셋팅
        setStockState : function(idx){

            var $unlimit = $('input[name="chk_sto_unlimit[]"]', $('#mix_option_result')).eq(idx); 
            var $realStock = $('input[name="sto_real_stock[]"]', $('#mix_option_result')).eq(idx);

            var stoState = '판매';
            $realStock.attr('disabled', false);

            if ($unlimit.is(':checked') === true) {
                stoState = '판매';
                //재고 입력박스 비활성화 처리하기
                $realStock.attr('disabled', true);
            } else if ($realStock.val() > 0) {
                stoState = '판매';
            } else if ($realStock.val() == 0) {
                stoState = '품절';
            }

            $('.sto-state', $('#mix_option_result')).eq(idx).text(stoState);
        },
        autoSetStockUseView : function() {
            //조합옵션 사용안함에 대해서 보여줄지 
            var stockUseView = $('#js-optStoUseView').is(':checked');
            if (stockUseView){
                _option.setStockUseView('Y');
            } else {
                _option.setStockUseView('N');
            }
        },
        //조합옵션 사용만 보기 / 전체보기 ( Y 사용함만 보기 / N 전체 보기 )
        setStockUseView : function(type){
            var lines = $('#mix_option_result .MSH-opt-body tbody tr');
            if (lines.length > 0) {
                $('select[name="sto_use[]"]').each(function(i,v){
                    var val = $(this).val();
                    if (type.trim() == 'Y') {
                        if (val == 'N') {
                            lines.eq(i).hide();   
                        }
                    } else {
                        lines.eq(i).show();
                    } 
                });
            }
        },
		//조합 옵션 재조합 
        setStockReset : function(){
            //옵션
            var del_opt_ids = [];
            $('input[name="opt_id[]"]').each(function(){
                var opt_id = $(this).val();
                if (opt_id.trim() == "") return true;
                del_opt_ids.push(opt_id);
                $(this).val('');
            });
            var str_del_opt_ids =  del_opt_ids.join(',');
            $('input[name="del_opt_ids"]').val(str_del_opt_ids);
            //재고옵션 
            var del_sto_ids = [];
            $('input[name="sto_id[]"]').each(function(){
                var sto_id = $(this).val();
                if (sto_id.trim() == "") return true;
                del_sto_ids.push(sto_id);
            });
            var str_del_sto_ids = del_sto_ids.join(',');
            $('input[name="del_sto_ids"]').val(str_del_sto_ids);

            //재조합 (재조합 안하고 삭제하는걸로)
            //var params = $('#mix_option input[name="opt_value[]"]').serialize();
            //_option.mixOutput(params, true);

            //옵션목록 초기화
            var lines = $('#mix_option_result .MSH-opt-body tbody tr');
            $.each(lines, function(){
                $(this).remove();
            });

            $('.js-optResetFalse').hide();
            $('.js-optResetTrue').show();
            _option.config.resetActive = true;
        },
        //일괄 수정에 설정한 옵션 초기화
        setOptStoAllSetting : function(){
            //옵션 가격
            $('select[name="opt_update_price_type"] option').eq(0).prop('selected', true);
            $('input[name="all_sto_price"]').val('');

            //재고
            $('select[name="opt_update_stock_type"] option').eq(0).prop('selected', true);
            $('input[name="all_sto_stock"]').val('');

            //사용
            $('select[name="all_sto_use"] option').eq(0).prop('selected', true);
        }
	};


	//=================================================================================
	// fixedHeader setting
	//=================================================================================
	setFixedHeader = function() {
        // 모바일일때 fixedHeader세팅하기 위해서 생성
        // 기존 반응형에서 모바일페이지를 별도로 만드는 방식으로 변경되서 필요 없어짐
        return false;
		if ($m('.is-mobile').css('display') == 'block' && is_fixedheader == false) {
			$m('#mix_option_result table').fixedHeaderTable({fixedColumns:0, fixedColumn:true});
			//CSS 틀어짐 현상 수정 
			var fth_tr_width = $m('th', $m('.fht-fixed-body table tr').eq(0)).eq(1).width();
							   $m('th', $m('.fht-fixed-body table tr').eq(0)).eq(1).width(fth_tr_width-0.5);
			var fth_fixed_width = $m('.fht-fixed-column').width();
								  $m('.fht-fixed-column').width(fth_fixed_width+2);
			var fth_fixed_height = $m('th', $m('.fht-fixed-column table tr').eq(0)).eq(0).height();
								   $m('th', $m('.fht-fixed-column table tr').eq(0)).eq(0).height(fth_fixed_height+1);
			$m('td', $m('.fht-fixed-column .fht-tbody > table > tbody > tr').eq(0)).eq(0).css({'border-top':'1px solid #ebebeb'});
			is_fixedheader = true;
		} else { 
			if (is_fixedheader === true) {
				unsetFixedHeader();
			}
		}
	}

	unsetFixedHeader = function() {
		$m('#mix_option_result table').eq($m('#mix_option_result table').length-1).fixedHeaderTable('destroy'); //fixedheader에서 의미없는 테이블을 생성하므로 destroy함. 마지막 테이블을 기준으로 실행하면됨.
		is_fixedheader = false;
	}

    setImgCnt = function() {
        var imgCnt = 0;
        $('.btn-prd-upload').each(function() {
            var tmpImg = $(this).parent().parent('li').find('input[name="prd_tmp_img[]"]').val(),
                saveImg = $(this).parent().parent('li').find('input[name="prd_saved_img[]"]').val();
            if (tmpImg != '' || saveImg != '') {
                imgCnt++;
            }
        });
        $('.MSH-txt-img-cnt').text(imgCnt);
    }
})(jQuery);
