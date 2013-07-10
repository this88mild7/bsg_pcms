<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- dashboard CSS -->
<style>
.alert-info {
	height : 250px;
}
h4 {
	color: #B404AE;
	float: left;
}

.pull-right {
	line-height: 46px;
} 

#myTab a {
	color: #003366;
	font-size : 17.5px;
	font-weight : bold;
}
#myTab>li.active>a {
	color: #B404AE;
}
.tab-content .table {
	margin : 0px 0px 0px;
}
.tabbable .nav li {
	line-height: 46px;
}
.tabbable ul {
	padding: 0;
	margin: 0 0 -1px 0px;
}

#chart1, #chart2 {
	margin: 0px 0px 20px 0px;
}
</style>

<div class="row-fluid">

	<div class="span6">
		
		<h4><img src='<spring:eval expression="@urlProp['star']"/>'> 최신등록상품</h4>
		<span class="pull-right"><button class="btn btn-small btn-url" data-url='<spring:eval expression="@urlProp['saleCompanyContractList']"/>'><i class="icon-list-alt"></i> 더보기</button></span>
			
			
		<table class="table table-striped table-hover">
		<tr>
			<th>상품코드</th>
			<th>상품명</th>
			<th>판매처</th>
			<th class="span2">상세보기</th>
		</tr>
		<c:forEach items="${productList}" var="product" varStatus="loop">
			<c:choose>
			<c:when test="${loop.count lt 7}">
	        <tr>
	   	    	<td>${ product.contents_cd }</td> 
	   	    	<td>${ product.contents_name }</td> 
	   	    	<td>${ product.company_name }</td>
				<td><button class="btn btn-mini btn-url" data-url="<spring:eval expression="@urlProp['saleCompanyContractDetail']"/>?contract_mgmtno=${ product.contract_mgmtno }"><i class="icon-zoom-in"></i> 상세보기</button></td>
	        </tr>
			</c:when> 
			</c:choose> 
		</c:forEach>
		</table>
	</div>
	
	<div class="span6 tabbable">
		 <ul id="myTab" class="nav nav-tabs">
	      <li><a href="#cpTab" data-toggle="tab"><span class="star-box"><img src='<spring:eval expression="@urlProp['star']"/>'></span> CP업체</a></li>
	      <li><a href="#customerTab" data-toggle="tab"><span class="star-box"><img src='<spring:eval expression="@urlProp['star']"/>'></span> 판매처</a></li>
	      <li class="pull-right"><button id="cross" class="btn btn-small btn-url cross" data-url="<spring:eval expression="@urlProp['cpList']"/>"><i class="icon-list-alt"></i> 더보기</button></li>
	    </ul>
   
	    <div class="tab-content">
	      <div class="tab-pane fade in active" id="cpTab">
	          <table class="table table-striped table-hover">
				<tr>
					<th>CP 코드</th>
					<th>회사명</th>
					<th>등록일</th>
					<th>연락처</th>
					<th class="span2">상세보기</th>
				</tr>
				<c:forEach items="${cpList}" var="cp" varStatus="loop">
					<c:choose>
					<c:when test="${loop.count lt 7}">
			        <tr>
			   	    	<td>${ cp.company_mgmtno }</td>
			   	    	<td>${ cp.company_name }</td>
			   	    	<td>${ cp.reg_dt }</td>
			   	    	<td>${ cp.phoneno }</td>
						<td><button class="btn btn-mini btn-url" data-url="<spring:eval expression="@urlProp['cpDetail']"/>?company_mgmtno=${ cp.company_mgmtno }"><i class="icon-zoom-in"></i> 상세보기</button></td>
			        </tr>
					</c:when> 
					</c:choose> 
				</c:forEach>
				</table>
	      </div>
	      <div class="tab-pane fade in row-fluid" id="customerTab">
	      	<table class="table table-striped table-hover">
          		<tr>
					<th>판매처 코드</th>
					<th>판매처명</th>
					<th>계약날짜</th>
					<th>연락처</th>
					<th class="span2">상세보기</th>
				</tr>
				<c:forEach items="${saleCompanyList}" var="saleCompany" varStatus="loop">
					<c:choose>
					<c:when test="${loop.count lt 7}">
			        <tr>
			   	    	<td>${ saleCompany.company_mgmtno }</td>
			   	    	<td>${ saleCompany.company_name }</td>
			   	    	<td>${ saleCompany.reg_dt }</td>
			   	    	<td>${ saleCompany.phoneno }</td>
						<td><button class="btn btn-mini btn-url" data-url="<spring:eval expression="@urlProp['saleCompanyDetail']"/>?company_mgmtno=${ saleCompany.company_mgmtno }"><i class="icon-zoom-in"></i> 상세보기</button></td>
			        </tr>
					</c:when> 
					</c:choose> 
				</c:forEach>
			</table>
	      </div>
	    </div>
	</div>
</div>

<hr />

<div class="row-fluid">
	<div class="span12">
		<div>
			<div style="line-height: 46px;">
				<button id="stats-product" class="btn btn-small"></button>
				<button id="stats-sale" class="btn btn-small"></button>
				<div class="pull-right">
					<button id="stats-btn" class="btn btn-small btn-url" data-url="<spring:eval expression="@urlProp['statsProductDashboard']"/>"><i class="icon-list-alt"></i> 더보기</button>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<div id="chart-layer">
			<!-- GOOGLE CHART HERE -->
		</div>
	</div>
</div>

<br />

	<!-- GOOGLE CHART API -->
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
		google.load('visualization', '1.0', {'packages':['corechart']});
    </script>
    
<script>
$(function(){
	
	//CP업체|판매처 탭 활성화
	$("#myTab")
		.find("a")
			.filter(":first").tab('show')
			.end()
		.end()
		.find("li").each(function(index){
			
			if( index == 1 )
				$("span.star-box").eq(1).hide();
			if( index == 2 )
				return false;
			
			$(this).click(function(){
				if( 0 == index ) {
					$("span.star-box")
						.eq(1).hide()
						.end()
						.eq(0).show();
					
					$("#cross").data("url", "<spring:eval expression="@urlProp['cpList']"/>");
					
				} else {
					$("span.star-box")
						.eq(0).hide()
						.end()
						.eq(1).show();
					
					$("#cross").data("url", "<spring:eval expression="@urlProp['saleCompanyList']"/>");
				}
			});
		});
	
	$("#stats-product").click(function() {
		var $this = $(this);
		$this.addClass("btn-inverse");
		$("#stats-sale").removeClass("btn-inverse");
		$("#stats-btn").data('url','<spring:eval expression="@urlProp['statsProductDashboard']"/>');
		createColumnChart({
			type: 'product',
			url: '<spring:eval expression="@urlProp['statsProductLineChart']"/>'
		});	
	});
	
	$("#stats-sale").click(function() {
		var $this = $(this);
		$this.addClass("btn-inverse");
		$("#stats-product").removeClass("btn-inverse");
		$("#stats-btn").data('url','<spring:eval expression="@urlProp['statsCompanyDashboard']"/>');
		createColumnChart({
			type: 'sale',
			url: '<spring:eval expression="@urlProp['statsCompanyLineChart']"/>'
		});	
	});
	
	//차트 기본값 상품통계
	var thisYear = new Date().toString('yyyy')
	$("#stats-product").text( thisYear + '년 상품통계' );
	$("#stats-sale").text( thisYear + '년 판매통계' );
	$("#stats-product").trigger("click");
	
});

//상품차트
function createColumnChart(option){

	var param;
	var url = option.url;
	
	$.getJSON(url, param, function(data) {
		console.info( data );
		
		if(data.code != 200) {
			bootbox.alert( data.msg );
			return false;
		} else if(data.lineGraph.length == 0) {
			bootbox.alert( "선차트 데이터가 없습니다." );
			return false;
		}
		
		var ggData = [],
			firstRow = [ "" ];
		for ( var begin = 0; begin <= 11; begin++ ) {
			var monthRow = [ (begin+1) + "월" ];
			$.each( data.lineGraph, function(idx, ele){
				if( begin == 0 ) {
					if( option.type == 'product') {
						firstRow.push( ele.contentName ); 
					} else {
						firstRow.push( ele.saleCompanyName );
					}
				}
				monthRow.push( ele.monthCount[ begin ] ); 
			});
			if( begin == 0 ) {
				ggData.push(firstRow);
			}
			ggData.push(monthRow);
		}
		
		// Data
		var data = google.visualization.arrayToDataTable(ggData);
		console.debug( "ggData ", ggData);
		var options = {
				height: 400,
				chartArea: { height: '80%'},
				legend: {position: 'bottom'},
				yAxis: {title: "7월"},
				backgroundColor:{fill:'white'},
				bar:{groupWidth:"90%"}
			};
		var columnChart = new google.visualization.ColumnChart(document.getElementById("chart-layer"));
		columnChart.draw(data, options);
	});
}
</script>