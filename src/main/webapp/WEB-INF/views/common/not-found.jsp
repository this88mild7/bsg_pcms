<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="hero-unit">
  <h2>요청하신 페이지를 찾을 수 없습니다.</h2>
  <p>
    <a class="btn btn-primary" href="<spring:eval expression="@urlProp['dashboard']"/>">메인화면</a>
  </p>
</div>