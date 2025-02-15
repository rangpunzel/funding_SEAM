<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
	
<!-- Page Path Begins -->
<div class="container">
	<div class="justify-content-md-center" style="padding: 40px;">
		<h4
			class="page-section-heading text-center text-uppercase text-primary mb-0">Q&A</h4>
	</div>
	<br>
	<div class="row col-sm-12" style="padding: 10px;">
		<div class="col-8">
			<h5 class="page-section-heading mb-0">${qna.qna_title }</h5>
		</div>
		<div class="col-4">
			<c:if test="${loginUser.mem_num eq 1 }">
				<button type="button" class="btn btn-outline-success btn-flat"
					id="registCmts">답변등록</button>
			</c:if>
			&nbsp;
			 <c:if test="${loginUser.mem_num eq qna.mem_num }"> 
			<button type="button" class="btn btn-outline-success btn-flat"
				id="modifyBtn">수정</button>
			&nbsp;&nbsp;
			<button type="button" class="btn btn-outline-success btn-flat"
				name="remove" id="removeBtn">삭제</button>
			 </c:if> 
		</div>
	</div>

	<!-- Page Path Ends -->
	<div class="post" style="border-bottom: none;">
		<div class="user-block border-bottom row">

			<div class="user-block border-top border-bottom row"
				style="padding: 10px;">
				<div class="col-md-10">
				<!-- src="https://source.unsplash.com/category/nature" randomImg-->
					<img class="img-circle img-bordered-sm"
						 src="<%= request.getContextPath() %>/displayProfileImg?mem_email=${member.mem_email}&fileName=${member.mem_profile_img}" onerror="this.src='<%= request.getContextPath() %>/resources/images/profile-picture.png'" alt="user profile image">
					<span class="username">${qna.mem_name  }</span> <span
						class="description"><fmt:formatDate
							value="${qna.qna_regdate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
				</div>
				<div class="col-md-2 float-right" style="padding: 5px;">
					<span class="viewcnt">조회수 &nbsp;${qna.qna_view_cnt }</span>
				</div>
			</div>
			<div style="min-height: 200px;">${qna.qna_contents}</div>
			<br />

			<form role="form">
				<input type="hidden" name="qna_num" value="${qna.qna_num }">
				<input type="hidden" name="qna_secret" value="${qna.qna_secret }">
				<input type="hidden" name="qna_pwd" value="${qna.qna_pwd }">
			</form>
		</div>
	</div>
		<div class='container text-center'>
			<button type="button" class="btn btn-outline-success btn-flat"
				onclick="javascript:location.href='/qna/list';">목록</button>
		</div>

</div>
<%-- <div class="user-block">
		          <span class="username">writer:&nbsp;${qna.mem_name }</span>
		          <span class="viewcnt">viewcnt:&nbsp;${qna.qna_view_cnt }</span>
		          <span class="regdate">regdate:&nbsp;<fmt:formatDate value="${qna.qna_regdate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
		        </div>
		        <br><br>
		        <div style="border: solid 2px olive; max-width: 800px" >	
				<div>content:&nbsp;<br>${qna.qna_contents}</div>
				</div>
				<br><br>
	<div class="card-header with-border">		
					<button type="button" class="btn btn-primary pointer" id="modifyBtn">수정</button>		
					<button type="button" class="btn btn-primary pointer" name="remove" id="removeBtn">삭제</button>		
				<button type="button" class="btn btn-primary pointer" onclick="javascript:location.href='/qna/list';">목록</button>
				&nbsp;&nbsp;
				<c:if test="${loginUser.mem_num eq 1 }">
				<button type="button" class="btn btn-sm btn-primary" id="registCmts">답변등록</button>
				</c:if>
			</div>
			 --%>

			
	<script>
	var formObj = $("form[role='form']"); 
	$('button#modifyBtn').on('click',function(e){
	//	alert('modify btn click');
		if("${loginUser.mem_num}"=="" || "${loginUser.mem_num}"!="${qna.mem_num}"){
			alert('로그인이 필요한 기능입니다')
			location.href='/commons/loginForm';
			return;
		}else if("${loginUser.mem_num}"=="${qna.mem_num}") {
			location.href='/qna/registForm';
		formObj.attr({
			'action':'modify',
			'method':'get'
			
		});
		formObj.submit();
			
	}
	});
	
	$('#removeBtn').on('click',function(){
		if("${loginUser.mem_num}"=="${qna.mem_num}"){
			
		formObj.attr("action", "remove");
		formObj.attr("method", "post");
		formObj.submit();
		}else{
			alert('잘못된 요청 입니다  로그인 해주세요');
		}
		

	});
	$('#registCmts').on('click',function(){
	//	alert("답글등록");
		formObj.attr({
			'action':'registCmts',
			'method':'get'
		});
		formObj.submit();
	});
	
	</script>
