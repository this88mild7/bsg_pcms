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
		
		<form id="productForm" class="form-horizontal" method="POST" action='<spring:eval expression="@urlProp['saleCompanyContractCreateAction']"/>'>
			<div class="control-group">
				<label class="control-label" for="saleType"><img src='<spring:eval expression="@urlProp['v']"/>'> 판매처</label>
				<div class="controls">
					<select size="1" name="company_mgmtno" id="customer">
						<c:forEach items="${ salCompanyList }" var="company">
							<option value="${ company.company_mgmtno }" >${ company.company_name }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="customer_license"><img src='<spring:eval expression="@urlProp['v']"/>'> 라이선스</label>
				<div class="controls">
					<label class="radio inline">
						<input type="radio" name="license_cd" value="1" checked>
						빅스타 소유
					</label>
					<label class="radio inline">
						<input type="radio" name="license_cd" value="2">
						공동 소유
					</label>
					<label class="radio inline">
						<input type="radio" name="license_cd" value="0">
						기타
					</label>
					<div>
						<textarea class="clearfix span10" rows="4" id="license_cd_detail" name="license_cd_detail" placeholder="라이선스 상세정보 입력" style="display:none;"></textarea>
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="sale_profit_type"><img src='<spring:eval expression="@urlProp['v']"/>'> 계약방식</label>
				<div class="controls">
					<label class="radio inline">
						<input type="radio" name="sale_profit_type" value="1" checked>쉐어
					</label>
					<label class="radio inline">
						<input type="radio" name="sale_profit_type" value="2" >선금
					</label>
					<label class="radio inline">
						<input type="radio" name="sale_profit_type" value="3" >후지급
					</label>
					<label class="radio inline">
						<input type="radio" name="sale_profit_type" value="0" >기타
					</label>
					<div>
						<textarea class="span10" id= "sale_profit_type_detail" rows="4" name="sale_profit_type_detail" placeholder="기타 설정시 필수입력" style="display:none;"></textarea>
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" ><img src='<spring:eval expression="@urlProp['v']"/>'> 수익률 </label>
				<div class="controls">
					<input type="text" id="customer_rate" name="sale_profit_rate" placeholder="0" value="0">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" ><img src='<spring:eval expression="@urlProp['v']"/>'> 계약기간 </label>
				<div class="controls">
					<input class="datepicker" type="text" name="str_date" data-date-format="yyyy-mm-dd"> - 
					<input class="datepicker" type="text" name="end_date" data-date-format="yyyy-mm-dd">
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
				
			<div class="control-group">
				<label class="control-label" for="deviceType"><img src='<spring:eval expression="@urlProp['v']"/>'> 판매형태
				<i class="icon-plus-sign"></i></label>
				<div class="controls customer-device" >
					<div class="row-fluid customer-device-form">
						<div class="span3">
							<select size="1" name="device_cd_list" id="customer_device_type">
								<c:forEach items="${ deviceList }" var="device">
									<option value="${device}" >${device}</option>
								</c:forEach>
							</select>
						</div>
						<div class="span2 device-remove-icon">
						</div>
						<!-- 아래로만 추가 하기 위한 empty -->
						<div class="span7">
							<!--  empty -->
						</div>
						
						<!-- 기타 일 경우 나타 나게
						<div class="span3">
							<div class="span3">기기명</div>
							<input class="span9" type="text" name="product_device_name" placeholder="기기명 입력">
						</div>
						 -->							
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="saleType"><img src='<spring:eval expression="@urlProp['v']"/>'> 판매방식</label>
				<div class="controls">
					<select size="1" name="contract_type" id="product_sale_type">
						<c:forEach items="${ contractTypeList }" var="contractType">
							<option value="${ contractType.contract_type }" >${ contractType.contract_type_detail }</option>
						</c:forEach>
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
						<input type="radio" name="sale_price_type" value="1" checked>
						기본 판매가격
					</label>
					<label class="radio inline">
						<input type="radio" id="sale_price_type" name="sale_price_type" value="0">
						기타 판매가격
					</label>
					<input type="text" id="sale_price" name=sale_price placeholder="상품가 입력">
				</div>
			</div>
			
			<div class="page-name">
				<h4>
					정산정보 입력
				</h4>
			</div>
			<div class="control-group">
				<label class="control-label" for="customer_balancetype"><img src='<spring:eval expression="@urlProp['v']"/>'> 정산방식</label>
				<div class="controls">
					<label class="radio inline">
						<input type="radio" name="balance_type" value="1" checked>
						월정산
					</label>
					<label class="radio inline">
						<input type="radio" name="balance_type" value="2" >
						연정산
					</label>
					<label class="radio inline">
						<input type="radio" name="balance_type" value="0" >
						기타
					</label>
					<div class="clearfix">
						<textarea class="span10" rows="4" id="balance_type_detail" name="balance_type_detail" placeholder="정산방식 상세정보 입력 필수"></textarea>
					</div>
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
			<input type="text" id="contentQuery" name="contentQuery" class="input-large">
			<button class="btn btn-search-content-form" type="button"><i class="icon-search"></i></button>
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
	
	//기타판매가 선택시 판매가격 빈값으로 변경 후 포커스
	$("input[name='sale_price_type']").change(function(){
		if( $(this).val() == 0 ) { 
			$("#sale_price").val("").focus();
		} else {
			
		}
	});
	
	{// 계약 방식 체크 & 이벤트
		$( "input[name='sale_profit_type']" ).each(function(){
			var $this = $(this);
			var $saleProfitDetail = $("#sale_profit_type_detail");
			
			$this.click(function(){
				if( $this.val() == 0 ){
					$saleProfitDetail.show();
				} else {
					$saleProfitDetail.hide().val("");
				}
			});
		});
	}
	{// 라이센스 방식 체크 & 이벤트
		$( "input[name='license_cd']" ).each(function(){
			var $this = $(this);
			var $licenseCdDetail = $("#license_cd_detail");
			
			$this.click(function(){
				if( $this.val() == 0 ){
					$licenseCdDetail.show();
				} else {
					$licenseCdDetail.hide().val("");
				}
			});
		});
	}
	
	//판매처 변경시 판매형태 변경
	/*
	$("#customer").change(function(){
		$.ajax({
			dataType: "json",
			url: '<spring:eval expression="@urlProp['ajaxCustomerDeviceTypeList']"/>',
			data: { "sale_company_mgmtno" : $(this).find("option").filter(":selected").val()},
			success: function(data){
				
				console.info("--------------------------");
				console.info(data.result);
				console.info("--------------------------");
				
				$target = $("#customer_device_type");
				//init
				$target.html(""); //성공시 리스트 초기화
				
				$json = data.result;
				$.each($json, function(){
					
					$('<option value="'+this.ty+'">'+this.na+'</option>')
						.appendTo($target);
				});
				
				$("input[name='product_device_type']").first().prop("checked", true);
			}
		});
	}).trigger("change");
	*/
	
	{ // 판매 형태 등록
		$form = $(".customer-device-form");
		$("div.product-box").on( "click", "i", function(){
			
			$this = $(this);
			if( $this.hasClass("icon-plus-sign") ) {
				$target = $("div.customer-device");
				$form.clone()			
				.find(".device-remove-icon").html("<i class='icon-remove-sign'></i>")
				.end()
				.appendTo( $target );
				$("i.icon-remove-sign").tooltip( { "title":"삭제", "placement":"right" } )
			}else{
				$(this).parent().parent().remove();
			}

			return false;
		});
		
		$("i.icon-plus-sign").tooltip({
			"title":"추가",
			"placement":"top"
		});
	}

	
	$("div.product-box, div.modal-body").find("button").click(function(){
		
		var $this = $(this);
		
		// 시리즈 등록 클릭
		if( $this.is(".btn-series-create, .btn-series-search-form") ) {
			if($this.is(".btn-series-create")){
				$("#seriesQuery").val("");
			}
			var seriesQuery = $("#seriesQuery").val();
			checkMulti();
			$.ajax({
				dataType: "json",
				url: '<spring:eval expression="@urlProp['ajaxSaleCompanySeriesList']"/>',
				data:{ search : seriesQuery },
				success: function(data){
					var $target = $("#findSeriesBody");
					
					//init
					$target.html(""); //성공시 리스트 초기화
					
					if(data.resultCnt > 0) {
						
						var $json = data.result;
						$.each($json, function(){
							$html = 	'<tr>';
							$html += 	'<td><input name="check_list" type="checkbox" data-series_price="' + (this.series_price==null?'':this.series_price) + '" data-series_name="' + this.series_name + '" value="' + this.series_mgmtno + '"></td>';
							$html += 	'<td>' + this.series_name + '</td>';
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
		} 
		//개별판매 
		else if ( $this.is(".btn-each-create") ) {
			$("#contentQuery").val("");	
			$.ajax({
				dataType: "json",
				url: '<spring:eval expression="@urlProp['ajaxSaleCompanyCateList']"/>',
				success: function(data){
					
					var $target = $("#findEach").find("select[name='category']");

					//init
					$target.html(""); //성공시 리스트 초기화
					
					if(data.resultCnt > 0) {
						
						var $json = data.result;
						$.each($json, function(){
							console.info(this.cate_id);
							$target.append( '<option value="' + this.cate_id + '">' + this.cate_name + '</option>' );
						});
						
					}
					
					categoryChange();
				}
			});
			$("#findEach").modal('toggle');
		}
		else if ( $this.is(".btn-search-content-form") ) {
			var contentQuery = $("#contentQuery").val();
			$.ajax({
				dataType: "json",
				data : {search : contentQuery},
				url: '<spring:eval expression="@urlProp['ajaxSaleCompanyContentsList']"/>',
				success: function(data){
					
					console.info( data );
					var $target = $("#findEachBody");
					
					//init
					$target.html(""); //성공시 리스트 초기화
					
					if(data.resultCnt > 0) {
						
						var $json = data.result;
						$.each($json, function(){
							$html = 	'<tr>';
							$html += 	'<td><input name="content_checkbox" type="checkbox" data-content_price="' + this.content_price + '" data-content_name="' + this.content_name + '" value="' + this.content_cd + '"></td>';
							$html += 	'<td>' + this.content_name + '</td>';
							$html += 	'<td>' + this.content_price + '</td>';
							$html += 	'</tr>';
							$target.append( $html );
						});
						
						//개별판매일때 멀티체크 방지
						checkMulti();
												
					}
				}
			});
		} 
		else if ( $this.is(".btn-product-list") ) {
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
		
		//시리즈 등록
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
					//arr.push( { series_mgmtno : $( this ).val() } );
					arr.push($( this ).val());
				});
				var json = { 'contentList' : arr };
				
				jQuery.ajaxSettings.traditional = true;
				$.ajax({
					url : "<spring:eval expression="@urlProp['ajaxSaleCompanySaveContents']"/>",
					type : "POST",
					data : json,
					dataType : "json",
					success : function( data ) {
						if( data.code === 200 ){
							var seletedTotlaPrice = 0;	
							$target.find("thead").append("<tr><th>시리즈명</th><th>가격</th></tr>");
							$selectedItem.each(function(){
								var $this = $(this);
								$target.find("tbody").append("<tr><td>" + $this.data("series_name") + "</td><td>" + $this.data("series_price") + "</td></tr>");
								seletedTotlaPrice += $this.data("series_price");
								console.info("seletedTotlaPrice : "+seletedTotlaPrice);
							});
							$("#sale_price").val(seletedTotlaPrice);
							
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
			
		} 
		// 개별 등록 버튼 클릭
		else if( $this.is(".btn-each-select") ) {
			
			var $target = $("table.table-content");
			$target.find("thead,tbody").empty();

			var $selectedItem = $("#findEach").find("input[name='content_checkbox']").filter(":checked");
			
			if( $selectedItem.size() == 0 ){
				bootbox.alert("1개 이상 선택해 주세요!");				
				return false;				
			} else {
				var arr = [];
				$selectedItem.each(function( index ){
					arr.push(  $( this ).val() );
				});
				
				var json = { 'contentList' : arr };
				jQuery.ajaxSettings.traditional = true;
				$.ajax({
					url : "<spring:eval expression="@urlProp['ajaxSaleCompanySaveContents']"/>",
					type : "POST",
					//contentType : "text/html; charset=utf-8" ,
					data : json,
					dataType : "json",
					success : function( data ) {
						if( data.code === 200 ){
							var seletedTotlaPrice = 0;	
							$target.find("thead").append("<tr><th>콘텐츠명</th><th>가격</th></tr>");
							$selectedItem.each(function(){
								var $this = $(this);
								$target.find("tbody").append("<tr><td>" + $this.data("content_name") + "</td><td>" + $this.data("content_price") + "</td></tr>");
								seletedTotlaPrice += $this.data("content_price");
							});
							$("#sale_price").val(seletedTotlaPrice);
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
			 
				$.getJSON('<spring:eval expression="@urlProp['ajaxSaleCompanySeriesList']"/>',
					{ cate_id : select_id },
					function(data) {
						console.info( data );
						if( data.resultCnt > 0 ){
							console.info( data.result );
							$.each( data.result, function(){
								$html = '<option value="' + this.series_mgmtno + '">' + this.series_name + '</option>';
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
			 
				$.getJSON('<spring:eval expression="@urlProp['ajaxSaleCompanyContentsList']"/>',
					{ series_id : series_id },
					function(data) {
						console.info( data );
						var $target = $("#findEachBody");
						
						//init
						$target.html(""); //성공시 리스트 초기화
						
						if(data.resultCnt > 0) {
							
							var $json = data.result;
							$.each($json, function(){
								$html = 	'<tr>';
								$html += 	'<td><input name="content_checkbox" type="checkbox" data-content_price="' + this.content_price + '" data-content_name="' + this.content_name + '" value="' + this.content_cd + '"></td>';
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
		if( saleType == 'CT001001' ){
			$( "input[name=checkbox_all]" ).hide();
			$("#findSeriesBody, #findEachBody").find("input[type='checkbox']").on("click",function(){
				var checkedSize = $(this).parent().parent().parent().find("input[type='checkbox']").filter(":checked").size();
				if( checkedSize > 1 ){
					$(this).prop("checked", false);
					bootbox.alert("판매형식이 개별판매 일때에는 다수 선택이 불가 합니다.");
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