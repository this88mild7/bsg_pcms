<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<style>
#pie-chart-layer {
        height: 400px;
        margin: 10px auto;
        padding: 10px;
      }
#line-chart-layer {
        height: 400px;
        margin: 10px auto;
        padding: 10px;
      }
.chart-title {
	background-color: gray;
	color: white;
	font-size: 16px;
	padding: 10px;
}	
#chart-title-dropbox{
	margin-top: -5px;
}

}
</style>
<div class="page-name">
	<h4>
		<img src='<spring:eval expression="@urlProp['star']"/>'> 판매처 통계
		<small>&gt;&gt; 판매처 통계 대쉬보드</small>
	</h4>
</div>

<div class="row-fluid box" data-query="${ search.searchQuery }" data-date="${ search.searchDate }" data-sort="${ search.sortingType }">

		<!-- 
		<div class="row-fluid">
			<span class="">
				<span>출력순</span>
				<select id="sortingTypeList" name="sortingType" class="span2">
					<option value="1">총매출금액</option>
					<option value="2">누적판매량</option>
				</select>
			</span>
			<span class="ml mr">
				기간설정
				<select class="span2 push" id="searchYear">
					<option value="2013">2013년</option>
				</select>
				<select class="span2 push" id="searchMonth">
					<option value="01">1월</option>
					<option value="02">2월</option>
					<option value="03">3월</option>
					<option value="04">4월</option>
					<option value="05">5월</option>
					<option value="06">6월</option>
					<option value="07">7월</option>
					<option value="08">8월</option>
					<option value="09">9월</option>
					<option value="10">10월</option>
					<option value="11">11월</option>
					<option value="12">12월</option>
				</select>
			</span>
			<div class="input-append">
				<form class="no-margin-bottom" id="contentSearchForm" action="<spring:eval expression="@urlProp['statsCompanyDashboard']"/>">
					<input type="hidden" id="sortingType" name="sortingType" value="1">
					<input type="hidden" id="searchDate" name="searchDate" >
					<input type="text" id="searchQuery" name="searchQuery" class="input-medium"  value="${ search.query }" placeholder="검색어">
					<button id="btn-content-search-form" class="btn" type="button"><i class="icon-search"></i></button>
				</form>
			</div>
		</div>
		 -->
		<div class="span3">
			<span>출력순</span>
			<select id="sortingTypeList" name="sortingType" class="mt10 span6">
				<option value="1">총매출금액</option>
				<option value="2">누적판매량</option>
			</select>
		</div>
		<div class="span6">
			기간설정
			<select class="mt10 span3" id="searchYear">
				<option value="0000">선택</option>
				<option value="2013">2013년</option>
			</select>
			<select class="mt10 span3" id="searchMonth">
				<option value="00">선택</option>
				<option value="01">1월</option>
				<option value="02">2월</option>
				<option value="03">3월</option>
				<option value="04">4월</option>
				<option value="05">5월</option>
				<option value="06">6월</option>
				<option value="07">7월</option>
				<option value="08">8월</option>
				<option value="09">9월</option>
				<option value="10">10월</option>
				<option value="11">11월</option>
				<option value="12">12월</option>
			</select>
		</div>
		<div class="span3">
			<div class="input-append pull-right mt10">
				<form class="no-margin-bottom" id="contentSearchForm" action="<spring:eval expression="@urlProp['statsCompanyDashboard']"/>">
					<input type="hidden" id="sortingType" name="sortingType" value="1">
					<input type="hidden" id="searchDate" name="searchDate" >
					<input type="text" id="searchQuery" name="searchQuery" class="input-medium"  value="${ search.query }" placeholder="검색어">
					<button id="btn-content-search-form" class="btn" type="button"><i class="icon-search"></i></button>
				</form>
			</div>
		</div>
		<br />
		
		<table class="table table-striped table-hover">
			<tr>
				<th>순위</th>
				<th>판매처</th>
				<th>총매출금액</th>
				<th>누적판매량</th>
			</tr>
			<c:forEach items="${ tableList }" var="obj" varStatus="status">
			<tr>
				<td>${ obj.rank }</td>
				<td>${ obj.company_name }</td>
				<td class="price">${ obj.total_sale_price }</td>
				<td class="count">${ obj.total_sale_count }</td>
			</tr>
			</c:forEach>
		</table>
			
		<c:if test="${ not empty pageLink }">
		<div class="pagination pagination-centered">
			<ul>
				<c:if test="${ 0 ne pageLink.pagePrev }">
				<li><a href="<spring:eval expression="@urlProp['statsCompanyList']"/>?pageNum=${ pageLink.pagePrev }${ empty search.search? '' : search.search }">Prev</a></li>
				</c:if>
				<c:forEach items="${ pageLink.pageList }" var="page" >
				<li data-page-num="${ page.pageNum }"><a href="<spring:eval expression="@urlProp['statsCompanyList']"/>?pageNum=${ page.pageNum }${ empty search.search? '' : search.search }">${ page.pageNum }</a></li>
				</c:forEach>
				<c:if test="${ 0 ne pageLink.pageNext }">
				<li><a href="<spring:eval expression="@urlProp['statsCompanyList']"/>?pageNum=${ pageLink.pageNext }${ empty search.search? '' : search.search }">Next</a></li>
				</c:if>
			</ul>
		</div>
		</c:if>
		
		<div class="row-fluid">
			<div class="span4">
				<div class="chart-title">
					판매처별 판매그래프
				</div>
				<div id="pie-chart-layer"></div>
			</div>
			<div class="span8">
				<div class="chart-title">
					기간별 판매그래프
					<select id="chart-title-dropbox" class="select-mini span3 pull-right">
						<option>2013년</option>
					</select>
				</div>
				<div id="line-chart-layer"></div>
			</div>
		</div>
	
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
		google.load('visualization', '1.0', {'packages':['corechart']});
    </script>
</div>
<!--/row-->
<script>
$(function(){
	
	//가격에 ,(콤마) 넣어주기
	$('.price').autoNumeric("init",{aPad: false, aSign: " 원", pSign: "s" });
	$('.count').autoNumeric("init",{aPad: false, aSign: " 건", pSign: "s" });
	
	
	{//엘리먼트 이벤트
		$("#btn-content-search-form").click(function() {
			$("#contentSearchForm").submit();
		});
		//출력순 변경에 따른 검색 hidden값 변경(기본값:1)
		$("#sortingTypeList").change(function() {
			$("#sortingType").val( $(this).val() );
		});
		//검색시 searchDate 변경. 예)2013-07 로 변경
		$("#contentSearchForm").submit(function() {
			$("#searchDate").val( $("#searchYear").val() + "-" + $("#searchMonth").val() );
		});
		//검색어 입력후 ENTER키 입력하면 검색하기
		$('#searchQuery').keyup(function( event ) {
			if( event.which == 13 ) {
				$("#btn-content-search-form").trigger("click");
			}
		});
	}
	
	{//검색값 체크
		var boxData = $("div.box").data();
		
		//출력순 선택
		if( $(boxData.sort).length > 0 ) {
			$("#sortingType").val( boxData.sort );
			$("#sortingTypeList").find("option[value='" + boxData.sort + "']").prop("selected", true);
		}
		//년/월 선택
		if( boxData.date.length > 0 ) {
			var arr = boxData.date.split("-");
			var year = arr[0];
			var month = arr[1];
			$("#searchYear").find("option[value='" + year + "']").prop("selected", true);
			$("#searchMonth").find("option[value='" + month + "']").prop("selected", true);
		}
		//검색어 있다면 검색창에 넣어주기
		if( boxData.query.length > 0 ) {
			$("#searchQuery").val( boxData.query );
		}
	}
	
	//파이차트 그리기
	createPieChart();

	//선차트 그리기
	createLineChart();
});

function createPieChart(option){

	var param;
	var url = '<spring:eval expression="@urlProp['statsCompanyPieChart']"/>';
	
	$.getJSON(url, param, function(data) {
		console.info( data );
		
		if(data.code != 200) {
			bootbox.alert( data.msg );
			return false;
		} else if(data.pieGraph.length == 0) {
			bootbox.alert( "파이차트 데이터가 없습니다." );
			return false;
		}
		
		var ggData = [];
		ggData.push( ["saleCompany", "saleValue"] );
		$.each( data.pieGraph, function(idx, ele){
			var pieData = [ ele.saleCompany, ele.saleValue ];
			ggData.push(pieData);
		});
		
		var data = google.visualization.arrayToDataTable(ggData);
		
		var options = {
				chartArea: {width: '90%', height: '80%'},
				legend: {position: 'bottom'}
				};
		var pieChart = new google.visualization.PieChart(document.getElementById("pie-chart-layer"));
		pieChart.draw(data, options);
	});
}

function createLineChart(option){

	var param;
	var url = '<spring:eval expression="@urlProp['statsCompanyLineChart']"/>';
	
	$.getJSON(url, param, function(data) {
		console.info( data );
		
		if(data.code != 200) { 
			bootbox.alert( data.msg );
			return false;
		} else if(data.lineGraph.length == 0) {
			bootbox.alert( "선차트 데이터가 없습니다." );
			return false;
		}
		
		var ggData = []; //구글 params
		var firstRow = [ "" ];
		//set company name
		$.each( data.lineGraph, function(idx, ele){
			firstRow.push( ele.saleCompanyName ); //['','companyName','companyName(n)']
		});
		ggData.push(firstRow);
		
		//set data
		for ( var begin = 0; begin <= 11; begin++ ) {
			var dataRow = [ (begin+1) + "월" ];
			$.each( data.lineGraph, function(idx, ele){
				dataRow.push( ele.monthCount[ begin ] ); 
			});
			
			ggData.push(dataRow);
		}
		
	    var data = google.visualization.arrayToDataTable(ggData);

		var options = {
				chartArea: {width: '80%', height: '75%'},
				legend: {position: 'bottom'},
				pointSize: 7
				};
	    var lineChart = new google.visualization.LineChart(document.getElementById("line-chart-layer"));
	    lineChart.draw(data, options);
	});
}
</script>