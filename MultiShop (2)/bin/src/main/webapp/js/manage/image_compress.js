/**
 * 이미지 업로드 전에 resize 및 quality 조정하여 업로드.
 * (모바일에서 이미지 용량이 클 경우 줄이기 위한 목적)
 * JIC library upload() + create canvas image
 *
 * @author parkjs
 **/

var image = {};
(function($){
	//이미지 업로드
	$(document).on("imageUpload", function (event) {
		if (event.blob && event.url) {
			var upload_img 		= document.createElement('img');
				upload_img.src 	= event.url;
			var image_name 		= 'upload_image.' + event.ext;
			var upload_url 		= event.upload_url;
            var file_name       = image.file_name;
            var callback        = image.callback;
            var errorCallback   = image.errorCallback;
			image.upload(upload_img, upload_url, file_name, image_name, callback, errorCallback);
			return false;
		}
	});

	image = {
		//custom parameter
		params : {
			//selected image key
			key : 0,
            orientation: 1,      // 기본 회전값=정상(1)
            callback: null,        // callback 함수를 받아 upolad에서 실행  
            errorCallback: null,
            file_name: "",
		},
        getOrientation: function (file) {
            if (typeof loadImage !== 'undefined') {
                loadImage.parseMetaData(file, function (data) {
                    if (data.exif && data.exif.get('Orientation')) {
                        image.params.orientation = data.exif.get('Orientation');
                    }
                }, {});
            }
        },

		/**
		 * 이미지 유효성 체크
		 * @param file 		[file form data]
		 **/
		validate : function(file) {
			var allowed_type = ['image/jpg','image/jpeg','image/gif','image/png'];
			if ($.inArray(file.type, allowed_type) < 0) {
				throw new Error('이미지만 업로드 가능합니다.');
			}
		},

		validateError : function(msg) {
			alert(msg);
			$('.btn-prd-upload').eq(image.params.key).css({'background':'#eef1f4 url(' + imgPath + '/assets/admin/images/btn/h32_plus.gif) no-repeat 50% 50%', 'background-size':'auto'});
		},
		
		/**
		 * 이미지 리사이즈 및 퀄리티 조정!!!!
		 * @param file     	[file form data]
		 * @param quality  	[image quality ~100]
		 * @param max_width [image max width]
		 * ========== Custom parameter ==========
		 * @param key 			[selected image index]
		 * @param upload_url 	[save image url]
		 * .... 
		 *
		 **/
		uploadAfterCompress : function(file, quality, max_width, key, upload_url, callback, errorCallback, file_name) {
            image.callback = callback;
            image.errorCallback = errorCallback;
            image.file_name = file_name;
			//이미지 유효성 체크
			try {
				image.validate(file);
			} catch (err) {
				image.validateError(err);
				return false;
			}

			//기본 포멧은 png이며, jpg일 경우에만 jpg로 셋팅함.
			var output_format = 'png';
			var output_type   = file.type;
			switch (file.type) {
				case 'image/jpg' :
				case 'image/jpeg' :
						output_format = 'jpg';
					break;
			}

			//이미지 선택한 key 값 (form)
			image.params.key = key;

			//TODO::add to validation!

			var reader = new FileReader();
			reader.onload = function(e) {
				var img = document.createElement('img');
				img.onload = function() {
					var canvas = document.createElement('canvas'),
						width  = img.width,
						height = img.height;

					//최대 넓이보다 클 경우, 비율맞춰서 리사이즈!
					if (width > max_width) {
						height *= max_width / width;
						width  = max_width;
					}

                    // jpg의 경우 회전 처리가 필요함(exif.orientation 값으로 판단)
                    if (output_format == 'jpg') {
                        if (4 < image.params.orientation && image.params.orientation < 9) {
                          canvas.width = height;
                          canvas.height = width;
                        } else {
                            canvas.width = width;
                            canvas.height = height;
                        }

                        var ctx = canvas.getContext('2d');

                        switch (image.params.orientation) {
                          case 2: ctx.transform(-1, 0, 0, 1, width, 0); break;
                          case 3: ctx.transform(-1, 0, 0, -1, width, height); break;
                          case 4: ctx.transform(1, 0, 0, -1, 0, height); break;
                          case 5: ctx.transform(0, 1, 1, 0, 0, 0); break;
                          case 6: ctx.transform(0, 1, -1, 0, height, 0); break;
                          case 7: ctx.transform(0, -1, -1, 0, height, width); break;
                          case 8: ctx.transform(0, -1, 1, 0, 0, width); break;
                          default: break;
                        }
                    } else {        // jpg가 아닌경우
                        canvas.width = width;
                        canvas.height = height;
                        var ctx = canvas.getContext('2d');
                    }

					ctx.drawImage(img, 0, 0, width, height);
					
					var data_url = canvas.toDataURL(output_type, quality/100);
					var resize_image = image.dataURLToBlob(data_url);
					//upload event trigger
					$.event.trigger({
						type : 'imageUpload',
						blob : resize_image, //blob
						url  : data_url, //dataURL
						upload_url  : upload_url, //업로드 url
						ext  : output_format //업로드 확장자
					});
				}
				img.src = e.target.result;
			}
            image.getOrientation(file);     // orientation값을 먼저 구해놔야함
			reader.readAsDataURL(file);
		},

		/**
		 * JIC Library 에서 upload 함수만 가져옴!
		 * @param t  	[image resource]
		 * @param e     [upload url]
		 * @param n 	[filename]
		 * @param a 	[saved file name]
		 * @param r 	[callback]
		 * @param o 	[error callback]
		 **/
		upload   : function(t,e,n,a,r,o,s,i) {
			void 0===XMLHttpRequest.prototype.sendAsBinary&&(XMLHttpRequest.prototype.sendAsBinary=function(t){var e=Array.prototype.map.call(t,function(t){return 255&t.charCodeAt(0)});this.send(new Uint8Array(e).buffer)});var p="image/jpeg";".png"==a.substr(-4)&&(p="image/png");var u=t.src;u=u.replace("data:"+p+";base64,","");var d=new XMLHttpRequest;d.open("POST",e,!0);var c="someboundary";if(d.setRequestHeader("Content-Type","multipart/form-data; boundary="+c),i&&"object"==typeof i)for(var f in i)d.setRequestHeader(f,i[f]);s&&s instanceof Function&&(d.upload.onprogress=function(t){t.lengthComputable&&s(t.loaded/t.total*100)}),d.sendAsBinary(["--"+c,'Content-Disposition: form-data; name="'+n+'"; filename="'+a+'"',"Content-Type: "+p,"",atob(u),"--"+c+"--"].join("\r\n")),d.onreadystatechange=function(){4==this.readyState&&(200==this.status?r(this.responseText):this.status>=400&&o&&o instanceof Function&&o(this.responseText))};
		},
	
		/**
		 * Canvas로 생성된 이미지의 dataURL으로 Blob build.
		 * @param dataURI 			[Canvas image dataURI]
		 *
		 *  -> canvas-to-blob.js 참고
		 **/
		dataURLToBlob : function(dataURI) {
			var hasBlobConstructor =
			    window.Blob && (function () {
	      			try {
				        return Boolean(new Blob());
					} catch (e) {
		    	   		return false;
					}
			    })();

			var hasArrayBufferViewSupport =
			    hasBlobConstructor &&
			    window.Uint8Array &&
			    (function () {
			    	try {
			    		return new Blob([new Uint8Array(100)]).size === 100
					} catch (e) {
						return false
				    }
				})();

 			var dataURIPattern = /^data:((.*?)(;charset=.*?)?)(;base64)?,/;
			var matches,mediaType,isBase64,dataString,byteString,arrayBuffer,intArray,i,bb;

			// Parse the dataURI components as per RFC 2397
			matches = dataURI.match(dataURIPattern);
			if (!matches) {
				throw new Error('invalid data URI');
			}

			// Default to text/plain;charset=US-ASCII
			mediaType 	= matches[2] ? matches[1]	: 'text/plain' + (matches[3] || ';charset=US-ASCII'); 
			isBase64 	= !!matches[4];
			dataString 	= dataURI.slice(matches[0].length);

			if (isBase64) {
				// Convert base64 to raw binary data held in a string:
				byteString = atob(dataString)
			} else {
				// Convert base64/URLEncoded data component to raw binary:
				byteString = decodeURIComponent(dataString)
			}

			// Write the bytes of the string to an ArrayBuffer:
			arrayBuffer = new ArrayBuffer(byteString.length);
			intArray 	= new Uint8Array(arrayBuffer);
			for (i = 0; i < byteString.length; i += 1) {
				intArray[i] = byteString.charCodeAt(i);
			}

			// Write the ArrayBuffer (or ArrayBufferView) to a blob:
			if (hasBlobConstructor) {
				return new Blob([hasArrayBufferViewSupport ? intArray : arrayBuffer], {
					type: mediaType
				});
			}

			bb = new BlobBuilder()
			bb.append(arrayBuffer)
			return bb.getBlob(mediaType);
		}

	}
})(jQuery);
