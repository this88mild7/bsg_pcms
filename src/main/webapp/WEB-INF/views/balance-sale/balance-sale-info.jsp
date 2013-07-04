<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
.well {
	height : 200px;
	overflow-y : scroll; 
}
#sale-tbl { table-layout: fixed; }
#sale-tbl th, #sale-tbl td { overflow: hidden; }
</style>
<div class="page-name">
	<h4>
		<c:choose>
			<c:when test="${not empty isCreate}">
				매출 입력 <small>&gt;&gt; 매출을 입력해 주세요.</small>
			</c:when>
			<c:otherwise>
				매출 입력 <small>&gt;&gt; 매출을 입력해 주세요.</small>
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
				<label class="control-label" for="contractTypeList"><img src='<spring:eval expression="@urlProp['v']"/>'> 판매방식</label>
				<div class="controls">
					<select size="1" id="contractTypeList" name="contract_type" data-cnt="${ fn:length( cpList ) }">
						<option value="0">판매방식을 선택해 주세요.</option>
						<!-- 
							ajax
						 -->
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" ><img src='<spring:eval expression="@urlProp['v']"/>'> 판매기간</label>
				<div class="controls">
					<input class="datepicker" type="text" name="sale_str_date" data-date-format="yyyy-mm-dd" value="${ contract.sale_str_date }"> - 
					<input class="datepicker" type="text" name="sale_end_date" data-date-format="yyyy-mm-dd" value="${ contract.sale_end_date }">
					<a id="salePeriodTip" href="#" data-toggle="tooltip" >tip</a>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" ><img src='<spring:eval expression="@urlProp['v']"/>'> 상품</label>
				<div class="controls">
					<button id="btn-sale-product-list" class="btn">매출 상품등록</button>
					<a id="contentListTip" href="#" data-toggle="tooltip" >tip</a>
					<br />
					<br />
					<div class="well">
						<table id="sale-tbl" class="tbl" style="width:100%;">
							<tr>
								<th style="width: 40%">상품명</th>
								<th style="width: 20%">업체</th>
								<th style="width: 20%">매출액</th>
								<th style="width: 13%">판매수량</th>
								<th style="width: 7%"></th>
							</tr>
							<!-- 
							ajax sale-content here
							 -->
						</table>
					</div>
					<div class="rowspan">
						<div class="span6"><h4>총 판매수량 : <span class="autoNumeric totalSaleCnt blue"></span> 건</h4></div>
						<div class="span6"><h4>총 매출금액 : <span class="autoNumeric totalSalePrice blue"></span> 원</h4></div>
					</div>
				</div>
			</div>
			<hr>
			<div class="control-group">
				<div class="text-right" style="padding-right:80px;">
					<h4>
						매출계산: 
						<span class="autoNumeric totalSalePrice blue"></span>(총 매출금액) - 
						<span class="autoNumeric totalSaleCompanyCommission blue"></span>(판매처 수수료) - 
						<span class="autoNumeric totalCpCommission blue"></span>(업체 수수료)
					</h4>
					<br />
					<h3>최종 자사 수익 : <span class="autoNumeric totalProfit blue"></span> 원</h3>
				</div>
			</div>
				<input type="hidden" id="totalSalePrice" name="total_sale_price"/>
				<input type="hidden" id="totalSaleCnt" name="total_sale_count"/>
				<input type="hidden" id="totalSaleCompanyCommission" name="total_sale_company_commission"/>
				<input type="hidden" id="totalCpCommission" name="total_cp_commission"/>
				<input type="hidden" id="totalProfit" name="total_profit"/>
			<div id="product-value">
				
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

<!-- MODAL -->
<div id="findProduct" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 class="text-center">상품 등록</h3>
	</div>
	<div class="modal-body">
		<div class="input-append pull-right">
			<input type="text" id="seriesQuery" name="seriesQuery" class="input-large">
			<button class="btn btn-series-search-form" type="button"><i class="icon-search"></i></button>
		</div>
		<table class="table table-striped table-hover">
			<thead>
			<tr>
				<th><input class="check-all" type="checkbox" name="checkbox_all" value="false" data-toggle="tooltip"></th>
				<th>상품명</th>
			</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">취소</button>
		<button id="btn-select-product" class="btn btn-primary">등록하기</button>
	</div>
</div>

<script>
$(function(){

	//validation
	//$("#company_name,#phoneno").not("[type=submit]").jqBootstrapValidation();
	
//매출 등록하기 버튼 이벤트
$("#btn-content-create-action").click(function(evnet){
	$("#balanceForm").submit();
});

//매출 상품등록 버튼 이벤트
$("#btn-sale-product-list").click(function(event){
	event.preventDefault();
	
	var companyMgmtno = $("#saleCompanyList").find("option").filter(":selected").val();
	var contractType = $("#contractTypeList").find("option").filter(":selected").val();
	
	var $target = $("#findProduct");
	var url = '<spring:eval expression="@urlProp['ajaxBalanceSaleContents']"/>';
	var param = { company_mgmtno : companyMgmtno, contract_type : contractType };
	$.getJSON(url, param, function(data) {
		console.info( data );
		if(data.code == 999) {
			bootbox.alert( data.msg );
			return false;
		}
		
		{ // 초기화
			$target.find("tbody").remove();
		}
		
		if(data.contentList.length == 0) {
			bootbox.alert( "등록된 상품이 없습니다. 상품등록을 마친 후 정산 입력해 주세요." );
			return false;
		}
		
		$.each(data.contentList, function(idx, ele){
			$html = '<option value="' + ele.sale_type + '">' + ele.sale_type_name + '</option>';
			$target.append( $html );
			
				var name = ele.name,
					salePrice = ele.sale_price,
					saleCompanyRate = ele.sale_company_rate,
					cpName = ele.cp_name,
					cpRate = ele.cp_rate,
					contentsCd = ele.contents_cd;
				
				var $html = String.format('<tr><td><input type="checkbox" name="check_list" data-name="{0}" data-sale_price="{1}" data-sale_company_rate="{2}" data-cp_rate="{3}" data-contents_cd="{4}" data-cp_name="{5}" value="{4}"></td><td>{0}</td></tr>',
						name, salePrice, saleCompanyRate, cpRate, contentsCd, cpName );
			
				$target.find("table").append( $html );
		});
		
		$target.modal('toggle');
	});
	
});
	
{ //MODAL EVENT
	
	//상품 선택하고 선택하면 상품리스트에 집어넣기
	$("#btn-select-product").click(function(){
		
		var $target = $("#sale-tbl");
		var $selectedProduct = $("#findProduct").find("input[name='check_list']").filter(":checked");
		
		$selectedProduct.each(function(index){
			var $this = $(this),
				name = $this.data("name"),
				cpName = $this.data("cp_name"),
				salePrice = $this.data("sale_price"),
				saleCompanyRate = $this.data("sale_company_rate"),
				cpRate = $this.data("cp_rate"),
				contentsCd = $this.data("contents_cd");
			
			var wrapHtml  = '<tr data-sale_price="{2}" data-sale_company_rate="{4}" data-cp_rate="{5}" >';
				wrapHtml += '<td>{0}</td>'; 		//상품명
				wrapHtml += '<td>{1}</td>';		//업체명
				wrapHtml += '<td><input style="width:90%" class="autoNumeric product-sale-price" type="text" name="salePrice" placeholder="매출액"/></td>';
				wrapHtml += '<td><input style="width:86%" class="autoNumeric product-cnt" type="text" name="saleCount" placeholder="판매수량"/></td>';
				wrapHtml += '<td><button class="btn btn-remove-product pull-right">삭제</button></td>';
				wrapHtml += '<input type="hidden" name="contentList" value="{6}" />';
				wrapHtml += '</tr>';
				
			$target.append( String.format(wrapHtml, name, cpName, salePrice, index, saleCompanyRate, cpRate, contentsCd) );
		});
		
		//상품 삭제버튼이 눌러지면 해당 엘리먼트 제거
		$("button.btn-remove-product").click(function(){
			var $this = $(this);
			$this.parent().parent().remove();
			//재계산
			calculate();
		});
		
		$('.autoNumeric').autoNumeric("init",{aPad: false });
		$(".blue").css("color", "blue");
		$("#findProduct").modal('toggle');
	});
}

$('.autoNumeric').autoNumeric('init',{aPad: false });

$("#balanceForm").submit(function(){
	//금액 콤마 제거	(숫자만 가져옴)		
	$("#sale-tbl").find("input.autoNumeric").each(function(){
		$(this).val($(this).autoNumeric('get'));
	});
});

//판매수량/매출액 입력될 때마다 이벤트 발생
$("body").on("keyup", $("input.product-cnt,input.product-sale-price"), function(event){
	calculate();
});

		//판매수량이 입력되면 계산 시작
		function calculate(){
			
			var totalSaleCnt = 0, 			//총 판매수
				totalSalePrice = 0,			//총 매출금액
				totalSaleCompanyFee = 0,	//총 판매 수수료
				totalCpFee = 0,				//총 업체 수수료
				totalProfit = 0;
			
			// 상품별 판매처 및 CP 업체 수익 값 DIV
			$("#product-value").empty();
			
			$("#sale-tbl").find("tr").not(":first").each(function(){
				
				var $this = $(this),
					productData = $this.data(),
					$tdList = $this.find("td");
				
				var salePrice = $tdList.eq(2).find("input").autoNumeric('get');
				var saleCnt = $tdList.eq(3).find("input").autoNumeric('get');
				var saleCompanyRate = isNaN( productData.sale_company_rate ) ? 0 : productData.sale_company_rate;
				var cpRate = isNaN( productData.cp_rate ) ? 0 : productData.cp_rate;
				
				if( isNaN(salePrice) || salePrice.length == 0 ) {
					salePrice = 0;
				}
				if( isNaN(saleCnt) || saleCnt.length == 0  ) {
					saleCnt = 0;
				}
				
				var avgPrice = salePrice / saleCnt,
					saleFee = salePrice * ( saleCompanyRate / 100 ),
					earning = salePrice - saleFee,
					cpFee = earning * ( cpRate / 100 ),
					profit = earning - cpFee;
				
				console.debug( String.format("avgPrice:{0} saleFee:{1} cpFee:{2} profit:{3} earning:{4}", avgPrice, saleFee, cpFee, profit, earning) );
				
				totalSaleCnt += parseInt(saleCnt);
				totalSalePrice += parseInt(salePrice);
				totalSaleCompanyFee += parseInt(saleFee);
				totalCpFee += parseInt(cpFee);
				totalProfit += parseInt(profit);
				
				// 판매처 및 업체 수수료 추가
				
				var saleFreeHtml = '<input type="hidden" name="contentSaleProfit" value="'+saleFee+'" />';
				var cpFreeHtml = '<input type="hidden" name="contentCpProfit" value="'+cpFee +'" />';
				var contentPriceHtml = '<input type="hidden" name="contentSalePrice" value="'+ salePrice +'" />';
				$("#product-value").append(saleFreeHtml);
				$("#product-value").append(cpFreeHtml);
				$("#product-value").append(contentPriceHtml);
				
			});
			
			//보여지는 값 넣어주기
			$("span.totalSalePrice").text(totalSalePrice); 
			$("span.totalSaleCnt").text(totalSaleCnt);
			$("span.totalSaleCompanyCommission").text(totalSaleCompanyFee);
			$("span.totalCpCommission").text(totalCpFee);
			$("span.totalProfit").text(totalProfit);
			
			//FORM input 히든값 넣어주기
			$("#totalSalePrice").val(totalSalePrice); 
			$("#totalSaleCnt").val(totalSaleCnt);
			$("#totalSaleCompanyCommission").val(totalSaleCompanyFee);
			$("#totalCpCommission").val(totalCpFee);
			$("#totalProfit").val(totalProfit);
			
			//숫자 표시 업데이트 000,000
			$('.autoNumeric').autoNumeric('update',{aPad: false });
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
	//판매처 아이디가 변할때 마다 판매기종 가져오기
	$("#saleCompanyList").change(function(){
		var $this = $(this);
		if($this.val() == 0) {
			return false;
		}
		
		var companyMgmtno = $("#saleCompanyList").find("option").filter(":selected").val();
		
		var url = '<spring:eval expression="@urlProp['ajaxBalanceSaleContractType']"/>';
		var param = { company_mgmtno : companyMgmtno };
		$.getJSON(url, param, function(data) {
			console.info(data);
			if(data.code == 999) {
				bootbox.alert( data.msg );
				return false;
			}
			
			var $target = $("#contractTypeList");
			
			{ // 초기화
				$target.find("option").not(":first").remove();
			}
			
			if(data.contractTypeList.length == 0) {
				bootbox.alert( "판매방식이 없습니다." );
				return false;
			}
			
			$.each(data.contractTypeList, function(idx, ele){
				var contractType = ele.contract_type,
					contractTypeName = ele.contract_type_name;
			
				var $html = String.format('<option value="{0}">{1}</option>', contractType, contractTypeName);
				$target.append( $html );
			});
		})
		.fail(function() { bootbox.alert( data.msg ); });
		
	});
	
	//계약 시작일, 종료일 계산위해
	var sdate, 
		edate;
	$( "input.datepicker" ).datepicker({autoclose:true})
		.on('changeDate', function(ev){
			if( "sale_str_date" === $(this).attr("name") ) {
				sdate = ev.date.valueOf();
			} else {
				edate = ev.date.valueOf();
				if( sdate > edate ) {
					bootbox.alert( "시작일 이전으로 설정할 수 없습니다." );
					$( this ).val( "" );
				}
				$( "input[name=sale_str_date]" ).datepicker( "hide" );
			}
		});
	
}

String.format = function() {
    var theString = arguments[0];
    
    for (var i = 1; i < arguments.length; i++) {
        var regEx = new RegExp("\\{" + (i - 1) + "\\}", "gm");
        theString = theString.replace(regEx, arguments[i]);
    }
    
    return theString;
}
	
});
</script>