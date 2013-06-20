<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="page-name">
	<h4>
		<c:choose>
			<c:when test="${empty isNew}">
				[${ content.name }] 상세정보
			</c:when>
			<c:otherwise>
				콘텐츠 등록 <small>&gt;&gt; 콘텐츠를 등록해 주세요.</small>
			</c:otherwise>
		</c:choose>
	</h4>
</div>

<div class="row-fluid box" 
data-contents_cd="${ content.contents_cd }"
data-name="${ content.name }"
data-contents_type="${ content.contents_type }"
data-sale_price="${ content.sale_price }"
data-age="${ content.age }"
data-company_mgmtno="${ content.company_mgmtno }"
data-cate_id="${ content.cate_id }"
data-series_mgmtno="${ content.series_mgmtno }"
data-currency="${ content.currency }"
>

	<div class="span12">
		
		<form id="contentForm" class="form-horizontal " method="POST" action="<spring:eval expression="@urlProp['contentCreateAction']"/>">
			<c:if test="${empty isNew}">
				<input type="hidden" name="contents_cd" value="${ content.contents_cd }" />
			</c:if>
			<div class="control-group">
				<label class="control-label" for="name"><img src='<spring:eval expression="@urlProp['v']"/>'> 콘텐츠명</label>
				<div class="controls">
					<input type="text" id="name" name="name" placeholder="콘텐츠명" value="${ content.name }" required="required" data-validation-required-message="콘텐츠명을 입력해 주세요.">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="company_mgmtno"><img src='<spring:eval expression="@urlProp['v']"/>'> CP업체</label>
				<div class="controls">
					<select size="1" id="company_mgmtno" name="company_mgmtno" data-cnt="${ fn:length( cpList ) }">
						<c:forEach items="${cpList}" var="cp">
							<option value="${ cp.company_mgmtno }">${cp.company_name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="category-list"><img src='<spring:eval expression="@urlProp['v']"/>'> 상품카테고리</label>
				<div id="category-box" class="controls">
					<select size="1" name="cate_id" data-cnt="${ fn:length( categoryList ) }" data-id="${ content.cate_id }">
						<c:forEach items="${ categoryList }" var="cate" >
							<option value="${ cate.cate_id }">${ cate.cate_name }</option>
						</c:forEach>
					</select>
					<select size="1" name="series_mgmtno" id="series_mgmtno" data-id="${ content.series_mgmtno }">
						<option value="0">선택안함</option>
					</select>
					<span class="help-inline"><a id="tip1" href="#" data-toggle="tooltip" >tip</a></span>
					<script>
					$('#tip1')
						.tooltip({
							"title":"메인 카테고리, 시리즈는 필수 선택입니다",
							"placement":"bottom"
						});
					</script>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" ><img src='<spring:eval expression="@urlProp['v']"/>'> 콘텐츠 유형</label>
				<div class="controls">
					<label class="radio inline">
						<input type="radio" name="contents_type" value="pb" checked="checked"> 그림책
					</label>
					<label class="radio inline">
						<input type="radio" name="contents_type" value="ebook"> E-BOOK
					</label>
					<label class="radio inline">
						<input type="radio" name="contents_type" value="2d"> 2D 애니
					</label>
					<label class="radio inline" >
						<input type="radio" name="contents_type" value="3d"> 3D 애니
					</label>
					<label class="radio inline">
						<input type="radio" name="contents_type" value="game"> 게임
					</label>
					<label class="radio inline">
						<input type="radio" name="contents_type" value="etc"> 기타
					</label>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="content_age"><img src='<spring:eval expression="@urlProp['v']"/>'> 연령</label>
				<div class="controls">
					<select name="age" size="1">
						<option value="1">0-1세</option>
						<option value="3">2-3세</option>
						<option value="5">4-5세</option>
						<option value="7">6-7세</option>
						<option value="0">전체시청</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="optionsRadio">판매가설정</label>
				<div class="controls">
					<label class="radio inline">
						<input type="radio" name="optionsRadio" value="1" checked>
						판매가설정
					</label>
					<label class="radio inline">
						<input type="radio" name="optionsRadio" value="0">
						설정안함
					</label>
				</div>
			</div>
			<div class="control-group price-group">
				<label class="control-label" for="content_price">판매단가</label>
				<div class="controls">
					<div class="input-prepend">
						<div class="btn-group no-padding">
							<button class="btn dropdown-toggle" data-toggle="dropdown">
								<span id="currency-view">KRW</span><span class="caret"></span>
							</button>
							<ul class="dropdown-menu" id="currency-menu">
								<li><a href="#">KRW</a></li>
								<li><a href="#">USD</a></li>
								<li><a href="#">JPY</a></li>
								<li><a href="#">CNY</a></li>
								<li><a href="#">EUR</a></li>
							</ul>
						</div>
						<input type="hidden" id="currency" name="currency" value="KRW">
						<input type="text" id="sale_price" name="sale_price" placeholder="판매단가" value="${ content.sale_price }" data-validation-required-message="판매단가를 숫자로 입력해 주세요.">
					</div>
					<a id="tip2" href="#" data-toggle="tooltip" >tip</a>
					<script>
					$('#tip2')
						.tooltip({
							"title":"콘텐츠 판매가는 실제 판매상품 등록 시 여러 환율 단위로 등록이 가능합니다. 대표 가격만 입력해주세요.",
							"placement":"bottom"
						});
					</script>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="file_path">콘텐츠 파일경로</label>
				<div class="controls">
					<input type="text" id="file_path" name="file_path" placeholder="콘텐츠 파일경로" value="${ content.file_path }">
				</div>
			</div>
		</form>
		
			<div class="control-group">
				<label class="control-label" ></label>
				<div class="controls">
					<button id="btn-content-list" class="btn">목록가기</button>
					<c:choose>
						<c:when test="${empty isNew}">
							<button id="btn-content-delete-action" class="btn">삭제</button>
							<button id="btn-content-update-action" class="btn btn-primary">수정하기</button>
						</c:when>
						<c:otherwise>
							<button id="btn-content-create-action" class="btn btn-primary">등록하기</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			
	</div>

	<form id="hiddenForm" action="<spring:eval expression="@urlProp['contentDeleteAction']"/>" method="POST">
		<input type="hidden" name="strList" value="${ content.contents_cd }"/>
	</form>
	
</div>
<!--/row-->

<script>
$(function(){
	
	//유효성 체크
	$("input,select,textarea").not("[type=submit]").jqBootstrapValidation();
	$('#sale_price').autoNumeric('init',{aPad: false });
	
	$('input[name="optionsRadio"]').click(function(){
		var $this = $(this);
		if(1 == $this.val() ) {
			$( "div.price-group" ).show();
			$('#sale_price').prop("required", true);
			//유효성 체크 다시 걸기
			$("input,select,textarea").not("[type=submit]").jqBootstrapValidation();
		} else {
			$( "div.price-group" ).hide();
			$('#sale_price').prop("required", false);
			
			console.info($('#sale_price').val());
			$('#sale_price').val(0);
			console.info($('#sale_price').val());
		}
	});
	
	// 판매가가 없으면 판매가 설정안함으로 라디오 체크
	if($("div.box").data("sale_price").length == 0 || $("div.box").data("sale_price") == 0) {
		$("input[name='optionsRadio']").each(function(){
			if("0" == $(this).val()){
				$(this ).prop("checked", true);
				$("div.price-group").hide();
			}
		});
	}
	
	$("#contentForm").submit(function(){
		
		// 10,000 원 => 숫자로만 변경
		$('#sale_price').val($('#sale_price').autoNumeric('get'));
	});
	
	//환율 변경
	$("#currency-menu").find("a").click(function(){
		var nowCurrency = $(this).text();
		$("#currency-view").text(nowCurrency);
		$("#currency").val(nowCurrency);
		
	});
	
	
	// CP 업체 선택
	$("#company_mgmtno").find("option[value='" + $("div.box").data("company_mgmtno") + "']").prop("selected", true);
	
	// 콘텐츠 유형 선택
	$("#contents_type").each(function(){
		if( $( "div.box" ).data( "content_type" ) == $(this).val() ){
			$( this ).prop("checked", true);
		}
	});
	// 연령 선택
	$("#age").find("option[value='" + $( "div.box" ).data( "content_age" ) + "']" ).prop("selected", true);
	
	// 환율 선택
	if($("div.box").data("currency").length > 0) {
		$("#currency-view").text($("div.box").data("currency"));
	}
	
	$("#btn-content-list").click(function(){
		bootbox.confirm( "화면에서 빠져 나가시겠습니까?", function(result) {
			if( result ) {
				history.back(-1);
			}
		}); 
	});
	$("#btn-content-create-action").click(function(){
		bootbox.confirm( "등록 하시겠습니까?", function(result) {
			if( result ) {
				$( "#contentForm" ).submit();
			}
		}); 
	});
	$("#btn-content-delete-action").click(function(){
		bootbox.confirm( "삭제하시겠습니까?", function(result) {
			if( result ) {
				$( "#hiddenForm" ).submit();
			};
		});  
	});
	$("#btn-content-update-action").click(function(){
		bootbox.confirm( "업데이트 하시겠습니까?", function(result) {
			if( result ) {
				$( "#contentForm" )
					.attr("action", '<spring:eval expression="@urlProp['contentUpdateAction']"/>')
					.submit();
			}
		}); 
	});
	
	var $selectCate = $( "select[name=cate_id]" );
	$selectCate.change(function () {
		if( $( this ).data("cnt") > 0 ){
			$.getJSON('<spring:eval expression="@urlProp['seriesAjaxList']"/>', { cate_id : $( this ).find( "option:selected").val() }, function(data) {
				console.info( data );
				if( data.resultCnt > 0 ){
					var $seriesEle = $("#series_mgmtno");
					$seriesEle.find("option").remove();
					
					$.each( data.result, function(){
						$("<option>")
							.val( this.series_mgmtno )
							.text( this.series_name )
							.appendTo($seriesEle);
					});
					
					$seriesEle
						.find("option").filter(function(){
							var $this = $(this);
							if( $("div.box").data("series_mgmtno") == $this.val() ){
								$this.prop("selected", true);
							}
						});
				}
			});				
		}
	});
	
	//카테고리 선택
	$selectCate
		.find("option").filter(function(){
			var $this = $(this);
			if( $("div.box").data("cate_id") == $this.val() ){
				$this.prop("selected", true);
			}
		});
	
	$selectCate.trigger('change');


});
</script>