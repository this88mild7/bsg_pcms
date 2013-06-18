<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
	<title>BIGSTAR GLOBAL</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="/pcms/img/favicon.ico" />
	<link href="/pcms/css/bootstrap.css" rel="stylesheet">
	<!-- 
	 <link href="/pcms/css/bootstrap-responsive.min.css" rel="stylesheet">
	 -->
	<link href="/pcms/css/datepicker.css" rel="stylesheet">
	<link href="/pcms/css/bigstar.css" rel="stylesheet" media="screen">
	
	<script src="http://code.jquery.com/jquery.js"></script>
	
</head>
<body data-nav_seq="${ navSeq }">

	<tiles:insertAttribute name="header"/>
	
	<div class="container body-fix">
		<tiles:insertAttribute name="content"/>
	</div>
	
	<tiles:insertAttribute name="footer"/>
	
	<script src="/pcms/js/jquery.blockUI.js"></script>
	<script src="/pcms/js/json2.js"></script>
	<script src="/pcms/js/bootstrap.min.js"></script>
	<script src="/pcms/js/bootstrap-datepicker.js"></script>
	<script src="/pcms/js/bootbox.min.js"></script>
	<script src="/pcms/js/bigstar.js"></script>
	<script src="/pcms/js/jqBootstrapValidation.js"></script>
	<script src="/pcms/js/flotr2.js"></script>
	
</body>
</html>
	
	
    
