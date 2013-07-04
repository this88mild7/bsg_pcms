<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
div[class="tooltip-inner"] {
    max-width: 300px;
    text-align: left;
}
</style>
<div class="page-name">
	<h4>
		<c:choose>
			<c:when test="${empty isNew}">
				콘텐츠 계약관리
			</c:when>
			<c:otherwise>
				계약 등록 <small>&gt;&gt; 상세 계약 내역을 입력해 주세요.</small>
			</c:otherwise>
		</c:choose>
	</h4>
</div>

<div class="row-fluid contract-box" 
	data-company_mgmtno="${ contract.company_mgmtno }"
	data-publishing_type="${ publishing_type }"
	data-license_cd="${ contract.license_cd }"
	data-license_cd_detail="${ contract.license_cd_detail }"
	data-license_country="${ contract.license_country }"
	data-license_country_detail="${ contract.license_country_detail }"
	data-contract_type="${ contract.contract_type }"
	data-contract_type_detail="${ contract.contract_type_detail }"
	data-sale_price="${ contract.sale_price }"
	data-sale_price_detail="${ contract.sale_price_detail }"
	data-sale_price_currency="${ contract.sale_price_currency }"
	data-sale_profit_rate="${ contract.sale_profit_rate }"
	data-payments_type="${ contract.payments_type }"
	data-deposit_bank="${ contract.deposit_bank }"
	data-account_no="${ contract.account_no }"
	data-account_holder="${ contract.account_holder }"
	data-is_create="${ isCreate }"
	data-installments_empty="${ empty installmentsList }"
	>

	<div class="span12">
		
		<form id="contractForm" class="form-horizontal " method="POST" action="<spring:eval expression="@urlProp['contractCreateAction']"/>">
			<c:if test="${empty isCreate}">
				<input type="hidden" id="contract_mgmtno" name="contract_mgmtno" value="${ contract.contract_mgmtno }" />
			</c:if>
			<div class="control-group">
				<label class="control-label" for="company_mgmtno"><img src='<spring:eval expression="@urlProp['v']"/>'> CP업체</label>
				<div class="controls input-large">
					<select size="1" id="company_mgmtno" name="company_mgmtno" data-cnt="${ fn:length( cpList ) }">
						<c:forEach items="${cpList}" var="cp">
							<option value="${ cp.company_mgmtno }">${cp.company_name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="contents"><img src='<spring:eval expression="@urlProp['v']"/>'> 콘텐츠</label>
				<div class="controls">
					<span id="series_name" class="uneditable-input">${ series.series_name }</span>
					<input type="hidden" id="cate_id" name="cate_id" value="${ series.cate_id }">
					<input type="hidden" id="series_mgmtno" name="series_mgmtno" value="${ series.series_mgmtno }" 	>
					<button id="btn-find-content" class="btn">찾아보기</button>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="contract_count">구성권수</label>
				<div class="controls">
					<span id="series_cnt" class="uneditable-input">${ seriesCnt }</span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for=""></label>
				<div class="controls">
					<div class="clearfix row-fluid">
						<div class="text-center span2">책그림</div>
						<div class="text-center span2">E-BOOK</div>
						<div class="text-center span2">2D</div>
						<div class="text-center span2">3D</div>
						<div class="text-center span2">GAME</div>
					</div>
					<div class="clearfix row-fluid">
						<div class="span2">
							<select name="isPicturebook" class="span12" size="1">
								<option value="N">X</option>
								<option value="Y">O</option>
							</select>
						</div>
						<div class="span2">
							<select name="isEbook" class="span12" size="1">
								<option value="N">X</option>
								<option value="Y">O</option>
							</select>
						</div>
						<div class="span2">
							<select name="is2d" class="span12" size="1">
								<option value="N">X</option>
								<option value="Y">O</option>
							</select>
						</div>
						<div class="span2">
							<select name="is3d" class="span12" size="1">
								<option value="N">X</option>
								<option value="Y">O</option>
							</select>
						</div>
						<div class="span2">
							<select name="isGame" class="span12" size="1">
								<option value="N">X</option>
								<option value="Y">O</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="contract_type"><img src='<spring:eval expression="@urlProp['v']"/>'> 계약방식</label>
				<div class="controls">
					<c:forEach items="${contractTypeList}" var="contractType" varStatus="status">
						<c:if test="${status.index < 3}">
							<c:choose>
								<c:when test="${status.first }">
									<label class="radio inline">
										<input type="radio" name="contract_type" value="${contractType.cd }" checked="checked">${contractType.cd_detail}
									</label>
								</c:when>
								<c:otherwise>
									<label class="radio inline">
										<input type="radio" name="contract_type" value="${contractType.cd }">${contractType.cd_detail}
									</label>
								</c:otherwise>
							</c:choose>
						</c:if>
					</c:forEach>
				</div>
			</div>

			<div class="page-name">
				<h4>
					상세정보 입력
				</h4>
			</div>

			
			<div class="control-group">
				<label class="control-label" for="license_cd"><img src='<spring:eval expression="@urlProp['v']"/>'> 라이선스</label>
				<div class="controls">
					<c:forEach items="${licenseList}" var="license" varStatus="status">
						<c:choose>
							<c:when test="${status.first }">
							<label class="radio inline">
								<input type="radio" name="license_cd" value="${license.cd }" checked="checked">${license.cd_detail}
							</label>
							</c:when>
							<c:otherwise>
							<label class="radio inline">
								<input type="radio" name="license_cd" value="${license.cd }">${license.cd_detail}
							</label>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<textarea class="clearfix span10" rows="4" id="license_cd_detail" name="license_cd_detail" placeholder="라이선스 상세정보 입력" style="display:none;">${ contract.license_cd_detail }</textarea>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="license_country"><img src='<spring:eval expression="@urlProp['v']"/>'> 라이선스 유효국가</label>
				<div class="controls">
					<label class="radio inline">
						<input type="radio" name="license_country" value="1" checked="checked">
						제한없음
					</label>
					<label class="radio inline">
						<input type="radio" name="license_country" value="0">기타
					</label>
					<br />
					<textarea class="span10" rows="4" id="license_country_detail" name="license_country_detail" placeholder="라이선스 유효국가 상세정보 입력" style="display:none;">${ contract.license_country_detail }</textarea>
				</div>
			</div>
			<div class="control-group"id="payments-parent" >
				<label class="control-label" for="payments_type"><img src='<spring:eval expression="@urlProp['v']"/>'> <span id="payments_type_text"></span></label>
				<div class="controls">
					<!-- 
					계약방식에 의해 변경됨.
					 -->
				</div>
			</div>
			<div class="control-group" id="payments-children" style="display:none" >
				<label class="control-label" for="payments"><img src='<spring:eval expression="@urlProp['v']"/>'> <span>분납방법</span></label>
				<div class="controls">
					<!-- 
					입금방식에 의해 변경됨.
					 -->
					<c:forEach items="${installmentsList}" var="installments" varStatus="status">
						<c:if test="${status.first }">
							<div class="installments-date input-append date" data-date-format="yyyy-mm-dd">
							<input type="text" name="installments_dt" placeholder="분납일" value="${ installments.installments_dt }">
							<span class="add-on"><i class="icon-calendar"></i></span>
							</div>
							<input type="text" name="installments_price" placeholder="금액" value="${ installments.installments_price }">
							<img id="addInstallments" src="/pcms/img/plus.png" alt="+" style="cursor: pointer;">
						</c:if>
						<c:if test="${not status.first }">
							<div style="margin-top : 5px;">
								<div class="installments-date input-append date" data-date-format="yyyy-mm-dd">
								<input type="text" name="installments_dt" placeholder="분납일" value="${ installments.installments_dt }">
								<span class="add-on"><i class="icon-calendar"></i></span>
								</div>
								<input type="text" name="installments_price" placeholder="금액" value="${ installments.installments_price }">
								<img class="removeInstallments" src="/pcms/img/remove.png" alt="+" style="cursor: pointer;">
							</div>
						</c:if>
					</c:forEach>	
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="sale_price"><img src='<spring:eval expression="@urlProp['v']"/>'> <span id="price_text"></span></label>
				<div class="controls">
					<div class="input-prepend">
						<div class="btn-group no-padding">
							<button class="btn dropdown-toggle" data-toggle="dropdown">
								<span id="currency-view">KRW</span><span class="caret"></span>
							</button>
							<ul class="dropdown-menu" id="currency-menu">
								<li><a href="#">KRW</a></li>
								<li><a href="#">USD</a></li>
								<li><a href="#">JPY</a></li>
								<li><a href="#">CNY</a></li>
								<li><a href="#">EUR</a></li>
							</ul>
						</div>
						<input type="hidden" id="currency" name="sale_price_currency" value="${ contract.sale_price_currency }">
						<input type="text" id="sale_price" name="sale_price" placeholder="판매단가" value="${ contract.sale_price }" required>
					</div>
					<a id="sale_price_tip" href="#" data-toggle="tooltip" >tip</a>
				</div>
			</div>
			<div class="control-group" id="profit-group">
				<label class="control-label" ><img src='<spring:eval expression="@urlProp['v']"/>'> 수익률(%) </label>
				<div class="controls">
					<input type="text" id="sale_profit_rate" name="sale_profit_rate" placeholder="수익률" value="${ contract.sale_profit_rate }" required>
					<a id="sale_profit_rate_tip" href="#" data-toggle="tooltip" >tip</a>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" ><img src='<spring:eval expression="@urlProp['v']"/>'> 계약기간 </label>
				<div class="controls">
					<input class="datepicker" type="text" name="str_date" data-date-format="yyyy-mm-dd" value="${ contract.str_date }" placeholder="시작일"> - 
					<input class="datepicker" type="text" name="end_date" data-date-format="yyyy-mm-dd" value="${ contract.end_date }" placeholder="종료일">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="fileData">계약서 등록</label>
				<div class="controls">
				
					<input id="fileData" name="fileData" type="file" style="display:none" value="">
					<div class="input-append">
					   <input id="fileName" class="input-large" type="text" value="">
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
				<label class="control-label" for="inputEmail">특이사항</label>
				<div class="controls">
					<textarea class="span10" rows="4" id="etc" name="etc" placeholder="특이사항입력">${ contract.etc }</textarea>
				</div>
			</div>
			<div class="control-group" id="bank">
				<label class="control-label" for="contract_bankname">입금은행</label>
				<div class="controls">
					<select name="deposit_bank" >
						<c:forEach items="${bankList}" var="bank" varStatus="status">
							<c:if test="${status.first }"><option value="0">${ bank.bank_name }</option></c:if>
    						<c:if test="${not status.first }"><option value="${ bank.bank_name }">${ bank.bank_name }</option></c:if>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group account-group" style="display:none;">
				<label class="control-label" for="account_holder">예금주</label>
				<div class="controls">
					<input type="text" id="account_holder" name="account_holder" placeholder="예금주" value="${ contract.account_holder }">
				</div>
			</div>
			<div class="control-group account-group" style="display:none;">
				<label class="control-label" for="account_no">계좌번호</label>
				<div class="controls">
					<input type="text" id="account_no" name="account_no" placeholder="계좌번호" value="${ contract.account_no }">
				</div>
			</div>
			
		</form>

			<div class="control-group">
				<label class="control-label" ></label>
				<div class="controls">
					<button id="btn-contract-list" class="btn">목록가기</button>
					<c:choose>
						<c:when test="${empty isCreate}">
							<button id="btn-contract-delete-action" class="btn">삭제</button>
							<button id="btn-contract-update-action" class="btn btn-primary">수정하기</button>
						</c:when>
						<c:otherwise>
							<button id="btn-contract-create-action" class="btn btn-primary">등록하기</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

	</div>
	
</div>
<!--/row-->

<div id="findContent" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3></h3>
	</div>
	<div class="modal-body">
		<table class="table table-striped table-hover">
			<thead>
			<tr>
				<th>콘텐츠명</th>
			</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">취소</button>
		<button id="btn-select-series" class="btn btn-primary">선택하기</button>
	</div>
</div>
<script>
$(function(){
		
	var boxData = $("div.contract-box").data();
	console.info(boxData);
	
	{//엘리먼트 이벤트
		
		$('#sale_price').autoNumeric('init',{aPad: false });
		
		$("#contractForm").submit(function(){
			
			
			//금액 콤마 제거	(숫자만 가져옴)		
			$('#sale_price').val($('#sale_price').autoNumeric('get'));
			
			//입금|지불 방식이 분납방식일 때에만 금액 콤마 제거(숫자만 가져옴)
			if( $("#payments_type").val() == "installments" ) {
				$("input[name='installments_price']").each(function(){
					$(this).val( $(this).autoNumeric('get') );
				});
				
			}
			
			//은행 선택안함 일시 예금주|계좌번호 초기화
			if( $("select[name='deposit_bank']").val() == 0 ) {
				$("div.account-group").find("input").remove();
			}
			
		});
		
		//환율 변경
		$("#currency-menu").find("a").click(function(){
			var nowCurrency = $(this).text();
			$("#currency-view").text(nowCurrency);
			$("#currency").val(nowCurrency);
			
		});		
		
		$("input[name='license_cd']").change(function(){
			var $licenseCdDetail = $("#license_cd_detail");
			if( $(this).val() == "LS001999" ){
				$licenseCdDetail.show();
			} else {
				$licenseCdDetail.hide().val("");
			}
		});
	
		$("input[name='payments_type']").change(function(){
			var $paymentsChildren = $("#payments-children");
			
			if($(this).val() == 'etc' ){
				$paymentsChildren.show();
			} else {
				$paymentsChildren.hide().val("");
			}
		});
		
		//계약 시작일, 종료일 계산위해
		var sdate, edate;
		$( "input.datepicker" ).datepicker()
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
		
		// 은행 체크
		$("select[name='deposit_bank']").change(function(){
			var $this = $(this);
			if($this.val() == 0) {
				$("div.account-group").hide();
			} else {
				$("div.account-group").show();
			}
		});
		
		$( "input[name='license_country']" ).change(function(){
			var $this = $(this);
			var $licenseCountryDetail = $("#license_country_detail");
			if( $this.val() == 0 ){
				$licenseCountryDetail.show();
			} else {
				$licenseCountryDetail.hide().val("");
			}
		});
		
	}//엘리먼트 이벤트
	
	
	{//BUTTON EVENT
		
		$("#btn-contract-list").click(function(){
			bootbox.confirm( "화면에서 빠져 나가시겠습니까?", function(result) {
				if( result ) {
					window.location.href = "<spring:eval expression="@urlProp['contractList']"/>";
				}
			}); 
		});
		
		$("#btn-contract-delete-action").click(function(){
			bootbox.confirm( "삭제하시겠습니까?", function(result) {
				if( result ) {
					window.location.href = "<spring:eval expression="@urlProp['contractDeleteAction']"/>?strList=" + ${ contract.contract_mgmtno } + "";
				}
			}); 
		});
		
		$("#btn-contract-update-action").click(function(){
			bootbox.confirm( "업데이트 하시겠습니까?", function(result) {
				if( result ) {
					$("#contractForm")
						.attr("action", '<spring:eval expression="@urlProp['contractUpdateAction']"/>')
						.submit();
				}
			}); 
		});
		
		$("#btn-contract-create-action").click(function(){
			bootbox.confirm( "등록 하시겠습니까?", function(result) {
				if( result ) {
					$( "#contractForm" ).submit();
				}
			}); 
		});
		
		// 찾아보기 버튼 눌렀을때 시리즈 목록 MODAL로 가져오기
		$("#btn-find-content").click(function(){
			$selectedCp = $("#company_mgmtno").find("option").filter(":selected");
			
			$.getJSON('<spring:eval expression="@urlProp['seriesAjaxListByCpMgmtno']"/>', { company_mgmtno : $selectedCp.val() }, function(data) {
				console.info( data );
				
				$("#findContent tbody").remove();
				
				if( data.resultCnt > 0 ){
					$.each( data.result, function(){
						$html = 	'<tr><td>';
						$html += 	'<label class="radio">';
						$html += 	'<input name="series" type="radio" data-series_name="' + this.series_name + '" data-cate_id="' + this.cate_id + '" data-tot-cnt="' + this.totCnt + '" value="' + this.series_mgmtno + '">';
						$html += 	this.series_name + '';
						$html += 	'</label>';
						$html += 	'</td></tr>';
						
						$("#findContent")
							.find("table").append( $html );
						
					} );
					
					$('#findContent')
						.find( "h3" ).text("[" + $selectedCp.text() + "] 카테고리 목록" )
						.end()
						.modal('toggle');
				} else {
					bootbox.alert( "카테고리 없음" );
				}
					  
			});
			
			return false;
		});
		
		//시리즈 목록에서 시리즈 선택했을때
		$("#btn-select-series")
			.click(function() {
				var $selectedSeries = $("input[name='series']").filter(":checked");
				console.info( $selectedSeries );
				//시리즈 값 셋팅
				$("#series_name").text( $selectedSeries.data("series_name") );
				$("#cate_id").val( $selectedSeries.data("cate_id") );
				$("#series_mgmtno").val( $selectedSeries.val() );
				$("#series_cnt").text( $selectedSeries.data("totCnt") );
				
				$('#findContent').modal('toggle');
			});

	};//BUTTON EVENT
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//계약방식에 따른 UI변경
	$("input[name='contract_type']").change(function(){
		
		var contractType = $(this).val();
		console.info("계약방식 : " + contractType);
		if(contractType == "CT001001") {
			//si 셀렉트 셋팅
			$("#price_text").text("계약대금");
			$("#payments_type_text").text("입금방식");
			$("#bank").show();
			$("#profit-group").show();
			
			setSiSelect();
			$("#sale_profit_rate").autoNumeric('init',{
				aPad: false,
				vMax:'100'
				});
			
		} else if(contractType == "CT001002") {
			
			//license 셀렉트 셋팅
			$("#price_text").text("지급대금");
			$("#payments_type_text").text("지급방식");
			$("#bank").hide();
			$("#profit-group").show();
			
			setLicenseSelect();
			$("#sale_profit_rate").autoNumeric('init',{
				aPad: false,
				vMax:'100'
				});
			
		} else if(contractType == "CT001003"){
			//협력 셀렉트 셋팅
			$("#price_text").text("판매가");
			$("#payments_type_text").text("수익쉐어");
			$("#bank").show();
			$("#profit-group").hide();
			
			setCollboSelect();
		} else if(contractType == "CT001004"){
			$("#price_text").text("계약대금");
			$("#payments_type_text").text("외주");
			//외주 코드 생성 예정 
			setOutsiderSelect();
		}
	}).first().trigger("change");
	
		function setSiSelect(){
			var $paymentsParent = $("#payments-parent");
			var html  = '<select size="1" id="payments_type" name="payments_type">'; 
				html += '<option value="lump_sum" >일시불</option>';
				html += '<option value="installments">분납</option>';
				html += '<option value="etc">기타</option>';
				html += '</select>';
			$paymentsParent
				.find(".controls")
					.text("")
					.append(html);
			$("#payments-children").hide();
		}
		
	
			$("#payments-parent").on("change", "#payments_type", function(){
				var value = $(this).val();
				var $paymentsChildren = $("#payments-children");
				if(value == "lump_sum") {
					//일시불
					$paymentsChildren.hide();
				} else if(value == "installments") {
					//분납
					if(boxData.installments_empty) {
						var html  = '<div class="installments-date input-append date" data-date-format="yyyy-mm-dd">';
							html += '<input type="text" name="installments_dt" placeholder="분납일">';
							html += '<span class="add-on"><i class="icon-calendar"></i></span>';
							html += '</div>';
							html += '&nbsp;';
							html += '<input type="text" name="installments_price" placeholder="금액">';
							html += '&nbsp;';
							html += '<img id="addInstallments" src="/pcms/img/plus.png" alt="+" style="cursor: pointer;">';
						
							$paymentsChildren
								.find(".controls")
									.text("")
									.append(html);
					}
					$paymentsChildren.show();
					
					$(".installments-date").datepicker({autoclose: true});
					$("input[name='installments_price']").autoNumeric('init',{aPad: false });
					
				} else {
					//기타
					var html = '<textarea class="span10" rows="4" id="sale_price_detail" name="sale_price_detail" placeholder="상세정보입력"></textarea>';
					$paymentsChildren
						.find(".controls")
							.text("")
							.append(html)
							.end()
						.show();
				}
			});
			
			//분납 추가 버튼
			$("body").on("click", "#addInstallments", function(){
				
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
					html += '<input type="text" name="installments_price" placeholder="금액">';
					html += '&nbsp;';
					html += '<img class="removeInstallments" src="/pcms/img/remove.png" alt="+" style="cursor: pointer;">';
					html += '</div>';
				
				$("#payments-children")
					.find(".controls")
						.append(html);
				
				$(".installments-date").datepicker({autoclose: true});
				$("input[name='installments_price']").autoNumeric('init',{aPad: false });
			});
			//분납 삭제 버튼
			$("body").on("click", "img.removeInstallments", function(){
				$(this).parent().remove();
			});
			
		function setLicenseSelect(){
			var $paymentsParent = $("#payments-parent");
			var html  = '<select size="1" id="payments_type" name="payments_type">'; 
				html += '<option value="installments">분납</option>';
				html += '<option value="etc">기타</option>';
				html += '</select>';
			$paymentsParent
				.find(".controls")
					.text("")
					.append(html);
			
			$("#payments_type").trigger("change");
		}
		
		function setCollboSelect(){
			var $paymentsParent = $("#payments-parent");
			var html  = '<div class="input-prepend">'; 
				html += '<div class="btn-group no-padding">';
				html += '<button class="btn dropdown-toggle" data-toggle="dropdown">';
				html += '<span id="payments_type_view">%</span><span class="caret"></span>';
				html += '</button>';
				html += '<ul class="dropdown-menu" id="payments_type_list">';
				html += '<li><a href="#" data-type="percent">%</a></li>';
				html += '<li><a href="#" data-type="ratio">비율</a></li>';
				html += '</ul>';
				html += '</div>';
				html += '<input type="hidden" id="payments_type" name="payments_type" value="percent">';
				html += '<input type="text" id="sale_profit_rate" name="sale_profit_rate" placeholder="수익쉐어" >';
				html += '</div>';
				html += '<a id="payments_tip" href="#" data-toggle="tooltip" >tip</a>';
			$paymentsParent
				.find(".controls")
					.text("")
					.append(html);
			
			$('#payments_tip')
			.tooltip({
				"title":"%, 비율에 따라 금액이 달라지니 주의해 주십시오. 입력값(0~100)",
				"placement":"bottom"
			});
			
			$("#payments-children").hide();
			$("#sale_profit_rate").autoNumeric('init',{
				aPad: false,
				vMax:'100'
				});
			
		}
		
			$("body").on("click", "#payments_type_list a", function(){
				var nowPaymentType = $(this).text();
				$("#payments_type_view").text(nowPaymentType);
				$("#payments_type").val($(this).data("type"));
			});
		
		function setOutsiderSelect(){
			var $paymentsParent = $("#payments-parent");
			//외주 코드 작성 예정
			var html  = '개발예정'; 
			$paymentsParent
				.find(".controls")
					.text("")
					.append(html);
			$("#payments-children").hide();
		}
	//계약방식에 따른 UI변경
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	{//상세보기 기존 값 체크 시작
		if(boxData.is_create != 1) {
			
			//CP업체 셋팅
			$("#company_mgmtno")
				.find("option").filter(function(index){
					return $(this).val() == boxData.company_mgmtno;
				}).prop("selected", true);
		
			//출판 형태 셋팅
			$.each($(boxData.publishing_type.split(",")), function(index, value) {
				switch (value) {
					case 'pb': 		$("select[name='isPicturebook'] option[value='Y']").prop("selected", true); break;
					case 'ebook': 	$("select[name='isEbook'] option[value='Y']").prop("selected", true); break;
					case '2d': 		$("select[name='is2d'] option[value='Y']").prop("selected", true); break;
					case '3d': 		$("select[name='is3d'] option[value='Y']").prop("selected", true); break;
					case 'game': 	$("select[name='isGame'] option[value='Y']").prop("selected", true); break;
				}
			});
			
			// 계약 방식 체크
			$( "input[name='contract_type']" ).each(function(){
				var $this = $(this);
				if(boxData.contract_type == $this.val() ){
					$this.prop("checked", true).trigger("change");
					
					if(boxData.contract_type == "CT001001" || boxData.contract_type == "CT001002") {
						
						$("#payments_type")
							.find("option").filter(function(index){
								var $this = $(this);
								return boxData.payments_type == $this.val();
							}).prop("selected", true);
						
						$("#payments_type").trigger("change");
						
						if(boxData.payments_type == "lump_sum") {
							//do nothing
						} else if(boxData.payments_type == "installments") {
							//forEach로 분납필드 채워넣음.
						} else {
							//etc
							$("#sale_profit_rate").val(boxData.sale_profit_rate);
						}
						
					} else if(boxData.contract_type == "CT001003"){
						//페이먼트 타입에 따라 퍼센트 비율 바꾸고 값 채우기]
						$("#payments_type_list").find("a").each(function(){
							if( $(this).data("type") == boxData.payments_type ) {
								$("#payments_type_view").text( $(this).text() );
								console.info($(this).data("type"));
								$("#payments_type").val( $(this).data("type") );
							}
						});
						$("#sale_profit_rate").val(boxData.sale_profit_rate);
					} else {
						//
					}
					
				}
				
			});
			
			//라이센스 체크 
			$( "input[name='license_cd']" ).each(function(){
				if(boxData.license_cd == $(this).val() ) {
					$(this).prop("checked", true).trigger("change");
				}
			});
			
			//라이센스 국가 제한 체크
			$("input[name='license_country']").each(function(){
				if(boxData.license_country == $(this).val() ){
					$(this).prop("checked", true).trigger("change");
				}
			});
			
			//지급방식 체크 
			$( "input[name='payments_type']" ).each(function(){
				if(boxData.payments_type == $(this).val() ) {
					$(this).prop("checked", true).trigger("change");
				}
			});
			
			//은행 체크
			if( boxData.deposit_bank == 0 ) {
				$("div.account-group").hide();
			} else {
				$("select[name='deposit_bank']")
					.find("option").each(function(){
						var $this = $(this);
						if($this.val() == boxData.deposit_bank) {
							$this.prop("selected", true);
							$("div.account-group").show();
						}
					});
			}
		}
		
	}//상세보기 기존 값 체크 시작
	
	{ //툴팁
		$('#sale_profit_rate_tip')
			.tooltip({
				"title":"입력값(0~100).",
				"placement":"bottom"
			});
		var	titleStr  = "1. 개발대행 : 콘텐츠의 개발대행 업무<br/>";
			titleStr += "2. 라이센싱 : 저작물의 라이선스 협력 계약(빅스타가 구매하는 경우)<br/>";
			titleStr += "3. 삼품판매납품 : 콘텐츠저작권자와 빅스타가 라이선스 협력 후 판매처에 판매를 위해 수익률을 나눠 개발<br/>";
			titleStr += "4. 외주의뢰 : 당사가 외주 개발 용역 계약<br/>";
		$('#contract_type_tip')
			.tooltip({
				"html": true,
				"title": titleStr,
				"placement":"bottom"
			});
		$('#sale_price_tip')
			.tooltip({
				"title":"콘텐츠 판매가는 실제 판매상품 등록 시 여러 환율 단위로 등록이 가능합니다. 대표 가격만 입력해주세요.",
				"placement":"bottom"
			});
	}
	
	//validation check... now length error
	//$("textarea").jqBootstrapValidation();
	
});
</script>