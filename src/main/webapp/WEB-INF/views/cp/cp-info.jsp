<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="page-name">
	<h4>
		<c:choose>
			<c:when test="${empty isNew}">
				[${ cp.company_name }] 상세정보
			</c:when>
			<c:otherwise>
				CP 업체등록 <small>&gt;&gt; CP 업체를 등록해 주세요.</small>
			</c:otherwise>
		</c:choose>
	</h4>
</div>

<div class="row-fluid cp-box">

	<div class="span12">
		
		<form id="cpForm" class="form-horizontal " method="POST" action="<spring:eval expression="@urlProp['cpCreateAction']"/>">
			<c:if test="${empty isNew}">
				<input type="hidden" name="company_mgmtno" value="${ cp.company_mgmtno }" />
			</c:if>
			<div class="control-group">
				<label class="control-label" for="company_name"><img src='<spring:eval expression="@urlProp['v']"/>'> 회사명</label>
				<div class="controls">
					<input type="text" id="company_name" name="company_name" placeholder="회사명" value="${ cp.company_name }" class="input-xlarge" data-validation-required-message="회사명을 입력해 주세요." required />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="company_no">사업자등록번호</label>
				<div class="controls">
					<input type="text" id="company_no" name="company_no" placeholder="사업자등록번호" value="${ cp.company_no }" class="input-xlarge" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="phoneno"><img src='<spring:eval expression="@urlProp['v']"/>'> 연락처</label>
				<div class="controls">
					<input type="text" id="phoneno" name="phoneno" placeholder="연락처" value="${ cp.phoneno }" class="input-xlarge" data-validation-required-message="연락처를 입력해 주세요." required/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="addr">주소</label>
				<div class="controls">
					<input type="text" id="addr" name="addr" placeholder="주소" class="input-xxlarge" value="${ cp.addr }" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="pdNameList">담당PD</label>
				<div class="controls pd-group">
					<c:choose>
						<c:when test="${ fn:length(pdList) == 0 }">
							<div>
								<input type="text" id="pdNameList" name="pdNameList" placeholder="담당PD" class="input-xlarge" />
								<img id="addPd" src="<spring:eval expression="@urlProp['plus']"/>" alt="+" style="cursor: pointer;"/>
								<a id="pdNameListTip" href="#" data-toggle="tooltip" >tip</a>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${pdList}" var="pdObj" varStatus="status">
								<c:if test="${status.first }">
									<div>
										<input type="text" id="pdNameList" name="pdNameList" placeholder="담당PD" class="input-xlarge" value="${ pdObj.pd_name }" />
										<img id="addPd" src="<spring:eval expression="@urlProp['plus']"/>" alt="+" style="cursor: pointer;"/>
										<a id="pdNameListTip" href="#" data-toggle="tooltip" >tip</a>
									</div>
								</c:if>
	    						<c:if test="${not status.first }">
	    							<div style="margin-top : 5px;">
		    							<input type="text" name="pdNameList" placeholder="담당PD" class="input-xlarge" value="${ pdObj.pd_name }" >
		    							<img class="removePd" src="<spring:eval expression="@urlProp['remove']"/>" alt="x" style="cursor: pointer;">
	    							</div>
	    						</c:if>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<!-- 
					담당PD 추가될 공간
					 -->
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="master">업체 담당자</label>
				<div class="controls">
					<input type="text" id="master" name="master" placeholder="업체 담당자" class="input-xlarge" value="${ cp.master }" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="master_email">업체 담당자 이메일</label>
				<div class="controls">
					<input type="email" id="master_email" name="master_email" placeholder="업체 담당자 이메일" class="input-xlarge" value="${ cp.master_email }" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="master_phoneno">업체 담당자 연락처</label>
				<div class="controls">
					<input type="text" id="master_phoneno" name="master_phoneno" placeholder="업체 담당자 연락처" class="input-xlarge" value="${ cp.master_phoneno }" />
				</div>
			</div>
		</form>
			<div class="control-group">
				<label class="control-label" ></label>
				<div class="controls">
					<button id="btn-cp-list" class="btn">목록가기</button>
					<c:choose>
						<c:when test="${empty isNew}">
							<button id="btn-cp-delete-action" class="btn">삭제</button>
							<button id="btn-cp-update-action" class="btn btn-primary">수정하기</button>
						</c:when>
						<c:otherwise>
							<button id="btn-cp-create-action" class="btn btn-primary">등록하기</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			

	</div>
	
</div>
<!--/row-->
<script>
$(function(){
	//팁박스
	$('#pdNameListTip')
		.tooltip({
			"title":"최대 5명까지 입력 가능합니다.",
			"placement":"bottom"
		});
	
	//유효성 체크
	$("#company_name,#phoneno").not("[type=submit]").jqBootstrapValidation();
	
	//담당PD 추가 버튼
	$("#addPd")
		.click(function(){
			//최대 5명 까지 가능
			if( 5 == $("input[name='pdNameList']").size() ) {
				bootbox.alert("최대 5명까지 입력 하실 수 있습니다.");
				return false;
			}
			//추가될 공간
			var $target = $("div.pd-group");
			//추가될 HTML
			var html =  '<div style="margin-top : 5px;">';
				html += '<input type="text" name="pdNameList" placeholder="담당PD" class="input-xlarge" /> ';	
				html += '<img class="removePd" src="<spring:eval expression="@urlProp['remove']"/>" alt="x" style="cursor: pointer;"/>';	
				html += '</div>';
			
			$target.append(html);
		});
	
	$("div.pd-group").on("click", ".removePd", function(event){
		  $(this).parent().remove();
	});
	
	//목록가기 버튼
	$("#btn-cp-list").click(function(){
		bootbox.confirm("화면에서 빠져 나가시겠습니까?", function(result) {
			if(result) {
				history.back(-1);
			}
		}); 
	});
	//삭제 버튼
	$("#btn-cp-delete-action").click(function(){
		bootbox.confirm( "삭제하시겠습니까?", function(result) {
			if( result ){
				window.location.href = '<spring:eval expression="@urlProp['cpDeleteAction']"/>?strList=' + ${ cp.company_mgmtno } + "";
			};
		});  
	});
	//등록가기 버튼
	$("#btn-cp-create-action").click(function(){
		bootbox.confirm( "등록 하시겠습니까?", function(result) {
			if( result ){
				$("#cpForm" ).submit();
			}
		}); 
	});
	//업데이트 버튼
	$("#btn-cp-update-action").click(function(){
		bootbox.confirm( "업데이트 하시겠습니까?", function(result) {
			if( result ){
				$( "#cpForm" )
					.attr("action", '<spring:eval expression="@urlProp['cpUpdateAction']"/>')
					.submit();
			}
		});  
	});
	
});
</script>