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
		<c:choose>
			<c:when test="${viewType eq 1 }">
				<form class="form-horizontal" id="registeForm" method="POST" action="<spring:eval expression="@urlProp['saleCompanyCreateAction']"/>">
			</c:when>
			<c:otherwise>
				<form class="form-horizontal" id="registeForm" method="POST" action="<spring:eval expression="@urlProp['saleCompanyUpdateAction']"/>">
					<input type="hidden" name="company_mgmtno" value="${ saleCompany.company_mgmtno }"/>
			</c:otherwise>
		</c:choose>
			<div class="control-group">
				<label class="control-label" for="customer_name"><img src='<spring:eval expression="@urlProp['v']"/>'> 회사명</label>
				<div class="controls">
					<input type="text" id="customer_name" name="company_name" placeholder="회사명" value="${ saleCompany.company_name }" data-validation-required-message="회사명은 필수 값입니다." required>
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
					<input type="text" id="customer_tel" name="phoneno" placeholder="연락처" value="${ saleCompany.phoneno }" data-validation-required-message="연락처는 필수 값입니다." required>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="customer_addr">주소</label>
				<div class="controls">
					<input type="text" id="customer_addr" name="addr" placeholder="주소" value="${ saleCompany.addr }">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">담당PD</label>
				<div class="controls">
					<input type="text" id="pd_name" name="pd_name" placeholder="담당PD" value="${ saleCompany.pd_name }">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="customer_master">업체담당자</label>
				<div class="controls">
					<input type="text" id="master" name="master" placeholder="업체담당자" value="${ saleCompany.master }">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="customer_master_email">업체담당자 연락처</label>
				<div class="controls">
					<input type="email" id="customer_master_email" name="master_email" placeholder="담당자 이메일" value="${ saleCompany.master_email }" data-validation-email-message="e-mail 형식이 아닙니다.">
					<input type="text" id="customer_master_email" name="master_phoneno" placeholder="전화번호" value="${ saleCompany.master_phoneno }" >
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="customer_bankname">입금은행</label>
				<div class="controls">
					<c:choose>
						<c:when test="${viewType eq 1 }">
							<select name="deposit_bank" >
								<c:forEach items="${bankList}" var="bank">
									<option value="${ bank.bank_name }">${ bank.bank_name }</option>
								</c:forEach>
							</select>
						</c:when>
						<c:otherwise>
							<input type="text" id="deposit_bank" name="deposit_bank" placeholder="입금은행" value="${saleCompany.deposit_bank}">
						</c:otherwise>
					</c:choose>
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
					<button id="btn-list" class="btn">목록가기</button>
					<c:choose>
						<c:when test="${viewType eq 1 }">
							<button id="btn-generate" class="btn btn-primary">등록하기</button>
						</c:when>
						<c:otherwise>
							<button id="btn-delete" class="btn">삭제</button>
							<button id="btn-modify" class="btn btn-primary">수정하기</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

	</div>
	
	<form id="deleteForm" action="<spring:eval expression="@urlProp['saleCompanyDeleteAction']"/>" method="POST">
		<input type="hidden" name="deleteCompany" value="${ saleCompany.company_mgmtno }"/>
	</form>
	
</div>
<!--/row-->
<script>

$(function () {
	  $("input,textarea").not("[type=submit]").jqBootstrapValidation();
	  $("#btn-generate").click(function(){
			bootbox.confirm( "등록 하시겠습니까?", function(result) {
				if( result ){
					$("#registeForm" ).submit();
				}
			}); 
		});
	  $("#btn-modify").click(function(){
			bootbox.confirm( "수정 하시겠습니까?", function(result) {
				if( result ){
					$("#registeForm" ).submit();
				}
			}); 
		});
	  $("#btn-list").click(function(){
			bootbox.confirm( "화면에서 빠져 나가시겠습니까?", function(result) {
				if( result ) {
					window.location.href = "<spring:eval expression="@urlProp['saleCompanyList']"/>";
				}
			});
			return ;
	  });
	  $("#btn-delete").click(function(){
			bootbox.confirm( "삭제하시겠습니까?", function(result) {
				if( result ) {
					$("#deleteForm").submit();
				}
			}); 
			return;
	  });
} );
</script>