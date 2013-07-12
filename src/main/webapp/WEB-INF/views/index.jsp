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
.alert-error {
	margin-top: 15px;
}

.form-signin {
	max-width: 300px;
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
	
	if( "${param.result}".length ) {
		//가입 성공 URL?result=1  
		//가입 실패 URL?result=0  
		if("${param.result}" == 1) {
			bootbox.alert("가입 완료 되었습니다.");
		} else if( "${param.result}" == 3 ) {
			bootbox.alert("아이디 혹은 비밀번호를 확인해 주십시오.");
		} else if( "${param.result}" == 4 ) {
			bootbox.alert("접속 권한이 없습니다. 관리자에게 문의해 주세요.");
		} else if( "${param.result}" == 5 ) {
			bootbox.alert("잘못된 접속경로 입니다.");
		} else if( "${param.result}" == 6 ) {
			bootbox.alert("로그인 해주세요.");
		} else {
			bootbox.alert("가입 실패 하였습니다. 관리자에게 문의해 주세요.");
		}
	}
	
	{ //테스트용 아이디,비번
		$( '.form-signin input')
			.eq(0).val( "bigstarglobal" )
			.end()
			.eq(1).val( "0412" );
		/*
		*/
	}
	
	//유효성 체크
	$("input").not("[type=submit]").jqBootstrapValidation();
	
	$("#loginBtn").click(function(){
		$("#loginForm").submit();
	});
	
	$("#joinBtn").click(function(event) {
	  	event.preventDefault();
		console.info("sSSS");
		window.location.href = "join.do";
	});
});
</script>
</head>
<body>
	<div class="container">
		
		<form id="loginForm" class="form-signin" method="POST" action="login.do">
		
			<h2 class="form-signin-heading">
				<img class="logo" src="<spring:eval expression="@urlProp['logo']"/>" />
			</h2>
			<div class="control-group">
				<input type="text" class="input-block-level" placeholder="Username" name="id" required/>
			</div>
			<div class="control-group">
				<input type="password" class="input-block-level" placeholder="Password" name="pwd" required/> 
			</div>
			<!--  
			<label class="checkbox">
				<input type="checkbox" value="remember-me"> Keep me signed in
			</label>
			 -->
			<button id="loginBtn" class="btn btn-large btn-primary" type="button">Login</button>
			<button id="joinBtn" class="btn btn-large" type="button">Join</button>
			<c:if test="${ result eq 0 }">
				<div class="alert alert-error">로그인에 실패 하였습니다.</div>
			</c:if>
			
		</form>
		<div class="text-center" id="footer">Copyright © 2013 Bigstar global co.Ltd,. All rights reserved.</div>
		
	</div>
	<!-- /container -->

	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/bootbox.min.js"></script>
	<script src="/js/jquery.placeholder.min.js"></script>
	<script src="/js/jqBootstrapValidation.js"></script>
	<script src="/js/bigstar.js"></script>

</body>
</html>