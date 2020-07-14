<%@page import="com.funding.dto.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<title>소상공인 펀딩 회원</title>
	
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Font Awesome -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- icheck bootstrap -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
	
</head>

<body>

	<div class="content-wrapper">
	<!-- Main content -->
	<section class="content">
		<div class="card">
			<div class="card-header with-border">
<%-- 				<c:if test="${loginUser.authority eq 'ROLE_ADMIN' }"> --%>
<!-- 					<button type="button" class="btn btn-primary" -->
<!-- 						onclick="OpenWindow('registForm.do','회원등록',800,1000);">회원등록</button> -->
<%-- 				</c:if> --%>

				<div id="keyword" class="card-tools" style="width: 350px;">
					<div class="input-group row">
						<select class="form-control col-md-4" name="searchType"
							id="searchType">
							<option value=""
								${pageMaker.cri.searchType eq '' ? 'selected':''}>검색구분</option>
							<option value="e"
								${pageMaker.cri.searchType eq 'e' ? 'selected':''}>이메일</option>
							<option value="p"
								${pageMaker.cri.searchType eq 'p' ? 'selected':''}>전화번호</option>
						</select> <input class="form-control" type="text" name="keyword"
							placeholder="검색어를 입력하세요." value="${param.keyword }" /> <span
							class="input-group-append">
							<button class="btn btn-primary" type="button" id="searchBtn"
								data-card-widget="search" onclick="searchList_go(1);">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
				</div>
			</div>
			
			<div class="card-body" style="text-align: center;">
				<div class="row">
					<div class="col-sm-12">
						<table class="table table-bordered">
							<tr>
								<th>이메일</th>
								<th>이 름</th>
								<th>패스워드</th>
								<th>전화번호</th>
							</tr>

							<c:if test="${!empty memberList }">
								<c:forEach var="member" items="${memberList }">
									<tr>
<!-- 									<td><a -->
<%-- 										href="javascript:OpenWindow('/member/detail?id=${member.mem_email }','회원상세보기','900','1000');">${member.mem_email }</a></td> --%>
										<td>${member.mem_email }</td>
										<td>${member.mem_name }</td>
										<td>${member.mem_pw }</td>
										<td>${member.mem_phone }</td>
									</tr>
								</c:forEach>
							</c:if>

							<c:if test="${empty memberList }">
								<tr>
									<td colspan="5">해당 사항이 없습니다.</td>
								</tr>
							</c:if>

						</table>
					</div>
				</div>
			</div>
			<div class="card-footer">
				<%@ include file="/WEB-INF/views/pagination/pagination.jsp"%>
			</div>
			<!-- card-footer -->
		</div>
		<!-- card  -->
	</section>

	</div>


<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js"></script>

</body>
</html>