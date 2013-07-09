<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
	<title>BIGSTAR GLOBAL</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="/img/favicon.ico" />
	<link href="/css/bootstrap.css" rel="stylesheet">
	<!-- 
	 <link href="/css/bootstrap-responsive.min.css" rel="stylesheet">
	 -->
	<link href="/css/datepicker.css" rel="stylesheet">
	<link href="/css/bigstar.css" rel="stylesheet" media="screen">
	
	<script src="http://code.jquery.com/jquery.js"></script>
	
</head>
<body data-nav_seq="${ navSeq }">

	<tiles:insertAttribute name="header"/>
	
	<div class="container body-fix">
		<tiles:insertAttribute name="content"/>
	</div>
	
	<tiles:insertAttribute name="footer"/>
	
	<script src="/js/jquery.blockUI.js"></script>
	<script src="/js/jquery.placeholder.min.js"></script>
	<script src="/js/json2.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/bootstrap-datepicker.js"></script>
	<script src="/js/bootbox.min.js"></script>
	<script src="/js/bigstar.js"></script>
	<script src="/js/jqBootstrapValidation.js"></script>
	<script src="/js/locales/datepicker-kr.js"></script>
	<script src="/js/bsg_ajax.js"></script>
	<script src="/js/bsg_pcms_sale.js"></script>
	<script src="/js/date.js"></script>
	
</body>
</html>
	
	
    

    