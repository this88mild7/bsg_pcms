<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="sidebar lnb">
	<a href="<spring:eval expression="@urlProp['saleCompanyList']"/>">판매업체 리스트</a>
	<a href="<spring:eval expression="@urlProp['saleCompanyContractList']"/>">판매 계약 리스트</a>	
</div>
    
