<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
.no-padding {
	padding : 0px;
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
	data-balance_type="${ contract.balance_type }"
	data-balance_type_detail="${ contract.balance_type_detail }"
	data-deposit_bank="${ contract.deposit_bank }"
	data-account_no="${ contract.account_no }"
	data-account_holder="${ contract.account_holder }"
	>

	<div class="span12">
		
		<form id="contractForm" class="form-horizontal " method="POST" action="<spring:eval expression="@urlProp['contractCreateAction']"/>">
			<c:if test="${empty isNew}">
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
					<input type="hidden" id="series_mgmtno" name="series_mgmtno" value="${ series.series_mgmtno }">
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
				<label class="control-label" for="license_cd"><img src='<spring:eval expression="@urlProp['v']"/>'> 계약방식</label>
				<div class="controls">
					<label class="radio inline">
						<input type="radio" name="license_cd" value="1" checked="checked">개발대행
					</label>
					<label class="radio inline">
						<input type="radio" name="license_cd" value="2">라이센싱
					</label>
					<label class="radio inline">
						<input type="radio" name="license_cd" value="0">상품판매납품(협력)
					</label>
					<label class="radio inline">
						<input type="radio" name="license_cd" value="0">외주의뢰
					</label>
					<a id="tip1" href="#" data-toggle="tooltip" >tip</a>
					<script>
					$('#tip1')
						.tooltip({
							"title":"설정 판매가를 입력하세요. 상품 등록 시 기본 판매가로 책정됩니다.",
							"placement":"bottom"
						});
					</script>
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
					<label class="radio inline">
						<input type="radio" name="license_cd" value="1" checked="checked">빅스타 소유
					</label>
					<label class="radio inline">
						<input type="radio" name="license_cd" value="2">에듀엔조이 소유
					</label>
					<label class="radio inline">
						<input type="radio" name="license_cd" value="3">플레이북스 소유
					</label>
					<label class="radio inline">
						<input type="radio" name="license_cd" value="4">공동 소유
					</label>
					<label class="radio inline">
						<input type="radio" name="license_cd" value="5">업체 소유
					</label>
					<label class="radio inline">
						<input type="radio" name="license_cd" value="6">기타
					</label>
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
			<div class="control-group">
				<label class="control-label" for="contract_type"><img src='<spring:eval expression="@urlProp['v']"/>'> 계약방식</label>
				<div class="controls">
					<div class="row-fluid">
						<label class="radio inline">
							<input type="radio" name="contract_type" value="1" checked="checked">
							쉐어
						</label>
						<label class="radio inline">
							<input type="radio" name="contract_type" value="2" >
							선금
						</label>
						<label class="radio inline">
							<input type="radio" name="contract_type" value="3" >
							후지급
						</label>
						<label class="radio inline">
							<input type="radio" name="contract_type" value="0" >
							기타
						</label>
						<textarea class="span10" rows="4" id="contract_type_detail"  name="contract_type_detail" placeholder="기타 설정시 필수입력" style="display:none;">${ contract.contract_type_detail }</textarea>
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="sale_price">계약대금</label>
				<div class="controls">
					<div class="input-prepend">
						<div class="btn-group no-padding">
							<button class="btn dropdown-toggle" data-toggle="dropdown">
								<span id="currency">KRW</span><span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="#">KRW(한국)</a></li>
								<li><a href="#">USD(미국)</a></li>
								<li><a href="#">JPY(일본)</a></li>
								<li><a href="#">CNY(중국)</a></li>
								<li><a href="#">EUR(유럽)</a></li>
							</ul>
						</div>
						<input type="text" id="sale_price" name="sale_price" placeholder="판매단가" value="${ contract.sale_price }">
					</div>
					<a id="tip2" href="#" data-toggle="tooltip" >tip</a>
					<script>
					$('#tip2')
						.tooltip({
							"title":"콘텐츠 판매가는 실제 판매상품 등록 시 여러 환율 단위로 등록이 가능합니다. 대표 가격만 입력해주세요.",
							"placement":"bottom"
						});
					</script>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" ><img src='<spring:eval expression="@urlProp['v']"/>'> 수익률 </label>
				<div class="controls">
					<input type="text" id="sale_profit_rate" name="sale_profit_rate" placeholder="수익률" value="${ contract.sale_profit_rate }">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" ><img src='<spring:eval expression="@urlProp['v']"/>'> 계약기간 </label>
				<div class="controls">
					<input class="datepicker" type="text" name="str_date" data-date-format="yyyy-mm-dd" value="${ contract.str_date }"> - 
					<input class="datepicker" type="text" name="end_date" data-date-format="yyyy-mm-dd" value="${ contract.end_date }">
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
			
			<div class="page-name">
				<h4>
					정산정보입력
				</h4>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputEmail"><img src='<spring:eval expression="@urlProp['v']"/>'> 정산방식</label>
				<div class="controls">
					<label class="radio inline">
						<input type="radio" name="balance_type" value="1" checked="checked">
						월정산
					</label>
					<label class="radio inline">
						<input type="radio" name="balance_type" value="2">
						연정산
					</label>
					<label class="radio inline">
						<input type="radio" name="balance_type" value="0">
						기타
					</label>
					<textarea class="span10" rows="4" id="balance_type_detail" name="balance_type_detail" placeholder="상세정보입력">${ contract.balance_detail }</textarea>
				</div>
			</div>
			<div class="control-group">
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
						<c:when test="${empty isNew}">
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
	
	$('#sale_price').autoNumeric('init',{aPad: false });
	
	placeholderForIE();
	
	contractValidation();
	
	var boxData = $("div.contract-box").data();
	//CP업체 셋팅
	$("#company_mgmtno")
		.find("option").filter(function(index){
			return $(this).val() == boxData.company_mgmtno;
		}).prop("selected", true);
	
	//출판 형태 셋팅
	$.each($(boxData.publishing_type.split(",")), function(index, value) {
		switch (value) {
			case 'pb': $( "select[name='isPicturebook'] option[value='Y']" ).prop("selected", true); break;
			case 'ebook': $( "select[name='isEbook'] option[value='Y']" ).prop("selected", true); break;
			case '2d': $( "select[name='is2d'] option[value='Y']" ).prop("selected", true); break;
			case '3d': $( "select[name='is3d'] option[value='Y']" ).prop("selected", true); break;
			case 'game': $( "select[name='isGame'] option[value='Y']" ).prop("selected", true); break;
			default: break;
		}
	});
	
	{//라이센스 체크 & 이벤트
		$( "input[name='license_cd']" ).each(function(){
			var $this = $(this);
			var $licenseCdDetail = $("#license_cd_detail");
			console.info(boxData.license_cd == $this.val());
			if(boxData.license_cd == $this.val() ){
				$this.prop("checked", true);
			}
			//add event
			$this.click(function(){
				if( $this.val() == 0 ){
					$licenseCdDetail.show();
				} else {
					$licenseCdDetail.hide().val("");
				}
			});
		});
		if(${empty isNew}) {
			//상세정보 펼치기
			if(boxData.license_cd == 0 ){
				$("#license_cd_detail").show();
			}
		};
	}//라이센스 체크 & 이벤트
	
	
	{//라이센스 국가 제한 체크 & 이벤트
		var $licenseCountryDetail = $("#license_country_detail");
		$( "input[name='license_country']" ).each(function(){
			var $this = $(this);
			if(boxData.license_country == $this.val() ){
				$this.prop("checked", true);
			}
			
			//add event
			$this.click(function(){
				if( $this.val() == 0 ){
					$licenseCountryDetail.show();
				} else {
					$licenseCountryDetail
						.hide()
						.val("");
				}
			});
		});
		var isEtc = ${empty isNew};
		if(isEtc) {
			//기타 일시 상세펼치기
			if(boxData.license_country == 0 ){
				$licenseCountryDetail.show();
			}
		}
	}//라이센스 국가 제한 체크 & 이벤트
	
	
	{// 계약 방식 체크 & 이벤트
		$( "input[name='contract_type']" ).each(function(){
			var $this = $(this);
			var $contractTypeDetail = $("#contract_type_detail");
			if(boxData.contract_type == $this.val() ){
				$this.prop("checked", true);
			}
			//add event
			$this.click(function(){
				if( $this.val() == 0 ){
					$contractTypeDetail.show();
				} else {
					$contractTypeDetail.hide().val("");
				}
			});
		});
		if(${empty isNew}) {
			//기타 일시 상세펼치기
			if(boxData.contract_type == 0 ){
				$contractTypeDetail.show();
			}
		}
	}// 계약 방식 체크 & 이벤트
	
	// 정산 방식 체크
	$( "input[name='balance_type']" ).each(function(){
		var $this = $(this);
		if(boxData.balance_type == $this.val() ){
			$this.prop("checked", true);
		}
	});
	
	// 은행 체크
	$("select[name='deposit_bank']")
		.change(function(){
			var $this = $(this);
			if($this.val() == 0) {
				$("div.account-group")
					.hide();
			} else {
				$("div.account-group").show();
			}
		}).trigger("change")
		.find("option").filter(function(){
			var $this = $(this);
			if($this.val() == boxData.deposit_bank) {
				$("div.account-group").show();
				return $this;
			}
		}).prop("selected", true);

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
	$("#btn-select-series").click(function() {
		
		var $selectedSeries = $("input[name='series']").filter(":checked");
		console.info( $selectedSeries );
		//시리즈 값 셋팅
		$("#series_name").text( $selectedSeries.data("series_name") );
		$("#cate_id").val( $selectedSeries.data("cate_id") );
		$("#series_mgmtno").val( $selectedSeries.val() );
		$("#series_cnt").text( $selectedSeries.data("totCnt") );
		
		$('#findContent').modal('toggle');
		
	});

});
</script>