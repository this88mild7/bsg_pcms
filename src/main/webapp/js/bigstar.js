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
	
}

/* --------------------------------------------------------------
4. FOOTER
-------------------------------------------------------------- */

