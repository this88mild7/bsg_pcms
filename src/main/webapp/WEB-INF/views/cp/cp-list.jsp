<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page-name">
	<h3>
		<img src='<spring:eval expression="@urlProp['star']"/>'> CP 업체 ( ${ pageLink.totalCnt } ) <small>&gt;&gt; 출판사 등록 및 관리를 위한 화면입니다.</small>
	</h3>
</div>

<div class="row-fluid box cp-box" data-query="${ search.query }" data-type="${ search.type }">

	<div class="span12">
		
		<div class="pull-right">
			<div class="btn-group">
				<a class="btn dropdown-toggle" data-toggle="dropdown" href="#"><span>전체</span><span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#">전체</a></li>
					<li><a href="#">회사명</a></li>
					<li><a href="#">CP코드</a></li>
				</ul>
			</div>
			<div class="input-append">
				<form class="no-margin-bottom" id="cpSearchForm" action="<spring:eval expression="@urlProp['cpList']"/>">
					<input type="hidden" id="type" name="type">
					<input class="inputError" type="text" id="query" name="query" class="input-medium" value="${ search.query }">
					<button id="cp-search-form-btn" class="btn" type="button"><i class="icon-search"></i></button>
				</form>
			</div>
		</div>

		<table class="table table-striped table-hover">
		<tr>
			<th><input class="check-all" type="checkbox" name="checkbox_all" value="false" data-toggle="tooltip"></th>
			<th>CP 코드</th>
			<th>회사명</th>
			<th>등록일</th>
			<th>연락처</th>
			<th>상세보기</th>
		</tr>
		<c:forEach items="${cpList}" var="cp">
	        <tr>
	   	    	<td><input type="checkbox" name="check_list" value="${ cp.company_mgmtno }"></td>
	   	    	<td>${ cp.company_mgmtno }</td>
	   	    	<td>${ cp.company_name }</td>
	   	    	<td>${ cp.reg_dt }</td>
	   	    	<td>${ cp.phoneno }</td>
				<td class="span2"><button class="btn btn-url" data-url="<spring:eval expression="@urlProp['cpDetail']"/>?company_mgmtno=${ cp.company_mgmtno }">상세보기</button></td>
	        </tr>
		</c:forEach>
		</table>
		
		<div class="clearfix">
			<p class="pull-right">
				<button id="btn-cp-selected-delete" class="btn">선택삭제</button>
				<button class="btn btn-primary btn-url" data-url="<spring:eval expression="@urlProp['cpCreate']"/>">CP 등록</button>
			</p>
		</div>
		
		<c:if test="${ not empty pageLink }">
		<div class="pagination pagination-centered">
			<ul>
				<c:if test="${ 0 ne pageLink.pagePrev }">
				<li><a href="<spring:eval expression="@urlProp['cpList']"/>?pageNum=${ pageLink.pagePrev }${ empty search.search? '' : search.search }">Prev</a></li>
				</c:if>
				<c:forEach items="${ pageLink.pageList }" var="page" >
				<li data-page-num="${ page.pageNum }"><a href="<spring:eval expression="@urlProp['cpList']"/>?pageNum=${ page.pageNum }${ empty search.search? '' : search.search }">${ page.pageNum }</a></li>
				</c:forEach>
				<c:if test="${ 0 ne pageLink.pageNext }">
				<li><a href="<spring:eval expression="@urlProp['cpList']"/>?pageNum=${ pageLink.pageNext }${ empty search.search? '' : search.search }">Next</a></li>
				</c:if>
			</ul>
		</div>
		</c:if>
		
	</div>
	
	<form id="hiddenForm" action="<spring:eval expression="@urlProp['cpDeleteAction']"/>" method="POST">
		<input type="hidden" name="strList" id="strList" />
	</form>
	
</div>
<!--/row-->
<script>
$(function(){
	
	// 검색종류 클릭한 글자로 변경.
	$("ul.dropdown-menu").find("a").click(function(){
		$("a.dropdown-toggle span" ).first().text( $(this).text() );
	});

	// null일때 length에러 나서 &&문 처리하였음.
	if( $("div.box").data("type") != null && 0 < $("div.box").data("type").length ) {
		$("a.dropdown-toggle").find("span").first().text( $("div.box").data("type") );
	}
	
	// Enter키로 눌러서 검색시 type넣어주기
	$("#cpSearchForm").submit(function() {
		var typeText = $("a.dropdown-toggle").find("span").first().text();
		$("#type").val(typeText);
	    return true;
	});
	
	$("#cp-search-form-btn").click(function(){
		//현재 선택된 type
		var typeText = $("a.dropdown-toggle").find("span").first().text();
		$("#type").val(typeText);
		$("#cpSearchForm").submit();
	});
	
	$("#btn-cp-selected-delete").click(function(){
		// 체크된 컨텐츠 리스트
		var $checkedContentList = $("input[name='check_list']").filter(":checked");
		
		if( $checkedContentList.length === 0 ){
			bootbox.alert("삭제할 CP업체를 선택해주세요.");
		} else {
			bootbox.confirm( "선택한 CP업체를 삭제하시겠습니까?", function(result) {
				if( result ) {
					var contentCd = "";
					$.each( $checkedContentList, function(idx){
						if( idx > 0 ) {
							contentCd += ",";
						}
						contentCd += $(this).val();
					});
					
					$("#strList").val(contentCd);
					$("#hiddenForm").submit();
				}
			}); 
		}
	});
});
</script>