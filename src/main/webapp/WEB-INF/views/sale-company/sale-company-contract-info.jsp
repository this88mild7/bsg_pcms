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
							<li><a href="#">CHW</a></li>
						</ul>
					</div>
					<div class="input-append">
						<input type="hidden" id="currency" name="currency" value="KRW">
						<input class="inputError input-medium" type="text" id="payments" name="payments" placeholder="지급대금 입력" value="${ saleContractDetail.payments }" data-validation-required-message="판매가는 필수이고 숫자여야 합니다." required>
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
						<option value="분납지급" <c:if test="${saleContractDetail.payments_type eq '분납지급'}">selected="selected"</c:if>>분납지급</option>
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
								<img id="addInstallments" src="/pcms/img/plus.png" alt="+"/>
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
							<label class="radio inline">
								<input type="radio" name="license_cd" value="1" checked>
								빅스타 소유
							</label>
							<label class="radio inline">
								<input type="radio" name="license_cd" value="2">
								에듀엔조이 소유
							</label>
							<label class="radio inline">
								<input type="radio" name="license_cd" value="3">
								플레이북스 소유
							</label>
							<label class="radio inline">
								<input type="radio" name="license_cd" value="4">
								공동 소유
							</label>
							<label class="radio inline">
								<input type="radio" name="license_cd" value="0">
								기타
							</label>
							<div>
								<textarea class="clearfix span10" rows="4" id="license_cd_detail" name="license_cd_detail" placeholder="라이선스 상세정보 입력" style="display:none;"></textarea>
							</div>
						</c:when>
						<c:otherwise>
							<label class="radio inline">
								<input type="radio" name="license_cd" value="1" <c:if test="${saleContractDetail.license_cd == 1}">checked</c:if>>
								빅스타 소유
							</label>
							<label class="radio inline">
								<input type="radio" name="license_cd" value="2" <c:if test="${saleContractDetail.license_cd == 2}">checked</c:if>>
								에듀엔조이 소유
							</label>
							<label class="radio inline">
								<input type="radio" name="license_cd" value="3" <c:if test="${saleContractDetail.license_cd == 3}">checked</c:if>>
								플레이북스 소유
							</label>
							<label class="radio inline">
								<input type="radio" name="license_cd" value="4" <c:if test="${saleContractDetail.license_cd == 4}">checked</c:if>>
								공동 소유
							</label>
							<label class="radio inline">
								<input type="radio" name="license_cd" value="0" <c:if test="${saleContractDetail.license_cd == 0}">checked</c:if>>
								기타
							</label>
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
				<label class="control-label" for="deviceType"><img src='<spring:eval expression="@urlProp['v']"/>'> 판매형태
				<img id="addInstallments" src="/pcms/img/plus.png" alt="+"/></label>
				<div class="controls customer-device" >
					<c:choose>
						<c:when test="${viewType eq 1}">
							<div class="row-fluid" >
								<div id="device-list">
									<div class="span3">
										<select size="1" name="device_cd_list">
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
						</c:when>
						<c:otherwise>
							<c:forEach items="${ saleContractDetail.contractedDeviceList }" var="contractedDeviceList">
								<div class="row-fluid">
									<div id="device-list">
										<div class="span3">							
											<select size="1" name="device_cd_list">
												<c:forEach items="${ deviceList }" var="device">
													<option value="${device}" <c:if test="${contractedDeviceList eq device}">selected="selected"</c:if>>${device}</option>
												</c:forEach>
											</select>
										</div>
										<div class="span2 device-remove-icon">
											<i class='icon-remove-sign'></i>
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
							<option <c:if test="${contractType.contract_type == saleContractDetail.contract_type}"> selected="selected"</c:if> value="${ contractType.contract_type }" >
								${ contractType.contract_type_detail }
							</option>
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
				<div class="controls" >
					<table id="product-content-tb" style="width:650px" class="table table-hover product-table">
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
		<button class="btn" data-dismiss="modal" aria-hidden="true">등록취소</button>
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
		<button class="btn" data-dismiss="modal" aria-hidden="true">목록가기</button>
		<button class="btn btn-primary btn-each-select">등록하기</button>
	</div>
</div>


<script>

	// 가격표시 객체
	{
		function BsgNumeric() {};
		BsgNumeric.prototype = {
			autoNumeric: function(target) {
				$(target).autoNumeric('init',{aPad: false });
	    	},
		};
		// 생성자 명시????????
		// BsgNumertic.prototype.construnctor = BsgNumertic;
	}
	
	// 메뉴 셀렉터
	{
		function MenuSelector() {};
		MenuSelector.prototype = {
			selectedValue : '',
			changeValue : function(menu, hiddenTarget, value) {
				this.selectedValue = value;
				$(menu).first().text(value);
				$(hiddenTarget).val(value);
				this.toString();
	    	},
	
	    	toString : function(){
	    		console.log(this.selectedValue);
	    	}
		};
		// 생성자 명시????????
		// BsgNumertic.prototype.construnctor = BsgNumertic;
	}
	
	// 달력 
	{
		function BsgCalendar() {};
		
		BsgCalendar.prototype = {
			
			calendar : '',
			
				
			call : function(target) {
				calendar = $(target).datepicker({
					autoclose: true,
					 format : 'yyyy-mm-dd'
				});
				return this;
	    	},
	    	
	    	checkStartEndDate : function(strDateName, ednDateName){
	    		
	    		var strDate, endDate;
	    		calendar.on('changeDate', function(ev){
	    			// 시작일 
	    			if( strDateName === $(this).attr("name") ) {
	    				strDate = ev.date.valueOf();
	    			}
	    			// 종료일
	    			if( ednDateName === $(this).attr("name") ) {
	    				endDate = ev.date.valueOf();
	    			}
	    			
	    			if( strDate > endDate ) {
    					bootbox.alert( "계약종료일 재설정" );
    					$( this ).val( "" );
    				}
	    		});
	    	}	
		};
	}
	
	


var seletedTotlaPrice = 0;
$(function(){
	
	var bsgNumeric = new BsgNumeric();
	var menuSelector = new MenuSelector();
	var bsgCalendar = new BsgCalendar();
	
	// 분납 방식 달력
	$("body").delegate('input[type=text].installments-date', 'focus', function(event){
		 $(this).datepicker({
			 autoclose: true,
			 format : 'yyyy-mm-dd'
		 });
	});
	
	// 분납 가격의 경우 추가 될수 있으면로 delegate 로 
	// 가격 구분 콤마 표시
	$("body").delegate('input[type=text].installments_price', 'focus', function(event){
		 bsgNumertic.autoNumeric($(this));
	});
	bsgNumeric.autoNumeric('#sale_price');
	bsgNumeric.autoNumeric('#payments');
	
	// 지급대금 통화 메뉴
	$("#currency-menu").find("a").click(function(){
		menuSelector.changeValue('#currency-toggle span', '#currency', $(this).text());
	});
	
	// 계약기간
	bsgCalendar.call("input.contract-date").checkStartEndDate("str_date", "end_date");
	
});
</script>