<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	
<div class="page-name">
	<h4>
		${ saleCompany.company_name } 상세정보
	</h4>
</div>

<div class="row-fluid customer-box">

	<div class="span12">
	
		<form class="form-horizontal" id="customerForm" method="POST" action="<spring:eval expression="@urlProp['saleCompanyUpdateAction']"/>">
			<input type="hidden" name="company_mgmtno" value="${ saleCompany.company_mgmtno }"/>
			<div class="control-group">
				<label class="control-label" for="customer_name"><img src='<spring:eval expression="@urlProp['v']"/>'> 회사명</label>
				<div class="controls">
					<input type="text" id="customer_name" name="company_name" placeholder="회사명" value="${ saleCompany.company_name }">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="customer_num">사업자등록번호</label>
				<div class="controls">
					<input type="text" id="customer_num" name="company_no" placeholder="사업자등록번호" value="${ saleCompany.company_no }">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="customer_tel"><img src='<spring:eval expression="@urlProp['v']"/>'> 연락처</label>
				<div class="controls">
					<input type="text" id="customer_tel" name="phoneno" placeholder="연락처" value="${ saleCompany.phoneno }">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="customer_addr">주소</label>
				<div class="controls">
					<input type="text" id="customer_addr" name="addr" placeholder="주소" value="${ saleCompany.addr }">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="customer_master">담당자</label>
				<div class="controls">
					<input type="text" id="customer_master" name="master" placeholder="담당자" value="${ saleCompany.master }">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="customer_master_email">담당자 이메일</label>
				<div class="controls">
					<input type="text" id="customer_master_email" name="master_email" placeholder="담당자 이메일" value="${ saleCompany.master_email }">
				</div>
			</div>
			
			<!-- 정산 정보는 판매 계약시 입금 하는 걸로 하는게 현 시스템에 좋을 듯 한데..
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
					<input type="text" id="deposit_bank" name="deposit_bank" placeholder="입금은행" value="${saleCompany.deposit_bank}">
				</div>
			</div>
			<div class="control-group account-group">
				<label class="control-label" for="customer_account">계좌번호</label>
				<div class="controls">
					<input type="text" id="account_no" name="account_no" placeholder="계좌번호" value="${saleCompany.account_no }">
				</div>
			</div>
			<div class="control-group account-group">
				<label class="control-label" for="customer_account">예금주</label>
				<div class="controls">
					<input type="text" id="account_holder" name="account_holder" placeholder="예금주" value="${saleCompany.account_holder }">
				</div>
			</div>
			
		</form>
			
			<div class="control-group">
				<label class="control-label" ></label>
				<div class="controls">
					<button class="btn btn-customer-list">목록가기</button>
					<button class="btn btn-customer-delete-action">삭제</button>
					<button class="btn btn-primary btn-customer-update-action">수정하기</button>
				</div>
			</div>

	</div>
	
	<form id="deleteForm" action="<spring:eval expression="@urlProp['saleCompanyDeleteAction']"/>" method="POST">
		<input type="hidden" name="deleteCompany" value="${ saleCompany.company_mgmtno }"/>
	</form>
	
</div>
<!--/row-->
<script>
$("div.customer-box").find("button").bind( "click", function(){
	
	if( $(this).is(".btn-customer-list") ) {
		bootbox.confirm( "화면에서 빠져 나가시겠습니까?", function(result) {
			if( result ) {
				window.location.href = "<spring:eval expression="@urlProp['saleCompanyList']"/>";
			}
		});
		return ;
	}
	
	if( $(this).is(".btn-customer-delete-action") ) {
		bootbox.confirm( "삭제하시겠습니까?", function(result) {
			if( result ) {
				$("#deleteForm").submit();
			}
		}); 
		return;
	} 
	
	if( $(this).is(".btn-customer-update-action") ) {
		
		bootbox.confirm( "업데이트 하시겠습니까?", function(result) {
			if( result ) {
				$( "#customerForm" ).submit();
			}
		});
		return;
	};
});
</script>