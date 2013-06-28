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
				<label class="control-label" for="deviceTypeList"><img src='<spring:eval expression="@urlProp['v']"/>'> 판매기종</label>
				<div class="controls">
					<select size="1" id="deviceTypeList" name="sale_type">
						<option value="0">판매기종을 선택해 주세요.</option>
						<!-- 
							ajax
						 -->
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
					<div class="well" id="sale-content-list">
						<!-- 
						ajax sale-content here
						 -->
					</div>
					<div class="rowspan">
						<div class="span6"><h4>총 판매수량 : <span class="autoNumeric totalSaleCnt"></span> 건</h4></div>
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
						<span class="autoNumeric totalSaleCompanyCommission"></span>(판매처 수수료) - 
						<span class="autoNumeric totalCpCommission"></span>(업체 수수료)
					</h3>
					<br />
					<h3>최종 자사 수익 : <span class="autoNumeric totalProfit"></span> 원</h3>
				</div>
			</div>
			
			<input type="hidden" id="totalSalePrice" name="total_sale_price"/>
			<input type="hidden" id="totalSaleCnt" name="total_sale_cnt"/>
			<input type="hidden" id="totalSaleCompanyCommission" name="total_sale_company_commission"/>
			<input type="hidden" id="totalCpCommission" name="total_cp_commission"/>
			<input type="hidden" id="totalProfit" name="total_profit"/>
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
		<h3></h3>
	</div>
	<div class="modal-body">
		<table class="table table-striped table-hover">
			<thead>
			<tr>
				<th></th>
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
	
$("#btn-sale-product-list").click(function(event){
	event.preventDefault();
	
	var companyMgmtno = $("#saleCompanyList").find("option").filter(":selected").val();
	var saleType = $("#deviceTypeList").find("option").filter(":selected").val();
	var contractType = $("#contractTypeList").find("option").filter(":selected").val();
	
	var $target = $("#findProduct");
	var url = '<spring:eval expression="@urlProp['ajaxBalanceSaleContents']"/>';
	var param = { company_mgmtno : companyMgmtno, sale_type : saleType, contract_type : contractType };
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
			bootbox.alert( "상품이 없습니다." );
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
				
				var $html = String.format('<tr><td><input type="checkbox" name="check_list" data-name="{0}" data-sale_price="{1}" data-sale_company_rate="{2}" data-cp_rate="{3}" data-contents_cd="{4}" data-cp_name="{5}" value="{4}"></td><td>{0} {1} 원</td></tr>',
						name, salePrice, saleCompanyRate, cpRate, contentsCd, cpName );
			
				$target.find("table").append( $html );
		});
		
		$target.modal('toggle');
	});
	
});
	
{ //MODAL EVENT
	
	//상품 선택하고 선택하면 상품리스트에 집어넣기
	$("#btn-select-product").click(function(){
		
		var $target = $("#sale-content-list");
		var $selectedProduct = $("#findProduct").find("input[name='check_list']").filter(":checked");
		
		var tableHtml = '<table class="tbl" style="width:100%;">';
		$selectedProduct.each(function(index){
			var $this = $(this),
				name = $this.data("name"),
				cpName = $this.data("cp_name"),
				salePrice = $this.data("sale_price"),
				saleCompanyRate = $this.data("sale_company_rate"),
				cpRate = $this.data("cp_rate"),
				contentsCd = $this.data("contents_cd");
			
			var wrapHtml  = '<tr>';
				wrapHtml += '<td span="4">{0}</td>'; 		//상품명
				wrapHtml += '<td span="2">{1}</td>';		//업체명
				wrapHtml += '<td span="2">{2} 원</td>';		//가격
				wrapHtml += '<td span="3"><input class="autoNumeric product-list pl{3}" type="text" name="saleCount" placeholder="판매수량" data-sale_price="{2}" data-sale_company_rate="{4}" data-cp_rate="{5}" /></td>';
				wrapHtml += '<td span="1"><button class="btn btn-remove-product">삭제</button></td>';
				wrapHtml += '<input type="hidden" name="contentList" value="{6}" />';
				wrapHtml += '</tr>';
				
			tableHtml += String.format(wrapHtml, name, cpName, salePrice, index, saleCompanyRate, cpRate, contentsCd);
			
		});
		tableHtml += '</table>';
		$target.append( tableHtml );
		
		//상품 삭제버튼이 눌러지면 해당 엘리먼트 제거
		$("button.btn-remove-product").click(function(){
			var $this = $(this);
			$this.parent().parent().remove();
			//재계산
			calculate();
		});
		
		$('.autoNumeric').autoNumeric('init',{aPad: false });
		$("#findProduct").modal('toggle');
	});
}

$('.autoNumeric').autoNumeric('init',{aPad: false });

$("#contractForm").submit(function(){
	//금액 콤마 제거	(숫자만 가져옴)		
	//$('#sale_price').val($('#sale_price').autoNumeric('get'));
});

//판매수량이 숫자 하나하나 입력될 때마다 이벤트 발생
$("body").on("keyup", $("input.product-list"), function(event){
	calculate();
});

		//판매수량이 입력되면 계산 시작
		function calculate(){
			
			var totalSaleCnt = 0, 			//총 판매수
				totalSalePrice = 0,			//총 매출금액
				totalSaleCompanyFee = 0,	//총 판매 수수료
				totalCpFee = 0,				//총 업체 수수료
				totalProfit = 0;
			
			console.debug(String.format("price * cnt = salePrice, ( earning - saleCompanyFee ) - cpFee = profit"));
			$("#sale-content-list").find("input.autoNumeric").each(function(){
				
				var $this = $(this),
					productData = $this.data();
				
				//계산
				var cnt = $this.autoNumeric('get');
				
				var salePrice = productData.sale_price * cnt,
					saleFee = salePrice * ( productData.sale_company_rate / 100 ),
					earning = salePrice - saleFee,
					cpFee = earning * ( productData.cp_rate / 100 ),
					profit = earning - cpFee;
				
				console.debug(String.format("{0} * {1} = {2}, ( {3} - {4} ) - {5} = {6}", 
						productData.sale_price, cnt, salePrice, earning, saleFee, cpFee, profit ));
				
				//판매 수량이 입력 안되었을때 
				if( isNaN(cnt) || cnt.length == 0 ) {
					cnt = 0;
			   	}
				//누적 데이터 쌓기
				totalSaleCnt += parseInt(cnt);
				totalSalePrice += salePrice;
				totalSaleCompanyFee += saleFee;
				totalCpFee += cpFee;
				totalProfit += profit;
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
		
		var url = '<spring:eval expression="@urlProp['ajaxBalanceSaleDeviceType']"/>';
		$.getJSON(url, { company_mgmtno : $this.val() }, function(data) {
			console.info(data);
			if(data.code == 999) {
				bootbox.alert( data.msg );
				return false;
			}
			
			var $target = $("#deviceTypeList");
			{ // 초기화
				$target.find("option").not(":first").remove();
				$("#saleTypeList").find("option").not(":first").remove();
			}
			
			if(data.deviceTypeList.length == 0) {
				bootbox.alert( "판매기종이 없습니다." );
				return false;
			}
			
			$.each(data.deviceTypeList, function(idx, ele){
		    
				var saleType = ele.sale_type,
					saleTypeName = ele.sale_type_name;
				
				var $html = String.format('<option value="{0}">{1}</option>', saleType, saleTypeName);
				$target.append( $html );
			});
		})
		.fail(function() { bootbox.alert( data.msg ); });
		
	});
	
	//판매기종이 선택되면 판매방식 가져오기
	$("#deviceTypeList").change(function(){
		var $this = $(this);
		if($this.val() == 0) {
			return false;
		}
		
		var companyMgmtno = $("#saleCompanyList").find("option").filter(":selected").val();
		var saleType = $("#deviceTypeList").find("option").filter(":selected").val();
		
		var url = '<spring:eval expression="@urlProp['ajaxBalanceSaleContractType']"/>';
		var param = { company_mgmtno : companyMgmtno, sale_type : saleType };
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
    // The string containing the format items (e.g. "{0}")
    // will and always has to be the first argument.
    var theString = arguments[0];
    
    // start with the second argument (i = 1)
    for (var i = 1; i < arguments.length; i++) {
        // "gm" = RegEx options for Global search (more than one instance)
        // and for Multiline search
        var regEx = new RegExp("\\{" + (i - 1) + "\\}", "gm");
        theString = theString.replace(regEx, arguments[i]);
    }
    
    return theString;
}
	
});
</script>