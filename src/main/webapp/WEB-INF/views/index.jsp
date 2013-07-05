<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8"%>
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
	
	{ //테스트용 아이디,비번
		$( '.form-signin input')
			.eq(0).val( "test" )
			.end()
			.eq(1).val( "123" );
		/*
		*/
	}
	
	//index 폼 체크
	$(".form-signin").validate({
			rules: {
				id: {
					required: true,
				},
				pwd: {
					required: true,
				}
			},
			messages: {
				id: {
					required: "Username",
				},
				pwd: {
					required: "Password",
				}
			},
			// the errorPlacement has to take the table layout into account
			errorPlacement: function(error, element) {
				if ( element.is(":radio") )
					error.appendTo( element.parent().next().next() );
				else if ( element.is(":checkbox") )
					error.appendTo ( element.next() );
				else {
					//error.appendTo( element );
					//element.after( error );
					$( element )
						.attr( "placeholder", $( error ).text() )
						.parent()
						.addClass( "error" );
					
				}
			},
			success: function(label, element) {
				// set &nbsp; as text for IE
				label.html("&nbsp;").addClass("checked");
				$(element).parent().removeClass( "error" );
			},
			highlight: function(element, errorClass) {
				$(element).parent().next().find("." + errorClass).removeClass("checked");
			}
		});
	
});
</script>
</head>
<body>
	<div class="container">
		
		<form class="form-signin" method="POST" action="login.do">
		
			<h2 class="form-signin-heading">
				<img class="logo" src="/img/logo.png" />
			</h2>
			<div class="control-group">
				<input type="text" class="input-block-level" placeholder="Username" name="id" />
			</div>
			<div class="control-group">
				<input type="password" class="input-block-level" placeholder="Password" name="pwd" /> 
			</div>
			<label class="checkbox">
				<input type="checkbox" value="remember-me"> Keep me signed in
			</label>
			<button class="btn btn-large btn-primary" type="submit">Login</button>
			<c:if test="${ result eq 0 }">
				<div class="alert alert-error">로그인에 실패 하였습니다.</div>
			</c:if>
			
		</form>
		<div class="text-center" id="footer">Copyright © 2013 Bigstar global co.Ltd,. All rights reserved.</div>
		
	</div>
	<!-- /container -->

	<script src="/js/bootstrap.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js" charset="ISO-8859-1"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/additional-methods.min.js"></script>
	<script src="/js/bigstar-validation.js"></script>
	<script src="/js/bigstar.js"></script>

</body>
</html>