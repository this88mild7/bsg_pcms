<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="page-name">
	<h3>
		<img src='<spring:eval expression="@urlProp['star']"/>'> 카테고리 관리 <small>&gt;&gt; 콘텐츠 학습 카테고리 관리 화면입니다.</small>
	</h3>
</div>

<div id="category_box" class="row-fluid">

	<!-- 메인 카테고리 -->
	<div id="category1" class="span3 category">
		<div class="row-fluid">
			<select name="category-id1" id="category-id1" class="span12" size="15">
				<c:forEach items="${categoryList}" var="category">
					<option value="${ category.cate_id }">${ category.cate_name }</option>
				</c:forEach>
			</select>
		</div>
		<div class="row-fluid">
			<div class="span12 input-prepend input-append">
				<span class="add-on">No.</span>
				<input id="category_name1" class="span8" type="text" name="category_name" placeholder="카테고리명">
				<button class="btn" data-fn-type="register">등록</button>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<button class="btn" data-fn-type="delete">선택삭제</button>
				<button class="btn" data-fn-type="update">수정</button>
			</div>
		</div>
	</div>

	<!-- 시리즈 -->
	<div id="series_box" class="span3 category">
		<div class="row-fluid">
			<select name="series" id="series" class="span12" size="15">
			</select>
		</div>
		<div class="row-fluid">
			<div class="span12 input-prepend input-append">
				<span class="add-on">No.</span>
				<input id="series_name" class="span8" type="text" name="category_name" placeholder="시리즈명">
				<button class="btn" data-fn-type="register">등록</button>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<button class="btn" data-fn-type="delete">선택삭제</button>
				<button class="btn" data-fn-type="update">수정</button>
			</div>
		</div>
	</div>

	<!-- 현재 사용안함 -->
	<div id="category3" class="span3 category">
		<div class="row-fluid">
			<select class="span12" size="15">
				<option>구현예정</option>
			</select>
		</div>
		<div class="row-fluid">
			<div class="span12 input-prepend input-append">
				<span class="add-on">No.</span>
				<input class="span8" type="text" name="category_name" placeholder="카테고리명">
				<button class="btn categoryBtn1">등록</button>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<button class="btn">선택삭제</button>
				<button class="btn">수정</button>
			</div>
		</div>
	</div>
	<!-- 현재 사용안함 -->

	<div id="category4" class="span3 category">
		<div class="row-fluid">
			<select class="span12" size="15">
				<option>구현예정</option>
			</select>
		</div>
		<div class="row-fluid">
			<div class="span12 input-prepend input-append">
				<span class="add-on">No.</span>
				<input class="span8" type="text" name="category_name" placeholder="카테고리명">
				<button class="btn categoryBtn1">등록</button>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span12">
				<button class="btn">선택삭제</button>
				<button class="btn">수정</button>
			</div>
		</div>
	</div>

</div>
<!--/row-->

<script>
$(function(){
	
	//현재는 카테고리3,4 사용안함.
	$("#category3, #category4").hide();
	
	//카테고리1 선택시 시리즈 옵션 변경
	$("#category-id1")
		.change(function () {
			var select_id = $(this).find("option").filter(":selected").val();
			if( null != select_id ){
			 
				$("#series")
					.find("option").remove();
			 
				var jqxhr = $.getJSON('<spring:eval expression="@urlProp['seriesAjaxList']"/>', { cate_id : select_id }, function(data) {
					
					if( data.resultCnt > 0 ){
						$.each( data.result, function(){
							$html = '<option value="' + this.series_mgmtno + '">' + this.series_name + '</option>';
							$("#series").append( $html );
						} );
					}
						  
				});
				console.info(jqxhr);
			}//if 
		})
		.find("option")
			.first().prop( "selected", true )
			.end()
		.end()
		.trigger("change");

$( "#category1 button" ).click(function(){
	
	
	var fnType = $( this ).data( "fnType" );
	var $categoryId1 = $("#category-id1");
	switch ( fnType )
	{
		case 'register': 
			
			var cateName = $( "#category_name1" ).val();
			
			//validation
			if( cateName.length === 0 ){
				alert( "이름을 입력해 주십시오." );
				$( "#category_name1" ).focus();
				break;
			}
			
			var answer1 = true;
			$categoryId1
				.find("option").each(function(){
				
					if( $( this ).text() == cateName ){
						alert( "이미 같은 이름이 있습니다." );
						$("#category_name1").focus();
						answer1 = false;
						return false;
					} else {
						
					}
				});
			
			if ( answer1 && confirm( "새 카테고리 [" + cateName + "] 를 추가하시겠습니까?" ) ){
				$.ajax({
					url : "<spring:eval expression="@urlProp['categoryAjaxCreateAction']"/>",
					type : "GET",
					contentType : "text/html; charset=utf-8" ,
					data : { cate_name : cateName },
					dataType : "json",
					success : function( data ) {
						
						var result = data.result;
						
						var $html = '<option value="' + result.cate_id + '">' + result.cate_name + '</option>';
	
						$( "#category-id1" ).append( $html );
						alert("카테고리 생성 완료");
						
						// 카테고리 셀렉트 해제
						$( "#category-id1 option" ).each(function(){
							$( this ).attr( "selected", false );
						});
						//카테고리 입력 input 초기화
						$( "#category_name1" ).val( "" );
						//시리즈 select 초기화
						$("#series").find( "option" ).remove();
					},
					error : function() {
						alert("카테고리 생성 실패, 관리자에게 문의하여 주십시오.");
					}
				});
			}
			break;
		case 'delete':
			
			var $target = $("#category-id1").find("option").filter(":selected");
			var categoryName = $target.text();
			
			if( $target.size() === 0 ){
				alert( "삭제할 카테고리를 선택해 주십시오." );
				break;				
			}
			if ( !confirm( "하위 카테고리까지 전부 삭제 됩니다.\n" + categoryName + "를 삭제하시겠습니까? " ) ){
				break;
			}
			
			$.ajax({
				url : "<spring:eval expression="@urlProp['categoryAjaxDeleteAction']"/>",
				type : "GET",
				contentType : "text/html; charset=utf-8" ,
				data : { strList : $target.val() },
				dataType : "json",
				success : function( data ) {
					
					alert("카테고리 삭제 완료");
					// 선택한 카테고리 삭제
					$target.remove();
					//하위카테고리 삭제
					$("#select").find("option").remove();
				},
				error : function() {
					alert("카테고리 삭제 실패, 관리자에게 문의하여 주십시오.");
				}
			});
			break;
		case 'update':
			console.info("update");
			
			var $target = $("#category-id1").find("option").filter(":selected");
			var cateName = $target.text();
			var cateId = $target.val();
			
			bootbox.prompt("카테고리 이름을 입력해 주세요.", "취소", "변경", function( result ) {       
				if (result != null) {	
					
					if( selectValidation(result, $("#category-id1")) ) {
						
						$.ajax({
							url : "<spring:eval expression="@urlProp['categoryAjaxUpdateAction']"/>",
							type : "GET",
							contentType : "text/html; charset=utf-8" ,
							data : {
								cate_id : cateId,
								cate_name : result
							},
							dataType : "json",
							success : function( data ) {
								
								alert("카테고리 변경 완료");
								$target.text(result);
							},
							error : function() {
								alert("카테고리 변경 실패, 관리자에게 문의하여 주십시오.");
							}
						});
						
					} else {
						return false;
					}
					
				}
			}, cateName);
			
			break;
		default:
			console.info("nothing ");
		}

	});


$( "#series_box button" ).click(function(){
	
	var fnType = $( this ).data( "fnType" );
	switch ( fnType )
	{
		case 'register': 
			
			var seriesName = $("#series_name").val();
			var cateId = $("#category-id1").find("option").filter(":selected").val();
			
			if( cateId == null ){
				alert( "카테고리를 선택해 주세요!" );
				break;
			}
			if( seriesName.length === 0 ){
				alert( "시리즈명을 입력해 주세요!" );
				$( "#series_name" ).focus();
				break;
			}
			
			var answer2 = true;
			
			$("#select").find("option").each(function(){
				
				if( $( this ).text() == seriesName ){
					alert( "이미 같은 이름이 있습니다." );
					answer2 = false;
					$( "#series_name" ).focus();
					return false;
				}
			});
			
			if ( answer2 && confirm("새 시리즈 [" + seriesName + "] 를 추가하시겠습니까?") ){
			
				$.ajax({
					url : "<spring:eval expression="@urlProp['seriesAjaxCreateAction']"/>",
					type : "GET",
					contentType : "text/html; charset=utf-8" ,
					data : { 
						series_name : seriesName, 
						cate_id : cateId },
					dataType : "json",
					success : function( data ) {
						var result = data.result;
						var $html = '<option value="' + result.series_mgmtno + '" data-cate_id="' + result.cate_id + '">' + result.series_name + '</option>';
	
						$( "select[name='series']" ).append( $html );
						$( "#series_name" ).val( "" );
						alert("시리즈 생성 완료");
						
					},
					error : function() {
						alert("시리즈 생성 실패, 관리자에게 문의하여 주십시오.");
					}
				});
			}
			break;
		case 'delete':
			var $target = $("#series").find("option").filter(":selected");
			if( $target.size() === 0 ){
				alert( "삭제할 시리즈를 선택해 주십시오." );
				break;				
			}
			
			var seriesName = $target.text();
			var answer = confirm( seriesName + "를 삭제하시겠습니까? " );
			if ( !answer ){
				break;
			}
			
			$.ajax({
				url : "<spring:eval expression="@urlProp['seriesAjaxDeleteAction']"/>",
				type : "GET",
				contentType : "text/html; charset=utf-8" ,
				data : {
					strList : $target.val()
					},
				dataType : "json",
				success : function( data ) {
					console.info("success");
					console.info( data );
					
					alert("시리즈 삭제 완료");
					$target.remove();
				},
				error : function() {
					alert("시리즈 삭제 실패, 관리자에게 문의하여 주십시오.");
				}
			});
			break;
		case 'update':
			console.info("update");
			
			var $target = $("#series").find("option").filter(":selected");
			
			if( $target.size() === 0 ){
				alert( "삭제할 시리즈를 선택해 주십시오." );
				break;				
			}
			
			var seriesName = $target.text();
			var seriesMgmtno = $target.val();
			
			bootbox.prompt("변경할 시리즈 이름을 입력해 주세요.", "취소", "변경", function( result ) {       
				if (result != null) {	
					
					if( selectValidation(result, $("#series")) ) {
						
						$.ajax({
							url : "<spring:eval expression="@urlProp['seriesAjaxUpdateAction']"/>",
							type : "GET",
							contentType : "text/html; charset=utf-8" ,
							data : {
								series_mgmtno : seriesMgmtno,
								series_name : seriesName
							},
							dataType : "json",
							success : function( data ) {
								
								alert("시리즈 이름 변경 완료");
								$target.text(result);
							},
							error : function() {
								alert("시리즈 이름 변경 실패, 관리자에게 문의하여 주십시오.");
							}
						});
						
					} else {
						return false;
					}
					
				}
			}, seriesName);
			break;
		default:
			console.info("nothing ");
		}

	});

});



// 빈값 X, 같은 이름 안되게 체크
var selectValidation = function( result, selectElement ) {
	
	var returnValue = true;
	if( result.length < 1) {
		alert("빈 값은 허용하지 않습니다.");				
		returnValue = false;
	}
	
	selectElement
		.find("option").each(function(){
			if( result == $(this).text() ) {
				alert("같은 이름은 허용하지 않습니다.");
				returnValue = false;
			}
		});
	
	return returnValue;
};
</script>