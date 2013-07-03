<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>

<style>
div#sale-content-list {
	height : 200px;
	overflow-y : scroll; 
}
</style>	
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
		<form id="registeForm" class="form-horizontal" method="POST" action='<spring:eval expression="@urlProp['saleCompanyContractCreateAction']"/>'>
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
						<input type="hidden" id="contract_mgmtno" name="contract_mgmtno" value="${saleContractDetail.contract_mgmtno}">
						${saleContractDetail.company_name}
					</c:otherwise>
				</c:choose>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="customer_license"><img src='<spring:eval expression="@urlProp['v']"/>'> 지급대금</label>
				<div class="controls">
					<div class="input-prepend">
						<div class="btn-group no-padding">
							<button id="currency-toggle" class="btn dropdown-toggle" data-toggle="dropdown">
									<span id="currency-view">KRW</span><span class="caret"></span>
							</button>
							<ul id="currency-menu" class="dropdown-menu">
								<li><a href="#">KRW</a></li>
								<li><a href="#">USD</a></li>
								<li><a href="#">JPY</a></li>
								<li><a href="#">CNY</a></li>
								<li><a href="#">EUR</a></li>
							</ul>
						</div>
						<input type="hidden" id="currency" name="currency" value="KRW">
						<input id="payments" class="input-medium payments price" type="text" name="payments" placeholder="지급대금 입력" value="${ saleContractDetail.payments }" data-validation-required-message="지급대금을 입력해 주세요." required />
					</div>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for=""><img src='<spring:eval expression="@urlProp['v']"/>'> 지급방식</label>
				<div class="controls">
					<select size="1" name="payments_type" id="payments_type" >
						<option value="일시지급" <c:if test="${saleContractDetail.payments_type eq '일시지급'}">selected="selected"</c:if>>일시지급</option>
						<option value="분납지급" <c:if test="${saleContractDetail.payments_type eq '분납지급'}">selected="selected"</c:if>>분납지급</option>
						<option value="기타방식" <c:if test="${saleContractDetail.payments_type eq '기타방식'}">selected="selected"</c:if>>기타방식</option>
					</select>
				</div>
			</div>
			<div class="control-group" id="installments-group" >
				<label class="control-label" for="payments">분납방식</label>
				<div class="controls">
						<c:choose>
							<c:when test="${saleContractDetail == null || fn:length(saleContractDetail.installmentList) == 0}">
								<div class="installments-date input-append date" data-date-format="yyyy-mm-dd">
								 	<input type="text"  name="installments_dt"  placeholder="분납입">
								 	<span class="add-on"><i class="icon-calendar"></i></span>
								</div>
							 	<input type="text" class="price" name="installments_price" placeholder="금액" >
								<img id="addInstallments" src="/pcms/img/plus.png" alt="+" style="cursor: pointer;"/>
							</c:when>
							<c:otherwise>
								<c:forEach items="${saleContractDetail.installmentList }" var="installment" varStatus="index">
									<c:choose>
										<c:when test="${not index.first }">
										<div style="margin-top : 5px;">
											<div class="installments-date input-append date" data-date-format="yyyy-mm-dd">
											 	<input type="text"  name="installments_dt"  value="${installment.installments_dt }" placeholder="분납입">
											 	<span class="add-on"><i class="icon-calendar"></i></span>
											</div>
										 	<input type="text" class="price" name="installments_price" placeholder="금액" value="${ installment.installments_price }">
											<img class="removePd" src="/pcms/img/remove.png" alt="x" style="cursor: pointer;"/>
										</div>
										</c:when>
										<c:otherwise>
											<div class="installments-date input-append date" data-date-format="yyyy-mm-dd">
											 	<input type="text"  name="installments_dt"  value="${installment.installments_dt }" placeholder="분납입">
											 	<span class="add-on"><i class="icon-calendar"></i></span>
											</div>
										 	<input type="text" class="price" name="installments_price" placeholder="금액" value="${ installment.installments_price }">
											<img id="addInstallments" src="/pcms/img/plus.png" alt="+" style="cursor: pointer;"/>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							
							</c:otherwise>
						</c:choose>
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
									<input class="btn-license" type="radio" name="license_cd" value="${license.cd }" 
									<c:if test="${index.count == 1 }"> checked </c:if>>
									${license.cd_detail }
								</label>
							</c:forEach>
							<div>
								<textarea class="clearfix span10" rows="4" id="license_cd_detail" name="license_cd_detail" placeholder="라이선스 상세정보 입력"  style="display:none;"></textarea>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${licenseList}" varStatus="index" var="license">
								<label class="radio inline">
									<input class="btn-license" type="radio" name="license_cd" value="${license.cd }" 
									<c:if test="${saleContractDetail.license_cd == license.cd}">checked</c:if>>
									${license.cd_detail }
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
			<div class="control-group" id="profit-group">
				<label class="control-label" ><img src='<spring:eval expression="@urlProp['v']"/>'> 판매처 수익률(%) </label>
				<div class="controls">
					<input type="text" id="sale_profit_rate" name="sale_profit_rate" placeholder="수익률" value="${ saleContractDetail.sale_profit_rate }" data-validation-required-message="수익률은 필수값 입니다." required>
				</div>
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
												<option value="${device.cd}" >${device.cd_detail}</option>
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
							<c:forEach items="${ saleContractDetail.contractedDeviceList }" var="contractedDeviceList" varStatus="index">
								<div class="row-fluid">
									<div>
										<div class="span3">							
											<select size="1" name="device_cd_list">
												<c:forEach items="${ deviceList }" var="device">
													<option value="${device.cd}" <c:if test="${contractedDeviceList eq device.cd}">selected="selected"</c:if> >${device.cd_detail}</option>
												</c:forEach>
											</select>
										</div>
										<c:choose>
											<c:when test="${not index.first }">
												<div class="span2 device-remove-icon">
													<img class="removePd" src="/pcms/img/remove.png" alt="x"/>
												</div>
											</c:when>
											<c:otherwise>
												<div class="span2 device-add-icon">
													<img id="addDeviceType" src="/pcms/img/plus.png" alt="+"/>
												</div>
											</c:otherwise>
										</c:choose>
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
							<option <c:if test="${contractType.cd == saleContractDetail.contract_type}"> selected="selected"</c:if> value="${ contractType.cd }" >
								${ contractType.cd_detail }
							</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for=""><img src='<spring:eval expression="@urlProp['v']"/>'> 콘텐츠</label>
				<div class="controls">
					<button id="btn-series-create" type="button" class="btn">시리즈등록</button>
					<button id="btn-each-create" type="button" class="btn ">개별상품등록</button>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for=""></label>
				<div class="controls" id="sale-content-list" >
					
					<c:choose>
						<c:when test="${viewType eq 1}">
							<table id="product-content-tb" class="tbl" style="width:100%;" data-validation-required-message="판매상품은 필수 값입니다." required>
							</table>				
						</c:when>
						<c:otherwise>
							<table id="product-content-tb" class="tbl" style="width:100%;" data-validation-required-message="판매상품은 필수 값입니다." required>
									<c:forEach items="${contentList }" var="content">
									<tr>
										<td class="span3">${content.contents_cd }<input type="hidden" name="selectedContentsCd" value="${content.contents_cd }"></td>
										<td class="span4">${content.name}</td>
										<td class="span3">${content.company_name}</td>
										<td class="span1"><input class="price product_price" type="text" name="selectedContentsPrice" value="${content.sale_price}"></td>
										<td class="span2"><button type="button" class="btn btn-remove-product">삭제</button></td>	
									</tr>
									</c:forEach>
							</table>				
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for=""><img src='<spring:eval expression="@urlProp['v']"/>'> 판매가 결정</label>
				<div class="controls">
					<c:choose>
						<c:when test="${viewType eq 1}">
							<label class="radio inline">
								<input type="radio" id="etc_price_type" name="sale_price_type" value="0">
								기타 판매가격
							</label>
							<label class="radio inline">
								<input type="radio" id="default_price_type" name="sale_price_type" value="1" checked>
								기본 판매가격
							</label>
							<input type="text" class="price" id="sale_price" name=sale_price placeholder="판매가 입력" data-validation-required-message="판매가는 필수값 입니다." required>
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
							<input type="text" class="price" id="sale_price" name="sale_price" placeholder="판매가 입력" value="${saleContractDetail.sale_price }" data-validation-required-message="판매가는 필수이고 숫자여야 합니다." required>
						</c:otherwise>
					</c:choose>					
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" ></label>
				<div class="controls">
					<button id="btn-list" type="button" class="btn btn-product-list">목록가기</button>
					<c:choose>
						<c:when test="${viewType eq 1 }">
							<button type="button" id="btn-registe" class="btn btn-primary">등록하기</button>
						</c:when>
						<c:otherwise>
							<button type="button" id="btn-delete" class="btn">삭제</button>
							<button type="button" id="btn-modify" class="btn btn-primary">수정하기</button>
						</c:otherwise>
					</c:choose>
					
				</div>
			</div>
			
		</form>
		
		<form id="deleteForm" action="<spring:eval expression="@urlProp['saleCompanyContractDeleteAction']"/>" method="post">
			<input type="hidden" name="contract_mgmtno" value="${saleContractDetail.contract_mgmtno}">
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
			<button id="btn-series-search-form" class="btn" type="button"><i class="icon-search"></i></button>
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
			<button id="btn-search-content-form" class="btn " type="button"><i class="icon-search"></i></button>
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

<!--판매형태(device) 추가 HTML -->
<div id="device-list" hidden="true">
	<div class="span3">
		<select size="1" name="device_cd_list">
			<c:forEach items="${ deviceList }" var="device">
				<option value="${device.cd}" >${device.cd_detail}</option>
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
	$(function(){
		
		// 금액에 콤마표시
		$("input.price").autoNumeric('init',{aPad: false });
		
		// 지급대금 통화 메뉴
		$("#currency-menu").find("a").click(function(){
			var selectedValue = $(this).text();
			$("#currency-toggle span").first().text(selectedValue);
			$('#currency').val(selectedValue);
		});
		
		// 계약기간
		var strDate, endDate;
		$("input.contract-date").datepicker({
				autoclose: true,
				format : 'yyyy-mm-dd'
			}).on('changeDate', function(ev){
				// 시작일 
				if( $(this).attr("name") === 'str_date') {
					strDate = ev.date.valueOf();
				}else{
					endDate = ev.date.valueOf();
				}
				
				// 시작일 종료일 체크
				if( strDate > endDate ) {
					bootbox.alert( "계약종료일 재설정" );
					$( this ).val( "" );
				}
			});
		
		// 분납 방식 추가 
		$("#addInstallments").click(function(){
			
			//최대 4개 까지 가능
			if( 4 == $("input[name='installments_dt']").size() ) {
				bootbox.alert("분납은 4번까지 입력 하실 수 있습니다.");
				return false;
			}
			//추가될 HTML
			var html  = '<div style="margin-top : 5px;">';
				html += '<div class="installments-date input-append date" data-date-format="yyyy-mm-dd">';
				html += '<input type="text" name="installments_dt" placeholder="분납일">';
				html += '<span class="add-on"><i class="icon-calendar"></i></span>';
				html += '</div>';
				html += '&nbsp;';
				html += '<input type="text" class="price" name="installments_price" placeholder="금액">';
				html += '&nbsp;';
				html += '<img class="removePd" src="/pcms/img/remove.png" alt="+" style="cursor: pointer;">';
				html += '</div>';
			
			$("#installments-group")
				.find(".controls")
					.append(html);
			
			$("input[name='installments_price']").autoNumeric('init',{aPad: false });
			
		});
		
		// 판매 형태 등록
		$("#addDeviceType").click(function(){
			$insertPlace = $("div.sale-device");
			$("#device-list").clone().show().appendTo( $insertPlace );
			minusIcontooltip();
		});
		
		// 시리즈 등록 버튼 이벤트
		// 시리즈 검색 버튼 이벤트
		$("#btn-series-create, #btn-series-search-form").click(function(){
			
			var searchQuery = $("#seriesQuery").val();
			if($(this).is("btn-series-create")){
				searchQuery = "";
			}
			var searchUrl = '<spring:eval expression="@urlProp['ajaxSaleCompanySeriesList']"/>';
			$.ajax({
				data:{ search : searchQuery },
				dataType: "json",
				url: searchUrl,
				success: function(response){
					
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
											+ '" data-cp_name="'+this.cp_name
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
					
					$(".check-product").attr('checked', false);
				}
			});
		});
		
		// 개별상품 검색 버튼 이벤트
		$("#btn-search-content-form").click(function(){
			var contentQuery = $("#contentQuery").val();
			$.ajax({
				dataType: "json",
				data : {search : contentQuery},
				url: '<spring:eval expression="@urlProp['ajaxSaleCompanyContentsList']"/>',
				success: function(data){
					
					var $target = $("#findEachBody");
					
					//init
					$target.html(""); //성공시 리스트 초기화
					
					if(data.resultCnt > 0) {
						var $json = data.result;
						$.each($json, function(){
							$html = 	'<tr>';
							$html += 	'<td><input class="check-product" name="check_list" type="checkbox" data-content_name="' + this.content_name 
										+ '" data-content_cd="'+this.content_cd
										+ '" data-content_price="'+this.content_price
										+ '" data-cp_name="'+this.cp_name
										+ '" value="' + this.content_cd
										+ '"></td>';
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
		});
		
		// 개별상품등록 버튼 이벤트
		$("#btn-each-create").click(function(){
			
			$("#contentQuery").val("");	
			
			var searchUrl = '<spring:eval expression="@urlProp['ajaxSaleCompanyCateList']"/>';
			
			$.ajax({
				dataType: "json",
				url: searchUrl,
				success: function(data){
					
					var $target = $("#product-modal").find("select[name='category']");

					//init
					$target.html(""); //성공시 리스트 초기화
					
					if(data.resultCnt > 0) {
						
						var $json = data.result;
						$.each($json, function(){
							$target.append( '<option value="' + this.cate_id + '">' + this.cate_name + '</option>' );
						});
					}
					
					categoryChange();
				}
			});
			$("#product-modal").modal('toggle');
			// 상품 선택 초기화
			$(".check-product").attr('checked', false);
			
			
		});
		
		// 시리즈 등록하기 버튼 이벤트
		$("#btn-series-select").click(function(){
			if (checkMulti()) {
				var $selectedItem = $(".check-product").filter(":checked");
				if( $selectedItem.size() == 0 ){
					bootbox.alert("1개 이상 선택해 주세요!");				
					return false;		
				}
				productTable($selectedItem);
				//close modal
				$("#series-modal").modal('toggle');
			}
		});
		
		// 개별상품 등록하기 버튼 이벤트
		$("#btn-each-select").click(function(){
			if (checkMulti()) {
				var $selectedItem = $(".check-product").filter(":checked");
				if( $selectedItem.size() == 0 ){
					bootbox.alert("1개 이상 선택해 주세요!");				
					return false;				
				}
				productTable($selectedItem);
				//close modal
				$("#product-modal").modal('toggle');
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
			totalPriceCalc();
		});
		// 상품 선택 체크
		$("body").delegate('.check-product', 'click', function(event){
			checkMulti();
		});
		// 상품 가격 변동시 총 판매 가격 변경
		$("body").delegate('.product_price', 'change', function(event){
			totalPriceCalc();
			$("#etc_price_type").attr("checked", true);
			$("#default_price_type").attr("checked", false);
		});
		// 분납 방식 달력
		$("body").delegate("div.installments-date", 'focus', function(event){
			$(this).datepicker({autoclose: true});
		});
		
		
		// 판매 상품 삭제 버튼 이벤트
		$("body").delegate("button.btn-remove-product", "click", function(){
			var $this = $(this);
			$this.parent().parent().remove();
			//재계산
			 totalPriceCalc();
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
		
		
		
		// 판매계약 등록시 가격에 , 표시 제거
		$("#registeForm").submit(function(){
			$("input.price").each(function(){
				$(this).val( $(this).autoNumeric('get') );
			});
		});
		
		// 등록 버튼 클릭
		$("#btn-registe").click(function(){
			$("input,textarea").not("[type=submit]").jqBootstrapValidation();
			 bootbox.confirm( "등록 하시겠습니까?", function(result) {
				if( result ) {
					$("#registeForm").submit();
				}
			}); 
		});
		
		// 수정 하기 버튼 클릭
		$("#btn-modify").click(function(){
			$("input,textarea").not("[type=submit]").jqBootstrapValidation();
			 bootbox.confirm( "수정 하시겠습니까?", function(result) {
				if( result ) {
					$( "#registeForm" )
					.attr("action", '<spring:eval expression="@urlProp['saleCompanyContractModifyAction']"/>')
					.submit();
				}
			});  
	    });
		
		
		$("#btn-list").click(function(){
			bootbox.confirm( "화면에서 빠져 나가시겠습니까?", function(result) {
				if( result ) {
					window.location.href = "<spring:eval expression="@urlProp['saleCompanyContractList']"/>";
				}
			});
		});
		
		$("#btn-delete").click(function(){
			bootbox.confirm( "삭제하시겠습니까?", function(result) {
				if( result ){
					$("#deleteForm").submit();
				};
			})
		});
		
		
	}); //init function
	
	function totalPriceCalc(){
		var seletedTotlaPrice=0;
		$.each($(".product_price"), function(){
			seletedTotlaPrice = parseInt(seletedTotlaPrice)+parseInt($(this).val().replace(/,/gi, ''));
		});
		$("#sale_price").val(seletedTotlaPrice);
		$('#sale_price').autoNumeric('init',{aPad: false });
		$('#sale_price').autoNumeric('update',{aPad: false });
	}
	
	/* function plusIcontooltip(){
		$("i.icon-plus-sign").tooltip({"title":"추가", "placement":"top" });
	}
	
	function minusIcontooltip(){
		$("i.icon-remove-sign").tooltip( { "title":"삭제", "placement":"right" } );
	} */
	
	function categoryChange(){
		$( "select[name='category']" ).change(function () {
			var select_id = $(this).find("option").filter(":selected").val();
			if( null != select_id ){
			 
				var $target = $( "select[name='series']" );
				$target.find( "option" ).remove();
				$.getJSON('<spring:eval expression="@urlProp['ajaxSaleCompanySeriesList']"/>',
					{ cate_id : select_id },
					function(data) {
						if( data.resultCnt > 0 ){
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
											+ ' data-cp_name="'+ this.cp_name + '"'
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
	
	
	function productTable($selectedItem){
		var $insertPlace = $("#product-content-tb");
		var productHtml;
		var seletedTotlaPrice=0;
		
		$insertPlace.empty();
		
		
		$selectedItem.each(function(){
			
			var $this = $(this);
			productHtml +='<tr>';
			productHtml +='<td class="span3">'+$this.data("content_cd")+'<input type="hidden" name="selectedContentsCd" value="'+$this.data("content_cd")+'"></td>';
			productHtml +='<td class="span4"> '+$this.data("content_name")+'</td>';
			productHtml +='<td class="span3"> '+$this.data("cp_name")+'</td>';
			productHtml +='<td class="span1"><input type="text" class="price product_price" name="selectedContentsPrice" value="'+$this.data("content_price")+'"></td>';
			productHtml +='<td class="span2"><button type="button" class="btn btn-remove-product">삭제</button></td>';			
			productHtml +='</td>';
			productHtml +='</tr>';
			
			seletedTotlaPrice += $this.data("content_price");
		});
		
		$insertPlace.append(productHtml);
		$('.product_price').autoNumeric('init',{aPad: false });
		$('.product_price').autoNumeric('update',{aPad: false });
		
		totalPriceCalc();
		/* $("#sale_price").val(seletedTotlaPrice);
		$('#sale_price').autoNumeric('init',{aPad: false });
		$('#sale_price').autoNumeric('update',{aPad: false }); */
	};
	
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