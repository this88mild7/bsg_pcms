<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="page-name">
	<h4>
		<img src='<spring:eval expression="@urlProp['star']"/>'> 계약 리스트 ( ${ pageLink.totalCnt } )
		<small>&gt;&gt; 출판사 계약 상세내용을 관리하는 화면입니다.</small>
	</h4>
</div>

<div class="row-fluid box" data-query="${ search.query }" data-type="${ search.type }">

	<div class="span12">
		
		<div class="pull-right">
			<div class="btn-group">
				<a class="btn dropdown-toggle" data-toggle="dropdown" href="#"><span id="search-type">전체</span><span class="caret"></span></a>
				<ul class="dropdown-menu" id="query-list">
					<li><a href="#">전체</a></li>
					<li><a href="#">CP업체</a></li>
					<li><a href="#">시리즈</a></li>
				</ul>
			</div>
			<div class="input-append">
				<form class="no-margin-bottom" id="contractSearchForm" action="<spring:eval expression="@urlProp['contractSearch']"/>">
					<input type="hidden" id="type" name="type" >
					<input type="text" id="query" name="query" class="input-medium"  value="${ search.query }">
					<button id="btn-contract-search-form" class="btn" type="button"><i class="icon-search"></i></button>
				</form>
			</div>
		</div>

		<table class="table table-striped table-hover">
		<tr>
			<th><input class="check-all" type="checkbox" name="checkbox_all" value="false" data-toggle="tooltip"></th>
			<th>CP업체</th>
			<th>시리즈</th>
			<th>계약기간</th>
			<th>계약종류</th>
			<th>금액</th>
			<th>수익률</th>
			<th>상세보기</th>
		</tr>
		<c:forEach items="${ contractList }" var="contract">
		<tr>
			<td><input type="checkbox" name="check_list" value="${ contract.contract_mgmtno }"></td>
			<td>${ contract.company_name }</td>
			<td>${ contract.series_name }</td>
			<td>${ contract.str_date } ~ ${ contract.end_date }</td>
			<td>${ contract.contract_type }</td>
			<td class="price">${contract.sale_price}</td>
			<td class="percent">${ contract.sale_profit_rate }</td>
			<td class="span2"><button class="btn btn-url" data-url="<spring:eval expression="@urlProp['contractDetail']"/>?contract_mgmtno=${ contract.contract_mgmtno }">상세보기</button></td>
		</tr>
		</c:forEach>
		</table>
		
		<div class="clearfix">
			<p class="pull-right">
				<button id="btn-contract-selected-delete" class="btn">선택삭제</button>
				<button class="btn btn-primary btn-url" data-url="<spring:eval expression="@urlProp['contractCreate']"/>">콘텐츠 계약 등록</button>
			</p>
		</div>
		
		<c:if test="${ not empty pageLink }">
		<div class="pagination pagination-centered">
			<ul>
				<c:if test="${ 0 ne pageLink.pagePrev }">
				<li><a href="<spring:eval expression="@urlProp['contractList']"/>?pageNum=${ pageLink.pagePrev }${ empty search.search? '' : search.search }">Prev</a></li>
				</c:if>
				<c:forEach items="${ pageLink.pageList }" var="page" >
				<li data-page-num="${ page.pageNum }"><a href="<spring:eval expression="@urlProp['contractList']"/>?pageNum=${ page.pageNum }${ empty search.search? '' : search.search }">${ page.pageNum }</a></li>
				</c:forEach>
				<c:if test="${ 0 ne pageLink.pageNext }">
				<li><a href="<spring:eval expression="@urlProp['contractList']"/>?pageNum=${ pageLink.pageNext }${ empty search.search? '' : search.search }">Next</a></li>
				</c:if>
			</ul>
		</div>
		</c:if>
		
	</div>
	
	<form id="hiddenForm" action="<spring:eval expression="@urlProp['contractDeleteAction']"/>" method="POST">
		<input type="hidden" id="strList" name="strList" />
	</form>
</div>
<!--/row-->
<script>
$(function(){
	
	$("td.price").autoNumeric("init",{aPad: false, aSign: " 원", pSign: "s" });
	$("td.percent").autoNumeric("init",{aPad: false, aSign: " %", pSign: "s" });
	
	//검색종류 클릭한 글자로 변경.
	$("ul.dropdown-menu").find("a").click(function(){
		$("a.dropdown-toggle span" ).first().text( $(this).text() );
	});
	
	// null일때 length에러 나서 &&문 처리하였음.
	if( $("div.box").data("type") != null && 0 < $("div.box").data("type").length ) {
		$("a.dropdown-toggle").find("span").first().text( $("div.box").data("type") );
	}
	
	// Enter키로 눌러서 검색시 type넣어주기
	$("#contractSearchForm").submit(function() {
		var typeText = $("a.dropdown-toggle").find("span").first().text();
		$("#type").val(typeText);
	    return true;
	});
	
	//검색
	$("#btn-contract-search-form").click(function(){
		//현재 선택된 type
		var typeText = $("a.dropdown-toggle").find("span").first().text();
		$("#type").val(typeText);
		$("#contractSearchForm").submit();
	});

	//체크박스 선택 삭제
	$("#btn-contract-selected-delete").click(function(){
		// 체크박스 폼 체크
		var $checkboxArray = $( "input[name='check_list']:checked" );
		
		if( $checkboxArray.length === 0 ){
			bootbox.alert("삭제할 콘텐츠 계약을 선택해주세요.");
		} else {
			bootbox.confirm( "선택한 콘텐츠 계약을 삭제하시겠습니까?", function(result) {
				if( result ) {
					var contractList = "";
					$.each( $checkboxArray, function(idx){
						if( idx > 0 ) {
							contractList += ",";
						}
						contractList += $( this ).val();
					});
					
					$( "#strList" ).val( contractList );
					$( "#hiddenForm" ).submit();
				}
			}); 
		}
	});
	
});	
</script>