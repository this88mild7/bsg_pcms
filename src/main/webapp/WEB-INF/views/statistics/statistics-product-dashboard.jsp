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
			출력순
			<select id="sorting_type" class="span2">
				<option value="1" <c:if test="${sortingType eq '1' }">selected="selected"</c:if> >등록순</option>
				<option value="2" <c:if test="${sortingType eq '2' }">selected="selected"</c:if> >매출순</option>
				<option value="3" <c:if test="${sortingType eq '3' }">selected="selected"</c:if> >수익수</option>
				<option value="4" <c:if test="${sortingType eq '4' }">selected="selected"</c:if> >판매량</option>
			</select>
			기간설정
			<select class="span2" id="period">
				<option value="thisMonth">이번달</option>
				<option value="lastMonth">지난달</option>
				<option value="thisWeek">이번주</option>
				<option value="lastWeek">지난주</option>
			</select>
			<input type="text" class="span2" placeholder="시작일" /> - <input type="text" class="span2" placeholder="종료일" />
			<div class="input-append">
				<form class="no-margin-bottom" id="contentSearchForm" action="<spring:eval expression="@urlProp['balanceCpSearch']"/>">
					<input type="text" id="searchQuery" name="searchQuery" class="input-medium"  value="${ search.query }">
					<input type="hidden" id="sortingType" name="sortingType" >
					<input type="hidden" id="searchStrDate" name="searchStrDate" >
					<input type="hidden" id="searchEndDate" name="searchEndDate" >
					<button id="btn-content-search-form" class="btn" type="button"><i class="icon-search"></i></button>
				</form>
			</div>
		</div>
		
		<div id="tbl-wrapper">
			<table class="table table-striped table-hover">
				<tr>
					<th>순위</th>
					<th>상품명</th>
					<th>판매기기</th>
					<th>총매출금액</th>
					<th>누적판매량</th>
				</tr>
				<c:forEach items="${ tableList }" var="obj" varStatus="status">
				<tr>
					<td>${ status.count }</td>
					<td>${ obj.contents_name }</td>
					<td>${ obj.sale_device }</td>
					<td class="price">${ obj.total_sale_price }</td>
					<td class="count">${ obj.total_sale_count }</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		
		<br />
		<br />
		
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
	
	//목록 상하 스크롤 만들기
	$("#tbl-wrapper").css({
		"overflow":"auto",
		"height":"300px"
	});
	
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