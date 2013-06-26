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
						<option value="0">판매처를 선택해 주세요.</option>
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
						붐붐 잉글리쉬1 : YBMsisa 1000 원 <input type="text" id="a" name="" placeholder="판매수량"/> 삭제
					</div>
					<div class="rowspan">
						<div class="span6"><h4>총 판매수량 : <span class="autoNumeric" id="totalSaleCnt"></span> 건</h4></div>
						<div class="span6"><h4>총 매출금액 : <span class="autoNumeric totalSalePrice"></span> 원</h4></div>
					</div>
				</div>
			</div>
			<hr>
			<div class="control-group">
				<div class="text-right" style="padding-right:80px;">
					<h3>
						매출계산: 
						<span class="autoNumeric totalSalePrice"></span>(총 매출금액) - 
						<span class="autoNumeric" id="saleCompanyFee"></span>(판매처 수수료) - 
						<span class="autoNumeric" id="cpFee"></span>(업체 수수료)
					</h3>
					<br />
					<h3>최종 자사 수익 : <span id="totalEarnings"></span> 원</h3>
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
	
	$('.autoNumeric').autoNumeric('init',{aPad: false });
	
	$("#contractForm").submit(function(){
		//금액 콤마 제거	(숫자만 가져옴)		
		//$('#sale_price').val($('#sale_price').autoNumeric('get'));
	});
	
	//판매수량이 숫자 하나하나 입력될 때마다 이벤트 발생
	$("#a").keyup(function(event){
		var $this = $(this);
		setTotalCnt( $this.autoNumeric('get') );
		calculate();
	});
	
			//판매수량이 입력되면 계산 시작
			function calculate(){
				
				var totalSaleCnt = 0,
					totalSalePrice = 0,
					saleCompanyFee = 0,
					cpFee = 0;
				
				/* 
					for() {
						var $this = $(this);
						var 상품가격 = ;
						var 판매수량 = ;
						var 판매수수료 = ;
						var CP수수료 = ;
						
						//상품가격 * 판매수량 
						$this.카운터 * $this.상품가격 = 매출액

						totalSaleCnt += ;
						totalSalePrice += ;
						saleCompanyFee += ;
						cpFee += ;
					}
				
				*/
				
				$(".totalSalePrice").text(totalSalePrice); // <- 혼자 class임 element가 2개임
				$("#totalSaleCnt").text(totalSaleCnt);
				$("#saleCompanyFee").text(saleCompanyFee);
				$("#cpFee").text(cpFee);
				
				//숫자 표시 업데이트 000,000
				$('.totalPrice').autoNumeric('update',{aPad: false });
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
			var $this = $(this);
			if($this.val() == 0) {
				return false;
			}
			
			console.info("A");
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
			});
		
	}
	
	
	
});
</script>