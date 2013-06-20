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
						<input class="inputError" type="text" id="payments" name="payments" class="input-medium" placeholder="지급대금 입력" value="${ saleContractDetail.payments }" data-validation-required-message="판매가는 필수이고 숫자여야 합니다." required>
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
				<label class="control-label" for=""><img src='<spring:eval expression="@urlProp['v']"/>'> 분납방식</label>
				<div class="controls installments-group">
					<div class="installments-date input-append date" data-date-format="yyyy-mm-dd">
					  <input class="span2" size="160px" type="text" value="" placeholder="분납일">
					  <span class="add-on"><i class="icon-calendar"></i></span>
					  <img id="addInstallments" src="/pcms/img/plus.png" alt="+"/>
					</div>
					<!-- 
					<div class="input-prepend bfh-datepicker-toggle" data-toggle="bfh-datepicker">
					    <span id="datepicker" class="add-on"><i class="icon-calendar"></i></span>
					    <input type="text" id="installments_dt" class="input-medium" data-date-format="yyyy-mm-dd" readonly>
					  </div>
					 -->
				</div>
			</div>
			<!-- 
			<div class="control-group">
				<label class="control-label" for=""><img src='<spring:eval expression="@urlProp['v']"/>'> 분납방식</label>
				<div class="controls installments-group" >
					<div>
							<input class="installments-date" id="installments-date" type="text" data-date-format="yyyy-mm-dd" style="width:100px"  name="installments_dt" placeholder="분납일" />
							<i class="installments-date icon-calendar"></i>
							<input type="text" id="installments" name="installments" placeholder="분납 금액" class="input-xlarge" />
							<img id="addInstallments" src="/pcms/img/plus.png" alt="+"/>
						</div>
				</div>
			
			</div>
			 -->
			
			<div class="control-group">
				<label class="control-label" ><img src='<spring:eval expression="@urlProp['v']"/>'> 계약기간 </label>
				<div class="controls">
					<input class="contract-date" id="str_date" type="text"  name="str_date" data-date-format="yyyy-mm-dd" value="${saleContractDetail.str_date }" data-validation-required-message="계약 시작일은 필수값 입니다." required> - 
					<input class="contract-date" id="end_date" type="text" name="end_date" data-date-format="yyyy-mm-dd" value="${saleContractDetail.end_date }" data-validation-required-message="계약 종료일은 필수값 입니다." required>
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
				<i class="icon-plus-sign"></i></label>
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
				<div class="controls">
							<c:choose>
								<c:when test="${viewType eq 1}">
							        <input type="hidden" id="hasContents" data-validation-required-message="콘텐츠는 필수값 입니다." required />
								</c:when>
								<c:otherwise>
							        <input type="hidden" id="hasContents" value="${fn:length(saleContractDetail.contentsList)}" data-validation-required-message="콘텐츠는 필수값 입니다." required />
								</c:otherwise>
							</c:choose>
						<table class="table table-condensed table-striped table-bordered table-content">
							<c:choose>
								<c:when test="${viewType eq 1}">
									<thead>
										<!-- ajax -->
									</thead>
									<tbody>
										<!-- ajax -->
									</tbody>
								</c:when>
								<c:otherwise>
									<thead>
										<tr>
											<th>콘텐츠명</th>
											<th>가격</th>
										</tr>
									</thead>
									<tbody>
											<c:forEach items="${ saleContractDetail.contentsList }" var="contentList">
												<tr>
													<td>${contentList.name }</td>
													<td>${contentList.sale_price }</td>
												</tr>
											</c:forEach>
									</tbody>
								</c:otherwise>
							</c:choose>
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
							<p class="help-block"></p>
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

var seletedTotlaPrice = 0;
$(function(){
	
	// 분납 방식 달력
	 $( ".installments-date" ).datepicker({
		 autoclose: true
	 });
	
	
	
	// 분납 방식 추가 버튼
	$("#addInstallments")
		.hover(function(){
			$(this).css("cursor", "pointer");
		})
		.click(function(){
			//최대 5명 까지 가능
			if( 5 == $("input[name='installments']").size() ) {
				bootbox.alert("최대 5명까지 입력 하실 수 있습니다.");
				return false;
			}
			//추가될 공간
			var $target = $("div.installments-group");
			//추가될 HTML
			var html =  '<div class="installments-date input-append date"  data-date-format="yyyy-mm-dd">';
				html += '<input class="span2" size="160px" type="text" value="" placeholder="분납일"> ';	
				html += '<span class="add-on"><i class="icon-calendar"></i></span>';	
				html += '<img class="removePd" src="/pcms/img/remove.png" alt="x"/>';	
				html += '</div>';
			
			$target.append(html);
			$( ".installments-date" ).datepicker({
				 autoclose: true
			 });
		});
	
	// 분납 방식 X 아이콘 이벤트
	$("div.installments-group").on("click", ".removePd", function(event){
		  $(this).parent().remove();
	});
	
	
	// 가격 구분바 표시
	$('#sale_price').autoNumeric('init',{aPad: false });
	$('#payments').autoNumeric('init',{aPad: false });
	
	// payments_type 이벤트
	
	$("#currency-menu").find("a").click(function(){
		$("#currency-toggle span" ).first().text( $(this).text() );
		$("#currency").val($(this).text());
		
	});
	
	// submit validation
	{
	    $("input,textarea").not("[type=submit]").jqBootstrapValidation();
	    
	    $("#btn-modify").click(function(){
	    	bootbox.confirm( "수정 하시겠습니까?", function(result) {
				if( result ){
					// 구분자 제거
					$('#sale_price').val($('#sale_price').autoNumeric('get'));
					$('#payments').val($('#payments').autoNumeric('get'));
					$("#registeForm" ).submit();
				}
			}); 
	    });
	    
	    $("#btn-registe").click(function(){
	    	bootbox.confirm( "등록 하시겠습니까?", function(result) {
				if( result ){
					// 구분자 제거
					$('#sale_price').val($('#sale_price').autoNumeric('get'));
					$('#payments').val($('#payments').autoNumeric('get'));
					$("#registeForm" ).submit();
				}
			}); 
		});
	}
	
	//목록으로 돌아가기
	{
		$("#btn-list").click(function(){
			bootbox.confirm( "목록으로 돌아가시겠습니까?", function(result) {
				if( result ) {
					window.location.href = '/pcms/saleCompany/contract/list.do';
				}
			}); 			
		});
	}
	
	// 계약 시작일, 종료일 계산위해
	var sdate, edate;

	$( "input.contract-date" ).datepicker()
		.on('changeDate', function(ev){
			if( "str_date" === $(this).attr("name") ) {
				sdate = ev.date.valueOf();
			} else {
				edate = ev.date.valueOf();
				if( sdate > edate ) {
					bootbox.alert( "계약종료일 재설정" );
					$( this ).val( "" );
				}
				$( "input[name=str_date]" ).datepicker( "hide" );
			}
		})
		.on('show', function(ev){
			// 2개의 달력을 동시에 안보이게 함.
			if( "str_date" === $(this).attr("name") ) {
				$( "input[name=end_date]" ).datepicker( "hide" );
			} else {
				$( "input[name=str_date]" ).datepicker( "hide" );
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
	
	{ // 판매 형태 등록
		$form = $("#device-list");
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
						$("#hasContents").val("has");
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
						$("#hasContents").val("has");
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
							seletedTotlaPrice = 0;	
							$target.find("thead").append("<tr><th>시리즈명</th><th>가격</th></tr>");
							$selectedItem.each(function(){
								var $this = $(this);
								$target.find("tbody").append("<tr><td>" + $this.data("series_name") + "</td><td>" + $this.data("series_price") + "</td></tr>");
								seletedTotlaPrice += $this.data("series_price");
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
							seletedTotlaPrice = 0;	
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