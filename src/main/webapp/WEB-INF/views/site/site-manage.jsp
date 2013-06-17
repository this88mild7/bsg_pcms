<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="row-fluid">

	<div class="span12">
		
		<table class="table table-striped table-hover">
			<caption></caption>
			<thead>
				<tr>
					<th>ID</th>
					<th>NAME</th>
					<th>ROLE</th>
					<th>미정</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${memberList}" var="member">
			        <tr>
			   	    	<td>${ member.member_id }</td>
			   	    	<td>${ member.member_name }</td>
			   	    	<td>${ member.member_role }</td>
			   	    	<td></td>
			        </tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
	
</div>
<!--/row-->