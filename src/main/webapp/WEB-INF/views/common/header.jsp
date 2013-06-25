<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<style>
.navbar {
	margin-bottom: 32px;
	border-bottom: 1px dotted #e5e5e5;
}
.navbar>.container {
	padding-left: 10px;
}
.gnb>a {
	width: 120px;
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
</style>
<div class="navbar">
	<div class="container">
		<a class="brand" href="/pcms/dashboard.do">
			<img class="logo" src="/pcms/img/logo.png" />
		</a>
		<div class="gnb">
			<a class="dashboard" href="/pcms/dashboard.do">메인</a>
			<a class="cp" href="/pcms/cp/list.do">업체관리</a>
			<a class="customer" href="/pcms/saleCompany/list.do">판매관리</a>
			<a class="statistics" href="/pcms/balance/sale-company/list.do">정산</a>						
			<a class="statistics" href="/pcms/statistics.do">통계</a>						
			<c:if test="${sessionScope['user'].leve_cd eq 0}">
				<a class="site" href="/pcms/site/manage.do">사이트관리</a>
			</c:if>
		</div>
		<p class="loginfo user">
			${ sessionScope["user"].id } 님 <button class="btn btn-small btn-logout" type="button" onclick="logout()">logout</button>
		</p>
	</div>
</div>
<script>
$(function(){
	//로그아웃
	var logout = function(){
		window.location.href = '<spring:eval expression="@urlProp['logout']"/>';			
	};
	//GNB 하이라이트 표시
	var nav_seq = $("body").data("nav_seq");
	$("div.gnb")
		.find("a").eq( nav_seq ).addClass( "active" );
});
</script>