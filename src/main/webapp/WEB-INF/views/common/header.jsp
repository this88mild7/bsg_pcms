<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<style>
.navbar {
	margin-bottom: 32px;
	border-bottom: 1px dotted #e5e5e5;
}
.gnb>a {
	width: 9%;
	line-height: 57px;
	display: inline-block;
	text-align: center;
	color: #003366;
	font-size: 17px;
	font-weight:bold;
}
.gnb>a:hover {
	text-decoration: none;
	background-color: #EB9400;
}
.gnb>a.active {
	box-shadow: 0 -3px 0 #D91414 inset;
}
.brand {
	width: 183px;
}
.user-info {
	margin-right: 5px;
	padding-top: 3px;
}
</style>
<div id="header" class="navbar">
	<div class="container">
		<a class="brand" href="<spring:eval expression="@urlProp['dashboard']"/>">
			<img class="logo" src="<spring:eval expression="@urlProp['logo']"/>" />
		</a>
		<div class="gnb">
			<a class="dashboard" href="<spring:eval expression="@urlProp['dashboard']"/>">메인</a>
			<a class="cp" href="<spring:eval expression="@urlProp['cpList']"/>">업체관리</a>
			<a class="customer" href="<spring:eval expression="@urlProp['saleCompanyList']"/>">판매관리</a>
			<a class="balance" href="<spring:eval expression="@urlProp['balanceSaleList']"/>">정산</a>						
			<a class="statistics" href="<spring:eval expression="@urlProp['statsCompanyDashboard']"/>">통계</a>						
	
			<!-- USER INFOMATION -->
			<div class="btn-group pull-right" style="margin-top:5px; line-height:46px;">
				<a class="btn" href='<spring:eval expression="@urlProp['userUpdate']"/>?id=${ sessionScope["user"].id }'><i class="icon-user"></i> ${ sessionScope["user"].id } 님</a> <a class="btn dropdown-toggle"
					data-toggle="dropdown" href="#"><span class="caret"></span></a>
				<ul class="dropdown-menu">
					<c:if test="${sessionScope['user'].level_cd eq 0}">
						<li><a class="site" href="<spring:eval expression="@urlProp['siteManage']"/>">사원관리</a></li>
					</c:if>
					<li><a href='<spring:eval expression="@urlProp['userUpdate']"/>?id=${ sessionScope["user"].id }'>계정설정</a></li>
					<li><a href="<spring:eval expression="@urlProp['userLogout']"/>">로그아웃</a></li>
				</ul>
			</div>
			<!-- USER INFOMATION -->
		</div>
	</div>
</div>
<script>
$(function(){
	
	console.info( '${ sessionScope["user"]}' );
	//로그아웃
	$("#btn-logout").click(function(){
		window.location.href = '<spring:eval expression="@urlProp['logout']"/>';			
	});
	
	//GNB 하이라이트 표시
	var nav_seq = $("body").data("nav_seq");
	$("div.gnb").find("a").eq( nav_seq ).addClass( "active" );

});
</script>