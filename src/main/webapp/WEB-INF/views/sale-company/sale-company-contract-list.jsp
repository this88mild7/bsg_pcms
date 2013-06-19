<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="page-name">
	<h3>
		<img src='<spring:eval expression="@urlProp['star']"/>'> 판매 계약 리스트
		<small>&gt;&gt; 판매처와의 계약을 관리화면입니다.</small>
	</h3>
</div>
<div class="row-fluid product-box" data-json='${ jsonStr }'>

	<div class="pull-right">
		<div class="btn-group">
			<a id="search-toggle" class="btn dropdown-toggle" data-toggle="dropdown" href="#"><span>전체</span><span class="caret"></span></a>
			<ul id="search-menu" class="dropdown-menu">
				<li><a href="#">전체</a></li>
				<li><a href="#">판매처명</a></li>
			</ul>
		</div>
		<div class="input-append">
			<form class="no-margin-bottom" id="search-form" action="<spring:eval expression="@urlProp['saleCompanyContractSearchAction']"/>">
				<input type="hidden" id="searchType" name="searchType" value="전체">			
				<input class="inputError" type="text" id="searchQuery" name="searchQuery" class="input-medium" >
				<button id="btn-search" class="btn" type="button"><i class="icon-search"></i></button>
			</form>
		</div>
	</div>
	
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th><input class="check-all" type="checkbox" name="checkbox_all" value="false" data-toggle="tooltip"></th>
				<th>계약코드</th>
				<th>판매방식</th>
				<th>판매형태</th>
				<th>판매처</th>
				<th>상품명</th>
				<th>등록일</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody id="productBody">
				<c:choose>
					<c:when test="${fn:length(saleContractList) > 0}">
						<c:forEach items="${saleContractList}" var="contract">
							<c:forEach items="${contract.contentsList}" var="contractContent" varStatus="roop">
								<tr>
								<c:choose>
									<c:when test="${roop.index == 0}">
										<td rowspan="${contract.contents_count}"><input type="checkbox" name="check_list" data-contract_mgmtno="${contract.contract_mgmtno }" ></td>						
										<td rowspan="${contract.contents_count}">${contract.contract_mgmtno }</td>						
										<td rowspan="${contract.contents_count}">${contract.contract_type }</td>						
										<td rowspan="${contract.contents_count}">${contract.sale_type }</td>						
										<td rowspan="${contract.contents_count}">${contract.company_name }</td>						
										<td>${contractContent.name }</td>		
										<td rowspan="${contract.contents_count}">${contract.reg_dt }</td>				
										<td rowspan="${contract.contents_count}">		
											<button class='btn btn-url' data-url="<spring:eval expression="@urlProp['saleCompanyContractDetail']"/>?contract_mgmtno=${contract.contract_mgmtno }">상세보기</button>
										</td>						
									</c:when>
									<c:otherwise>
											<td>${contractContent.name }</td>		
									</c:otherwise>
								</c:choose>
								</tr>
							</c:forEach>
						</c:forEach>
					</c:when>
				</c:choose>
		
			<!-- json parse -->
		</tbody>
	</table>
	
	
	
	<div class="clearfix">
		<p class="pull-right">
			<button id="btn-selected-delete" class="btn">선택삭제</button>
			<button id="btn-registe" class="btn btn-primary" data-url="<spring:eval expression="@urlProp['saleCompanyContractCreate']"/>">판매 계약 등록</button>
		</p>
	</div>
	
	<form id="deleteContractForm" action="<spring:eval expression="@urlProp['saleCompanyContractDeleteAction']"/>" method="POST">
		
	</form>
	
</div>
<!--/row-->
<script>
$(function(){
	
	// 검색종류 클릭한 글자로 변경.
	$("#search-menu").find("a").click(function(){
		$("#search-toggle span" ).first().text( $(this).text() );
		$("#searchType").val($(this).text());
	});
	
	$("#btn-registe").click(function(){
		var $this = $("#btn-registe");
		window.location = $this.attr("data-url");
	});
	
	$("#btn-search").click(function(){
		$("#search-form").submit();
	});
	
	
	$("#btn-selected-delete").click(function(){
		// 체크박스 폼 체크
		var $checkboxArray = $( "input[name='check_list']:checked" );
		
		var $deleteForm = $("#deleteContractForm");
		$deleteForm.empty();
		
		if( $checkboxArray.length === 0 ){
			bootbox.alert("삭제할 판매상품을 선택해주세요.");
		} else {
			bootbox.confirm( "선택한 판매상품을 삭제하시겠습니까?", function(deleteOk) {
				if( deleteOk ) {
					$.each( $checkboxArray, function(idx){
						$deleteForm.append('<input type="hidden" name="contract_mgmtno" value='+$(this).data("contract_mgmtno")+ ' />');
					});
					$("#deleteContractForm").submit();
				}
			});
		}//else
	});
});
</script>