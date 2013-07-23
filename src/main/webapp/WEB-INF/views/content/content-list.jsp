<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page-name">
	<h4>
		<img src='<spring:eval expression="@urlProp['star']"/>'> 콘텐츠 ( ${ pageLink.totalCnt } ) 
		<small>&gt;&gt; 출판사의 콘텐츠를 관리할 수 있습니다.</small>
	</h4>
</div>

<div class="row-fluid box" data-query="${ search.query }" data-type="${ search.type }">

	<div class="span12">
		
		<form class="no-margin-bottom" id="contentSearchForm" action="<spring:eval expression="@urlProp['contentList']"/>">
			<div class="input-prepend input-append pull-right">
				<div class="btn-group">
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#"><span>전체</span><span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">전체</a></li>
						<li><a href="#">CP업체</a></li>
						<li><a href="#">카테고리</a></li>
						<li><a href="#">시리즈</a></li>
						<li><a href="#">콘텐츠</a></li>
					</ul>
				</div>
				<input type="hidden" id="type" name="type" >
				<input type="text" id="query" name="query" value="${ search.query }">
				<button id="btn-content-search-form" class="btn" type="button"><i class="icon-search"></i></button>
			</div>
		</form>
		
		<!-- 
		<div class="pull-right">
			<div class="btn-group">
				<a class="btn dropdown-toggle" data-toggle="dropdown" href="#"><span>전체</span><span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#">전체</a></li>
					<li><a href="#">CP업체</a></li>
					<li><a href="#">카테고리</a></li>
					<li><a href="#">시리즈</a></li>
					<li><a href="#">콘텐츠</a></li>
				</ul>
			</div>
			<div class="input-append">
				<form class="no-margin-bottom" id="contentSearchForm" action="<spring:eval expression="@urlProp['contentList']"/>">
					<input type="hidden" id="type" name="type" >
					<input type="text" id="query" name="query" class="input-medium"  value="${ search.query }">
					<button id="btn-content-search-form" class="btn" type="button"><i class="icon-search"></i></button>
				</form>
			</div>
		</div>
		 -->

		<table class="table table-striped table-hover">
		<tr>
			<th><input class="check-all" type="checkbox" name="checkbox_all" value="false" data-toggle="tooltip"></th>
			<th>콘텐츠 코드</th>
			<th>CP업체</th>
			<th>카테고리</th>
			<th>시리즈</th>
			<th>콘텐츠명</th>
			<th>등록일</th>
			<th>상세보기</th>
		</tr>
		<c:forEach items="${ contentList }" var="content">
		<tr>
			<td><input type="checkbox" name="check_list" value="${ content.contents_cd }"></td>
			<td>${ content.contents_cd }</td>
			<td>${ content.company_name }</td>
			<td>${ content.cate_name }</td>
			<td>${ content.series_name }</td>
			<td>${ content.name }</td>
			<td>${ content.reg_dt }</td>
			<td><button class="btn btn-url" data-url="<spring:eval expression="@urlProp['contentDetail']"/>?contents_cd=${ content.contents_cd }">상세보기</button></td>
		</tr>
		</c:forEach>
		</table>
		
		<div class="clearfix">
			<p class="pull-right">
				<button id="excel-down" class="btn btn-url" data-url="<spring:eval expression="@urlProp['contentListExcel']"/>">Excel 다운로드</button>
				<button id="btn-content-selected-delete" class="btn">선택삭제</button>
				<button class="btn btn-primary btn-url" data-url="<spring:eval expression="@urlProp['contentCreate']"/>">콘텐츠 등록</button>
			</p>
		</div>
		
		<c:if test="${ not empty pageLink }">
		<div class="pagination pagination-centered">
			<ul>
				<c:if test="${ 0 ne pageLink.pagePrev }">
				<li><a href="<spring:eval expression="@urlProp['contentList']"/>?pageNum=${ pageLink.pagePrev }${ empty search.search? '' : search.search }">Prev</a></li>
				</c:if>
				<c:forEach items="${ pageLink.pageList }" var="page" >
				<li data-page-num="${ page.pageNum }"><a href="<spring:eval expression="@urlProp['contentList']"/>?pageNum=${ page.pageNum }${ empty search.search? '' : search.search }">${ page.pageNum }</a></li>
				</c:forEach>
				<c:if test="${ 0 ne pageLink.pageNext }">
				<li><a href="<spring:eval expression="@urlProp['contentList']"/>?pageNum=${ pageLink.pageNext }${ empty search.search? '' : search.search }">Next</a></li>
				</c:if>
			</ul>
		</div>
		</c:if>

	</div>
	
	<form id="hiddenForm" action="<spring:eval expression="@urlProp['contentDeleteAction']"/>" method="POST">
		<input type="hidden" name="strList" id="strList"/>
	</form>
	
</div>
<!--/row-->
<script>

//검색종류 클릭한 글자로 변경.
$("ul.dropdown-menu").find("a").click(function(){
	$("a.dropdown-toggle span" ).first().text( $(this).text() );
});

// null일때 length에러 나서 &&문 처리하였음.
if( $("div.box").data("type") != null && 0 < $("div.box").data("type").length ) {
	$("a.dropdown-toggle").find("span").first().text( $("div.box").data("type") );
}

// Enter키로 눌러서 검색시 type넣어주기
$("#contentSearchForm").submit(function() {
	var typeText = $("a.dropdown-toggle").find("span").first().text();
	$("#type").val(typeText);
    return true;
});

$("#btn-content-search-form").click(function(){
	//현재 선택된 type
	var typeText = $("a.dropdown-toggle").find("span").first().text();
	$("#type").val(typeText);
	$("#contentSearchForm").submit();
});
	
//엑셀 다운로드
$("#excel-down").click(function(){
	console.log("Hello world");
});


//컨텐츠 삭제
$("#btn-content-selected-delete").click(function(){
	// 체크된 컨텐츠 리스트
	var $checkedContentList = $("input[name='check_list']").filter(":checked");
	
	if( $checkedContentList.length === 0 ){
		bootbox.alert("삭제할 콘텐츠를 선택해주세요.");
	} else {
		bootbox.confirm( "선택한 콘텐츠를 삭제하시겠습니까?", function(result) {
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
</script>