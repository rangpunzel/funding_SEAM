<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


 <nav aria-label="member list Navigation">
	<ul class="pagination justify-content-center m-0">
		<li class="page-item">
			<a class="page-link" href="javascript:searchList_go(1);">
			<i class="fas fa-angle-double-left"></i>
			</a>
		</li>
		<li class="page-item">
			<a class="page-link" href="javascript:searchList_go(
			${pageMaker.prev ? pageMaker.startPage-1 : 1}				
			);"><i class="fas fa-angle-left"></i></a>
		</li>
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">						
		<li class="page-item 
			<c:out value="${pageMaker.cri.page == pageNum?'active':''}"/>">
			<a class="page-link" href="javascript:searchList_go(${pageNum},'list?mem_num=${loginUser.mem_num }','flag');" >${pageNum }
			</a>
		</li>
		</c:forEach>
		<li class="page-item">
			<a class="page-link" href="javascript:searchList_go(
			${pageMaker.next ? pageMaker.endPage+1 : pageMaker.cri.page}			
			);"><i class="fas fa-angle-right" ></i></a>
		</li>
		<li class="page-item">
			<a class="page-link" href="javascript:searchList_go(
			${pageMaker.realEndPage} 
			);">
			<i class="fas fa-angle-double-right"></i></a>
		</li>	
	</ul>
</nav>   	

<form id="jobForm">
	<input type='hidden' name="page" value="${pageMaker.cri.page}" />
	<input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum}"/>
	<input type='hidden' name="searchType" value="${pageMaker.cri.searchType }" />
	<input type='hidden' name="keyword" value="${pageMaker.cri.keyword }" />
	<input type='hidden' name="searchState" value="${pageMaker.cri.searchState }" />
</form>

<script>
function searchListPayType() {
	
	var jobForm=$('#jobForm');
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	
	jobForm.attr("method","post");
	jobForm.attr("action","payType");		

	jobForm.submit();
}

function searchListRefundState() {
	
	var jobForm=$('#jobForm');
	jobForm.find("[name='searchState']").val($('select[name="searchState"]').val());
	
	jobForm.attr("method","post");
	jobForm.attr("action","refundState");		

	jobForm.submit();	
}

function searchListKeyword() {
	
	var jobForm=$('#jobForm');
	jobForm.find("[name='keyword']").val($('input[name="keyword"]').val());
	
	jobForm.attr("method","post");
	jobForm.attr("action","keyword");		

	jobForm.submit();	
}


function searchList_go(page,url){
	
	var jobForm=$('#jobForm');
// 	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	
// 	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
// 	jobForm.find("[name='keyword']").val($('input[name="keyword"]').val());	
// 	jobForm.find("[name='categoryType']").val($('select[name="categoryType"]').val());	
// 	jobForm.find("[name='pjtType']").val($('select[name="pjtType"]').val());	
// 	jobForm.find("[name='stateType']").val($('select[name="stateType"]').val());	
// 	jobForm.find("[name='progressType']").val($('select[name="progressType"]').val());	
// 	jobForm.find("[name='calcType']").val($('select[name="calcType"]').val());	
// 	jobForm.find("[name='calcDate']").val($('input[name="calcDate"]').val());
// 	jobForm.find("[name='successOrFailure']").val($('select[name="successOrFailure"]').val());
	
	jobForm.attr("method","post");
	jobForm.attr("action","payType");		
	
	jobForm.submit();
}

function enterkey() {
    if (window.event.keyCode == 13) {
    	searchList_go(1);
    }
}
function searchList_go(page,url,flag){
	
	if(flag == ""){
		var keyword = $('div.input-group>input[name="keyword"]').val();
		if(keyword == ""){
			alert('검색어를 입력해주세요!');
			return;
		}
	}
	
	var jobForm=$('#jobForm');
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());	
	jobForm.attr("method","post");
	if(url){
		jobForm.attr("action",url);		
	}
	jobForm.submit();
}
</script>