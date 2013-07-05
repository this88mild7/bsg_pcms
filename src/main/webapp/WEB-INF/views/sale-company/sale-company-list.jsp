<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page-name">
	<h4>
		<img src='<spring:eval expression="@urlProp['star']"/>'> 판매처 리스트
		<small>&gt;&gt; 빅스타 글로벌의 상품을 판매하는 업체 화면입니다.</small>
	</h4>
</div>

<div class="row-fluid customer-box">
	<div class="span12">
		<div class="pull-right">
			<div class="btn-group">
				<a id="search-toggle" class="btn dropdown-toggle" data-toggle="dropdown" href="#"><span>전체</span><span class="caret"></span></a>
				<ul id="search-menu" class="dropdown-menu">
					<li><a href="#">전체</a></li>
					<li><a href="#">판매처명</a></li>
				</ul>
			</div>
			<div class="input-append">
				<form class="no-margin-bottom" id="search-form" action="<spring:eval expression="@urlProp['saleCompanyList']"/>">
					<input type="hidden" id="searchType" name="searchType" value="전체">			
					<input class="inputError" type="text" id="searchQuery" name="searchQuery" class="input-medium" value="${ salCompany.query }">
					<button id="btn-search" class="btn" type="button"><i class="icon-search"></i></button>
				</form>
			</div>
		</div>
			
		<table class="table table-striped table-hover">
			<tr>
				<th><input class="check-all" type="checkbox" name="checkbox_all" value="false" data-toggle="tooltip"></th>
				<th>판매처 코드</th>
				<th>판매처명</th>
				<th>등록날짜</th>
				<th>연락처</th>
				<th>상세보기</th>
			</tr>
			<c:forEach items="${salCompanyList}" var="salCompany">
		        <tr>
		        	<td><input type="checkbox" name="check_list" value="${ salCompany.company_mgmtno }"></td>
		   	    	<td>${ salCompany.company_mgmtno }</td>
		   	    	<td>${ salCompany.company_name }</td>
		   	    	<td>${ salCompany.reg_dt }</td>
		   	    	<td>${ salCompany.phoneno }</td>
					<td class="span2"><button class="btn btn-url" data-url="<spring:eval expression="@urlProp['saleCompanyDetail']"/>?company_mgmtno=${ salCompany.company_mgmtno }">상세보기</button></td>
		        </tr>
			</c:forEach>
		</table>
		
		<div class="clearfix">
			<p class="pull-right">
				<button id ="btn-delete" class="btn ">선택삭제</button>
				<button class="btn btn-primary btn-url" data-url="<spring:eval expression="@urlProp['saleCompanyCreate']"/>">판매처 등록</button>
			</p>
		</div>
		
		<c:if test="${ not empty pageLink }">
		<div class="pagination pagination-centered">
			<ul>
				<c:if test="${ 0 ne pageLink.pagePrev }">
				<li><a href="<spring:eval expression="@urlProp['saleCompanyList']"/>?pageNum=${ pageLink.pagePrev }&searchQuery=${search.searchQuery}&searchType=${search.searchType}">Prev</a></li>
				</c:if>
				<c:forEach items="${ pageLink.pageList }" var="page" >
				<li data-page-num="${ page.pageNum }"><a href="<spring:eval expression="@urlProp['saleCompanyList']"/>?pageNum=${ page.pageNum }&searchQuery=${search.searchQuery}&searchType=${search.searchType}">${ page.pageNum }</a></li>
				</c:forEach>
				<c:if test="${ 0 ne pageLink.pageNext }">
				<li><a href="<spring:eval expression="@urlProp['saleCompanyList']"/>?pageNum=${ pageLink.pageNext }&searchQuery=${search.searchQuery}&searchType=${search.searchType}">Next</a></li>
				</c:if>
			</ul>
		</div>
		</c:if>
		
		<form id="deleteForm" action="<spring:eval expression="@urlProp['saleCompanyDeleteAction']"/>" method="POST">
		</form>
	</div>
</div>
<!--/row-->

<script>
$(function(){
	
	// 검색종류 클릭한 글자로 변경.
	$("#search-menu").find("a").click(function(){
		$("#search-toggle span" ).first().text( $(this).text() );
		$("#searchType").val($(this).text());
	});
	
	// 검색 버튼 이벤트
	$("#btn-search").click(function(){
		$( "#search-form" ).submit();
	});

	// 삭제 버튼 이벤트
	$("#btn-delete").click(function(){
		// 체크박스 폼 체크
		var $checkboxArray = $( "input[name='check_list']:checked" );
		
		$("#deleteForm").empty();
		
		
		$checkboxArray.each( function(index) {
			console.info($(this).val());
			$("#deleteForm").append('<input type="hidden" name="deleteCompany" value='+$(this).val()+' />');
		});
		
		if( $checkboxArray.length === 0 ){
			bootbox.alert("삭제할 판매업체를 선택해주세요.");
		} else {
			bootbox.confirm( "선택한 판매업체를 삭제하시겠습니까?", function(result) {
				if( result ) {
					$("#deleteForm").submit();
				}
			}); 
		}
	});

});
</script>