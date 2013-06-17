<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page-name">
	<h4>
		판매업체 등록
	</h4>
</div>

<div class="row-fluid customer-box">

	<div class="span12">
		
		<form class="form-horizontal" id="customerForm" method="POST" action="<spring:eval expression="@urlProp['saleCompanyCreateAction']"/>">
			<div class="control-group">
				<label class="control-label" for="customer_name"><img src='<spring:eval expression="@urlProp['v']"/>'> 회사명</label>
				<div class="controls">
					<input type="text" id="company_name" name="company_name" placeholder="회사명">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="customer_num">사업자등록번호</label>
				<div class="controls">
					<input type="text" id="company_no" name="company_no" placeholder="사업자등록번호">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="customer_tel"><img src='<spring:eval expression="@urlProp['v']"/>'> 연락처</label>
				<div class="controls">
					<input type="text" id="phoneno" name="phoneno" placeholder="연락처">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="addr">주소</label>
				<div class="controls">
					<input class="input-xxlarge" type="text" id="addr" name="addr" placeholder="주소">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="master">담당자</label>
				<div class="controls">
					<input type="text" id="master" name="master" placeholder="담당자">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="master_email">담당자 이메일</label>
				<div class="controls">
					<input type="text" id="master_email" name="master_email" placeholder="담당자 이메일">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="master_phoneno">담당자 전화번호</label>
				<div class="controls">
					<input type="text" id="master_phoneno" name="master_phoneno" placeholder="담당자 전화번호">
				</div>
			</div>
			<!-- 
			
			<div class="page-name">
				<h4>
					판매 형태 등록
				</h4>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="product_device">
					<i class="icon-plus-sign"></i>
				</label>
				<div class="controls product-device-list">
					
					<input type="hidden" name="product_type" id="product_type" />
					<div class="row-fluid product-device-form">
						<div class="span3">
							<div class="span2">os</div>
							<select class="span10" size="1" name="product_device_type">
								<option value="ios">ios</option>
								<option value="android">안드로이드</option>
								<option value="web">웹</option>
								<option value="etc">기타</option>
							</select>
						</div>
						<div class="span3">
							<div class="span3">기기명</div>
							<input class="span9" type="text" name="product_device_name" placeholder="기기명 입력">
						</div>
						<div class="span6"></div>
					</div>
					
					 product-device-form 들어올 자리 
					
				</div>
			</div>
			
			<div class="page-name">
				<h4>
					정산정보 입력
				</h4>
			</div>
			<div class="control-group">
				<label class="control-label" for="customer_balancetype"><img src='<spring:eval expression="@urlProp['v']"/>'> 정산방식</label>
				<div class="controls">
					<label class="radio inline">
						<input type="radio" name="customer_balancetype" value="1" checked>
						월정산
					</label>
					<label class="radio inline">
						<input type="radio" name="customer_balancetype" value="2" >
						연정산
					</label>
					<label class="radio inline">
						<input type="radio" name="customer_balancetype" value="0" >
						기타
					</label>
					<div class="clearfix">
						<textarea class="span10" rows="4" id="customer_balance_detail" name="contract_balance_detail" placeholder="정산방식 상세정보 입력 필수"></textarea>
					</div>
				</div>
			</div>
			 -->
			<div class="control-group">
				<label class="control-label" for="customer_bankname">입금은행</label>
				<div class="controls">
					<select name="deposit_bank" >
						<c:forEach items="${bankList}" var="bank">
							<option value="${ bank.bank_name }">${ bank.bank_name }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="customer_master">계좌번호</label>
				<div class="controls">
					<input type="text" id="customer_master" name="account_no" placeholder="계좌번호">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="customer_master">예금주</label>
				<div class="controls">
					<input type="text" id="customer_master" name="account_holder" placeholder="예금주">
				</div>
			</div>
			
		</form>
			
			<div class="control-group">
				<label class="control-label" ></label>
				<div class="controls">
					<button class="btn btn-customer-list">목록가기</button>
					<button class="btn btn-primary btn-customer-create-action">등록하기</button>
				</div>
			</div>
			
	</div>
		
</div>
<!--/row-->

<%@ include file="sale-company-script.jsp" %>	