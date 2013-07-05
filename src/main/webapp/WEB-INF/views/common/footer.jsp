<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<footer>
	<div class="container">
		<div class="row-fluid text-left footer-menu">
			<div class="span2">
				<h5>메인</h5>
			</div>
			<div class="span2">
				<h5>업체 관리</h5>
				<a href='<spring:eval expression="@urlProp['cpList']"/>'>업체 리스트</a>
				<br />
				<a href='<spring:eval expression="@urlProp['categoryList']"/>'>카테고리 리스트</a>
				<br />
				<a href='<spring:eval expression="@urlProp['contentList']"/>'>콘텐츠 리스트</a>
				<br />
				<a href='<spring:eval expression="@urlProp['contractList']"/>'>계약 리스트</a>
			</div>
			<div class="span2">
				<h5>판매 관리</h5>
				<a href='<spring:eval expression="@urlProp['saleCompanyList']"/>'>판매업체 리스트</a>
				<br />
				<a href='<spring:eval expression="@urlProp['saleCompanyContractList']"/>'>판매계약 리스트</a>
				<br />
			</div>
			<div class="span2">
				<h5>정산</h5>
				<a href="<spring:eval expression="@urlProp['balanceSaleList']"/>">판매 정산현황</a>
				<br />
				<a href="<spring:eval expression="@urlProp['balanceCpList']"/>">업체 정산현황</a>
			</div>
			<div class="span2">
				<h5>통계</h5>
				<a href="<spring:eval expression="@urlProp['statsCompanyDashboard']"/>">판매처통계</a>
				<br />
				<a href="<spring:eval expression="@urlProp['statsProductDashboard']"/>">상품통계</a>
			</div>
		</div>
	</div>
	<span class="footer-logo">
		<img src='<spring:eval expression="@urlProp['favicon']"/>' />
		<br/>
		<span>&copy; 2013 Bigstar global co.Ltd,. All rights reserved.</span>
	</span>
</footer>
