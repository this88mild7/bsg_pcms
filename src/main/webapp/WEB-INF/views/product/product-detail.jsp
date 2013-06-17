<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	
<div class="page-name">
	<h4>
		판매상품 상세보기
	</h4>
</div>

<div class="row-fluid product-box" data-product_id="${ product.product_id }" data-group_id="${ product.group_id }">

	<div class="span12">
		
	
		<form class="form-horizontal">
			
			<div class="control-group">
				<label class="control-label" for="inputEmail"><img src='<spring:eval expression="@urlProp['v']"/>'> 판매처</label>
				<div class="controls">
					<select size="1" name="customer_id" id="customer">
						<c:forEach items="${ customerList }" var="customer">
							<option value="${ customer.customer_id }" data-group_id="${ customer.group_id }">${ customer.customer_name }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="deviceType"><img src='<spring:eval expression="@urlProp['v']"/>'> 판매형태</label>
				<div class="controls">
					<div class="input-append" id="deviceType">
						<!-- ajax -->
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="saleType"><img src='<spring:eval expression="@urlProp['v']"/>'> 판매방식</label>
				<div class="controls">
					<select size="1" name="product_sale_type" id="product_sale_type">
						<option value="1">개별 판매</option>
						<option value="2">팩키지 판매</option>
						<option value="3">번들 판매</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for=""><img src='<spring:eval expression="@urlProp['v']"/>'> 콘텐츠</label>
				<div class="controls">
					<button class="btn btn-series-create">시리즈등록</button>
					<button class="btn btn-each-create">개별상품등록</button>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for=""></label>
				<div class="controls">
					<div class="span10">
						<table class="table table-condensed table-striped table-bordered table-content">
							<thead>
								<!-- ajax -->
							</thead>
							<tbody>
								<!-- ajax -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for=""></label>
				<div class="controls">
					<label class="radio inline">
						<input type="radio" name="product_price_type" value="1" checked>
						기본판매가격
					</label>
					<label class="radio inline">
						<input type="radio" name="product_price_type" value="0">
						기타 판매가 설정
					</label>
					<input type="text" id="product_price" name="product_price" placeholder="상품가 입력">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="address"></label>
				<div class="controls">
					<label class="radio inline">
						<input type="radio"name="product_source_type" value="ebook" checked>
						E-book source html
					</label>
					<label class="radio inline">
						<input type="radio"name="product_source_type" value="video">
						동영상 html
					</label>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" ></label>
				<div class="controls">
					<textarea class="span10" rows="4" name="product_etc" placeholder="Source 입력">${ product.product_etc }</textarea>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" ></label>
				<div class="controls">
					<button class="btn btn-product-list">목록가기</button>
					<button class="btn btn-primary btn-product-detail-action">수정하기</button>
				</div>
			</div>
			
		</form>

	</div>
	
	<form id="hiddenForm" action='<spring:eval expression="@urlProp['productDeleteAction']"/>' method="POST">
		<input type="hidden" id="product_json" name="product_json" />
	</form>
	
</div>
<!--/row-->
<script>
$("div.product-box").find("button").bind( "click", function(){
	
	if( $(this).is(".btn-product-list") ) {
		bootbox.confirm( "화면에서 빠져 나가시겠습니까?", function(result) {
			if( result ) {
				history.back(-1);
			}
		}); 
	} else if( $(this).is(".btn-customer-delete-action") ) {
		bootbox.confirm( "삭제하시겠습니까?", function(result) {
			if( result ) {
				var $json = { "list" : [ {"pr" : $("div.product-box").data("product_id")+"", "gr" : $("div.product-box").data("group_id")+""} ] };
				
				$("#product_json")
					.val( JSON.stringify( $json ) )
					.parent()
					.submit();
			}
		}); 
	} else if( $(this).is(".btn-product-detail-action") ) {
		
		bootbox.alert("업데이트 구현 예정");
		/*
		bootbox.confirm( "업데이트 하시겠습니까?", function(result) {
			if( result ) {
				$( "#customerForm" ).submit();
			}
		}); 
		*/
	};
	
	return false;
});
</script>