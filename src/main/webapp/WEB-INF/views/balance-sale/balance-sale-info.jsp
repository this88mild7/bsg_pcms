<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
div#sale-content-list {
	height : 200px;
	overflow-y : scroll; 
}
</style>
<div class="page-name">
	<h4>
		<c:choose>
			<c:when test="${not empty isCreate}">
				매출 입력 <small>&gt;&gt; 매출을 입력해 주세요.</small>
			</c:when>
			<c:otherwise>
				[${ content.name }] 상세정보
			</c:otherwise>
		</c:choose>
	</h4>
</div>

<div class="row-fluid"
	data-is_create="${isCreate}">

	<div class="span12">
		
		<form id="balanceForm" class="form-horizontal " method="POST" action="<spring:eval expression="@urlProp['balanceSaleCreateAction']"/>">
			<c:if test="${empty isCreate}">
				<input type="hidden" name="contents_cd" value="${ content.contents_cd }" />
			</c:if>
			<div class="control-group">
				<label class="control-label" for="name"><img src='<spring:eval expression="@urlProp['v']"/>'> 판매처</label>
				<div class="controls">
					<select size="1" id="saleCompanyList" name="company_mgmtno">
						<c:forEach items="${saleCompanyList}" var="companyDTOex">
							<option value="${ companyDTOex.company_mgmtno }">${companyDTOex.company_name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="company_mgmtno"><img src='<spring:eval expression="@urlProp['v']"/>'> 판매기종</label>
				<div class="controls">
					<select size="1" id="company_mgmtno" name="company_mgmtno" data-cnt="${ fn:length( cpList ) }">
						<!-- 
							ajax
						 -->
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="company_mgmtno"><img src='<spring:eval expression="@urlProp['v']"/>'> 판매방식</label>
				<div class="controls">
					<select size="1" id="company_mgmtno" name="company_mgmtno" data-cnt="${ fn:length( cpList ) }">
						<!-- 
							ajax
						 -->
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" ><img src='<spring:eval expression="@urlProp['v']"/>'> 판매기간</label>
				<div class="controls">
					<input class="datepicker" type="text" name="str_date" data-date-format="yyyy-mm-dd" value="${ contract.str_date }"> - 
					<input class="datepicker" type="text" name="end_date" data-date-format="yyyy-mm-dd" value="${ contract.end_date }">
					<a id="salePeriodTip" href="#" data-toggle="tooltip" >tip</a>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" ><img src='<spring:eval expression="@urlProp['v']"/>'> 상품</label>
				<div class="controls">
					<button id="btn-sale-content-list" class="btn">매출 상품등록</button>
					<a id="contentListTip" href="#" data-toggle="tooltip" >tip</a>
					<br />
					<br />
					<div id="sale-content-list">
						<!-- 
						ajax sale-content here
						 -->
						붐붐 잉글리쉬 : YBMsisa 1000 원 <input type="text" id="a" name="" placeholder="판매수량"/> 삭제
					</div>
					<div class="rowspan">
						<div class="span6"><h4>총 판매수량 : <span id="totalCnt">3300</span> 건</h4></div>
						<div class="span6"><h4>총 매출금액 : <span class="totalPrice">49,500,000</span> 원</h4></div>
					</div>
				</div>
			</div>
			<hr>
			<div class="control-group">
				<div class="text-right" style="padding-right:80px;">
					<h3>
						매출계산: 
						<span class="totalPrice">49,500,000</span>(총 매출금액) - 
						<span id="saleCompanyFee">0</span>(판매처 수수료) - 
						<span id="cpFee">24,502,500</span>(업체 수수료)
					</h3>
					<br />
					<h3>최종 자사 수익 : <span id="totalEarnings">24,502,500</span> 원</h3>
				</div>
			</div>
		</form>
		
		<div class="control-group">
			<label class="control-label" ></label>
			<div class="controls">
				<button id="btn-content-list" class="btn">목록가기</button>
				<c:choose>
					<c:when test="${empty isCreate}">
						<button id="btn-content-delete-action" class="btn">삭제</button>
						<button id="btn-content-update-action" class="btn btn-primary">수정하기</button>
					</c:when>
					<c:otherwise>
						<button id="btn-content-create-action" class="btn btn-primary">등록하기</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

</div>
<!--/row-->

<script>
$(function(){
	
	//$('#a').autoNumeric('init',{aPad: false });
	
	$("#contractForm").submit(function(){
		//금액 콤마 제거	(숫자만 가져옴)		
		//$('#sale_price').val($('#sale_price').autoNumeric('get'));
	});
	
	$("#a").keyup(function(event){
		var $this = $(this);
		setTotalCnt( $this.val() );
	});
	
	function setTotalCnt(totalCnt){
		$("#totalCnt").text(totalCnt);
		$("span.totalPrice").text(totalCnt * 1000);
	}
	
	//툴팁
	$('#contentListTip')
		.tooltip({
			"title":"판매된 상품을 정확하게 입력해 주세요.",
			"placement":"bottom"
		});
	$('#salePeriodTip')
		.tooltip({
			"title":"해당 업체의 판매기간을 설정해 주세요.",
			"placement":"bottom"
		});
	
	//엘리먼트 이벤트
	{
		$("#saleCompanyList").change(function(){
			console.info("!!");
			//판매처 아이디로 판매기종,판매방식 가져오기
		});
		
		//계약 시작일, 종료일 계산위해
		var sdate, 
			edate;
		$( "input.datepicker" ).datepicker({autoclose:true})
			.on('changeDate', function(ev){
				if( "str_date" === $(this).attr("name") ) {
					sdate = ev.date.valueOf();
				} else {
					edate = ev.date.valueOf();
					if( sdate > edate ) {
						bootbox.alert( "시작일 이전으로 설정할 수 없습니다." );
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
		
	}
	
	
	
});
</script>