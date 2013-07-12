<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>BIGSTAR GLOBAL</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="/css/bigstar.css" rel="stylesheet" media="screen">
<script src="http://code.jquery.com/jquery.js"></script>

<style type="text/css">
body {
	padding-top: 100px;
	background-color: #f5f5f5;
}

.form-signin {
	max-width: 500px;
	padding: 19px 29px 29px;
	margin: 0 auto 20px;
	background-color: #fff;
	border: 1px solid #e5e5e5;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
}

.form-signin .form-signin-heading,.form-signin .checkbox { margin-bottom: 10px; }
.form-signin input[type="text"],.form-signin input[type="password"] {
	font-size: 16px;
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
}
</style>
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
	
	$("#btnJoin").click(function(event) {
		event.preventDefault();
		$("#joinForm").submit();
	});
	
	$("#joinBtn").click(function(event) {
	  	event.preventDefault();
		window.location.href = "join.do";
	});
	
	//아이디 중복검사
	$("#id").keyup(function(){
		var $this = $(this);
		
		$.ajax({
			url : "<spring:eval expression="@urlProp['userAjaxGetUser']"/>",
			type : "GET",
			contentType : "text/html; charset=utf-8" ,
			data : {
				id : $this.val()
			},
			dataType : "json",
			success : function( data ) {
			console.info(data);
				if( data.code == 200 ) {
					$(".id-group").removeClass("success").addClass("error");
					$("#idCheckResult")
						.html("")
						.append("<li>이미 존재하는 아이디 입니다.</li>")
						.css("color", "#b94a48");
					$("#isValidOk").val(0);
				} else {
					$(".id-group").removeClass("error").addClass("success");
					$("#idCheckResult")
						.html("")
						.append("<li>사용 가능한 아이디 입니다.</li>")
						.css("color", "#468847");
					$("#isValidOk").val(1);
				} 
			},
			error : function() {
				$("#isValidOk").val(0);
			}
		});
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
</head>
<body>
	<div class="container">
		<form id="joinForm" method="POST" action="joinAction.do" class="form-horizontal form-signin">
			<div class="row-fluid">
				<div class="control-group">
					<label class="control-label" for="id"></label>
					<div class="controls">
						<h3>회원가입</h3>
					</div>
				</div>
				<div class="control-group id-group">
					<label class="control-label" for="id"><img src='<spring:eval expression="@urlProp['v']"/>'> 아이디</label>
					<div class="controls">
						<input type="text" id="id" name="id" placeholder="아이디" value="${ user.id }" class="input-xlarge" data-validation-required-message="아이디를 입력해 주세요." required />
						<ul id="idCheckResult"></ul>
						<div class="help-block"></div>
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
					<label class="control-label" for="pwd"><img src='<spring:eval expression="@urlProp['v']"/>'> 비밀번호</label>
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
						<c:choose>
							<c:when test="${isUpdate}">
								<button id="btnDelete" class="btn">삭제</button>
								<button id="btnUpdate" class="btn btn-primary">수정하기</button>
							</c:when>
							<c:otherwise>
								<button id="btnCalcel" class="btn">취소</button>
								<button type="button" id="btnJoin" class="btn btn-primary">가입</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<input type="hidden" id="isValidOk" name="isValidOk" value="0" />
		</form>
	</div>
	<!-- /container -->

	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/bootbox.min.js"></script>
	<script src="/js/jquery.blockUI.js"></script>
	<script src="/js/jquery.placeholder.min.js"></script>
	<script src="/js/jqBootstrapValidation.js"></script>
	<script src="/js/bigstar.js"></script>

</body>
</html>