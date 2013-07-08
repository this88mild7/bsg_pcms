<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="page-name">
	<h4>
		<img src='<spring:eval expression="@urlProp['star']"/>'> 판매 정산현황
		<small>&gt;&gt; 판매 정산현황 리스트</small>
	</h4>
</div>

<div class="row-fluid box" data-query="${ search.query }" data-type="${ search.type }">

	<div class="span12">
		
		<div>
			<span class="">
				<span>출력순</span>
				<select id="sorting_type" name="sortingType" class="span2">
					<option value="1" <c:if test="${sortingType eq '1' }">selected="selected"</c:if> >정산월</option>
					<option value="2" <c:if test="${sortingType eq '2' }">selected="selected"</c:if> >매출순</option>
				</select>
			</span>
			<span class="ml mr">
				기간설정
				<select class="span2 push" id="searchYear">
					<option value="2013">2013년</option>
				</select>
				<select class="span2 push" id="searchMonth">
					<option value="01">1월</option>
					<option value="02">2월</option>
					<option value="03">3월</option>
					<option value="04">4월</option>
					<option value="05">5월</option>
					<option value="06">6월</option>
					<option value="07">7월</option>
					<option value="08">8월</option>
					<option value="09">9월</option>
					<option value="10">10월</option>
					<option value="11">11월</option>
					<option value="12">12월</option>
				</select>
			</span>
			<div class="input-append">
				<form class="no-margin-bottom" id="contentSearchForm" action="<spring:eval expression="@urlProp['balanceSaleList']"/>">
					<input type="hidden" id="searchDate" name="searchDate" >
					<input type="text" id="searchQuery" name="searchQuery" class="input-medium"  value="${ search.searchQuery }" placeholder="검색어">
					<button id="btn-content-search-form" class="btn" type="button"><i class="icon-search"></i></button>
				</form>
			</div>
		</div>
		<table class="table table-striped table-hover">
		<tr>
			<th>정산월</th>
			<th>판매처</th>
			<th>상품</th>
			<th>판매횟수</th>
			<th>총매출금액</th>
			<th>판매업체수수료</th>
			<!-- 
			<th>빅스타수익률</th>
			<th>에듀앤조이수익률</th>
			 -->
			<th>업체수수료</th>
			<th>자사수익</th>
		</tr>
		<c:forEach items="${ balanceList }" var="balance">
		<tr>
			<td>${ balance.sale_str_date }월</td>
			<td>${ balance.company_name }</td>
			<td>${ balance.contents_name }</td>
			<td class="count">${ balance.total_sale_count } </td>
			<td class="price">${ balance.totalMoney }</td>
			<td class="price">${ balance.saleMoney }</td>
			<td class="price">${ balance.cpMoney }</td>
			<!-- 
			<td>${ balance.cp_commission }</td>
			<td>${ balance.cp_commission }</td>
			 -->
			<td class="price">${ balance.ownerMoney }</td>
		</tr>
		</c:forEach>
		</table>
		<div class="clearfix">
			<p class="pull-right">
				<button class="btn btn-primary btn-url" data-url="<spring:eval expression="@urlProp['balanceSaleInfo']"/>">매출입력</button>
			</p>
		</div>
		
		<c:if test="${ not empty pageLink }">
		<div class="pagination pagination-centered">
			<ul>
				<c:if test="${ 0 ne pageLink.pagePrev }">
				<li><a href="<spring:eval expression="@urlProp['balanceSaleList']"/>?pageNum=${ pageLink.pagePrev }${ empty search.search? '' : search.search }">Prev</a></li>
				</c:if>
				<c:forEach items="${ pageLink.pageList }" var="page" >
				<li data-page-num="${ page.pageNum }"><a href="<spring:eval expression="@urlProp['balanceSaleList']"/>?pageNum=${ page.pageNum }${ empty search.search? '' : search.search }">${ page.pageNum }</a></li>
				</c:forEach>
				<c:if test="${ 0 ne pageLink.pageNext }">
				<li><a href="<spring:eval expression="@urlProp['balanceSaleList']"/>?pageNum=${ pageLink.pageNext }${ empty search.search? '' : search.search }">Next</a></li>
				</c:if>
			</ul>
		</div>
		</c:if>

	</div>
	
</div>
<!--/row-->
<script>
$(function(){
	
	//가격에 ,(콤마) 넣어주기
	$('.price').autoNumeric("init",{aPad: false, aSign: " 원", pSign: "s" });
	$('.count').autoNumeric("init",{aPad: false, aSign: " 건", pSign: "s" });
	
$("#btn-content-search-form").click(function(){
	$("#sorting_type").val($("#sorting-type-select").val());
	$("#searchStrDate").val($("#search-str-date").val());
	$("#searchEndDate").val($("#search-end-date").val());
	$("#contentSearchForm").submit();
});

$("#btn-content-search-form").change(function(){
	$("#sorting_type").val($("#sorting-type-select").val());
	$("#balance-sorting").submit();
});

//검색종류 클릭한 글자로 변경.
$("ul.dropdown-menu").find("a").click(function(){
	$("a.dropdown-toggle span" ).first().text( $(this).text() );
});

// null일때 length에러 나서 &&문 처리하였음.
if( $("div.box").data("type") != null && 0 < $("div.box").data("type").length ) {
	$("a.dropdown-toggle").find("span").first().text( $("div.box").data("type") );
}

// Enter키로 눌러서 검색시 type넣어주기
$("#contentSearchForm").submit(function() {
	var typeText = $("a.dropdown-toggle").find("span").first().text();
	$("#type").val(typeText);
    return true;
});

$("#btn-content-search-form").click(function(){
	//현재 선택된 type
	var typeText = $("a.dropdown-toggle").find("span").first().text();
	$("#type").val(typeText);
	$("#contentSearchForm").submit();
});
	

//컨텐츠 삭제
$("#btn-content-selected-delete").click(function(){
	// 체크된 컨텐츠 리스트
	var $checkedContentList = $("input[name='check_list']").filter(":checked");
	
	if( $checkedContentList.length === 0 ){
		bootbox.alert("삭제할 콘텐츠를 선택해주세요.");
	} else {
		bootbox.confirm( "선택한 콘텐츠를 삭제하시겠습니까?", function(result) {
			if( result ) {
				var contentCd = "";
				$.each( $checkedContentList, function(idx){
					if( idx > 0 ) {
						contentCd += ",";
					}
					contentCd += $(this).val();
				});
				
				$("#strList").val(contentCd);
				$("#hiddenForm").submit();
			}
		}); 
	}
});


function dataSortingCallBack(response){
	var $balanceTable = $("#balance-table");
	$balanceTable.empty();
	$balanceTable.html(response);
}

function dataSortingError(response){
	alert("에러 발생! 관리자에게 문의하여 주십시오.");
}

});
</script>