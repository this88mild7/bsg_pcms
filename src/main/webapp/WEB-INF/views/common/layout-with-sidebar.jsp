<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
	<title>BIGSTAR GLOBAL</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="/beta/img/favicon.ico" />
	<link href="/beta/css/bootstrap.css" rel="stylesheet">
	<link href="/beta/css/bootstrap.icon-large.min.css" rel="stylesheet">
	<!-- 
	<link href="/beta/css/bootstrap-responsive.min.css" rel="stylesheet">
	 -->
	<link href="/beta/css/datepicker.css" rel="stylesheet">
	<link href="/beta/css/bigstar.css" rel="stylesheet" media="screen">
	
	<script src="http://code.jquery.com/jquery.js"></script>
	<script src="/beta/js/bootstrap.min.js"></script>
	<script src="/beta/js/bsg_ajax.js"></script>
	<script src="/beta/js/bsg_pcms_sale.js"></script>
	<script>
	$(function(){
		
		// 현재 페이지 하이라이트 처리
		$("div.pagination").find("li").each(function(){
			$this = $(this);
			if( $("body").data("pageNum") ==  $this.data("pageNum") ) {
				$this.addClass("active");
			}
		});
		
	});
	</script>
</head>
<body data-left_menu_seq="${ leftMenuSeq }" data-nav_seq="${ navSeq }" data-page-num="${ pageLink.pageNum }">
	
	<tiles:insertAttribute name="header"/>
	
	<div class="container body-fix">
		<div class="row-fluid">
			<div class="span2"><tiles:insertAttribute name="sidebar"/></div>
			<div class="span10"><tiles:insertAttribute name="content"/></div>
		</div>
	</div>
	
	<tiles:insertAttribute name="footer"/>
	
	<script src="/beta/js/jquery.blockUI.js"></script>
	<script src="/beta/js/jquery.placeholder.min.js"></script>
	<script src="/beta/js/json2.js"></script>
	<script src="/beta/js/bootstrap-datepicker.js"></script>
	<script src="/beta/js/bootbox.min.js"></script>
	<script src="/beta/js/jqBootstrapValidation.js"></script>
	<script src="/beta/js/bigstar.js"></script>
	<script src="/beta/js/autoNumeric.js"></script>
	<script src="/beta/js/locales/datepicker-kr.js"></script>
	<script src="/beta/js/date.js"></script>
		
</body>
</html>
	
	
    
