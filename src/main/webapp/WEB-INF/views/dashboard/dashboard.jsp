<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- dashboard CSS -->
<style>
.alert-info {
	height : 250px;
}
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
.tabbable .btn-url {
	margin-left : 100px;
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
		<span class="pull-right"><button class="btn btn-small btn-dashboard" data-url=""><i class="icon-list-alt"></i> 더보기</button></span>
			
			
		<table class="table table-striped table-hover">
		<tr>
			<th>상품코드</th>
			<th>상품명</th>
			<th>판매방식</th>	
			<th>판매처</th>
			<th class="span2">상세보기</th>
		</tr>
		<c:forEach begin="0" end="5" step="1">
		<tr>
			<td>노부영 시리즈</td>
			<td>LG</td>
			<td>김아무개</td>
			<td>Ios</td>
			<td><button class="btn btn-mini"><i class="icon-zoom-in"></i> 상세보기</button></td>
		</tr>
		</c:forEach>
		</table>
	</div>
	
	<div class="span6 tabbable">
		 <ul id="myTab" class="nav nav-tabs">
	      <li><a href="#cpTab" data-toggle="tab"><span class="star-box"><img src='<spring:eval expression="@urlProp['star']"/>'></span> CP업체</a></li>
	      <li><a href="#customerTab" data-toggle="tab"><span class="star-box"><img src='<spring:eval expression="@urlProp['star']"/>'></span> 판매처</a></li>
	      <li class="pull-right"><button class="btn btn-small btn-url" data-url="<spring:eval expression="@urlProp['cpList']"/>"><i class="icon-list-alt"></i> 더보기</button></li>
	    </ul>
   
	    <div class="tab-content">
	      <div class="tab-pane fade in active" id="cpTab">
	          <table class="table table-striped table-hover">
				<tr>
					<th>CP 코드</th>
					<th>회사명</th>
					<th>등록일</th>
					<th>연락처</th>
					<th>상세보기</th>
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
					<th>상세보기</th>
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

	<div class="span6">
	
		<h4><img src='<spring:eval expression="@urlProp['star']"/>'> 3월 판매처 판매통계</h4>
		<span class="pull-right"><button class="btn btn-small"><i class="icon-list-alt"></i> 더보기</button></span>
		<div class="clearfix"></div>
		<div id="chart1">
		&nbsp;
		</div>
		
	</div>
	
	<div class="span6">
		
		<h4><img src='<spring:eval expression="@urlProp['star']"/>'> 월 상품통계</h4>
		<div class="pull-right"><button class="btn btn-small"><i class="icon-list-alt"></i> 더보기</button></div>
		<div class="clearfix"></div>
		<div id="chart2">
		&nbsp;
		</div>
		
	</div>
	
</div>
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
				addStar( index );
			});
		});
	
	
	chart1( document.getElementById('chart1') );
	basic( document.getElementById('chart2') );
});

var addStar = function( index ) {
	
	if( 0 == index ) {
		$("span.star-box")
			.eq(1).hide()
			.end()
			.eq(0).show();
	} else {
		$("span.star-box")
			.eq(0).hide()
			.end()
			.eq(1).show();
	}
}

//하단 좌측 차트 더미 데이터  
function chart1(container) {
   var d1 = [ [1.3, 4.0],[2.3, 3.0],[3.3, 4.3],[4.3, 4.7],[5.3, 4.7],[6.3, 4.3],[7.3, 4.7],[8.3, 4.2] ],    // My
       d2 = [ [1,3.5],[2,3.7],[3,3.5],[4,3.7],[5,3.7],[6,3.2],[7,3.4],[8,3.5] ];

   var bar1 = {
       data: d1,
       label: "Me",
       bars: {
           show: true,
           barWidth: 0.3
       }
   }, mark1 = {
       data: d1,
       markers: {
           show: true,
             position: 'ct',
             fontSize: '10'
       }
   }, bar2 = {
       data: d2,
       label: "Avg",
       bars: {
           show: true,
           barWidth: 0.3
       }
   }, mark2 = {
       data: d2,
       markers: {
           show: true,
             position: 'ct',
             fontSize: '10'
       }
   };

   Flotr.draw(
       container,
       [bar1, mark1, bar2, mark2],
       {
         legend : {
               position : 'sw',
               backgroundOpacity: 1,
               backgroundColor: '#e0e0e0'
           },
           yaxis: {
               min: 0,
               max: 6,
                 tickDecimals: 'no',
                 ticks: [ [1,"1"], [2,"2"], [3,"3"], [4,"4"], [5,"5"] ]
           },
           xaxis: {
                 ticks: [ [1.1,"Total"], [2.1,"Job"], [3.1, "TMR"],
                          [4.1, "Ini"], [5.1, "Com"], [6.1, "Exe"],
                          [7.1, "Co"], [8.1, "Re"] ]
           },
           mouse: { track: true }
       }
   )

   // for FF case z-index error fix
   $('.flotr-legend').css('z-index', '2');
   $('.flotr-legend-bg').css('z-index', '1');


   }
   
// 하단 우측 차트 더미 데이터   
function basic(container) {

	  var
	    d1 = [[0, 3], [4, 8], [8, 5], [9, 13]], // First data series
	    d2 = [],                                // Second data series
	    i, graph;

	  // Generate first data set
	  for (i = 0; i < 14; i += 0.5) {
	    d2.push([i, Math.sin(i)]);
	  }

	  // Draw Graph
	  graph = Flotr.draw(container, [ d1, d2 ], {
	    xaxis: {
	      minorTickFreq: 4
	    }, 
	    grid: {
	      minorVerticalLines: true
	    }
	  });
	};
</script>