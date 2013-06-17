<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page-name">
	<h3>
		<img src='<spring:eval expression="@urlProp['star']"/>'> 판매상품 리스트
		<small>&gt;&gt; 판매처에서 판매되는 상품의 관리화면입니다.</small>
	</h3>
</div>
<div class="row-fluid product-box" data-json='${ jsonStr }'>

	<div class="pull-right">
		<div class="btn-group">
			<a class="btn dropdown-toggle" data-toggle="dropdown" href="#"><span>전체</span><span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="#">전체</a></li>
				<li><a href="#">판매처명</a></li>
			</ul>
		</div>
		<div class="input-append">
			<form class="no-margin-bottom" id="productSearchForm" action="<spring:eval expression="@urlProp['productList']"/>">
				<input type="hidden" id="productType" name="type" >
				<input class="inputError" type="text" id="productQuery" name="query" class="input-medium" value="${ search.query }">
				<button class="btn btn-product-search-action" type="button"><i class="icon-search"></i></button>
			</form>
		</div>
	</div>
	
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th><input class="check-all" type="checkbox" name="checkbox_all" value="false" data-toggle="tooltip"></th>
				<th>상품코드</th>
				<th>판매방식</th>
				<th>판매형태</th>
				<th>판매처</th>
				<th>상품명</th>
				<th>등록일</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody id="productBody">
			<!-- json parse -->
		</tbody>
	</table>
	
	<div class="clearfix">
		<p class="pull-right">
			<button class="btn btn-product-selected-delete">선택삭제</button>
			<button class="btn btn-primary btn-url" data-url="<spring:eval expression="@urlProp['productCreate']"/>">판매상품 등록</button>
		</p>
	</div>
	
	<form id="hiddenForm" action="<spring:eval expression="@urlProp['productDeleteAction']"/>" method="POST">
		<input type="hidden" id="product_json" name="product_json" />
	</form>
	
</div>
<!--/row-->

<script>
$(function(){
	var obj = ${ jsonStr };
	if( obj.result.length > 0 ) {
		
		var $target = $("#productBody");
		
		$.each(obj.result, function(){
			var cnt = this.prod_cnt;
			var arr = this.prod_list;
			
			for( var i = 1; i <= cnt; i++) {

				var html = "<tr>";

				if(i == 1) {
					html += '<td rowspan="' + cnt + '"><input type="checkbox" name="check_list" data-group_id="' + this.group_id + '" value="' + this.product_id + '"></td>';
					html += "<td rowspan='" + cnt + "'>" + this.product_id + "</td>";
					html += "<td rowspan='" + cnt + "'>" + this.product_sale_type + "</td>";
					html += "<td rowspan='" + cnt + "'>" + this.product_device_type + "</td>";
					html += "<td rowspan='" + cnt + "'>" + this.customer_name + "</td>";
					html += "<td>" + arr[i-1] + "</td>";
					html += "<td rowspan='" + cnt + "'>" + this.product_cdate + "</td>";
					html += "<td rowspan='" + cnt + "' class='span2'><button class='btn btn-url' data-url='<spring:eval expression="@urlProp['productDetail']"/>?product_id=" + this.product_id + "'>상세보기</button></td>";
				} else {
					html += "<td>" + arr[i-1] + "</td>";
				}
				
				html += "</tr>";

				$target.append(html);
			}
			
			$("button").click(function(){
				var $this = $(this);
				if( $this.is(".btn-url") ) {
					console.info(">>>");
					window.location = $this.data("url");
				}
			});
		});
		
		
	}
	
	$("button").click(function(){
		var $this = $(this);
		if( $this.is(".btn-product-selected-delete") ) {
			// 체크박스 폼 체크
			var $checkboxArray = $( "input[name='check_list']:checked" );
			
			if( $checkboxArray.length === 0 ){
				bootbox.alert("삭제할 판매상품을 선택해주세요.");
			} else {
				bootbox.confirm( "선택한 판매상품을 삭제하시겠습니까?", function(result) {
					if( result ) {
						var arr = [];
						$.each( $checkboxArray, function(idx){
							arr.push( { "pr" : $(this).val(), "gr" : $(this).data("group_id")+"" } );
						});
						
						var $json = { "list" : arr };
						
						$("#product_json")
							.val( JSON.stringify( $json ) )
							.parent()
							.submit();
					}
				});
			}//else
		}
	});
});
</script>