<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!-- Page Path Begins -->
<div class="container">
	<div class="justify-content-md-center" style="padding:40px;">
		<h2 class="page-section-heading text-center text-primary text-secondary mb-0" style="line-height:130%;color:#555;width:900px;word-break:break-all;">${freeBoard.free_title }</h2>
		<br/>
			<div class="float-right">
				<c:if test="${loginUser.mem_name eq freeBoard.mem_name}">					
					<button type="button" class="btn btn-outline-success btn-flat" onclick="modify_go();">수정</button>		
					<button type="button" class="btn btn-outline-success btn-flat" onclick="remove_go();">삭제</button>	
				</c:if>
			</div>
	</div>
<!-- Page Path Ends -->

<!-- Page Content Begins -->	
	<!-- Main content -->
	<div class="post">
		<div class="user-block border-top border-bottom row" style="padding:10px;">
			<div class="col-md-10">
		          <img class="img-circle img-bordered-sm" src="<%= request.getContextPath() %>/displayProfileImg?mem_email=${member.mem_email}&fileName=${member.mem_profile_img}" onerror="this.src='<%= request.getContextPath() %>/resources/images/profile-picture.png'" alt="user profile image">
		          <span class="username">${freeBoard.mem_name }</span>
		          <span class="description"><fmt:formatDate value="${freeBoard.free_regdate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
        	</div>
        	<div class="col-md-2 float-right thumbUpDiv" style="padding:5px;">
        		<c:if test="${loginUser.mem_num eq null }">
					<a href="javascript:alert('로그인이 필요합니다.');location.href='<%= request.getContextPath() %>/commons/loginForm';" class="link-black text-sm col-sm-2"><i class="far fa-thumbs-up fa-2x"></i>${freeBoard.free_like } Like</a>
				</c:if>
        	</div>
        </div>
        <br/>
		<div class="row">
			<br/>
			${freeBoard.free_contents}
		</div>
		<br/>
		<br/>
		<div id="commentArea">
			<!-- 댓글쓰기 -->
			<form id="CommentsForm">
				<%-- <div class="panel panel-info">
			      <div class="panel-title">
			      	<h5 class="float-left" style="margin-left:10px;">댓글</h5>
					<span class="text-sm float-right">
						<i class="far fa-comments mr-1"></i> Comments (${freeCmtsCount }) 비활성화된 댓글 개수 빼야함
					</span>
			      </div> --%>
			      
			    	<div class="border-top border-bottom row">
						<table>
							<tbody>
								<c:if test="${loginUser.code_num ne 0 }">
										<tr>
											<td><i class="fas fa-angle-up"></i>&nbsp;<a href="#a" onclick="movePreOrNextPage('nextForMem', '${preOrNextForMember.next_no }');" id="prev">다음글 : ${preOrNextForMember.next_title }</a></td>
										</tr>
										<tr style="height:5px;">
											<td></td>
										</tr>
										<tr>
											<td><i class="fas fa-angle-down"></i>&nbsp;<a href="#a" onclick="movePreOrNextPage('preForMem', '${preOrNextForMember.pre_no }');" id="next">이전글 : ${preOrNextForMember.pre_title }</a></td>
										</tr>
								</c:if>
								<c:if test="${loginUser.code_num eq 0 }">
										<tr>
											<td><i class="fas fa-angle-up"></i>&nbsp;<a href="#a" onclick="movePreOrNextPage('nextForAdmin', '${preOrNextForAdmin.next_no }');" id="prev">다음글 : ${preOrNextForAdmin.next_title }</a></td>
										</tr>
										<tr style="height:5px;">
											<td></td>
										</tr>
										<tr>
											<td><i class="fas fa-angle-down"></i>&nbsp;<a href="#a" onclick="movePreOrNextPage('preForAdmin', '${preOrNextForAdmin.pre_no}');" id="next">이전글 : ${preOrNextForAdmin.pre_title }</a></td>
										</tr>
								</c:if>
							</tbody>
						</table>
					</div>
					<br/>  
					<br/>  
			      <div class="panel-body row">		
					<div class="input-group input-group-sm col-10">
						<textarea class="form-control" rows="3" wrap="hard" placeholder="Enter ..." id="free_cmts_contents" name="free_cmts_contents"></textarea>
						<br>
						<div class="input-group-append">
	                      <button type="button" class="btn btn-outline-success btn-flat" onclick="reply_regist_go();">댓글 저장</button>
	                    </div>
					</div>
			      </div>
				<br/>
				<!-- 댓글 리스트 -->
				<c:if test="${loginUser.mem_num eq 1 }">
					<button type="button" id="checkAll" class="btn btn-outline-success btn-flat" style="display:visible;">전체 선택</button>
					<button type="button" id="checkClearAll" class="btn btn-outline-success btn-flat" style="display:none;">전체 해제</button>
					<button type="button" id="enabledBtn" class="btn btn-outline-success btn-flat" onclick="enabled();">블라인드</button>
	      		</c:if>
	      		<div id="comment-tab___" class="tab-pane___ active___" style=" margin: 5px 10px;">
					<div class="comments___ ace-scroll___" style="position: relative;">
						<div class="scroll-track___ scroll-active___" style="display: block; sheight: 300px;">
						<div class="scroll-bar___" style="sheight: 232px; top: 0px;"></div>
						</div>
						<div id="repliesDiv" class="scroll-content___" style="smax-height: 300px;">		
						</div>
						<div class='text-center'>
							<ul id="pagination" class="pagination pagination-sm no-margin ">
				
							</ul>
						</div>									
				   </div>		
			    </div>
			<!-- </div> -->
		</form>
		</div>
		</div>
	<!-- /.content -->

<%@ include file="/WEB-INF/views/board/free/reply.jsp" %>
<%@ include file="/WEB-INF/views/board/free/detail_js.jsp" %>
	<div class='container text-center'>
		<button type="button" class="btn btn-outline-success btn-flat" onclick="javascript:location.href='<%= request.getContextPath() %>/board/free/list'">목록</button>
	</div>
<!-- Page Content Ends -->
<br/>
<br/>
</div>