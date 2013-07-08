<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<style>
#chart1 {
        height: 400px;
        margin: 10px auto;
        padding: 10px;
      }
#chart2 {
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
</style>
<div class="page-name">
	<h4>
		<img src='<spring:eval expression="@urlProp['star']"/>'> 상품통계
		<small>&gt;&gt; 상품통계 대쉬보드</small>
	</h4>
</div>

<div class="row-fluid box" data-query="${ search.query }" data-type="${ search.type }">

		<div>
			<span class="">
				<span>출력순</span>
				<select id="sorting_type" name="sortingType" class="span2">
					<option value="1" <c:if test="${sortingType eq '1' }">selected="selected"</c:if> >총매출금액</option>
					<option value="2" <c:if test="${sortingType eq '2' }">selected="selected"</c:if> >누적판매량</option>
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
				<form class="no-margin-bottom" id="contentSearchForm" action="<spring:eval expression="@urlProp['statsProductDashboard']"/>">
					<input type="hidden" id="searchDate" name="searchDate" >
					<input type="text" id="searchQuery" name="searchQuery" class="input-medium"  value="${ search.query }" placeholder="검색어">
					<button id="btn-content-search-form" class="btn" type="button"><i class="icon-search"></i></button>
				</form>
			</div>
		</div>
		
		<table class="table table-striped table-hover">
			<tr>
				<th>순위</th>
				<th>상품명</th>
				<th>총매출금액</th>
				<th>누적판매량</th>
			</tr>
			<c:forEach items="${ tableList }" var="obj" varStatus="status">
			<tr>
				<td>${ status.count }</td>
				<td>${ obj.contents_name }</td>
				<td class="price">${ obj.total_sale_price }</td>
				<td class="count">${ obj.total_sale_count }</td>
			</tr>
			</c:forEach>
		</table>
		
		<c:if test="${ not empty pageLink }">
		<div class="pagination pagination-centered">
			<ul>
				<c:if test="${ 0 ne pageLink.pagePrev }">
				<li><a href="<spring:eval expression="@urlProp['statsProductDashboard']"/>?pageNum=${ pageLink.pagePrev }${ empty search.search? '' : search.search }">Prev</a></li>
				</c:if>
				<c:forEach items="${ pageLink.pageList }" var="page" >
				<li data-page-num="${ page.pageNum }"><a href="<spring:eval expression="@urlProp['statsProductDashboard']"/>?pageNum=${ page.pageNum }${ empty search.search? '' : search.search }">${ page.pageNum }</a></li>
				</c:forEach>
				<c:if test="${ 0 ne pageLink.pageNext }">
				<li><a href="<spring:eval expression="@urlProp['statsProductDashboard']"/>?pageNum=${ pageLink.pageNext }${ empty search.search? '' : search.search }">Next</a></li>
				</c:if>
			</ul>
		</div>
		</c:if>
		
		<div class="row-fluid">
			<div class="span4">
				<div class="chart-title">
					상품별 판매그래프
				</div>
				<div id="chart1"></div>
			</div>
			<div class="span8">
				<div class="chart-title">
					기간별 판매그래프
					<select class="select-mini span3 pull-right">
						<option>2013년</option>
						<option>2012년</option>
						<option>2011년</option>
						<option>2010년</option>
					</select>
				</div>
				<div id="chart2"></div>
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
	
	//파이차트 그리기
	createPidChart();

	//선차트 그리기
	createLineChart();
	
	{//엘리먼트 이벤트
		$("#period").change(function(){
			var $this = $(this);
			console.info( $this.val() );
		});
	}
	
});

function createPidChart(option){

	var param;
	var url = '<spring:eval expression="@urlProp['statsProductPieChart']"/>';
	
	$.getJSON(url, param, function(data) {
		console.info( data );
		
		if(data.code != 200) {
			bootbox.alert( data.msg );
			return false;
		} else if(data.pieGraph.length == 0) {
			bootbox.alert( "파이차트 데이터가 없습니다." );
			return false;
		}
		
		var pieRows = [];
		$.each( data.pieGraph, function(idx, ele){
			var pieData = [ ele.contentName, ele.saleCount ];
			pieRows.push(pieData);
		});
		
		//GOOGLE PIE CHART API CALL
		drawPieChart({
			id : "chart1",
			rows : pieRows
		});
	});
}

function createLineChart(option){

	var param;
	var url = '<spring:eval expression="@urlProp['statsProductLineChart']"/>';
	
	$.getJSON(url, param, function(data) {
		console.info( data );
		
		if(data.code != 200) {
			bootbox.alert( data.msg );
			return false;
		} else if(data.lineGraph.length == 0) {
			bootbox.alert( "선차트 데이터가 없습니다." );
			return false;
		}
		
		var lineRows = []; //구글 params
		var firstRow = [ "" ];
		//set company name
		$.each( data.lineGraph, function(idx, ele){
			firstRow.push( ele.contentName ); //['','companyName','companyName(n)']
		});
		lineRows.push(firstRow);
		
		//set data
		for ( var begin = 0; begin <= 11; begin++ ) {
			var dataRow = [ (begin+1) + "월" ];
			$.each( data.lineGraph, function(idx, ele){
				dataRow.push( ele.monthCount[ begin ] ); 
			});
			
			lineRows.push(dataRow);
		}
		
		//GOOGLE LINE CHART API CALL
		drawLineChart({
			rows : lineRows,
			id : "chart2"
		});
	});
}

function drawPieChart( params ) {
	console.info( params );
	var data = new google.visualization.DataTable();
	data.addColumn('string', 'string');
	data.addColumn('number', 'number');
	data.addRows( params.rows );
	
	var options = {
			chartArea: {width: '90%', height: '80%'},
			legend: {position: 'bottom'}
			};
	var pieChart = new google.visualization.PieChart(document.getElementById( params.id ));
	pieChart.draw(data, options);
}
  
function drawLineChart( params ) {
	console.info( params );
    var data = google.visualization.arrayToDataTable( params.rows );

	var options = {
			chartArea: {width: '85%', height: '75%'},
			legend: {position: 'bottom'}
			};
    var lineChart = new google.visualization.LineChart(document.getElementById( params.id));
    lineChart.draw(data, options);
}
</script>