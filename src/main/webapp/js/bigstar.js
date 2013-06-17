/*
INDEX


0. COMMON
1. HEADER
2. LEFT
3. CONTENT
4. FOOTER

*/

/* --------------------------------------------------------------
0. COMMON
-------------------------------------------------------------- */
{//IE placeholder 플러그인 시작
	this.placeholderForIE();
}//IE placeholder 플러그인 마침

{//버튼 클릭 후 페이지 이동 작업 시작
	$( "button.btn-url" ).click( function() { 
		window.location = $(this).data("url");
	});
}//버튼 클릭 후 페이지 이동 작업 마침

{//Ajax 시작과 끝 로딩 이미지 처리 시작
	$(document)
		.ajaxStart(function() {
			$.blockUI({ message: '<h2><img src="/pcms/img/busy.gif" /> 데이터 가져오는중...</h2>' }); 
		})
		.ajaxComplete(function() {
			$.unblockUI({ fadeOut: 200 }); 
		});
}//Ajax 시작과 끝 로딩 이미지 처리 마침

{//체크박스 전체체크 기능 시작
	$( "input[name=checkbox_all]" )
		.click( function(){
			var $checkboxArray = $( "input[name='check_list']" );
			
			if( $( this ).val() == "true" ) {
				$( this ).val( "false" );
				$.each( $checkboxArray, function(){
					$checkboxArray.prop("checked", false);
				});
			} else {
				$( this ).val( "true" );
				$.each( $checkboxArray, function(idx){
					$checkboxArray.prop("checked", true);
				});
			}
		})
		.tooltip({
			"title":"전체선택",
			"placement":"top"
		});
}//체크박스 전체체크 기능 마침 


/* --------------------------------------------------------------
1. HEADER
-------------------------------------------------------------- */



/* --------------------------------------------------------------
2. LEFT
-------------------------------------------------------------- */
{ //사이드바 하이라이팅
	var left_menu_seq = $("body").data("left_menu_seq");
	
	$("div.lnb")
		.find("a").eq(left_menu_seq).addClass("active");
}

/* --------------------------------------------------------------
3. CONTENT
-------------------------------------------------------------- */

{//컨텐츠 폼 라벨 좌측 정렬 시작
	$("label.control-label").each(function(){
		var $this = $(this);
		//폼 라벨 텍스트 좌측 정렬
		$this.css("text-align", "left");
		//필수 요소 아닌경우 여백
		if(!$this.children().is("img")) {
			$this.css("padding-left", "15px");
		}
	});
}//컨텐츠 폼 라벨 좌측 정렬 마침


// IE placeholder 를 위한 함수
function placeholderForIE(){
	if (!("placeholder" in $('<input />')[0])) {
		$(":input[placeholder]").each(function () {
			var $input = $(this).attr('id', 'fix-' + this.name);
			var $label = $('<label />', {
				'for' : $input.attr('id'),
				'class' : 'handler',
				'text' : $input.attr('placeholder')
			}).css({
				'width' : $input.width(),
				'font-size' : $input.css('font-size'),
				'margin-top' : parseInt($input.css('padding-top')) + parseInt($input.css('border-top-width')) + 1,
				'margin-left' : parseInt($input.css('padding-left')) + parseInt($input.css('border-left-width')) + 1
			}).insertBefore($input).hide();
			$input.on('focus', function() {
				$label.hide();
			}).on('blur', function() {
				if(!this.value.length) $label.css('display', '');
			}).filter(function(){return !this.value.length;}).prev().css('display', '');
		});
	}
	
	// 콘텐츠
	//TODO 폼체크 관련해서 수정해야할 부분 시작
	// 콘텐츠 계약
	$( "label[for='fix-contract_license_detail']" ).hide();
	$( "label[for='fix-contract_country_detail']" ).hide();
	$( "label[for='fix-contract_etc']" ).hide();
	
	// 기타 선택시 상세정보 입력창 가리기/보이기
	$( "input[name='contract_license'],input[name='customer_license']" ).on( "click", function(){
		if( $( this ).val() == 0 ) {
			$( "textarea[name='contract_license_detail'],textarea[name='customer_license_detail']" ).show();
			$( "label[for='fix-contract_license_detail'],label[for='fix-customer_license_detail']" ).show();
		} else {
			$( "textarea[name='contract_license_detail'],textarea[name='customer_license_detail']" ).hide().val( "" );
			$( "label[for='fix-contract_license_detail'],label[for='fix-customer_license_detail']" ).hide();
		}
	});
	$( "input[name='contract_country']" ).on( "click", function(){
		if( $( this ).val() == 0 ) {
			$( "textarea[name='contract_country_detail']" ).show();
			$( "label[for='fix-contract_country_detail']" ).show();
		} else {
			$( "textarea[name='contract_country_detail']" ).hide().val( "" );
			$( "label[for='fix-contract_country_detail']" ).hide();
		}
	});
	$( "input[name='contract_type'],input[name='customer_contract_type']" ).on( "click", function(){
		if( $( this ).val() == 0 ) {
			$( "textarea[name='contract_etc'],textarea[name='customer_contract_type_detail']" ).show();
			$( "label[for='fix-contract_etc'],label[for='fix-customer_contract_type_detail']" ).show();
		} else {
			$( "textarea[name='contract_etc'],textarea[name='customer_contract_type_detail']" ).hide().val( "" );
			$( "label[for='fix-contract_etc'],label[for='fix-customer_contract_type_detail']" ).hide();
		}
	});
	
	$( "select[name='contract_bankname'],select[name='customer_bankname']" ).change(function(){
		if( "선택하기" != $(this).val() ) {
			$( "div.account-group" ).show();	
		} else {
			$( "div.account-group" ).hide().val( "" );	
			
		}		
	});
	
	$( "input[name='optionsRadio']" ).on( "click", function(){
		if( $( this ).val() == "true" ) {
			$( "div.price-group" ).show();
			$( "label[for='fix-content_price']" ).show();
		} else {
			$( "div.price-group" ).hide().val( "" );
			$( "label[for='fix-content_price']" ).hide();
		}
	});
	// 폼체크 관련해서 수정해야할 부분 마침
}

{ // CUSTOMER
	
	
}

/* --------------------------------------------------------------
4. FOOTER
-------------------------------------------------------------- */

