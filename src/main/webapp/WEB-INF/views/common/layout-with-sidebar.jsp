<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
	<title>BIGSTAR GLOBAL</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="/img/favicon.ico" />
	<link href="/css/bootstrap.css" rel="stylesheet">
	<link href="/css/bootstrap.icon-large.min.css" rel="stylesheet">
	<link href="/css/bootstrap-responsive.min.css" rel="stylesheet">
	<!-- 
	 -->
	<link href="/css/datepicker.css" rel="stylesheet">
	<link href="/css/bigstar.css" rel="stylesheet" media="screen">
	<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
	 <!--[if lt IE 9]>
	     <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	 <![endif]-->
	
	<script src="http://code.jquery.com/jquery.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/bsg_ajax.js"></script>
	<script src="/js/bsg_pcms_sale.js"></script>
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
	
	<div class="container-fluid body-fix">
		<div class="row-fluid">
			<div class="span2"><tiles:insertAttribute name="sidebar"/></div>
			<div class="span10"><tiles:insertAttribute name="content"/></div>
		</div>
	</div>
	
	<tiles:insertAttribute name="footer"/>
	
	<script src="/js/jquery.blockUI.js"></script>
	<script src="/js/jquery.placeholder.min.js"></script>
	<script src="/js/json2.js"></script>
	<script src="/js/bootstrap-datepicker.js"></script>
	<script src="/js/bootbox.min.js"></script>
	<script src="/js/jqBootstrapValidation.js"></script>
	<script src="/js/bigstar.js"></script>
	<script src="/js/autoNumeric.js"></script>
	<script src="/js/locales/datepicker-kr.js"></script>
	<script src="/js/date.js"></script>
		
</body>
</html>
	
	
    
