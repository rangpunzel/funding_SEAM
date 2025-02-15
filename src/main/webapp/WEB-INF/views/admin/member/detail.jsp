<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
	<title>일반 회원 상세 조회</title>
</head>

<div class="card-body box-profile">
  <div class="text-center">
    <img class="profile-user-img img-fluid img-circle" src="<%= request.getContextPath() %>/displayProfileImg?mem_email=${member.mem_email}&fileName=${member.mem_profile_img}" onerror="this.src='<%= request.getContextPath() %>/resources/images/profile-picture.png'" alt="user profile image" style="width:150px;height:150px;">
  </div>
  <h3 class="profile-username text-center">${member.mem_name }</h3>
  <p class="text-muted text-center">${member.code_state }</p>
	
	<table>
		<tr class="row" style="padding-left:200px;">
			<td style="padding-right:20px;">
				<select class="form-control" name="code_state" id="codeState" style="width:300px;">
			        <option>회원 상태</option>
			        <c:forEach items="${memStateCodeList }" var="memStateCode">
			        	<c:if test="${memStateCode.code_state_num ne 9}">
							<option value="${memStateCode.code_state_num }" ${memStateCode.code_state_num eq member.code_state_num ? 'selected':'' }>${memStateCode.code_state }</option>
						</c:if>
			        </c:forEach>
				</select>
			</td>
			<td>
				<button type="button" class="btn btn-block btn-secondary" id="modifyStateCodeBtn" onclick="modifyStateCode();">회원 상태 변경</button>
			</td>
		</tr>
	</table>
	<br/>
	<br/>
  <div class="col-12 text-center">
    <div class="card">
      <div class="card-header">
        <h3>회원 상세 정보</h3>
      </div>
      <!-- /.card-header -->
      <div class="card-body">
        <table class="table table-bordered">
		  	<tr>
		  		<th>이메일</th>
		  		<td>${member.mem_email }</td>
		  	</tr>
		  	<tr>
		  		<th>전화번호</th>
		  		<td>${member.mem_phone }</td>
		  	</tr>
		  	<tr>
		  		<th>가입 일자</th>
		  		<td><fmt:formatDate value="${member.mem_regdate }" pattern="yyyy-MM-dd"/></td>
		  	</tr>
		  	<tr>
		  		<th>마지막 로그인 일자</th>
		  		<td><fmt:formatDate value="${member.mem_lastdate }" pattern="yyyy-MM-dd"/></td>
		  	</tr>
		  	<tr>
		  		<th>보유 포인트</th>
		  		<td><fmt:formatNumber>${point }</fmt:formatNumber> </td>
		  	</tr>
		 </table>
      </div>
      <!-- /.card-body -->
      <div class="card-footer clearfix">
      </div>
    </div>
    <!-- /.card -->
  </div>
  <br/>
  <div class="col-12 text-center">
    <div class="card">
      <div class="card-header">
        <h3>프로젝트 참여 목록</h3>
      </div>
      <!-- /.card-header -->
      <div class="card-body">
        <table class="table table-bordered" style="font-size:13px;">
          <thead>                  
            <tr>
              <th style="width:10%;">번호</th>
              <th colspan="2">프로젝트</th>
              <th style="width:10%;">유형</th>
              <th>금액</th>
              <th style="width:17%;">결제 일자</th>
            </tr>
          </thead>
          <tbody>
          	<c:if test="${!empty memberDetailList }">
	          	<c:forEach items="${memberDetailList}" var="memberDetail">
		            <tr>
		              <td>${memberDetail.pjt_pay_num }</td>
		              <td><img src="<%= request.getContextPath() %>/project/picture/get?picture=${memberDetail.pjt_atc_sum_name}" onerror="this.src='https://source.unsplash.com/category/nature'" alt="image" style="width:50px;height:50px;"></td>
		              <td>${memberDetail.pjt_title }</td>
		              <td>${memberDetail.pjt_type_code_val }</td>
		              <td>${memberDetail.pjt_pay_amount }</td>
		              <td><fmt:formatDate value="${memberDetail.ptj_pay_date }" pattern="yyyy-MM-dd"/></td>
		            </tr>
	            </c:forEach>
            </c:if>
            <c:if test="${empty memberDetailList }">
            	<tr>
					<td colspan="6">
						<strong>후원 내역이 없습니다.</strong>
					</td>
				</tr>
            </c:if>
          </tbody>
        </table>
      </div>
      <!-- /.card-body -->
      <div class="card-footer clearfix">
        <%@ include file="/WEB-INF/views/admin/member/detailPagination.jsp" %>	
      </div>
    </div>
    <!-- /.card -->
  </div>
</div>

<script>
	function modifyStateCode(){
		var code_state = $('select[name="code_state"] option:checked').text();
		var code_state_num = $('select[name="code_state"]').val();
		var mem_num = ${member.mem_num};
		
		var con = confirm('회원 상태를 ' + code_state + "로 변경하시겠습니까?");
		if(con){
			$.ajax({
				url : '<%= request.getContextPath() %>/admin/member/modifyStateCode',
				type : 'POST',
				data : {'code_state_num' : code_state_num, 'mem_num' : mem_num},
				success : function(data){
					alert('변경되었습니다.');
					location.reload();
					opener.location.reload();
				},
				error : function(error){
					alert('서버 오류로 변경에 실패했습니다.');
				}
			})
		}else{
			alert('변경을 취소하였습니다.');
			return;
		}
	}
</script>