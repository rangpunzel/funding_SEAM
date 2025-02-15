<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
	<title>프로젝트 상세 조회</title>
</head>

  <div class="col-12 text-center">
    <div class="card">
      <div class="card-header">
      	<br/>
        <h3>프로젝트 상세 정보</h3>
        <br/>
      </div>
      <!-- /.card-header -->
      <div class="card-body">
      	<table class="table table-bordered">
      		<c:forEach items="${projectInProgressList }" var="projectInProgress">
      			<c:if test="${project.pjt_num eq projectInProgress.pjt_num }">
      				<tr>
      					<th rowspan="2"><h4 style="padding:35px 0px 0px 50px;width:400px;">진행중인 프로젝트입니다!</h4></th>
	      				<td>
	      					<select class="form-control" id="thumbsUpSelect" style="width:250px;float:left;">
						  		<option>--프로젝트 추천하기--</option>
						  		<option value="1">Y</option>
						  		<option value="0">N</option>
						  	</select>
		      				<button type="button" class="btn btn-secondary" onclick="saveThumbsUp();">저장</button>
		      			</td>
	      			</tr>
	      			<tr>
		      			<td>
	      					<select class="form-control" id="enabledSelect" style="width:250px;float:left;">
						  		<option>--프로젝트 활성화 여부--</option>
						  		<option value="1">노출</option>
						  		<option value="0">비노출</option>
						  	</select>
		      				<button type="button" class="btn btn-secondary" onclick="saveEnabled();">저장</button>
		      			</td>
	      			</tr>
      			</c:if>
      		</c:forEach>
      		<c:forEach items="${calcToStandByList }" var="standBy">
      			<c:if test="${project.pjt_num eq standBy.pjt_num }">
      				<c:if test="${project.pjt_type_code eq 1 }">
	      				<tr>
     						<c:if test="${project.pjt_cash <= project.pjtPaySum }">
     							<c:if test="${project.pjt_calculate_code eq 1 }">
		     						<th>
			     						<h4>목표 금액에 달성하여 정산 대기중인 프로젝트입니다!</h4>
			     						<!-- <h4 style="color:red;display:none;"></h4> -->
			      					</th>
			      					<td>
			      						<button type="button" class="btn btn-secondary forCalcBtn" style="width:150px;" onclick="saveCalc('정산');">정산 완료</button>
			      					</td>
		      					</c:if>
	      					</c:if>
	      					<c:if test="${project.pjt_cash > project.pjtPaySum }">
      							<th>
		     						<h4>목표 금액에 미달성한 프로젝트입니다.</h4>
		      					</th>
      						</c:if>
	      				</tr>
	      			</c:if>
	      			<c:if test="${project.pjt_type_code eq 2 }">
	      				<c:if test="${project.pjt_cash > project.pjtPaySum }">
							<tr>
								<th style="width:73%;">
			 						<h4>목표 금액에 미달성한 프로젝트입니다.</h4>
			  					</th>
		  					</tr>
						</c:if>
	      			</c:if>
	    		</c:if>
	    	</c:forEach>
	    	<c:forEach items="${standByToCalcList }" var="standByToRefund">
				<c:if test="${project.pjt_num eq standByToRefund.pjt_num }">
					<c:if test="${project.pjt_type_code eq 2 }">
						<c:if test="${project.pjt_cash <= project.pjtPaySum }">
							<c:if test="${empty project.pjt_repaydate }">
								<tr>
									<th style="width:63%;">
				 						<h4>대출 상환 대기중인 프로젝트입니다!</h4>
				 						<h4 id="repayDate" style="color:red;display:none;font-size:18px;"></h4>
				 					</th>
				  					<td>
					  					<select class="form-control" id="forRepaySelect" style="width:150px;float:left;margin-left:15px;">
						  					<option>--상환 여부--</option>
						  					<c:if test="${project.pjt_calculate_code eq 1}">
							  					<option value="3">상환 미완료</option>
							  					<option value="4">상환 완료</option>
						  					</c:if>
						  					<c:if test="${project.pjt_calculate_code eq 3}">
							  					<option value="3" selected>상환 미완료</option>
							  					<option value="4">상환 완료</option>
						  					</c:if>
									  	</select>
				 						<button type="button" class="btn btn-secondary forRepayBtn" style="width:100px;" onclick="saveRepay();">저장</button>
				 					</td>
			 					</tr>
		 					</c:if>
						</c:if>
					</c:if>
				</c:if>
			</c:forEach>
      		<c:if test="${project.pjt_state_code eq 1 }">
				<tr>
					<th style="width:73%;"><h4>프로젝트 등록 승인 대기중인 프로젝트입니다!</h4></th>
					<td>
						<select class="form-control" id="stateSelect" style="width:130px;float:left;">
					  		<option value="2">승인</option>
					  		<option value="3">보류</option>
					  	</select>
					  	<button type="button" class="btn btn-secondary" id="saveStateBtn" onclick="saveState();">저장</button>
					</td>
				</tr>
     		</c:if>	
			<c:if test="${project.pjt_state_code eq 4 }">
				<tr>
					<th style="width:73%;"><h4>프로젝트 등록 승인을 재요청한 프로젝트입니다!</h4></th>
					<td>
						<select class="form-control" id="stateSelect" style="width:130px;float:left;">
					  		<option value="2">승인</option>
					  		<option value="3">보류</option>
					  	</select>
					  	<button type="button" class="btn btn-secondary" id="saveStateBtn" onclick="saveState();">저장</button>
					</td>
				</tr>
     		</c:if>
     		<c:if test="${project.pjt_state_code eq '3' }">
   				<tr>
   					<th><h4>승인을 보류한 프로젝트입니다.</h4></th>
   				</tr>
   			</c:if>
   			<c:if test="${!empty project.pjt_calcdate }">
   				<tr>
   					<th>
   						<h4>정산 완료된 프로젝트입니다.</h4>
   						정산 날짜 : <fmt:formatDate value="${project.pjt_calcdate }" pattern="yyyy-MM-dd"/>
   					</th>
   				</tr>
   			</c:if>
   			<c:if test="${project.pjt_calculate_code eq 4}">
   				<tr>
   					<th>
						<h4>대출 상환 완료된 프로젝트입니다.</h4>
						상환 날짜 : <fmt:formatDate value="${project.pjt_repaydate }" pattern="yyyy-MM-dd"/>
					</th>
				</tr>		
			</c:if>
      	</table>
      	<br/>
        <table class="table table-bordered">
		  	<tr>
		  		<th style="width:250px;">상호명</th>
		  		<td><a href="#a" onclick="OpenWindow('<%= request.getContextPath() %>/admin/comMember/detail?mem_num=${project.mem_num}','회원 상세 보기','950','900')">${comMember.com_bsns_name }</a></td>
		  	</tr>
		  	<tr>
		  		<th>사업장 주소</th>
		  		<td>${comMember.com_zipcode }&nbsp;${comMember.com_addr1 }&nbsp;${comMember.com_addr2 }</td>
		  	</tr>
		  	<tr>
		  		<th>연락처</th>
		  		<td>${comMember.com_bsns_phone }</td>
		  	</tr>
		  	<tr>
		  		<th>업종</th>
		  		<td>${project.pjt_category }</td>
		  	</tr>
		  	<tr>
		  		<th>통장 사본</th>
		  		<td>
		  			<c:if test="${!empty project.pjt_atc_bankbook_name}">
		  				<button class="col-sm-3 btn" type="button" onclick="self.location='receiveDoc?fileName=${project.pjt_atc_bankbook_name}';"><i class="fas fa-folder-open fa-3x"></i>다운로드</button>
		  			</c:if>
		  			<c:if test="${empty project.pjt_atc_bankbook_name}">
						통장 사본이 등록되어 있지 않습니다.
		  			</c:if>
		  		</td>
		  	</tr>
		  	<c:if test="${!empty project.pjt_calcdate }">
		  		<tr>
			  		<th>프로젝트 정산일자</th>
			  		<td><fmt:formatDate value="${project.pjt_calcdate }" pattern="yyyy-MM-dd"/></td>
		  		</tr>
		  	</c:if>
		  	<tr>
		  		<th>제목</th>
		  		<td>${project.pjt_title }</td>
		  	</tr>
		  	<tr>
		  		<th>프로젝트 작성일자</th>
		  		<td><fmt:formatDate value="${project.pjt_regdate }" pattern="yyyy-MM-dd"/></td>
		  	</tr>
		  	<c:if test="${!empty project.pjt_moddate }">
		  		<tr>
			  		<th>프로젝트 수정일자</th>
			  		<td><fmt:formatDate value="${project.pjt_moddate }" pattern="yyyy-MM-dd"/></td>
		  		</tr>
		  	</c:if>
		  	<tr>
		  		<th>유형</th>
		  		<td>${project.pjt_type_code_val }</td>
		  	</tr>
		  	<tr>
		  		<th>목표 금액</th>
		  		<td><fmt:formatNumber>${project.pjt_cash }</fmt:formatNumber> </td>
		  	</tr>
		  	<c:if test="${project.pjt_int_rate ne '0'}">
		  		<tr>
			  		<th>투자 이자율</th>
			  		<td>${project.pjt_int_rate }</td>
		  		</tr>
		  	</c:if>
		  	<tr>
		  		<th>진행 기간</th>
		  		<td>
		  			<fmt:formatDate value="${project.pjt_startdate }" pattern="yyyy-MM-dd"/>
		  			&nbsp;~&nbsp;
		  			<fmt:formatDate value="${project.pjt_enddate }" pattern="yyyy-MM-dd"/>
		  		</td>
		  	</tr>
		  	<c:if test="${project.pjt_type_code eq 2 }">
			  	<tr>
			  		<th>대출 상환 예정일</th>
			  		<td id="repayDateTd"></td>
			  	</tr>
		  	</c:if>
		  	<tr>
		  		<th>대표 이미지</th>
		  		<td><img class="profile-user-img img-fluid" src="<%= request.getContextPath() %>/project/picture/get?picture=${project.pjt_atc_sum_name}" onerror="this.src='https://source.unsplash.com/category/nature'" alt="user profile image" style="width:150px;height:150px;"></td>
		  	</tr>
		  	<tr>
		  		<th>상세 내용</th>
		  		<td>${project.pjt_contents }</td>
		  	</tr>
		  	<c:if test="${!empty project.pjt_state_comment }">
		  		<tr>
			  		<th>프로젝트 보류 메시지</th>
			  		<td>${project.pjt_state_comment }</td>
		  		</tr>
		  	</c:if>
		 </table>
      </div>
      <!-- /.card-body -->
      <div class="card-footer clearfix">
      </div>
    </div>
    <!-- /.card -->
    
	<c:if test="${project.pjt_state_code eq 2 }">
		<div class="card">
	      <div class="card-header">
	      	<br/>
	        <h3>프로젝트 참여 회원 목록</h3>
	        <button type="button" id="downloadBtn" class="btn btn-secondary float-left" onclick="fnExcelReport('hiddenTable','funseamding_프로젝트참여회원리스트')">Excel로 다운로드 받기</button>
	        <c:forEach items="${calcToStandByList }" var="standBy">
    			<c:if test="${project.pjt_num eq standBy.pjt_num }">
    				<c:if test="${project.pjt_cash > project.pjtPaySum }">
		  				<button type="button" class="btn btn-secondary float-right" onclick="refundGo();">환불 완료</button>
	  				</c:if>
    				<c:if test="${project.pjt_cash <= project.pjtPaySum }">
    					<c:if test="${project.pjt_type_code eq 2 }">
			  				<button type="button" class="btn btn-secondary float-right" onclick="saveRepayment();">상환 완료</button>
		  				</c:if>
	  				</c:if>
  				</c:if>
  			</c:forEach>
	        <br/>
	      </div>
	      <!-- /.card-header -->
	      <div class="card-body">
	        <table class="table table-bordered" style="font-size:13px;">
		  		<tr>
		  			<th style="width:7%;">번호</th>
		  			<th>아이디</th>
		  			<th style="width:8%;">이름</th>
		  			<th>전화번호</th>
		  			<th>결제 일자</th>
		  			<th>결제<br>금액</th>
		  			<th>결제<br>방식</th>
		  			<th>포인트<br>사용</th>
		  			<c:if test="${project.pjt_type_code eq 2 }">
		  				<th>상환<br>금액</th>
		  			</c:if>
		  			<c:forEach items="${calcToStandByList }" var="standBy">
	      				<c:if test="${project.pjt_num eq standBy.pjt_num }">
	      					<c:if test="${project.pjt_cash > project.pjtPaySum }">
					  			<th>환불<br>여부</th>
					  			<th>
					  				<input type='checkbox' id='checkAll' name='checkAll'>
					  			<!-- <button type="button" class="btn btn-primary pointer" onclick="refundGo();">환불 완료</button> -->
					  			</th>
				  			</c:if>
	      					<c:if test="${project.pjt_cash <= project.pjtPaySum }">
	      						<c:if test="${project.pjt_type_code eq 2 }">
						  			<th>상환<br>여부</th>
						  			<th>
						  				<input type='checkbox' id='checkAll' name='checkAll'>
						  			<!-- <button type="button" class="btn btn-primary pointer" onclick="saveRepayment();">상환 완료</button> -->
						  			</th>
					  			</c:if>
				  			</c:if>
			  			</c:if>
		  			</c:forEach>
		  		</tr>
	  			<c:if test="${empty listOfParticipationInProject }">
					<tr>
						<td colspan="10">
							<strong>해당 내용이 없습니다.</strong>
						</td>
					</tr>
				</c:if>
	  			<c:if test="${!empty listOfParticipationInProject }">
		      		<c:forEach items="${listOfParticipationInProject }" var="MemPartInPJT">
		      			<tr>
		      				<td>${MemPartInPJT.pjt_pay_num }</td>
		      				<td>${MemPartInPJT.mem_email }</td>
		      				<td>${MemPartInPJT.mem_name }</td>
		      				<td>${MemPartInPJT.mem_phone }</td>
		      				<td><fmt:formatDate value="${MemPartInPJT.ptj_pay_date }" pattern="yyyy-MM-dd"/></td>
		      				<td>${MemPartInPJT.pjt_pay_amount }</td>
		      				<td>${MemPartInPJT.pjt_pay_type }</td>
		      				<td>${MemPartInPJT.pjt_pay_usepoint }</td>
		      				<c:if test="${project.pjt_type_code eq 2 }">
				  				<td><fmt:formatNumber value="${MemPartInPJT.pjt_pay_amount + (MemPartInPJT.pjt_pay_amount * 0.025 * 2) }" type="number"/></td>
				  			</c:if>
		      				<c:forEach items="${calcToStandByList }" var="standBy">
 				     			<c:if test="${project.pjt_num eq standBy.pjt_num }">
 				     				<c:if test="${project.pjt_cash > project.pjtPaySum }">
				      					<c:if test="${MemPartInPJT.pjt_refund eq 0 or MemPartInPJT.pjt_refund eq 1}">
				      						<td>N</td>
				      						<td><input type='checkbox' name='check' value="${MemPartInPJT.pjt_pay_num }"></td>
				      					</c:if>
				      					<c:if test="${MemPartInPJT.pjt_refund eq 2 }">
				      						<td>Y</td>
				      						<td><input type='checkbox' name='check' value="${MemPartInPJT.pjt_pay_num }" checked></td>
				      					</c:if>
				      				</c:if>
 				     				<c:if test="${project.pjt_cash <= project.pjtPaySum }">
 				     					<c:if test="${project.pjt_type_code eq 2 }">
					      					<c:if test="${empty MemPartInPJT.pjt_pay_calc_date }">
					      						<td>N</td>
					      						<td><input type='checkbox' name='check' value="${MemPartInPJT.pjt_pay_num }"></td>
					      					</c:if>
					      					<c:if test="${!empty MemPartInPJT.pjt_pay_calc_date }">
					      						<td>Y</td>
					      						<td><input type='checkbox' name='check' value="${MemPartInPJT.pjt_pay_num }" checked></td>
					      					</c:if>
					      				</c:if>
				      				</c:if>
				      			</c:if>
				      		</c:forEach>
		      			</tr>
				  	</c:forEach>
				</c:if>
			 </table>
	      </div>
	      <!-- /.card-body -->
	      <div class="card-footer clearfix">
	      	<%@ include file="/WEB-INF/views/admin/project/paginationForProjectPayDetail.jsp" %>	
	      </div>
	    </div>
	    <!-- /.card -->
	</c:if>
  </div>

<table class="table table-bordered" id="hiddenTable" style="display:none;">
	<tr>
		<th>번 호</th>
		<th>아이디</th>
		<th>이 름</th>
		<th>전화번호</th>
		<th>결제 일자</th>
		<th>결제 금액</th>
		<th>결제 방식</th>
		<th>포인트 사용</th>
		<c:if test="${project.pjt_type_code eq 2 }">
			<th>상환 금액</th>
		</c:if>
	</tr>
	<c:if test="${empty listOfParticipationInProjectForDownload }">
		<tr>
			<td colspan="8">
				<strong>해당 내용이 없습니다.</strong>
			</td>
		</tr>	
	</c:if>
	<c:if test="${!empty listOfParticipationInProjectForDownload }">
   		<c:forEach items="${listOfParticipationInProjectForDownload }" var="MemPartInPJTForDownload">
   			<tr>
   				<td>${MemPartInPJTForDownload.pjt_pay_num }</td>
   				<td>${MemPartInPJTForDownload.mem_email }</td>
   				<td>${MemPartInPJTForDownload.mem_name }</td>
   				<td>${MemPartInPJTForDownload.mem_phone }</td>
   				<td><fmt:formatDate value="${MemPartInPJTForDownload.ptj_pay_date }" pattern="yyyy-MM-dd"/></td>
   				<td>${MemPartInPJTForDownload.pjt_pay_amount }</td>
   				<td>${MemPartInPJTForDownload.pjt_pay_type }</td>
   				<td>${MemPartInPJTForDownload.pjt_pay_usepoint }</td>
   				<c:if test="${project.pjt_type_code eq 2 }">
	  				<td><fmt:formatNumber value="${MemPartInPJTForDownload.pjt_pay_amount + (MemPartInPJTForDownload.pjt_pay_amount * 0.025 * 2) }" type="number"/></td>
	  			</c:if>
   			</tr>
  		</c:forEach>
	</c:if>
</table>

<div id="registMessageModal" class="modal fade in">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">프로젝트 진행을 보류하는 이유를 적어주세요.</h4>
        <input type="hidden" class="modal_pjt_num" value="${project.pjt_num }">
        <button type="button" class="close" data-dismiss="modal">&times;</button>        
      </div>
      <div class="modal-body">
        <p><textarea id="modal_pjt_state_comment" class="form-control" style="height:500px;"></textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="pjtStateCodeSaveBtn">저장</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<%@ include file="/WEB-INF/views/admin/project/detail_js.jsp" %>
