<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(function(){

// 계약 시작일, 종료일 계산위해
var sdate, edate;

$( "input.datepicker" ).datepicker()
	.on('changeDate', function(ev){
		if( "customer_sdate" === $(this).attr("name") ) {
			sdate = ev.date.valueOf();
		} else {
			edate = ev.date.valueOf();
			if( sdate > edate ) {
				bootbox.alert( "계약종료일 재설정" );
				$( this ).val( "" );
			}
			$( "input[name=customer_sdate]" ).datepicker( "hide" );
		}
	})
	.on('show', function(ev){
		// 2개의 달력을 동시에 안보이게 함.
		if( "customer_sdate" === $(this).attr("name") ) {
			$( "input[name=customer_edate]" ).datepicker( "hide" );
		} else {
			$( "input[name=customer_sdate]" ).datepicker( "hide" );
		}
	});
	
customerValidation();

function customerValidation() {
	$("#customerForm").validate({
		rules: {
		},
		messages: {
		},
		// the errorPlacement has to take the table layout into account
		errorPlacement: function(error, element) {
			if ( element.is(":radio") )
				error.appendTo( element.parent().next().next() );
			else if ( element.is(":checkbox") )
				error.appendTo ( element.next() );
			else {
				error.appendTo( element.next() );
				$( element )
					.parent().parent().addClass( "error" );
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
			if( $( "input[name='optionsRadio']:checked" ).val() == "true" ) {
				console.info( $("input[name='content_price']").val().length );
				if( $("input[name='content_price']").val().length == 0 ) {
					bootbox.alert("판매가 설정시 판매가 필수 입력");
					$("input[name='content_price']").parent().parent().addClass( "error" );
					return false;
				} 
			} 
			
			// 판매 형태 JSON 작업
			$deviceArr = $("select[name='product_device_type'] option").filter(":selected");
			$nameArr = $("input[name='product_device_name']");
			arr = [];
			$("select[name='product_device_type'] option").filter(":selected").each( function(index) {
				arr.push( { "ty" : $(this).val(), "na" : $nameArr.eq( index ).val() } );
			});
			$json = { "list" : arr };
			console.info( JSON.stringify( $json ) );
			$("#product_type").val( JSON.stringify( $json ) );
			form.submit();
		    
		 }
	});
}
$("div.customer-box").find("button").click(function(){
	$this = $(this);
	if( $this.hasClass("btn-customer-create-action") ) {
		$("#customerForm").submit();
	}
});

{ // 판매 형태 등록
	$form = $("div.product-device-form");
	$("div.customer-box").on( "click", "i", function(){
		
		$this = $(this);
		
		if( $this.hasClass("icon-plus-sign") ) {
			$target = $("div.product-device-list");
			$productDeviceForm = $("div.product-device-form");
			
			// 최대 몇개까지 생성가능 하게 할 것인가?
			if ( $productDeviceForm.length > 5 ) {
				// max 7ea
			} else {
				$form.clone()
					.find(".span6").html("<i class='icon-remove-sign'></i>")
					.end()
					.appendTo( $target );
				
				$("i.icon-remove-sign").tooltip( { "title":"삭제", "placement":"right" } );
			}
		} else if ( $this.hasClass("icon-remove-sign") ) {
			$(this).parent().parent().remove();
		}
		
		return false;
	});
	
	$("i.icon-plus-sign").tooltip({
		"title":"추가",
		"placement":"top"
	});
}

$("div.customer-box").find("button").bind( "click", function(){
	
	console.info( $(this) );
	
	if( $(this).hasClass( "btn-customer-list" ) ) {
		
		history.back(-1);
		
	} else if( $(this).hasClass( "btn-customer-create-action" ) ) {
		
		bootbox.confirm( "등록 하시겠습니까?", function(result) {
			if( result ) {
				$( "#customerForm" ).submit();
			}
		}); 
		
	} else if( $(this).hasClass( "btn-customer-search-action" ) ){
		
		if( $( "#customerQuery").val().length ) {
			//검색어 체크 해야할까?
		};
		
		$( "#customerType" )
			.val( $( "a.dropdown-toggle span" ).first().text() )
			.parent()
			.submit();
		
	} else if( $(this).is(".btn-customer-selected-delete") ) {
		
		// 체크박스 폼 체크
		var $checkboxArray = $( "input[name='check_list']:checked" );
		
		if( $checkboxArray.length === 0 ){
			bootbox.alert("삭제할 판매업체를 선택해주세요.");
		} else {
			bootbox.confirm( "선택한 판매업체를 삭제하시겠습니까?", function(result) {
				if( result ) {
					var customerIdList = "";
					$.each( $checkboxArray, function(idx){
						if( idx > 0 ) {
							customerIdList += ",";
						}
						customerIdList += $( this ).val();
					});
					
					$( "input[name='customerIdList']" )
						.val( customerIdList )
						.parent()
						.submit();
				}
			}); 
		}
	} 
	
});

});

</script>