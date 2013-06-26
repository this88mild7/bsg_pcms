<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
	
<div class="page-name">
<c:choose>
			<c:when test="${viewType eq 1 }">
	<h4>
		계약 등록
	</h4>
			</c:when>
			<c:otherwise>
	<h4>
		계약 정보
	</h4>
			</c:otherwise>
</c:choose>
</div>

<div class="row-fluid product-box">

	<div class="span12">
		<c:choose>
			<c:when test="${viewType eq 1 }">
				<form id="registeForm" class="form-horizontal" method="POST" action='<spring:eval expression="@urlProp['saleCompanyContractCreateAction']"/>'>
			</c:when>
			<c:otherwise>
				<form id="registeForm" class="form-horizontal" method="POST" action='<spring:eval expression="@urlProp['saleCompanyContractModifyAction']"/>'>
				<input type="hidden" id="contract_mgmtno" name="contract_mgmtno" value="${saleContractDetail.contract_mgmtno}">
			</c:otherwise>
		</c:choose>
			<div class="control-group">
				<label class="control-label" for="saleType"><img src='<spring:eval expression="@urlProp['v']"/>'> 판매처</label>
				<div class="controls">
				<c:choose>
					<c:when test="${viewType eq 1}">
						<select size="1" name="company_mgmtno">
							<c:forEach items="${ salCompanyList }" var="company">
								<option value="${ company.company_mgmtno }" >${ company.company_name }</option>
							</c:forEach>
						</select>
					</c:when>
					<c:otherwise>
						${saleContractDetail.company_name}
					</c:otherwise>
				</c:choose>
				</div>
			</div>
			
			
			
			<div class="control-group">
				<label class="control-label" for="customer_license"><img src='<spring:eval expression="@urlProp['v']"/>'> 지급대금</label>
				<div class="controls">
					<div class="btn-group">
						<a  id="currency-toggle" class="btn dropdown-toggle" data-toggle="dropdown" href="#"><span>KRW</span><span class="caret"></span></a>
						<ul id="currency-menu" class="dropdown-menu">
							<li><a href="#">KRW</a></li>
							<li><a href="#">USD</a></li>
							<li><a href="#">JPY</a></li>
							<li><a href="#">CNY</a></li>
							<li><a href="#">EUR</a></li>
						</ul>
					</div>
					<div class="input-append">
						<input type="hidden" id="currency" name="currency" value="KRW">
						<input class="inputError input-medium payments" type="text" name="payments" placeholder="지급대금 입력" value="${ saleContractDetail.payments }" data-validation-required-message="판매가는 필수이고 숫자여야 합니다." required>
					</div>
					<span class="help-inline"><a id="tip4" href="#" data-toggle="tooltip" >tip</a></span>
					<script>
					$('#tip4')
						.tooltip({
							"title":"지급대금을 입력해 주세요",
							"placement":"bottom"
						});
					</script>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for=""><img src='<spring:eval expression="@urlProp['v']"/>'> 지급방식</label>
				<div class="controls">
					<select size="1" name="payments_type" id="payments_type" >
						<option value="일시지급" <c:if test="${saleContractDetail.payments_type eq '일시지급'}">selected="selected"</c:if>>일시지급</option>
						<option value="지급" <c:if test="${saleContractDetail.payments_type eq '분납지급'}">selected="selected"</c:if>>분납지급</option>
						<option value="기타방식" <c:if test="${saleContractDetail.payments_type eq '기타방식'}">selected="selected"</c:if>>기타방식</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="">분납방식</label> 
				<div class="controls installments-group">
					<div >
					<c:choose>
						<c:when test="${saleContractDetail == null || fn:length(saleContractDetail.installmentList) == 0}">
						 	<input class="installments-date" type="text"  name="installments_dt"  placeholder="분납입">
							<input type="text" class="installments_price" name="installments_price" placeholder="금액">
							<img id="addInstallments" src="/pcms/img/plus.png" alt="+"/>
						</c:when>
						<c:otherwise>
							<c:forEach items="${saleContractDetail.installmentList }" var="installment">
							 	<input class="installments-date" type="text"  name="installments_dt"  value="${saleContractDetail.str_date }" placeholder="분납입">
								<input type="text" class="installments_price" name="installments_price" placeholder="금액" value="${installment.installments_price}">
								<div class="span2 device-remove-icon">
							</c:forEach>
						
						</c:otherwise>
					</c:choose>
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" ><img src='<spring:eval expression="@urlProp['v']"/>'> 계약기간 </label>
				<div class="controls">
					<input class="contract-date" id="str_date" type="text"  name="str_date"  value="${saleContractDetail.str_date }" data-validation-required-message="계약 시작일은 필수값 입니다." required> - 
					<input class="contract-date" id="end_date" type="text" name="end_date" value="${saleContractDetail.end_date }" data-validation-required-message="계약 종료일은 필수값 입니다." required>
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
				<label class="control-label" for="customer_license"><img src='<spring:eval expression="@urlProp['v']"/>'> 라이선스</label>
				<div class="controls">
					<c:choose>
						<c:when test="${viewType eq 1 }">
							<c:forEach items="${licenseList}" varStatus="index" var="license">
								<label class="radio inline">
									<input class="btn-license" type="radio" name="license_cd" value="${license.license_cd }" 
									<c:if test="${index.count == 1 }"> checked </c:if>>
									${license.license_cd_name }
								</label>
							</c:forEach>
							<div>
								<textarea class="clearfix span10" rows="4" id="license_cd_detail" name="license_cd_detail" placeholder="라이선스 상세정보 입력"  style="display:none;"></textarea>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${licenseList}" varStatus="index" var="license">
								<label class="radio inline">
									<input class="btn-license" type="radio" name="license_cd" value="${license.license_cd }" 
									<c:if test="${saleContractDetail.license_cd == license.license_cd}">checked</c:if>>
									${license.license_cd_name }
								</label>
							</c:forEach>
							<div>
								<c:if test="${not empty saleContractDetail.license_cd_detail}">
									<textarea class="clearfix span10" rows="4" id="license_cd_detail" name="license_cd_detail" placeholder="라이선스 상세정보 입력">${saleContractDetail.license_cd_detail}</textarea>
								</c:if>
								<c:if test="${empty  saleContractDetail.license_cd_detail}">
									<textarea class="clearfix span10" rows="4" id="license_cd_detail" name="license_cd_detail" placeholder="라이선스 상세정보 입력" style="display:none;"></textarea>
								</c:if>
							</div>						
						</c:otherwise>					
					</c:choose>
				</div>
			</div>
<div class="page-name">
<c:choose>
			<c:when test="${viewType eq 1 }">
	<h4>
		상세 상품정보 입력
	</h4>
			</c:when>
			<c:otherwise>
	<h4>
		상세 상품정보
	</h4>
			</c:otherwise>
</c:choose>
</div>
			<div class="control-group">
				<label class="control-label" for="deviceType"><img src='<spring:eval expression="@urlProp['v']"/>'> 판매형태</label>
				<div class="controls sale-device" >
					<c:choose>
						<c:when test="${viewType eq 1}">
							<div class="row-fluid" >
								<div>
									<div class="span3">
										<select size="1" name="device_cd_list">
											<c:forEach items="${ deviceList }" var="device">
												<option value="${device.device_cd}" >${device.device_name}</option>
											</c:forEach>
										</select>
									</div>
									<div class="span2 device-add-icon">
										<img id="addDeviceType" src="/pcms/img/plus.png" alt="+"/>
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
						</c:when>
						<c:otherwise>
							<c:forEach items="${ saleContractDetail.contractedDeviceList }" var="contractedDeviceList">
								<div class="row-fluid">
									<div>
										<div class="span3">							
											<select size="1" name="device_cd_list">
												<c:forEach items="${ deviceList }" var="device">
													<option value="${device.device_cd}" <c:if test="${contractedDeviceList eq device.device_cd}">selected="selected"</c:if> >${device.device_name}</option>
												</c:forEach>
											</select>
										</div>
										<div class="span2 device-remove-icon">
											<img class="removePd" src="/pcms/img/remove.png" alt="x"/>
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
								</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="saleType"><img src='<spring:eval expression="@urlProp['v']"/>'> 판매방식</label>
				<div class="controls">
					<select size="1" name="contract_type" id="product_sale_type">
						<c:forEach items="${ contractTypeList }" var="contractType">
							<option <c:if test="${contractType.contract_type_cd == saleContractDetail.contract_type}"> selected="selected"</c:if> value="${ contractType.contract_type_cd }" >
								${ contractType.contract_type_cd_name }
							</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for=""><img src='<spring:eval expression="@urlProp['v']"/>'> 콘텐츠</label>
				<div class="controls">
					<button id="btn-series-create" class="btn">시리즈등록</button>
					<button id="btn-each-create" class="btn ">개별상품등록</button>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for=""></label>
				<div class="controls" >
					<table id="product-content-tb" style="width:650px" class="table table-striped table-bordered">
					</table>				
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for=""><img src='<spring:eval expression="@urlProp['v']"/>'> 판매가 결정</label>
				<div class="controls">
					<c:choose>
						<c:when test="${viewType eq 1}">
							<label class="radio inline">
								<input type="radio" id="sale_price_type" name="sale_price_type" value="0">
								기타 판매가격
							</label>
							<label class="radio inline">
								<input type="radio" name="sale_price_type" value="1" checked>
								기본 판매가격
							</label>
							<input type="text" id="sale_price" name=sale_price placeholder="판매가 입력" data-validation-required-message="판매가는 필수값 입니다." required>
						</c:when>
						<c:otherwise>
							<label class="radio inline">
								<input type="radio" name="sale_price_type" value="0" <c:if test="${saleContractDetail.sale_price_type == 0}">checked</c:if>>
								기타 판매가격
							</label>
							<label class="radio inline">
								<input type="radio" name="sale_price_type" value="1" <c:if test="${saleContractDetail.sale_price_type == 1}">checked</c:if>>
								기본 판매가격
							</label>
							<input type="text" id="sale_price" name="sale_price" placeholder="판매가 입력" value="${saleContractDetail.sale_price }" data-validation-required-message="판매가는 필수이고 숫자여야 합니다." required>
						</c:otherwise>
					</c:choose>					
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" ></label>
				<div class="controls">
					<button id="btn-list" class="btn btn-product-list">목록가기</button>
					<c:choose>
						<c:when test="${viewType eq 1 }">
							<button id="btn-registe" class="btn btn-primary">등록하기</button>
						</c:when>
						<c:otherwise>
							<button id="btn-modify" class="btn btn-primary">수정하기</button>
						</c:otherwise>
					</c:choose>
					
				</div>
			</div>
			
		</form>

	</div>
	
</div>
<!--/row-->

<!-- MODAL-SERIES -->
<div id="series-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
		<button class="btn" data-dismiss="modal" aria-hidden="true">등록취소</button>
		<button id="btn-series-select" class="btn btn-primary">등록하기</button>
	</div>
</div>

<!-- MODAL-EACH-PRODUCT -->
<div id="product-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
		<button id="btn-each-select" class="btn btn-primary">등록하기</button>
	</div>
</div>

<!-- 분납방식 추가 HTML -->
<div id="installment-add-html" hidden="true">
	<input class="installments-date" type="text"  name="installments_dt"  placeholder="분납입">
	<input type="text" class="installments_price" name="installments_price" placeholder="금액">	
	<img class="removePd" src="/pcms/img/remove.png" alt="x"/>
</div>

<!--판매형태(device) 추가 HTML -->
<div id="device-list" hidden="true">
	<div class="span3">
		<select size="1" name="device_cd_list">
			<c:forEach items="${ deviceList }" var="device">
				<option value="${device.device_cd}" >${device.device_name}</option>
			</c:forEach>
		</select>
	</div>
	<div class="span2 device-remove-icon">
		<img class="remove-device" src="/pcms/img/remove.png" alt="x"/>
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
<script>

	var seletedTotlaPrice = 0;

	var bsgNumeric = new BsgNumeric();
	var menuSelector = new MenuSelector();
	var bsgCalendar = new BsgCalendar();
	var bsgReq = new BsgRequest();
	
	$(function(){
		
		// 금액에 콤마표시
		bsgNumeric.autoNumeric('#sale_price');
		bsgNumeric.autoNumeric('#payments');
		bsgNumeric.autoNumeric('.installments_price');
		
		// 상품선택시 판매 총합 콤마 표시
		$("#sale_price").on("change", function(){
			bsgNumeric.autoNumeric('#sale_price');
		});
		
		
		
		$("#btn-registe").click(function(){
			//금액 콤마 제거	(숫자만 가져옴)		
			$('#sale_price').val($('#sale_price').autoNumeric('get'));
			
			//입금|지불 방식이 분납방식일 때에만 금액 콤마 제거(숫자만 가져옴)
			$("input[name='installments_price']").each(function(){
				$(this).val( $(this).autoNumeric('get') );
			});
			$(".payments").each(function(){
				$(this).val( $(this).autoNumeric('get') );
			});
			$("#registeForm").submit();
		})
		
		// 분납 방식 달력
		$("body").delegate('input[type=text].installments-date', 'focus', function(event){
			bsgCalendar.eventListen($(this));
		});
		
		// 분납 가격의 경우 추가 될수 있으면로 delegate 로 가격 구분 콤마 표시
		$("body").delegate('input[type=text].installments_price', 'focus', function(event){
			bsgNumeric.autoNumeric($(this));
		});
		
		
		
		// 지급대금 통화 메뉴
		$("#currency-menu").find("a").click(function(){
			menuSelector.changeValue('#currency-toggle span', '#currency', $(this).text());
		});
		
		// 계약기간
		bsgCalendar.eventListen("input.contract-date").checkStartEndDate("str_date", "end_date");
		
		// 분납 방식 추가 
		$("#addInstallments").click(function(){
			var $insertPlace = $("div.installments-group");
			$("#installment-add-html").clone().show().appendTo($insertPlace);
		});
		
		// 판매 형태 등록
		$("#addDeviceType").click(function(){
			$insertPlace = $("div.sale-device");
			$("#device-list").clone().show().appendTo( $insertPlace );
			minusIcontooltip();
		});
		
		// 시리즈 등록 버튼 이벤트
		$("#btn-series-create").click(function(){
			var searchUrl = '<spring:eval expression="@urlProp['ajaxSaleCompanySeriesList']"/>';
			bsgReq.json(searchUrl, null, searchSeriesCallBack, searchSeriesError);
					
		});
		
		// 개별상품등록 버튼 이벤트
		$("#btn-each-create").click(function(){
			
			// 1. 카테고리 조회
			// 2. 시리즈 조회
			// 3. 상품 조회
			/* var searchUrl = '<spring:eval expression="@urlProp['ajaxSaleCompanyCateList']"/>';
			bsgReq.json(searchUrl, null, searchCateCall, searchSeriesError); */
			
			$("#contentQuery").val("");	
			$.ajax({
				dataType: "json",
				url: '<spring:eval expression="@urlProp['ajaxSaleCompanyCateList']"/>',
				success: function(data){
					
					var $target = $("#product-modal").find("select[name='category']");

					//init
					$target.html(""); //성공시 리스트 초기화
					
					if(data.resultCnt > 0) {
						
						var $json = data.result;
						$.each($json, function(){
							console.info(this.cate_id);
							$target.append( '<option value="' + this.cate_id + '">' + this.cate_name + '</option>' );
						});
						$("#hasContents").val("has");
					}
					
					categoryChange();
				}
			});
			$("#product-modal").modal('toggle');
			
			
		});
		
		// 개별상품 등록하기 버튼 이벤트
		$("#btn-series-select").click(function(){
			if (checkMulti()) {
				saveSeriesInSession();
			}
		});
		
		// 개별상품 등록하기 버튼 이벤트
		$("#btn-each-select").click(function(){
			if (checkMulti()) {
				registeProduct();
			}
		});
		
		// 분납 방식 삭제 아이콘
		$("body").delegate('img.removePd', 'click', function(event){
			  $(this).parent().remove();
		});
		// 선택 디바이스 삭제 아이콘
		$("body").delegate('img.remove-device', 'click', function(event){
			$(this).parent().parent().remove();
		});
		// 선택 삭제 아이콘
		$("body").delegate('img.remove-product', 'click', function(event){
			$(this).parent().parent().remove();
		});
		
		// 라이센스 버튼 이벤트
		$(".btn-license").click(function(){
			// 기타 체크 이벤트라면
			if($(this).val() == 'LS001999'){
				$("#license_cd_detail").show();
			}else{
				$("#license_cd_detail").hide().val("");
			}
		}); 
		
		//기타판매가 선택시 판매가격 빈값으로 변경 후 포커스
		$("input[name='sale_price_type']").change(function(){
			if( $(this).val() == 0 ) { 
				$("#sale_price").val("").focus();
			} else {
				
			}
		});
		
		// 상품 모달에서 체크시 판매방식 검증
		
		$("body").delegate('.check-product', 'click', function(event){
			checkMulti();
		});
		
		
	}); //init function
	
	function plusIcontooltip(){
		$("i.icon-plus-sign").tooltip({"title":"추가", "placement":"top" });
	}
	
	function minusIcontooltip(){
		$("i.icon-remove-sign").tooltip( { "title":"삭제", "placement":"right" } );
	}
	
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
						var $target = $("#findEachBody");
						
						//init
						$target.html(""); //성공시 리스트 초기화
						
						if(data.resultCnt > 0) {
							
							var $json = data.result;
							$.each($json, function(){
								$html = 	'<tr>';
								$html += 	'<td><input class="check-product" name="content_checkbox" type="checkbox"'
											+ ' data-content_price="' + this.content_price + '"' 
											+ ' data-content_name="'+ this.content_name + '"'
											+ ' data-content_cd="'+ this.content_cd + '"'
											+ ' value="' + this.content_cd + '"></td>';
								$html += 	'<td>' + this.content_name + '</td>';
								$html += 	'<td>' + this.content_price + '</td>';
								$html += 	'</tr>';
								$target.append( $html );
							});
						}
					});
			} 
		}).trigger('change');
	}
	
	
	function saveSeriesInSession(){
		
		var $selectedItem = $(".check-product").filter(":checked");
		
		if( $selectedItem.size() == 0 ){
			bootbox.alert("1개 이상 선택해 주세요!");				
			return false;		
		}
		
		var arrParam = [];
		$selectedItem.each(function( index ){
			arrParam.push($( this ).val());
		});
		var json = { 'contentList' : arrParam };
		
		// 선택한 상품 목록 세션 저장
		jQuery.ajaxSettings.traditional = true;
		var url = "<spring:eval expression="@urlProp['ajaxSaleCompanySaveContents']"/>";
		bsgReq.json(url, json, function(response){
			if( response.code === 200 ){
				productTable($selectedItem);
			} else {
				alert("에러 발생! 관리자에게 문의하여 주십시오.");
			}
		}, function(xhr,status,error){
			alert("에러 발생! 관리자에게 문의하여 주십시오.");
		});
		
		//close modal
		$("#series-modal").modal('toggle');
	}
	
	// 개별상품 등록 function
	function registeProduct(){
		var $selectedItem = $(".check-product").filter(":checked");
		
		if( $selectedItem.size() == 0 ){
			bootbox.alert("1개 이상 선택해 주세요!");				
			return false;				
		} 
		var paramArr = [];
		$selectedItem.each(function( index ){
			paramArr.push(  $( this ).val() );
		});
		var json = { 'contentList' : paramArr };
		
		// 선택한 상품 목록 세션 저장
		jQuery.ajaxSettings.traditional = true;
		var url = "<spring:eval expression="@urlProp['ajaxSaleCompanySaveContents']"/>";
		
		bsgReq.json(url, json, function(response){
			if( response.code === 200 ){
				productTable($selectedItem);
			} else {
				alert("에러 발생! 관리자에게 문의하여 주십시오.");
			}
		}, function(xhr,status,error){
			alert("에러 발생! 관리자에게 문의하여 주십시오.");
		});
		
		//close modal
		$("#product-modal").modal('toggle');
	}
	
	function productTable($selectedItem){
		var $insertPlace = $("#product-content-tb");
		
		$insertPlace.empty();
		
		var productHtml;
		
		productHtml += '<thead>';
		productHtml += '<tr>';
		productHtml += '<th>상품코드</th>';
		productHtml += '<th>상품명</th>';
		productHtml += '<th>CP 업체</th>';
		productHtml += '<th>판매금액</th>';
		productHtml += '</tr>';
		productHtml += '</thead>';
		
		/*
		if($selectedItem.size() > 5){
			productHtml += '<tbody style="display:block; overflow:auto; height:230px;">';
		}else{
		} */
		
		productHtml += '<tbody>';
		var seletedTotlaPrice=0;
		$selectedItem.each(function(){
			
			var $this = $(this);
			productHtml +='<tr>';
			productHtml +='<td>'+$this.data("content_cd")+'</td>';
			productHtml +='<td> '+$this.data("content_name")+'</td>';
			productHtml +='<td> '+$this.data("cp_name")+'</td>';
			productHtml +='<td>'+$this.data("content_price")+'</td>';
			productHtml +='&nbsp;<img class="remove-product" src="/pcms/img/remove.png" alt="x"/>';
			productHtml +='</td>';
			productHtml +='</tr>';
			
			seletedTotlaPrice += $this.data("content_price");
		});
		productHtml += '</tbody>';
		
		$insertPlace.append(productHtml);
		$("#sale_price").val(seletedTotlaPrice);
	};
	
	
	
	function searchSeriesCallBack(response, param){
		var $seriesModal = $("#series-modal");
		var $insertPlace = $("#findSeriesBody");
		
		$insertPlace.empty(); //성공시 리스트 초기화
		
		if(response.resultCnt > 0) {
			var $json = response.result;
			$.each($json, function(){
				$html = 	'<tr>';
				$html += 	'<td><input class="check-product" name="check_list" type="checkbox" data-content_name="' + this.series_name 
								+ '" data-content_cd="'+this.series_mgmtno
								+ '" data-content_price="'+this.series_price
								+ '" value="' + this.series_mgmtno 
								+ '"></td>';
				$html += 	'<td>' + this.series_name + '</td>';
				$html += 	'<td>' + this.series_price + '</td>';
				$html += 	'</tr>';
				$insertPlace.append( $html );
				
			});

			$("#series-modal").modal('toggle');
		}
		$seriesModal.show();
	}
	function searchSeriesError(response, param){
		console.info(data);
	}
	
	function checkMulti() {
		var saleType = $("#product_sale_type").find("option").filter(":selected").val(); 
		
		//개별판매인가(체크박스 갯수를 세야하는가?)
		if( saleType == 'CT002001' ){
			
			var $selectedItem = $(".check-product").filter(":checked");
			
			$( "input[name=checkbox_all]" ).hide();
		
			if($selectedItem.size() > 1){
				$(this).prop("checked", false);
				bootbox.alert("판매형식이 개별판매 일때에는 다수 선택이 불가 합니다.");
				return false;
			}
			else{
				return true;
			}
		}else{
			return true;
		} 
	}
	

</script>