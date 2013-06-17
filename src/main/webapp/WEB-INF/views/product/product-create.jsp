<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	
<div class="page-name">
	<h4>
		판매 계약 등록 <small>&gt;&gt; 계약 정보를 상세히 입력해 주세요.</small>
	</h4>
</div>

<div class="row-fluid product-box">

	<div class="span12">
		
		<form id="productForm" class="form-horizontal" method="POST" action='<spring:eval expression="@urlProp['productCreateAction']"/>'>
			<div class="control-group">
				<label class="control-label" for="customer_license"><img src='<spring:eval expression="@urlProp['v']"/>'> 라이선스</label>
				<div class="controls">
					<label class="radio inline">
						<input type="radio" name="customer_license" value="1" checked>
						빅스타 소유
					</label>
					<label class="radio inline">
						<input type="radio" name="customer_license" value="2">
						공동 소유
					</label>
					<label class="radio inline">
						<input type="radio" name="customer_license" value="0">
						기타
					</label>
					<div>
						<textarea class="clearfix span10" rows="4" name="customer_license_detail" placeholder="라이선스 상세정보 입력" style="display:none;"></textarea>
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="customer_contract_type"><img src='<spring:eval expression="@urlProp['v']"/>'> 계약방식</label>
				<div class="controls">
					<label class="radio inline">
						<input type="radio" name="customer_contract_type" value="1" checked>쉐어
					</label>
					<label class="radio inline">
						<input type="radio" name="customer_contract_type" value="2" >선금
					</label>
					<label class="radio inline">
						<input type="radio" name="customer_contract_type" value="3" >후지급
					</label>
					<label class="radio inline">
						<input type="radio" name="customer_contract_type" value="0" >기타
					</label>
					<div>
						<textarea class="span10" rows="4" name="customer_contract_type_detail" placeholder="기타 설정시 필수입력" style="display:none;"></textarea>
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" ><img src='<spring:eval expression="@urlProp['v']"/>'> 수익률 </label>
				<div class="controls">
					<input type="text" id="customer_rate" name="customer_rate" placeholder="수익률">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" ><img src='<spring:eval expression="@urlProp['v']"/>'> 계약기간 </label>
				<div class="controls">
					<input class="datepicker" type="text" name="customer_sdate" data-date-format="yyyy-mm-dd"> - 
					<input class="datepicker" type="text" name="customer_edate" data-date-format="yyyy-mm-dd">
					<a id="tip3" href="#" data-toggle="tooltip" >tip</a>
					<script>
					$('#tip3')
						.tooltip({
							"title":"시작일과 종료일을 넣어주세요.",
							"placement":"bottom"
						});
					</script>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">계약서 등록</label>
				<div class="controls">
				
					<input id="fileData" name="mf" type="file" style="display:none">
					<div class="input-append">
					   <input id="fileName" name="fileName"class="input-large" type="text">
					   <a class="btn" onclick="$('input[id=fileData]').click();">파일찾기</a>
					</div>
					
					<script type="text/javascript">
					$( "input[ id=fileData ]" ).change(function() {
					   $( "#fileName" ).val( $(this).val() );
					});
					</script>
					
				</div>
			</div>
			<input type="hidden" name="group_id" id="group_id" />
				
			<div class="control-group">
				<label class="control-label" for="customer"><img src='<spring:eval expression="@urlProp['v']"/>'> 판매처</label>
				<div class="controls">
					<select size="1" name="customer_id" id="customer">
						<c:forEach items="${ customerList }" var="customer">
							<option value="${ customer.customer_id }" data-group_id="${ customer.group_id }">${ customer.customer_name }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="deviceType"><img src='<spring:eval expression="@urlProp['v']"/>'> 판매형태</label>
				<div class="controls">
					<div class="" id="deviceType">
						<!-- ajax -->
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="saleType"><img src='<spring:eval expression="@urlProp['v']"/>'> 판매방식</label>
				<div class="controls">
					<select size="1" name="product_sale_type" id="product_sale_type">
						<option value="1">개별 판매</option>
						<option value="2">팩키지 판매</option>
						<option value="3">번들 판매</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for=""><img src='<spring:eval expression="@urlProp['v']"/>'> 콘텐츠</label>
				<div class="controls">
					<button class="btn btn-series-create">시리즈등록</button>
					<button class="btn btn-each-create">개별상품등록</button>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for=""></label>
				<div class="controls">
					<div class="span10">
						<table class="table table-condensed table-striped table-bordered table-content">
							<thead>
								<!-- ajax -->
							</thead>
							<tbody>
								<!-- ajax -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for=""></label>
				<div class="controls">
					<label class="radio inline">
						<input type="radio" name="product_price_type" value="1" checked>
						기본판매가격
					</label>
					<label class="radio inline">
						<input type="radio" name="product_price_type" value="0">
						기타 판매가 설정
					</label>
					<input type="text" id="product_price" name="product_price" placeholder="상품가 입력">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="address"></label>
				<div class="controls">
					<label class="radio inline">
						<input type="radio"name="product_source_type" value="ebook" checked>
						E-book source html
					</label>
					<label class="radio inline">
						<input type="radio"name="product_source_type" value="video">
						동영상 html
					</label>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" ></label>
				<div class="controls">
					<textarea class="span10" rows="4" name="product_etc" placeholder="Source 입력"></textarea>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" ></label>
				<div class="controls">
					<button class="btn btn-product-list">목록가기</button>
					<button class="btn btn-primary btn-product-create-action">등록하기</button>
				</div>
			</div>
			
		</form>

	</div>
	
	
</div>
<!--/row-->

<!-- MODAL -->
<div id="findSeries" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 class="text-center">시리즈 등록</h3>
	</div>
	<div class="modal-body">
		<div class="input-append pull-right">
			<input type="text" id="seriesQuery" name="seriesQuery" class="input-large">
			<button class="btn btn-series-search-form" type="button"><i class="icon-search"></i></button>
		</div>
		<table class="table table-striped table-hover">
			<thead>
			<tr>
				<th><input class="check-all" type="checkbox" name="checkbox_all" value="false" data-toggle="tooltip" style="display:none;"></th>
				<th>시리즈명</th>
				<th>가격</th>
			</tr>
			</thead>
			<tbody id="findSeriesBody">
			</tbody>
		</table>
	</div>
	<div class="modal-footer">
		<button class="btn btn-series-close" data-dismiss="modal" aria-hidden="true">등록취소</button>
		<button class="btn btn-primary btn-series-select">등록하기</button>
	</div>
</div>

<div id="findEach" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 class="text-center">개별상품 등록</h3>
	</div>
	<div class="modal-body">
		<div class="input-append pull-right">
			<input type="text" id="seriesQuery" name="seriesQuery" class="input-large">
			<button class="btn btn-series-search-form" type="button"><i class="icon-search"></i></button>
		</div>
		<div class="input-append">
			<select name="category">
				<!-- ajax -->
			</select>
			<select name="series">
				<!-- ajax -->
			</select>
		</div>
		<table class="table table-striped table-hover">
			<thead>
			<tr>
				<th></th>
				<th>콘텐츠명</th>
				<th>가격</th>
			</tr>
			</thead>
			<tbody id="findEachBody">
				<!-- ajax -->
			</tbody>
		</table>
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">등록취소</button>
		<button class="btn btn-primary btn-each-select">등록하기</button>
	</div>
</div>


<script>
$(function(){
	
	//기타판매가 선택시 판매가격 빈값으로 변경 후 포커스
	$("input[name='product_price_type']").change(function(){
		if( $(this).val() == 0 ) { 
			$("#product_price").val("").focus();
		} else {
			
		}
	});
	
	//판매처 변경시 판매형태 변경
	$("#customer").change(function(){
		$.ajax({
			dataType: "json",
			url: '<spring:eval expression="@urlProp['ajaxProductDeviceTypeList']"/>',
			data: { "group_id" : $(this).find("option").filter(":selected").data("group_id") },
			success: function(data){
				
				console.info("--------------------------");
				console.info(data);
				console.info("--------------------------");
				
				$target = $("#deviceType");
				//init
				$target.html(""); //성공시 리스트 초기화
				
				$json = data.result;
				$.each($json, function(){
					$('<label class="radio inline"/>')
						.append('<input type="radio" name="product_device_type" value="' + this.ty + '"/>' + this.na)
						.appendTo($target);
				});
				
				$("input[name='product_device_type']").first().prop("checked", true);
			}
		});
	}).trigger("change");
	
	$("div.product-box, div.modal-body").find("button").click(function(){
		
		var $this = $(this);
		
		if( $this.is(".btn-series-create, .btn-series-search-form") ) {
			
			var seriesQuery = $("#seriesQuery").val();
			checkMulti();
			$.ajax({
				dataType: "json",
				url: '<spring:eval expression="@urlProp['ajaxProductSeriesList']"/>',
				data:{ group_name : seriesQuery },
				success: function(data){
					console.info(data);
					console.info("--------------------------");
					console.info("series");
					var $target = $("#findSeriesBody");
					
					//init
					$target.html(""); //성공시 리스트 초기화
					
					if(data.resultCnt > 0) {
						
						var $json = data.result;
						$.each($json, function(){
							$html = 	'<tr>';
							$html += 	'<td><input name="check_list" type="checkbox" data-series_price="' + (this.series_price==null?'':this.series_price) + '" data-category_name="' + this.category_name + '" value="' + this.category_id + '"></td>';
							$html += 	'<td>' + this.category_name + '</td>';
							$html += 	'<td>' + (this.series_price==null?'':this.series_price) + '</td>';
							$html += 	'</tr>';
							$target.append( $html );
							
						});
						
						//개별판매일때 멀티체크 방지
						checkMulti();
					}
				},
				error: function(data){
					console.info(data);
				}
			});
			if ( $this.is(".btn-series-create") ) {
				
				//modal call
				$("#findSeries").modal('toggle');
			}
		} else if ( $this.is(".btn-each-create") ) {
			
			//개별판매 
			$.ajax({
				dataType: "json",
				url: '<spring:eval expression="@urlProp['ajaxProductCategoryList']"/>',
				success: function(data){
					
					console.info("--------------------------");
					console.info(data);
					console.info("--------------------------");
					
					var $target = $("#findEach").find("select[name='category']");

					//init
					$target.html(""); //성공시 리스트 초기화
					
					if(data.resultCnt > 0) {
						
						var $json = data.result;
						$.each($json, function(){
							$target.append( '<option value="' + this.category_id + '">' + this.category_name + '</option>' );
						});
						
					}
					
					categoryChange();
				}
			});
			
			//modal call
			$("#findEach").modal('toggle');
		} else if ( $this.is(".btn-product-list") ) {
			bootbox.confirm( "목록으로 돌아가시겠습니까?", function(result) {
				if( result ) {
					history.back(-1);
				}
			}); 
		} else if ( $this.is(".btn-product-create-action") ) {
			
			bootbox.confirm( "등록 하시겠습니까?", function(result) {
				if( result ) {
					$( "#productForm" ).submit();
				}
			}); 
			
		}
		
		//form submit 막기위해
		return false;	
		
	});
	
	$("button").click(function(){
		var $this = $(this);
		
		//시리즈 선택 눌렀을때
		if( $this.is(".btn-series-select") ) {
			var $target = $("table.table-content");
			$target.find("thead,tbody").empty();

			var $selectedItem = $("#findSeriesBody").find("input[name='check_list']").filter(":checked");
			
			if( $selectedItem.size() == 0 ){
				bootbox.alert("1개 이상 선택해 주세요!");				
				return false;				
			} else {
				var arr = [];
				$selectedItem.each(function( index ){
					arr.push( { category_id : $( this ).val(), category_name : $( this ).data( "category_name" ) } );
				});
				
				var json = { "categoryList" : arr };
				console.info( JSON.stringify( json ) );
				$.ajax({
					url : "<spring:eval expression="@urlProp['ajaxGroupCreateAction']"/>",
					type : "POST",
					//contentType : "text/html; charset=utf-8" ,
					data : { jsonStr : JSON.stringify( json ) },
					dataType : "json",
					success : function( data ) {
						if( data.code === 200 ){
							$( "#group_id" ).val( data.group_id );
							
							$target.find("thead").append("<tr><th>시리즈명</th><th>가격</th></tr>");
							$selectedItem.each(function(){
								var $this = $(this);
								$target.find("tbody").append("<tr><td>" + $this.data("category_name") + "</td><td>" + $this.data("series_price") + "</td></tr>");
							});
							
						} else {
							alert("에러 발생! 관리자에게 문의하여 주십시오.");
						}
					},
					error : function() {
						alert("에러 발생! 관리자에게 문의하여 주십시오.");
					}
				});
			}
			
			//close modal
			$("#findSeries").modal('toggle');
			
		} else if( $this.is(".btn-each-select") ) {
			
			var $target = $("table.table-content");
			$target.find("thead,tbody").empty();

			var $selectedItem = $("#findEach").find("input[name='content_checkbox']").filter(":checked");
			
			if( $selectedItem.size() == 0 ){
				bootbox.alert("1개 이상 선택해 주세요!");				
				return false;				
			} else {
				var arr = [];
				$selectedItem.each(function( index ){
					arr.push( { content_code : $( this ).val(), content_name : $( this ).data( "content_name" ) } );
				});
				
				var json = { "contentList" : arr };
				console.info( JSON.stringify( json ) );
				$.ajax({
					url : "<spring:eval expression="@urlProp['ajaxGroupContentAction']"/>",
					type : "POST",
					//contentType : "text/html; charset=utf-8" ,
					data : { jsonStr : JSON.stringify( json ) },
					dataType : "json",
					success : function( data ) {
						if( data.code === 200 ){
							$( "#group_id" ).val( data.group_id );
							
							$target.find("thead").append("<tr><th>콘텐츠명</th><th>가격</th></tr>");
							$selectedItem.each(function(){
								var $this = $(this);
								$target.find("tbody").append("<tr><td>" + $this.data("content_name") + "</td><td>" + $this.data("content_price") + "</td></tr>");
							});
							
						} else {
							alert("에러 발생! 관리자에게 문의하여 주십시오.");
						}
					},
					error : function() {
						alert("에러 발생! 관리자에게 문의하여 주십시오.");
					}
				});
			}
			
			//close modal
			$("#findEach").modal('toggle');
			
		}
			
			
		
	});
	
	function categoryChange(){
		
		$( "select[name='category']" ).change(function () {
			var select_id = $(this).find("option").filter(":selected").val();
			if( null != select_id ){
			 
				var $target = $( "select[name='series']" );
				$target.find( "option" ).remove();
			 
				$.getJSON('<spring:eval expression="@urlProp['ajaxCategoryList']"/>',
					{ category_parent : select_id },
					function(data) {
						console.info( data );
						if( data.resultCnt > 0 ){
							console.info( data.result );
							$.each( data.result, function(){
								$html = '<option value="' + this.category_id + '">' + this.category_name + '</option>';
								$target.append( $html );
							} );
						}//if
						
						seriesChange();
					});
			} 
			
		}).trigger('change');
	}
	
	function seriesChange(){
		
		$( "select[name='series']" ).change(function () {
			var series_id = $(this).find("option").filter(":selected").val();
			if( null != series_id ){
			 
				$.getJSON('<spring:eval expression="@urlProp['ajaxProductContentList']"/>',
					{ category_id2 : series_id },
					function(data) {
						console.info( data );
						var $target = $("#findEachBody");
						
						//init
						$target.html(""); //성공시 리스트 초기화
						
						if(data.resultCnt > 0) {
							
							var $json = data.result;
							$.each($json, function(){
								$html = 	'<tr>';
								$html += 	'<td><input name="content_checkbox" type="checkbox" data-content_price="' + this.content_price + '" data-content_name="' + this.content_name + '" value="' + this.content_code + '"></td>';
								$html += 	'<td>' + this.content_name + '</td>';
								$html += 	'<td>' + this.content_price + '</td>';
								$html += 	'</tr>';
								$target.append( $html );
							});
							
							//개별판매일때 멀티체크 방지
							checkMulti();
						}
					});
			} 
			
		}).trigger('change');
	}
	
	//판매형태가 개별일때 중복 체크 함수
	function checkMulti() {
		var saleType = $("#product_sale_type").find("option").filter(":selected").val(); //1이면 개별판매
		
		//개별판매인가(체크박스 갯수를 세야하는가?)
		if( saleType == 1 ){
			$( "input[name=checkbox_all]" ).hide();
			$("#findSeriesBody, #findEachBody").find("input[type='checkbox']").on("click",function(){
				var checkedSize = $(this).parent().parent().parent().find("input[type='checkbox']").filter(":checked").size();
				if( checkedSize > 1 ){
					$(this).prop("checked", false);
					bootbox.alert("판매형식이 개별판매 일때에는 중복체크 할수 없습니다.");
				}
			});
		} else {
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
				})
				.show();
		}
	}
	
	function closeModal(element_id){
		if(element_id != null) {
			$("#"+element_id).modal("hide");
		}
	}
	
});
</script>