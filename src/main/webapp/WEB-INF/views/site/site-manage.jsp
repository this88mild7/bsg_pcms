<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="row-fluid">

	<div class="span12">
		
		<table class="table table-striped table-hover">
			<caption></caption>
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>부서</th>
					<th>직책</th>
					<th>가입일</th>
					<th>레벨</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${userList}" var="user">
			        <tr>
			   	    	<td>${ user.id }</td>
			   	    	<td>${ user.name }</td>
			   	    	<td>${ user.team }</td>
			   	    	<td>${ user.title }</td>
			   	    	<td>${ user.reg_dt }</td>
			   	    	<td>
			   	    		<c:choose>
			   	    			<c:when test="${ user.level_cd eq 0 }">관리자</c:when>
			   	    			<c:when test="${ user.level_cd eq 1 }">회원</c:when>
			   	    			<c:otherwise>준회원</c:otherwise>
			   	    		</c:choose> 
			   	    	</td>
			   	    	<td>
			   	    		<c:choose>
			   	    			<c:when test="${ user.level_cd eq 2 }">
					   	    		<button class="btn btnDeleteUser" data-id="${ user.id }">삭제</button>
					   	    		<button class="btn btnUpdateUserLevel" data-id="${ user.id }">승인</button>
			   	    			</c:when>
			   	    			<c:otherwise>
					   	    		<button class="btn btnDeleteUser" data-id="${ user.id }">삭제</button>
			   	    			</c:otherwise>
			   	    		</c:choose> 
			   	    	</td>
			        </tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
	
</div>
<!--/row-->
<script>
$(function(){
	
	//준회원 -> 회원으로
	$(".btnUpdateUserLevel").click(function(){
		var $this = $(this);
		window.location.href = '<spring:eval expression="@urlProp['userUpdateLevel']"/>' + '?id=' + $this.data("id");
	});
	
	//회원삭제
	$(".btnDeleteUser").click(function(){
		var $this = $(this);
		window.location.href = '<spring:eval expression="@urlProp['userDelete']"/>' + '?id=' + $this.data("id");
	});
	
});
</script>