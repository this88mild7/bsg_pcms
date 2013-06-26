<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
			<c:if test="${empty isNew}">
				<input type="hidden" name="contents_cd" value="${ content.contents_cd }" />
			</c:if>
			<div class="control-group">
				<label class="control-label" for="name"><img src='<spring:eval expression="@urlProp['v']"/>'> 판매처</label>
				<div class="controls">
					<select size="1" id="company_mgmtno" name="company_mgmtno" data-cnt="${ fn:length( cpList ) }">
						<c:forEach items="${cpList}" var="cp">
							<option value="${ cp.company_mgmtno }">${cp.company_name}</option>
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
					<a id="tip3" href="#" data-toggle="tooltip" >tip</a>
					<script>
					$('#tip3')
						.tooltip({
							"title":"해당 업체의 판매기간을 설정해 주세요.",
							"placement":"bottom"
						});
					</script>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" ><img src='<spring:eval expression="@urlProp['v']"/>'> 상품</label>
				<div class="controls">
					<button id="btn-sale-content-list" class="btn">매출 상품등록</button>
					<a id="contentListTip" href="#" data-toggle="tooltip" >tip</a>
					<script>
					$('#contentListTip')
						.tooltip({
							"title":"판매된 상품을 정확하게 입력해 주세요.",
							"placement":"bottom"
						});
					</script>
				</div>
			</div>
			<div class="control-group">
				매출계산: 49,500,000(총 매출금액) - 0(판매처 수수료) - 24,502,500(업체 수수료)
				<br />
				최종 자사 수익 : 24,502,500
			</div>
		</form>
			<div class="control-group">
				<label class="control-label" ></label>
				<div class="controls">
					<button id="btn-content-list" class="btn">목록가기</button>
					<c:choose>
						<c:when test="${empty isNew}">
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

});
</script>