<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 
<head>
	<style>
		table{
			width:99%;
		}
		td{
			padding: 10px;
		}
	</style>	

</head>
<br> -->

<div class="container">

	<div class="row justify-content-md-center">

		<a href="<%=request.getContextPath()%>/board/notice/notice_list">
			<button class="btn btn-outline-success btn-flat" style="width: 150px; border-radius: 25px; border: 3px double green; margin: 5px;" type="button">공지사항</button>
		</a> 
		<a href="<%=request.getContextPath()%>/FAQ/list">
			<button class="btn btn-outline-success btn-flat" style="width: 150px; border-radius: 25px; border: 3px double green; margin: 5px;" type="button">F A Q</button>
		</a>
		 <a href="<%=request.getContextPath()%>/qna/list">
			<button class="btn btn-outline-success btn-flat" style="width: 150px; border-radius: 25px; border: 3px double green; margin: 5px;" type="button">Q & A</button>
		</a>



	</div>

	<br>
	<br>

<!-- Page Path Begins -->
<div class="container" style="min-height:800px;">
	<div class="justify-content-md-center" style="padding:40px;">
		<h2 class="page-section-heading text-center text-primary text-secondary mb-0">공지사항</h2>
	</div>
<!-- Page Path Ends -->
<!-- Main content -->
	  <div class="row" style="padding:20px;">
	  		<div class="col-sm-3">
			<c:if test="${loginUser.mem_num eq 1}">
				<button type="button" class="btn btn-outline-success btn-flat float-left" id="registBtn">글 등록</button>
			</c:if>	
		</div>
	  	<div class="col-sm-9">
			<div id="keyword" class="input-group" style="width:400px;float: right">
				<select class="form-control" name="searchType" id="searchType" style="border:none;">
					<option value="">검색구분</option>
					<option value="t"
						${pageMaker.cri.searchType eq 't' ? 'selected':'' }>제목</option>
					<option value="c"
						${pageMaker.cri.searchType eq 'c' ? 'selected':'' }>본문</option>
					<option value="tc"
						${pageMaker.cri.searchType eq 'tc' ? 'selected':'' }>제목+본문</option>						
				</select>
				<input class="form-control" type="text" name="keyword" style="width:150px;outline: 0;border-width: 0 0 2px;" placeholder="검색어를 입력하세요." value="${pageMaker.cri.keyword }"/>
				<div class="input-group-append">
					<button class="btn" type="button" onclick="searchList_go(1,'notice_list');" data-card-widget="search"><i class="fas fa-search"></i></button>
				</div>
			</div>	
		</div>
	
	  </div>
	  
	  	<div class="card-body table-responsive p-0">
			<table class="table table-head-fixed text-center border-bottom">					
				<tr style="font-size:0.95em;">
				<c:forEach var="col" items="${colNames}">
					<th style="width:${col.width}%;">
					
						<div>${col.colName }</div>
					</th>
				</c:forEach>
				</tr>
				<c:if test="${empty noticeList }">
					<tr>
						<td colspan="6"><strong>해당 내용이 없습니다</strong></td>
					</tr>
				</c:if>
				
					<c:forEach var="pointNotice" items="${pointList }">
						<tr role="row" style="font-size: 0.85em;">
							<td  style="text-align: center;" >
								<input type="button" class="red ace-icon fa fa-star bigger-120" style="margin-top: 3px;" id="btnDelPoint" onclick="delPoint('${pointNotice.notice_num}');">
							</td>
							<td  style="text-align: center;">${pointNotice.notice_num }</td>
							<td ><a href="<%= request.getContextPath() %>/board/notice/detail?notice_num=${pointNotice.notice_num }">${pointNotice.notice_title }</a></td>
							<td  style="text-align: center; font-size: 10pt;"><fmt:formatDate value="${pointNotice.notice_regdate }" pattern="yyyy-MM-dd" /></td>
					<td  style="text-align: center;">
					<a class="maninfo" rel="${pointNotice.mem_num }" href="#" data-hasqtip="21"> 
						<i class="pink2 ace-icon fa fa-user" title="작성자"></i> 관리자</a>
					</td>
					<td  style="text-align: center;">
						<c:if test="${!empty pointNotice.attachList }">
							<i class=" ace-icon fa fa-file" title="첨부있음"></i>
						</c:if> 
						<c:if test="${empty pointNotice.attachList }">
							<i class="green ace-icon fa fa-times bigger-120" title="첨부없음"></i>
						</c:if></td>
							<td  style="text-align: center;">${pointNotice.notice_view_cnt }</td>
						</tr>
					</c:forEach>

					<c:forEach var="nomalNotice" items="${noticeList }">
						<tr role="row" style="font-size: 0.85em;">
							<td  style="text-align: center;">
								<c:if test="${loginUser.mem_num eq 1 }">
								  <input type="button" class="far fa-star" id="btnAddPoint" onclick="addPoint('${nomalNotice.notice_num}');" title="일반">
								</c:if>
							</td>
							<td  style="text-align: center;">${nomalNotice.notice_num }</td>
							<td ><a href="<%= request.getContextPath() %>/board/notice/detail?notice_num=${nomalNotice.notice_num }"
								<%-- style='<c:if test="${nomalNotice.notice_view_cnt >= 20}" >font-weight:bold;color:blue;</c:if>' --%>>${nomalNotice.notice_title }</a></td>
							<td  style="text-align: center;"><fmt:formatDate value="${nomalNotice.notice_regdate }" pattern="yyyy-MM-dd" /></td>
							<td  style="text-align: center;">
							  <a class="maninfo" rel="${nomalNotice.mem_num }" href="#" data-hasqtip="21"> 
								<i class="pink2 ace-icon fa fa-user" title="작성자"></i>
									관리자
							  </a></td>
							<td  style="text-align: center;">
							<c:if test="${!empty nomalNotice.attachList }">
									<i class=" ace-icon fa fa-file" title="첨부있음"></i>
							</c:if> 
							<c:if test="${empty nomalNotice.attachList }">
									<i class="grey ace-icon fa fa-times bigger-120" title="첨부없음"></i>
								</c:if></td>
							<td  style="text-align: center;">${nomalNotice.notice_view_cnt }</td>
						</tr>
					</c:forEach>
				</table>
			</div>	
			</div>
				<br>
					<%@include file="/WEB-INF/views/pagination/pagination.jsp"%> 
	  </div>
	  
	<%--   //------------------------------------------------------------------------------------------------------------------

	<div class="page-content main-content" style="padding: 0px;">
		<div id="if_list_div" class="show">
			<div id="if_list" name="if_list" class="no-skin listBody">
				<div class="breadcrumbs" id="breadcrumbs" style="border: none;">
					<ul class="breadcrumb">
						<li><i class="fa fa-file-text-o"></i>
							&nbsp;공지사항</li>
					</ul>
				</div>
		

				<!-- 상단 우측버튼 -->
				<c:if test="${loginUser.mem_num eq 1}">
				<div class="wizard-actions-L">
					<button type="button" class="btn btn-sm btn-white btn-bold"
						onclick="OpenWindow('<%=request.getContextPath()%>/board/notice/regist','','850','620');">
						<i class="red ace-icon fa fa-pencil-square-o bigger-120"></i> <b>공지글 등록</b>
					</button>
				</div>
				</c:if>

				<div class="col-sm-3 col-6" style="margin-left: 550px">
					<div id="keyword" class="pull-right" style="width: 400px;">
						<div class="input-group row">
							<select class="form-control col-md-4" name="searchType"	id="searchType">
								<option value="">검색구분</option>
								<option value="t"
									${pageMaker.cri.searchType eq 't' ? 'selected':'' }>제목</option>
								<option value="c"
									${pageMaker.cri.searchType eq 'c' ? 'selected':'' }>본문</option>
								<option value="tc"
									${pageMaker.cri.searchType eq 'tc' ? 'selected':'' }>제목+본문</option>
							</select> <input class="form-control" type="text" name="keyword"
								placeholder="검색어를 입력하세요." value="${pageMaker.cri.keyword }" /> <span
								class="input-group-append">
								<button class="btn btn-primary" type="button" id="searchBtn"
									data-card-widget="search">검색</button>
							</span>
						</div>
					</div>
				</div>
				<!-- 상단 우측버튼 -->
				
				

				<!-- jqGrid Begins -->
				<div class="row justify-content-md-center">
					<div class="col-xs-12">
						<div id="grid_container" style="width: 800px; padding-bottom: 250px;">
								<div class="loading ui-state-default ui-state-active"
									id="load_grid-table" style="display: none;">Data Loading...</div>
								<div class="ui-jqgrid-view " role="grid" id="gview_grid-table">
								
								
									<div class="ui-jqgrid-hdiv ui-state-default ui-corner-top">
										<div class="ui-jqgrid-hbox">
											<table class="ui-jqgrid-htable ui-common-table "
												role="presentation" style="text-align: center"
												aria-labelledby="gbox_grid-table">
												<thead style="visibility: visible;">
													<tr class="ui-jqgrid-labels" role="row">
														<c:forEach var="col" items="${colNames}">
															<th id="grid-table_apprNowUser" role="columnheader"
																class="ui-th-column ui-th-ltr ui-state-default"
																aria-selected="true" style="width:${col.width}%;">
															
																<div id="jqgh_grid-table_apprNowUser"
																	class="ui-jqgrid-sortable">${col.colName }</div>
															</th>
														</c:forEach>
													</tr>
												</thead>
											</table>
											</div>
										</div>
										<div style="position: relative;">
											<table id="grid-table" tabindex="0" role="presentation"
												aria-multiselectable="false"
												aria-labelledby="gbox_grid-table"
												class="ui-jqgrid-btable ui-common-table">
												<tr class="jqgfirstrow" role="row">
													<c:forEach var="col" items="${colNames }">
														<td  style="width:${col.width}%;"></td>
													</c:forEach>
												</tr>


												<c:forEach var="pointNotice" items="${pointList }">
													<tr role="row" class="jqgrow ui-row-ltr ui-widget-content">
														<td  style="text-align: center;" >
															<input type="button" class="red ace-icon fa fa-star bigger-120" id="btnDelPoint" onclick="delPoint('${pointNotice.notice_num}');">
														</td>
														<td  style="text-align: center;">${pointNotice.notice_num }</td>
														<td ><a href="#"
															onclick="OpenWindow('/board/notice/detail?notice_num=${pointNotice.notice_num }','','850','620')"
															style='<c:if test="${pointNotice.notice_view_cnt >= 20}" >font-weight:bold;color:blue;</c:if>'>${pointNotice.notice_title }</td>
														<td  style="text-align: center; font-size: 10pt;"><fmt:formatDate value="${pointNotice.notice_regdate }" pattern="yyyy-MM-dd" /></td>
												<td  style="text-align: center;">
												<a class="maninfo" rel="${pointNotice.mem_num }" href="#" data-hasqtip="21"> 
													<i class="pink2 ace-icon fa fa-user" title="작성자"></i> ${pointNotice.mem_num } </a>
												</td>
												<td  style="text-align: center;">
													<c:if test="${!empty pointNotice.attachList }">
														<i class=" ace-icon fa fa-file" title="첨부있음"></i>
													</c:if> 
													<c:if test="${empty pointNotice.attachList }">
														<i class="green ace-icon fa fa-times bigger-120" title="첨부없음"></i>
													</c:if></td>
														<td  style="text-align: center;">${pointNotice.notice_view_cnt }</td>
													</tr>
												</c:forEach>

												<c:forEach var="nomalNotice" items="${noticeList }">
													<tr role="row" class="jqgrow ui-row-ltr ui-widget-content">
														<td  style="text-align: center;">
															<c:if test="${loginUser.mem_num eq 1 }">
															   <input type="button" class="far fa-star" id="btnAddPoint" onclick="addPoint('${nomalNotice.notice_num}');" title="중요">
															</c:if>
														</td>
														<td  style="text-align: center;">${nomalNotice.notice_num }</td>
														<td ><a href="#" onclick="OpenWindow('/board/notice/detail?notice_num=${nomalNotice.notice_num }','','850','620')"
															style='<c:if test="${nomalNotice.notice_view_cnt >= 20}" >font-weight:bold;color:blue;</c:if>'>${nomalNotice.notice_title }</td>
														<td  style="text-align: center;"><fmt:formatDate value="${nomalNotice.notice_regdate }" pattern="yyyy-MM-dd" /></td>
														<td  style="text-align: center;">
														  <a class="maninfo" rel="${nomalNotice.mem_num }" href="#" data-hasqtip="21"> 
															<i class="pink2 ace-icon fa fa-user" title="작성자"></i>
																${nomalNotice.mem_num }
														  </a></td>
														<td  style="text-align: center;">
														<c:if test="${!empty nomalNotice.attachList }">
																<i class=" ace-icon fa fa-file" title="첨부있음"></i>
														</c:if> 
														<c:if test="${empty nomalNotice.attachList }">
																<i class="grey ace-icon fa fa-times bigger-120" title="첨부없음"></i>
															</c:if></td>
														<td  style="text-align: center;">${nomalNotice.notice_view_cnt }</td>
													</tr>
												</c:forEach>
											</table>
										</div>
								
								<br>
								<%@include file="/WEB-INF/views/pagination/pagination.jsp"%>
						</div>
					</div>
				</div>
					<!-- jqGrid Ends -->
			</div>
		</div>
	</div>
	</div>

</div><!-- end container -->
 --%>

<%-- 	<%@ include file="./list_js.jsp"%> --%>
	<script>
/* //팝업창들 띄우기
//새로운 Window창을 Open할 경우 사용되는 함수 ( arg : 주소 , 창타이틀 , 넓이 , 길이 )
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
   winleft = (screen.width - WinWidth) / 2;
   wintop = (screen.height - WinHeight) / 2;
   var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth +", height="+ WinHeight +", top="+ wintop +", left=" + winleft + ", resizable=yes, status=yes"  );
    win.focus() ; 
} */

$("#registBtn").on("click", function(){
	location.href="<%= request.getContextPath() %>/board/notice/regist";
});

function addPoint(val){
	alert('중요게시물로 등록하시겠습니까?');
	console.log(val);

	$.ajax({
		url : "addPoint",
		type : "POST",
		data : {'notice_num': val},
/* 		dataType : 'json',
		contentType : 'application/json', */
		success:function(){
			alert('중요게시물로 등록되었습니다');
			location.reload();
		},error : function(error){
			alert('error')
		}
	});

}

var loginUser = ${loginUser.mem_num};

function delPoint(val) {
	if(loginUser == 1){
		
	alert('일반게시물로 이동합니다');
	
	$.ajax({
		url:"delPoint",
		type : "POST",
		data : {'notice_num' : val},
		success : function(){
			location.reload();
		},error : function(error){
			alert('error')
		}
	});
	}
	
}


    </script>
