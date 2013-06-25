<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page-name">
	<h3>
		<img src='<spring:eval expression="@urlProp['star']"/>'> 판매 정산현황
		<small>&gt;&gt; 판매 정산현황 리스트</small>
	</h3>
</div>

<div class="row-fluid box" data-query="${ search.query }" data-type="${ search.type }">

	<div class="span12">
		
		<div>
			출력순
			<select id="sorting-type-select" class="span2" name="sorting_type">
				<option value="1" <c:if test="${sorting_type eq '1' }">selected="selected"</c:if> >등록순</option>
				<option value="2" <c:if test="${sorting_type eq '2' }">selected="selected"</c:if> >매출순</option>
				<option value="3" <c:if test="${sorting_type eq '3' }">selected="selected"</c:if> >수익수</option>
				<option value="4" <c:if test="${sorting_type eq '4' }">selected="selected"</c:if> >판매량</option>
				
			</select>
			기간설정
			<select class="span2">
				<option>이번달</option>
				<option>지난달</option>
				<option>이번주</option>
				<option>지난주</option>
			</select>
			<input id="search-str-date" type="text" class="span2" /> - <input id="search-end-date" type="text" class="span2" />
			<div class="input-append">
				<form class="no-margin-bottom" id="contentSearchForm" action="<spring:eval expression="@urlProp['balanceSaleSearch']"/>">
					<input type="text" id="searchQuery" name="searchQuery" class="input-medium"  value="${ search.query }">
					<input type="hidden" id="sortingType" name="sortingType" >
					<input type="hidden" id="searchStrDate" name="searchStrDate" >
					<input type="hidden" id="searchEndDate" name="searchEndDate" >
					<button id="btn-content-search-form" class="btn" type="button"><i class="icon-search"></i></button>
				</form>
			</div>
		</div>
		<table class="table table-striped table-hover">
		<tr>
			<th>판매처</th>
			<th>상품</th>
			<th>판매방식</th>
			<th>기기</th>
			<th>판매횟수</th>
			<th>총매출금액</th>
			<th>판매업체수수료</th>
			<th>빅스타수익률</th>
			<th>에듀앤조이수익률</th>
			<th>업체수수료</th>
			<th>수익</th>
		</tr>
		<c:forEach items="${ balanceList }" var="balance">
		<tr>
			<td>${ balance.company_name }</td>
			<td>${ balance.contents_name }</td>
			<td>${ balance.contract_type }</td>
			<td>${ balance.sale_type }</td>
			<td>${ balance.total_sale_count } </td>
			<td>${ balance.total_sale_price }</td>
			<td>${ balance.sale_commission }</td>
			<td>${ balance.cp_commission }</td>
			<td>${ balance.cp_commission }</td>
			<td>${ balance.cp_commission }</td>
			<td>${ balance.owner_profit }</td>
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
				<li><a href="<spring:eval expression="@urlProp['contentList']"/>?pageNum=${ pageLink.pagePrev }${ empty search.search? '' : search.search }">Prev</a></li>
				</c:if>
				<c:forEach items="${ pageLink.pageList }" var="page" >
				<li data-page-num="${ page.pageNum }"><a href="<spring:eval expression="@urlProp['contentList']"/>?pageNum=${ page.pageNum }${ empty search.search? '' : search.search }">${ page.pageNum }</a></li>
				</c:forEach>
				<c:if test="${ 0 ne pageLink.pageNext }">
				<li><a href="<spring:eval expression="@urlProp['contentList']"/>?pageNum=${ pageLink.pageNext }${ empty search.search? '' : search.search }">Next</a></li>
				</c:if>
			</ul>
		</div>
		</c:if>

	</div>
	
</div>
<!--/row-->
<script>

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

</script>