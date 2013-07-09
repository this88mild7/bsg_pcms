<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="page-name">
	<h4>
		<img src='<spring:eval expression="@urlProp['star']"/>'> 판매 정산현황
		<small>&gt;&gt; 판매 정산현황 리스트</small>
	</h4>
</div>

<div class="row-fluid box" data-query="${ search.searchQuery }" data-date="${ search.searchDate }" data-sort="${ search.sortingType }">

	<div class="span12">
		
		<div>
			<span class="">
				<span>출력순</span>
				<select id="sortingTypeList" name="sortingType" class="span2">
					<option value="1">정산월</option>
					<option value="2">매출순</option>
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
					<input type="hidden" id="sortingType" name="sortingType" value="1">
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
	
	{//엘리먼트 이벤트
		$("#btn-content-search-form").click(function() {
			$("#contentSearchForm").submit();
		});
		
		//출력순 변경에 따른 검색 hidden값 변경(기본값:1)
		$("#sortingTypeList").change(function() {
			$("#sortingType").val( $(this).val() );
		});
		
		//검색시 searchDate 변경. 예)2013-07 로 변경
		$("#contentSearchForm").submit(function() {
			$("#searchDate").val( $("#searchYear").val() + "-" + $("#searchMonth").val() );
		});
		
		//검색어 입력후 ENTER키 입력하면 검색하기
		$('#searchQuery').keyup(function( event ) {
			if( event.which == 13 ) {
				$("#btn-content-search-form").trigger("click");
			}
		});
	}
	
	{//검색값 체크
		var boxData = $("div.box").data();
		
		//출력순 선택
		if( $(boxData.sort).length > 0 ) {
			$("#sortingType").val( boxData.sort );
			$("#sortingTypeList").find("option[value='" + boxData.sort + "']").prop("selected", true);
		}
		//년/월 선택
		if( boxData.date.length > 0 ) {
			var arr = boxData.date.split("-");
			var year = arr[0];
			var month = arr[1];
			$("#searchYear").find("option[value='" + year + "']").prop("selected", true);
			$("#searchMonth").find("option[value='" + month + "']").prop("selected", true);
		}
		//검색어 있다면 검색창에 넣어주기
		if( boxData.query.length > 0 ) {
			$("#searchQuery").val( boxData.query );
		}
	}

});
</script>