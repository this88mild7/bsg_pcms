<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page-name">
	<h4>
		<c:choose>
			<c:when test="${empty isNew}">
				[${ cp.company_name }] 상세정보
			</c:when>
			<c:otherwise>
				CP 업체등록 <small>&gt;&gt; CP 업체를 등록해 주세요.</small>
			</c:otherwise>
		</c:choose>
	</h4>
</div>

<div class="row-fluid cp-box">

	<div class="span12">
		
		<form id="cpForm" class="form-horizontal " method="POST" action="<spring:eval expression="@urlProp['cpCreateAction']"/>">
			<c:if test="${empty isNew}">
				<input type="hidden" name="company_mgmtno" value="${ cp.company_mgmtno }" />
			</c:if>
			<div class="control-group">
				<label class="control-label" for="company_name"><img src='<spring:eval expression="@urlProp['v']"/>'> 회사명</label>
				<div class="controls">
					<input type="text" id="company_name" name="company_name" placeholder="회사명" value="${ cp.company_name }" class="input-xlarge" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="company_no">사업자등록번호</label>
				<div class="controls">
					<input type="text" id="company_no" name="company_no" placeholder="사업자등록번호" value="${ cp.company_no }" class="input-xlarge" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="phoneno"><img src='<spring:eval expression="@urlProp['v']"/>'> 연락처</label>
				<div class="controls">
					<input type="text" id="phoneno" name="phoneno" placeholder="연락처" value="${ cp.phoneno }" class="input-xlarge" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="addr">주소</label>
				<div class="controls">
					<input type="text" id="addr" name="addr" placeholder="주소" class="input-xxlarge" value="${ cp.addr }" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="master">담당자</label>
				<div class="controls">
					<input type="text" id="master" name="master" placeholder="담당자" class="input-xlarge" value="${ cp.master }" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="master_email">담당자 이메일</label>
				<div class="controls">
					<input type="text" id="master_email" name="master_email" placeholder="이메일" class="input-xlarge" value="${ cp.master_email }" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="master_phoneno">담당자 연락처</label>
				<div class="controls">
					<input type="text" id="master_phoneno" name="master_phoneno" placeholder="이메일" class="input-xlarge" value="${ cp.master_phoneno }" />
				</div>
			</div>
		</form>
			<div class="control-group">
				<label class="control-label" ></label>
				<div class="controls">
					<button id="btn-cp-list" class="btn">목록가기</button>
					<c:choose>
						<c:when test="${empty isNew}">
							<button id="btn-cp-delete-action" class="btn">삭제</button>
							<button id="btn-cp-update-action" class="btn btn-primary">수정하기</button>
						</c:when>
						<c:otherwise>
							<button id="btn-cp-create-action" class="btn btn-primary">등록하기</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			

	</div>
	
</div>
<!--/row-->
<script>
$(function(){
	
	//목록가기 버튼
	$("#btn-cp-list").click(function(){
		bootbox.confirm("화면에서 빠져 나가시겠습니까?", function(result) {
			if(result) {
				history.back(-1);
			}
		}); 
	});
	//삭제 버튼
	$("#btn-cp-delete-action").click(function(){
		bootbox.confirm( "삭제하시겠습니까?", function(result) {
			if( result ){
				window.location.href = '<spring:eval expression="@urlProp['cpDeleteAction']"/>?strList=' + ${ cp.company_mgmtno } + "";
			};
		});  
	});
	//등록가기 버튼
	$("#btn-cp-create-action").click(function(){
		bootbox.confirm( "등록 하시겠습니까?", function(result) {
			if( result ){
				$("#cpForm" ).submit();
			}
		}); 
	});
	//업데이트 버튼
	$("#btn-cp-update-action").click(function(){
		bootbox.confirm( "업데이트 하시겠습니까?", function(result) {
			if( result ){
				$( "#cpForm" )
					.attr("action", '<spring:eval expression="@urlProp['cpUpdateAction']"/>')
					.submit();
			}
		});  
	});
			
	// 유효성 체크
	cpValidation();
	
	function cpValidation() {
		$("#cpForm").validate({
			rules: {
				company_name: {
					required: true,
				},
				phoneno: {
					required: true,
				},
				cp_master_email:{
					//email: true
				}
			},
			messages: {
				company_name: {
					required: "&nbsp;",
				},
				phoneno: {
					required: "&nbsp;",
				},
				cp_master_email: "email 형식에 맞게 넣어주세요."
			},
			// the errorPlacement has to take the table layout into account
			errorPlacement: function(error, element) {
				if ( element.is(":radio") )
					error.appendTo( element.parent().next().next() );
				else if ( element.is(":checkbox") )
					error.appendTo ( element.next() );
				else {
					error.appendTo( element.next() );
					//element.after( error );
					$( element )
						//.attr( "placeholder", $( error ).text() )
						//.after( $( error ).text() )
						.parent().parent()
						.addClass( "error" );
					
				}
			},
			success: function(label, element) {
				// set &nbsp; as text for IE
				label.html("&nbsp;").addClass("checked");
				$(element).parent().parent().removeClass( "error" );
			},
			highlight: function(element, errorClass) {
				$(element).parent().next().find("." + errorClass).removeClass("checked");
			}
		});
	}
	
});
</script>