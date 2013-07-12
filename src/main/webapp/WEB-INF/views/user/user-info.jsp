<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page-name">
	<h4>
		회원 정보수정 <small>&gt;&gt; 정보를 수정할 수 있습니다.</small>
	</h4>
</div>

<br />
<br />

<form id="joinForm" method="POST" action='<spring:eval expression="@urlProp['userUpdateAction']"/>' class="form-horizontal form-signin">
	<div class="row-fluid">
		<div class="control-group id-group">
			<label class="control-label" for="id"><img src='<spring:eval expression="@urlProp['v']"/>'> 아이디</label>
			<div class="controls">
				<input type="hidden" id="id" name="id" value="${ user.id }" />
				<span class="uneditable-input input-xlarge">${ user.id }</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="name"><img src='<spring:eval expression="@urlProp['v']"/>'> 이름</label>
			<div class="controls">
				<input type="text" id="name" name="name" placeholder="이름" value="${ user.name }" class="input-xlarge" data-validation-required-message="이름을 입력해 주세요." required />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="team"><img src='<spring:eval expression="@urlProp['v']"/>'> 부서</label>
			<div class="controls">
				<input type="text" id="team" name="team" placeholder="부서" value="${ user.team }" class="input-xlarge" data-validation-required-message="부서를 입력해 주세요." required />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="title"><img src='<spring:eval expression="@urlProp['v']"/>'> 직급</label>
			<div class="controls">
				<input type="text" id="title" name="title" placeholder="직급" value="${ user.title }" class="input-xlarge" data-validation-required-message="직급을 입력해 주세요." required />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="pwd"><img src='<spring:eval expression="@urlProp['v']"/>'> 비밀번호 변경</label>
			<div class="controls">
				<input type="password" id="pwd" name="pwd" placeholder="비밀번호" value="" class="input-xlarge" required />
			</div>
		</div>
		<div class="control-group pwd-group">
			<label class="control-label" for="rePwd"><img src='<spring:eval expression="@urlProp['v']"/>'> 비밀번호 확인</label>
			<div class="controls">
				<input type="password" id="rePwd" name="rePwd" placeholder="비밀번호 확인" value="" class="input-xlarge" required />
				<ul id="pwdCheckResult"></ul>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" ></label>
			<div class="controls">
				<button type="button" id="btnCancel" class="btn">돌아가기</button>
				<button type="button" id="btnUpdate" class="btn btn-primary">수정하기</button>
			</div>
		</div>
	</div>
	<input type="hidden" id="isValidOk" name="isValidOk" value="0" />
</form>
		
<script>
$(function(){
	
	//유효성 체크
	$("input").not("[type=submit]").jqBootstrapValidation();
	
	$("#joinForm").submit(function(){
		if( $("#isValidOk").val() < 1) {
			bootbox.alert("올바르지 않은 값이 있습니다.");
			return false;
		}	
	});
	
	$("#btnUpdate").click(function(event) {
		event.preventDefault();
		$("#joinForm").submit();
	});
	
	$("#btnCancel").click(function(event) {
		event.preventDefault();
		window.history.go(-1);
	});
	
	//비밀번호 재확인
	$("#rePwd").keyup(function(){
		var $this = $(this);
		
		if( $this.val() != $("#pwd").val() ) {
			$(".pwd-group").addClass("error");
			$("#pwdCheckResult")
				.html("")
				.append("<li>입력한 비밀번호랑 맞지 않습니다.</li>")
				.css("color", "#b94a48");
			$("#isValidOk").val(0);
		} else {
			$(".pwd-group").removeClass("error");
			$("#pwdCheckResult").html("");
			$("#isValidOk").val(1);
		}
	});
	
});
</script>