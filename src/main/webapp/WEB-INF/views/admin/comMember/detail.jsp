<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
	<title>소상공인 회원 상세 조회</title>
</head>

<div class="card-body box-profile">
  <div class="text-center">
    <img class="profile-user-img img-fluid img-circle" src="<%= request.getContextPath() %>/displayProfileImg?mem_email=${comMember.mem_email}&fileName=${comMember.mem_profile_img}" onerror="this.src='<%= request.getContextPath() %>/resources/images/profile-picture.png'" alt="user profile image" style="width:150px;height:150px;">
  </div>
  <h3 class="profile-username text-center">${comMember.mem_name }</h3>
  <p class="text-muted text-center">${comMember.code_state }</p>

	<%-- 가입	 미승인 상태(대기중)인 경우 --%>
	<c:if test="${comMember.com_state_code eq 2 }">
			<table class="container" style="margin-top:10px;width:450px;">
				<tr class="text-center">
					<td style="margin-top:7px;" colspan="2">
						<b style="font-size:15px;color:red;">※가입 승인을 기다리고 있는 회원입니다.※</b>
					</td>
				</tr>
				<tr class="text-center" style="padding-left:400px;">
					<td>
						<select class="form-control float-left" name="com_state_code" id="comStateCode" style="width:300px;" onchange="forModal();">
					        <option>가입 상태</option>
					        <c:forEach items="${comStateCodeList }" var="comStateCode">
								<option value="${comStateCode.com_state_code }" ${comStateCode.com_state_code eq comMember.com_state_code ? 'selected':'' }>${comStateCode.com_state_code_val }</option>
					        </c:forEach>
						</select>
					</td>
					<td>	
						<button type="button" class="btn btn-block btn-secondary" id="modifyComStateCodeBtn" onclick="modifyComStateCode();" style="width:100px;">저장</button>
					</td>	
				</tr>
			</table>
		<br/>
		<br/>
	</c:if>

	<%-- 가입	 보류 상태(거절)인 경우 --%>
	<c:if test="${comMember.com_state_code eq 0 }">
		<b style="font-size:20px;padding-left:320px;margin-top:9px;">- 가입을 보류한 회원입니다. -</b>
		<br/>
		<br/>
	</c:if>
	
	<%-- 가입	 승인 상태인 경우 --%>
	<c:if test="${comMember.com_state_code eq 1 }">
	<table>
		<tr class="row text-center" style="padding-left:200px;">
			<td style="padding-right:20px;">
				<select class="form-control" name="code_state" id="stateCode" style="width:300px;">
			        <option>회원 상태</option>
			        <c:forEach items="${memStateCodeList }" var="memStateCode">
			        	<c:if test="${memStateCode.code_state_num ne 9}">
							<option value="${memStateCode.code_state_num }" ${memStateCode.code_state_num eq comMember.code_state_num ? 'selected':'' }>${memStateCode.code_state }</option>
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
	</c:if>
	
  <div class="col-12 text-center">
    <div class="card">
      <div class="card-header">
        <h3>회원 상세 정보</h3>
      </div>
      <!-- /.card-header -->
      <div class="card-body">
        <table class="table table-bordered" style="font-size:15px;">
		  	<tr>
		  		<th>이메일</th>
		  		<td>${comMember.mem_email }</td>
		  	</tr>
		  	<tr>
		  		<th>전화번호</th>
		  		<td>${comMember.mem_phone }</td>
		  	</tr>
		  	<tr>
		  		<th>가입 일자</th>
		  		<td><fmt:formatDate value="${comMember.mem_regdate }" pattern="yyyy-MM-dd"/></td>
		  	</tr>
		  	<tr>
		  		<th>마지막 로그인 일자</th>
		  		<td><fmt:formatDate value="${comMember.mem_lastdate }" pattern="yyyy-MM-dd"/></td>
		  	</tr>
		  	<tr>
		  		<th>보유 포인트</th>
		  		<td><fmt:formatNumber>${point }</fmt:formatNumber> </td>
		  	</tr>
		  	<tr>
		  		<th>사업장명</th>
		  		<td>${comMember.com_bsns_name }</td>
		  	</tr>
		  	<tr>
		  		<th>대표자명</th>
		  		<td>${comMember.com_bsns_rep_name }</td>
		  	</tr>
		  	<tr>
		  		<th>사업자 등록 번호</th>
		  		<td>${comMember.com_bsns_number }</td>
		  	</tr>
		  	<tr>
		  		<th>대표 전화번호</th>
		  		<td>${comMember.com_bsns_phone }</td>
		  	</tr>
		  	<tr>
		  		<th>주소</th>
		  		<td>${comMember.com_zipcode }&nbsp;${comMember.com_addr1 }&nbsp;${comMember.com_addr2 }</td>
		  	</tr>
		  	<tr>
		  		<th colspan="2" style="font-size:20px;">첨부파일</th>
		  	</tr>
			<tr>
				<th>사업자 등록증</th>
				<td><button class="col-sm-5 btn btn-block" type="button" onclick="self.location='receiveDoc?fileName=${comMember.com_bsns_reg_license}&id=${comMember.mem_email }';" style="margin-left:90px;"><i class="fas fa-folder-open fa-1x"></i>&nbsp;다운로드</button></td>
			</tr>
			<tr>
				<th>소상공인 증명서</th>
				<td><button class="col-sm-5 btn btn-block" type="button" onclick="self.location='receiveDoc?fileName=${comMember.com_bsns_cert}&id=${comMember.mem_email }';" style="margin-left:90px;"><i class="fas fa-folder-open fa-1x"></i>&nbsp;다운로드</button></td>
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
            <c:if test="${empty comMemberProjectPayList }">
            	<tr>
					<td colspan="6">
						<strong>후원 내역이 없습니다.</strong>
					</td>
				</tr>
            </c:if>
          	<c:if test="${!empty comMemberProjectPayList }">
	          	<c:forEach items="${comMemberProjectPayList}" var="comMemberProjectPayDetail">
		            <tr>
		              <td>${comMemberProjectPayDetail.pjt_pay_num }</td>
		              <td><img src="<%= request.getContextPath() %>/project/picture/get?picture=${comMemberProjectPayDetail.pjt_atc_sum_name}" onerror="this.src='https://source.unsplash.com/category/nature'" alt="image" style="width:50px;height:50px;"></td>
		              <td>${comMemberProjectPayDetail.pjt_title }</td>
		              <td>${comMemberProjectPayDetail.pjt_type_code_val }</td>
		              <td>${comMemberProjectPayDetail.pjt_pay_amount }</td>
		              <td><fmt:formatDate value="${comMemberProjectPayDetail.ptj_pay_date }" pattern="yyyy-MM-dd"/></td>
		            </tr>
	            </c:forEach>
            </c:if>
          </tbody>
        </table>
      </div>
      <!-- /.card-body -->
      <div class="card-footer clearfix">
        <%@ include file="/WEB-INF/views/admin/comMember/paginationForPjtPayDetail.jsp" %>	
      </div>
    </div>
    <!-- /.card -->
  </div>
  <br/>
  <div class="col-12 text-center">
    <div class="card">
      <div class="card-header">
        <h3>프로젝트 진행 목록</h3>
      </div>
      <!-- /.card-header -->
      <div class="card-body">
        <table class="table table-bordered" style="font-size:13px;">
          <thead>                  
            <tr>
              <th style="width:10%;">번호</th>
              <th style="width:15%;">카테고리</th>
              <th colspan="2">프로젝트</th>
              <th style="width:10%;">유형</th>
              <th>기간</th>
            </tr>
          </thead>
          <tbody>
            <c:if test="${empty comMemberProjectList }">
            	<tr>
					<td colspan="6">
						<strong>등록한 프로젝트가 없습니다.</strong>
					</td>
				</tr>
            </c:if>
          	<c:if test="${!empty comMemberProjectList }">
	          	<c:forEach items="${comMemberProjectList}" var="comMemberProject">
		            <tr>
		              <td>${comMemberProject.pjt_num }</td>
		              <td>${comMemberProject.pjt_category }</td>
		              <td><img src="<%= request.getContextPath() %>/project/picture/get?picture=${comMemberProject.pjt_atc_sum_name}" style="width:50px;height:50px;"></td>
		              <td>${comMemberProject.pjt_title }</td>
		              <td>${comMemberProject.pjt_type_code_val }</td>
		              <td>
		              	<fmt:formatDate value="${comMemberProject.pjt_startdate }" pattern="yyyy-MM-dd"/>
		              	~
		              	<fmt:formatDate value="${comMemberProject.pjt_enddate }" pattern="yyyy-MM-dd"/>
		              </td>
		            </tr>
	            </c:forEach>
            </c:if>
          </tbody>
        </table>
      </div>
      <!-- /.card-body -->
      <div class="card-footer clearfix">
        <%@ include file="/WEB-INF/views/admin/comMember/paginationForProjectDetail.jsp" %>	
      </div>
    </div>
    <!-- /.card -->
  </div>
</div>

<div id="modifyModal" class="modal fade in" >
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">가입을 보류하는 사유를 적어주세요.</h4>
        <input type="hidden" class="modal_mem_num" value="${comMember.mem_num }">
        <button type="button" class="close" data-dismiss="modal">&times;</button>        
      </div>
      <div class="modal-body" data-free_cmts_num>
        <p><input type="text" id="modal_com_state_comment" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="comStateCodeModifyBtn">저장</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<script>

	<%-- 보류 선택 후 저장 버튼 클릭시 모달창 띄우기 --%>	
	function forModal(){
		if($('select[name="com_state_code"] option:selected').val() == 0){
			$('#modifyComStateCodeBtn').attr({'data-toggle':'modal', 'data-target':'#modifyModal'});
		}else{
			$('#modifyComStateCodeBtn').removeAttr('data-toggle');
			$('#modifyComStateCodeBtn').removeAttr('data-target');
			return;
		}
	}
	
	<%-- 모달창의 저장 버튼 눌렀을 때 --%>	
	$('#comStateCodeModifyBtn').on('click', function(){
		var com_state_code_val = $('select[name="com_state_code"] option:selected').text();
		var com_state_code = $('select[name="com_state_code"]').val();
		var mem_num = ${comMember.mem_num};
		var mem_name = "${comMember.mem_name}";
		var com_state_comment = $('#modal_com_state_comment').val();
		
		var con = confirm(mem_name + '님의 가입을 ' + com_state_code_val + "하시겠습니까?");
		if(con){
			$.ajax({
				url : '<%= request.getContextPath() %>/admin/comMember/modifyComStateCode',
				type : 'POST',
				data : {'com_state_code' : com_state_code, 'mem_num' : mem_num, 'com_state_comment' : com_state_comment},
				success : function(data){
					alert('변경되었습니다.');
				},
				error : function(error){
					alert('서버 오류로 변경에 실패했습니다.');
				},
				complete:function(){
					$('#modifyModal').modal('hide');
					location.reload();
				}
			})
		}else{
			$('#modifyComStateCodeBtn').removeAttr('data-toggle');
			$('#modifyComStateCodeBtn').removeAttr('data-target');
			alert('변경을 취소하였습니다.');
			return;
		}
	})
	
	function modifyComStateCode(){
		var com_state_code_val = $('select[name="com_state_code"] option:selected').text();
		var com_state_code = $('select[name="com_state_code"] option:selected').val();
		var mem_num = ${comMember.mem_num};
		var mem_name = "${comMember.mem_name}";
		
		if(com_state_code != 0){ //선택 값이 보류가 아닌 경우
			var con = confirm(mem_name + '님의 가입을 ' + com_state_code_val + "하시겠습니까?");
			if(con){
				$.ajax({
					url : '<%= request.getContextPath() %>/admin/comMember/modifyComStateCode',
					type : 'POST',
					data : {'com_state_code' : com_state_code, 'mem_num' : mem_num},
					success : function(data){
						alert('변경되었습니다.');
						opener.location.reload();
						location.reload();
					},
					error : function(error){
						alert('서버 오류로 변경에 실패했습니다.');
					}
				})
			}else{
				$('#modifyComStateCodeBtn').removeAttr('data-toggle');
				$('#modifyComStateCodeBtn').removeAttr('data-target');
				alert('변경을 취소하였습니다.');
				return;
			}
		}else{
			return;
		}
		
	}
	
	function modifyStateCode(){
		var code_state = $('select[name="code_state"] option:checked').text();
		var code_state_num = $('select[name="code_state"]').val();
		var mem_num = ${comMember.mem_num};
		
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