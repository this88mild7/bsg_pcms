<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="sidebar lnb">
	<a href="<spring:eval expression="@urlProp['balanceSaleList']"/>">판매처통계</a>
	<a href="<spring:eval expression="@urlProp['balanceCpList']"/>">상품통계</a>
</div>