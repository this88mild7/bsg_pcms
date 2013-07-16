<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page-name">
	<h4>
		<img src='<spring:eval expression="@urlProp['star']"/>'> 업체 정산현황
		<small>&gt;&gt; 업체 정산현황 리스트</small>
	</h4>
</div>

<div class="row-fluid box" data-query="${ search.searchQuery }" data-date="${ search.searchDate }" data-sort="${ search.sortingType }">

	<div class="span12">
		
		<!-- 
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
				<form class="no-margin-bottom" id="contentSearchForm" action="<spring:eval expression="@urlProp['balanceCpList']"/>">
					<input type="hidden" id="sortingType" name="sortingType" value="1">
					<input type="hidden" id="searchDate" name="searchDate" >
					<input type="text" id="searchQuery" name="searchQuery" class="input-medium"  value="${ search.searchQuery }" placeholder="검색어">
					<button id="btn-content-search-form" class="btn" type="button"><i class="icon-search"></i></button>
				</form>
			</div>
		</div>
		 -->
		
		<div class="span3">
			<span>출력순</span>
			<select id="sortingTypeList" name="sortingType" class="mt10 span6">
				<option>선택</option>
				<option value="1">정산월</option>
				<option value="2">매출순</option>
			</select>
		</div>
		<div class="span6">
			기간설정
			<select class="mt10 span3" id="searchYear">
				<option value="0000">선택</option>
				<option value="2013">2013년</option>
			</select>
			<select class="mt10 span3" id="searchMonth">
				<option value="00">선택</option>
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
		</div>
		<div class="span3">
			<div class="input-append pull-right mt10">
				<form class="no-margin-bottom" id="contentSearchForm" action="<spring:eval expression="@urlProp['balanceCpList']"/>">
					<input type="hidden" id="sortingType" name="sortingType" value="1">
					<input type="hidden" id="searchDate" name="searchDate" >
					<input type="text" id="searchQuery" name="searchQuery" class="input-medium"  value="${ search.searchQuery }" placeholder="검색어">
					<button id="btn-content-search-form" class="btn" type="button"><i class="icon-search"></i></button>
				</form>
			</div>
		</div>
		<br />
		
		<table class="table table-striped table-hover">
		<tr>
			<th>정산월</th>
			<th>업체명</th>
			<th>계약조건</th>
			<th>총매출금액</th>
			<th>수수료</th>
			<th>등록일</th>
		</tr>
		<c:forEach items="${ balanceList }" var="balance">
		<tr>
			<td>${ balance.sale_str_date } 
			</td>
			<td>${ balance.company_name }</td>
			<td>${ balance.contract_type }</td>
			<td class="price">${ balance.totalMoney }</td>
			<td class="price">${ balance.cpMoney }</td>
			<td>${ balance.reg_dt }</td>
		</tr>
		</c:forEach>
		</table>
		
		<c:if test="${ not empty pageLink }">
		<div class="pagination pagination-centered">
			<ul>
				<c:if test="${ 0 ne pageLink.pagePrev }">
				<li><a href="<spring:eval expression="@urlProp['balanceCpList']"/>?pageNum=${ pageLink.pagePrev }${ empty search.search? '' : search.search }">Prev</a></li>
				</c:if>
				<c:forEach items="${ pageLink.pageList }" var="page" >
				<li data-page-num="${ page.pageNum }"><a href="<spring:eval expression="@urlProp['balanceCpList']"/>?pageNum=${ page.pageNum }${ empty search.search? '' : search.search }">${ page.pageNum }</a></li>
				</c:forEach>
				<c:if test="${ 0 ne pageLink.pageNext }">
				<li><a href="<spring:eval expression="@urlProp['balanceCpList']"/>?pageNum=${ pageLink.pageNext }${ empty search.search? '' : search.search }">Next</a></li>
				</c:if>
			</ul>
		</div>
		</c:if>

	</div>
	
	<form id="hiddenForm" action="<spring:eval expression="@urlProp['contentDeleteAction']"/>" method="POST">
		<input type="hidden" name="strList" id="strList"/>
	</form>
	
</div>
<!--/row-->
<script>
$(function(){
	
	//가격에 ,(콤마) 넣어주기
	$('.price').autoNumeric("init",{aPad: false, aSign: " 원", pSign: "s" });

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