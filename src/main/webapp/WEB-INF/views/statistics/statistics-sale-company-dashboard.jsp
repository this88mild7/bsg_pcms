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
	height: 40px;
	font-size: 20px;
}
</style>
<div class="page-name">
	<h4>
		<img src='<spring:eval expression="@urlProp['star']"/>'> 판매처 통계
		<small>&gt;&gt; 판매처 통계 대쉬보드</small>
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
			<select class="span2">
				<option>이번달</option>
				<option>지난달</option>
				<option>이번주</option>
				<option>지난주</option>
			</select>
			<input type="text" class="span2" placeholder="시작일" /> - <input type="text" class="span2" placeholder="종료일" />
			<div class="input-append">
				<form class="no-margin-bottom" id="contentSearchForm" action="<spring:eval expression="@urlProp['balanceCpSearch']"/>">
					<input type="text" id="searchQuery" name="searchQuery" class="input-medium"  value="${ search.query }" placeholder="검색어">
					<input type="hidden" id="sortingType" name="sortingType" >
					<input type="hidden" id="searchStrDate" name="searchStrDate" >
					<input type="hidden" id="searchEndDate" name="searchEndDate" >
					<button id="btn-content-search-form" class="btn" type="button"><i class="icon-search"></i></button>
				</form>
			</div>
		</div>
		
		<table class="table" style="margin-bottom:0px;">
			<tr>
				<th>순위</th>
				<th>판매처</th>
				<th>판매기기</th>
				<th>총매출금액</th>
				<th>누적판매량</th>
			</tr>
		</table>
		<div id="tbl-wrapper">
			<table class="table table-striped table-hover">
				<c:forEach items="${ dummyList }" var="dummy">
				<tr>
					<td>~</td>
					<td>!</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				</c:forEach>
			</table>
		</div>
		
		<br />
		<br />
		
		<div class="row-fluid">
			<div class="span4">
				<div class="chart-title text-center">
					판매처별 판매그래프
				</div>
				<div id="chart1"></div>
			</div>
			<div class="span8">
				<div class="chart-title">
					<span>기간별 판매그래프</span>
					<span>
						<select class="span2">
							<option>2013년</option>
							<option>2012년</option>
							<option>2011년</option>
							<option>2010년</option>
						</select>
					</span>
				</div>
				<div id="chart2"></div>
			</div>
		</div>
	
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">

      google.load('visualization', '1.0', {'packages':['corechart']});
      //파이차트 그리기
      google.setOnLoadCallback(drawPieChart);
      //라인차트 그리기
      google.setOnLoadCallback(drawLineChart);
      
      function drawPieChart() {
    	  
        var data = new google.visualization.DataTable();
        data.addColumn('string', '스트링');
        data.addColumn('number', '넘버');
        data.addRows([
	        ['LG전자', 3],
	        ['olleh', 1],
	        ['기타', 1]
        ]);

        var options = {'width':'100%'};

        var pieChart = new google.visualization.PieChart(document.getElementById('chart1'));
        pieChart.draw(data, options);
    	  
      }
      
      function drawLineChart() {
          var data = google.visualization.arrayToDataTable([
            ['월', 'LG전자', 'olleh', '기타'],
            ['1월', 1, 3, 1],
            ['2월', 5,10,2],
            ['3월', 1, 3, 1],
            ['4월', 20,1,5],
            ['5월', 5,10,2],
            ['6월', 1, 3, 1],
            ['7월', 20,1,5],
            ['8월', 5,10,2],
            ['9월', 1, 3, 1],
            ['10월', 37, 7, 3],
            ['11월', 20,1,5],
            ['12월',  5,10,2]
          ]);

		var options = {'width':'100%', 'height':300};

        var lineChart = new google.visualization.LineChart(document.getElementById('chart2'));
        lineChart.draw(data, options);
       }
    </script>
</div>
<!--/row-->
<script>
$(function(){
	
	$("#tbl-wrapper").css({
		"overflow":"auto",
		"height":"300px"
	});
	
});


</script>