
//CONTENT 폼체크
function contentValidation() {
	$("#contentForm").validate({
		rules: {
			name: {
				required: true,
			}
		},
		messages: {
			name: {
				required: "&nbsp;",
			}
		},
		// the errorPlacement has to take the table layout into account
		errorPlacement: function(error, element) {
			if ( element.is(":radio") )
				error.appendTo( element.parent().next().next() );
			else if ( element.is(":checkbox") )
				error.appendTo ( element.next() );
			else {
				error.appendTo( element.next() );
				//element.after( error );
				$( element )
					//.attr( "placeholder", $( error ).text() )
					//.after( $( error ).text() )
					.parent().parent()
					.addClass( "error" );
				
			}
		},
		success: function(label, element) {
			// set &nbsp; as text for IE
			label.html("&nbsp;").addClass("checked");
			$(element).parent().parent().removeClass( "error" );
		},
		highlight: function(element, errorClass) {
			$(element).parent().next().find("." + errorClass).removeClass("checked");
		},
		submitHandler: function(form) {
			
			// 판매가 설정시 판매가 필수 입력
//			if( $( "input[name='isPrice']:checked" ).val() == "true" ) {
//				console.info( $("input[name='content_price']").val().length );
//				if( $("input[name='content_price']").val().length == 0 ) {
//					bootbox.alert("판매가 설정시 판매가 필수 입력");
//					$("input[name='content_price']").parent().parent().addClass( "error" );
//					return false;
//				} 
//			} 
			form.submit();
		    
		 }
	});
}



//CONTRACT 폼체크
function contractValidation() {
	
	// 콘텐츠 계약
	$( "textarea" ).click( function(){
		$( this ).removeClass( "border-color-red" );
	});
	
	/*
	$("#contractForm").validate({
		rules: {
			group_id: {
				required: true,
			},
			contract_rate: {
				required: true,
			},
			contract_sdate: {
				required: true,
			},
			contract_edate: {
				required: true,
			},
		},
		messages: {
			group_id: {
				required: "&nbsp;",
			},
			contract_rate: {
				required: "&nbsp;",
			},
			contract_sdate: {
				required: "&nbsp;",
			},
			contract_edate: {
				required: "&nbsp;",
			}
		},
		// the errorPlacement has to take the table layout into account
		errorPlacement: function(error, element) {
			if ( element.is(":radio") ) {
			} else if ( element.is(":checkbox") ) {
				error.appendTo ( element.next() );
			} else if ( element.is("textarea") ) {
				
			} else {
				$( element )
					.parent().parent()
					.addClass( "error" );
				
			}
		},
		success: function(label, element) {
			// set &nbsp; as text for IE
			label.html("&nbsp;").addClass("checked");
			$(element).parent().parent().removeClass( "error" );
		},
		highlight: function(element, errorClass) {
			$(element).parent().next().find("." + errorClass).removeClass("checked");
		},
		submitHandler: function(form) {
			
			var result = true;
			// 라이선스 권한
			if( $( "input[name='contract_license']:checked" ).val() == 0 ) {
				var $contract_license_detail = $("textarea[name='contract_license_detail']");
				if( $contract_license_detail.val().length == 0 ) {
					$contract_license_detail.addClass( "border-color-red" );
					result = false;
				} 
			} 
			// 라이선스 유효국가
			if( $( "input[name='contract_country']:checked" ).val() == 0 ) {
				var $contract_country_detail = $("textarea[name='contract_country_detail']");
				if( $contract_country_detail.val().length == 0 ) {
					$contract_country_detail.addClass( "border-color-red" );
					result = false;
				} 
			} 
			// 계약방식
			if( $( "input[name='contract_type']:checked" ).val() == 0 ) {
				var $contract_etc = $("textarea[name='contract_etc']");
				if( $contract_etc.val().length == 0 ) {
					$contract_etc.addClass( "border-color-red" );
					result = false;
				} 
			} 
			// 정산 상세정보
			var $contract_balance_detail = $("textarea[name='contract_balance_detail']");
			if( $contract_balance_detail.val().length == 0 ) {
				$contract_balance_detail.addClass( "border-color-red" );
				result = false;
			}
			// 은행 선택시
			if( "선택하기" != $( "select[name='contract_bankname'] option:selected" ).val() ) {
				var $contract_account = $( "#contract_account" );
				if( $contract_account.val().length == 0 ) {
					$contract_account.css( "border-color", "#b94a48" );
					result = false;
				}	
			} 		
			
			if( result ) {
				form.submit();
			}
		    
		 },
		debug: true
	});
	*/
}