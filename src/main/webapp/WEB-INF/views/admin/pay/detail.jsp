<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
	<title>결제 내역 상세 조회</title>
</head>

  <div class="col-12 text-center">
    <div class="card">
      <div class="card-header">
      	<br/>
        <h3>결제 내역 상세 정보</h3>
        <button type="button" id="downloadBtn" class="btn btn-secondary" style="float:right;" onclick="fnExcelReport('hiddenTable','funseamding_결제내역_${projectPayDetail.mem_name}')">Excel로 다운로드 받기</button>
        <br/>
      </div>
      <!-- /.card-header -->
      <div class="card-body">
      	<c:forEach items="${standByToRefundList }" var="standByToRefund">
	      	<c:if test="${standByToRefund.pjt_pay_num eq projectPayDetail.pjt_pay_num }">
		      	<table class="table table-bordered">
	      			<tr>
						<th style="width:75%;"><h4>환불 대기 중인 내역입니다!</h4></th>
						<td>
						  	<button type="button" class="btn btn-secondary" id="saveStateBtn" style="width:100px;" onclick="saveRefund();">환불 완료</button>
						</td>
					</tr>
	     		</table>
	      	</c:if>
      	</c:forEach>
      	<c:if test="${projectPayDetail.pjt_refund eq 1 }">
      		<table class="table table-bordered">
      			<tr>
					<th style="width:75%;"><h4>환불을 요청한 내역입니다!</h4></th>
					<td>
					  	<button type="button" class="btn btn-secondary" id="saveStateBtn" style="width:100px;" onclick="saveRefund();">환불 완료</button>
					</td>
				</tr>
     		</table>
      	</c:if>
      	<c:forEach items="${standByRepaymentList }" var="standByToRepayment">
      		<c:if test="${standByToRepayment.pjt_num eq projectPayDetail.pjt_num }">
      			<table class="table table-bordered">
    	  			<c:if test="${projectPayDetail.pjt_pay_calc_state eq 0 }">
		      			<tr>
							<th style="width:75%;"><h4>대출 상환 대기 중인 내역입니다!</h4></th>
							<td>
							  	<button type="button" class="btn btn-secondary" id="saveRepayBtn" style="width:100px;" onclick="saveRepay();">상환 완료</button>
							</td>
						</tr>
		     		</c:if>
    	  			<c:if test="${projectPayDetail.pjt_pay_calc_state eq 1 }">
		      			<tr>
							<th><h4>대출 상환을 완료한 내역입니다!</h4></th>
						</tr>
		     		</c:if>
     			</table>
      		</c:if>
      	</c:forEach>
      	<br/>
        <table class="table table-bordered">
		  	<tr>
		  		<th>이 름</th>
		  		<td>${projectPayDetail.mem_name }</td>
		  	</tr>
		  	<tr>
		  		<th>이메일</th>
		  		<td>${projectPayDetail.mem_email }</td>
		  	</tr>
		  	<tr>
		  		<th>전화번호</th>
		  		<td>${projectPayDetail.mem_phone }</td>
		  	</tr>
		  	<tr>
		  		<th>프로젝트</th>
		  		<td>${projectPayDetail.pjt_title }</td>
		  	</tr>
		  	<tr>
		  		<th>유 형</th>
		  		<td>${projectPayDetail.pjt_type_code_val }</td>
		  	</tr>
		  	<c:if test="${projectPayDetail.pjt_type_code eq 2}">
		  		<tr>
		  			<th>이자율</th>
		  			<td>${projectPayDetail.pjt_int_rate }</td>
		  		</tr>
		  	</c:if>
		  	<tr>
		  		<th>결제 방식</th>
		  		<td>${projectPayDetail.pjt_pay_type }</td>
		  	</tr>
		  	<tr>
		  		<th>총 결제 금액</th>
		  		<td><fmt:formatNumber>${projectPayDetail.pjt_pay_amount }</fmt:formatNumber> </td>
		  	</tr>
		  	<tr>	
		  		<th>포인트 사용</th>
		  		<td>${projectPayDetail.pjt_pay_usepoint }</td>
		  	</tr>
		  	<tr>
		  		<th>결제 전화번호</th>
		  		<td>${projectPayDetail.pjt_pay_phone }</td>
		  	</tr>
		  	<tr>
		  		<th>결제 일자</th>
		  		<td><fmt:formatDate value="${projectPayDetail.ptj_pay_date }" pattern="yyyy-MM-dd"/></td>
	  		</tr>
	  		<c:if test="${projectPayDetail.pjt_type_code eq 2}">
		  		<tr>
		  			<th>상환 금액</th>
		  			<td><fmt:formatNumber value="${projectPayDetail.pjt_pay_amount + (projectPayDetail.pjt_pay_amount * 0.025 * 2) }" type="number"/></td>
		  		</tr>
		  		<tr>
		  			<th>상환 일자</th>
		  			<td class="repayDateTd"></td>
		  		</tr>
		  	</c:if>
		  	<tr>
		  		<th>환불 여부</th>
		  		<c:if test="${projectPayDetail.pjt_refund eq 0 or projectPayDetail.pjt_refund eq 1}">
		  			<td>N</td>
		  		</c:if>
		  		<c:if test="${projectPayDetail.pjt_refund eq 2}">
		  			<td>Y</td>
		  		</c:if>
	  		</tr>
		 </table>
      </div>
      <!-- /.card-body -->
      <div class="card-footer clearfix">
      </div>
    </div>
    <!-- /.card -->
  </div>
  
<table class="table table-bordered" id="hiddenTable" style="display:none;">
  	<tr>
  		<th>이 름</th>
  		<td>${projectPayDetail.mem_name }</td>
  	</tr>
  	<tr>
  		<th>이메일</th>
  		<td>${projectPayDetail.mem_email }</td>
  	</tr>
  	<tr>
  		<th>전화번호</th>
  		<td>${projectPayDetail.mem_phone }</td>
  	</tr>
  	<tr>
  		<th>프로젝트</th>
  		<td>${projectPayDetail.pjt_title }</td>
  	</tr>
  	<tr>
  		<th>유 형</th>
  		<td>${projectPayDetail.pjt_type_code_val }</td>
  	</tr>
  	<c:if test="${!empty projectPayDetail.pjt_int_rate }">
  		<tr>
  			<th>이자율</th>
  			<td>${projectPayDetail.pjt_int_rate }</td>
  		</tr>
  	</c:if>
  	<tr>
  		<th>결제 방식</th>
  		<td>${projectPayDetail.pjt_pay_type }</td>
  	</tr>
  	<tr>
  		<th>결제 금액</th>
  		<td>${projectPayDetail.pjt_pay_amount }</td>
  	</tr>
  	<tr>	
  		<th>포인트 사용</th>
  		<td>${projectPayDetail.pjt_pay_usepoint }</td>
  	</tr>
  	<tr>
  		<th>결제 전화번호</th>
  		<td>${projectPayDetail.pjt_pay_phone }</td>
  	</tr>
  	<tr>
  		<th>결제 일자</th>
  		<td><fmt:formatDate value="${projectPayDetail.ptj_pay_date }" pattern="yyyy-MM-dd"/></td>
 	</tr>
	<c:if test="${projectPayDetail.pjt_type_code eq 2}">
  		<tr>
  			<th>상환 금액</th>
  			<td>
  				<fmt:formatNumber value="${projectPayDetail.pjt_pay_amount + (projectPayDetail.pjt_pay_amount * 0.025 * 2) }" type="number"/>
  			</td>
  		</tr>
  		<tr>
  			<th>상환 일자</th>
  			<td class="repayDateTd"></td>
  		</tr>
  	</c:if>
  	<tr>
  		<th>환불 여부</th>
  		<c:if test="${projectPayDetail.pjt_refund eq 0 or projectPayDetail.pjt_refund eq 1}">
  			<td>N</td>
  		</c:if>
  		<c:if test="${projectPayDetail.pjt_refund eq 2}">
  			<td>Y</td>
  		</c:if>
 	</tr>
 </table>
<script>
	/**
	 * 대출 상환 예정일 출력
	 */
	var enddate = new Date(${projectPayDetail.pjt_enddate.time});
	var repayDate = enddate.setFullYear(enddate.getFullYear()+2);
	var displayRepayDate = new Date(repayDate);
	//alert(displayRepayDate);
	var year=displayRepayDate.getFullYear();
	var month=displayRepayDate.getMonth()+1;
	var date=displayRepayDate.getDate();
	$('.repayDateTd').append(year+"-"+month+"-"+date);

	function saveRefund(){
		var pjt_pay_num = ${projectPayDetail.pjt_pay_num};
		var checkedTrueList = new Array(); //배열 필요 없는데 기존 메서드 사용하기 위해 생성
		checkedTrueList.push(pjt_pay_num);
		var json = { 'checkedTrueList' : checkedTrueList };
		
		var con = confirm("환불 완료로 처리하시겠습니까?");
		if(con){
			$.ajax({
				url : '<%= request.getContextPath() %>/admin/pay/refund',
				type : 'post',
				data: JSON.stringify(json),
		        contentType:'application/json',
				success : function(result){
					alert("환불 완료로 처리했습니다.");
					opener.location.reload();
					location.reload();
				},
				error : function(xhr,error){
					alert("서버 오류로 실패했습니다. 다시 시도해주세요!");
					//alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
				}
			})	
		}else{
			alert("취소하였습니다.");
		}
	}
	
	function saveRepay(){
		var pjt_pay_num = ${projectPayDetail.pjt_pay_num};
		var checkedTrueList = new Array(); //배열 필요 없는데 기존 메서드 사용하기 위해 생성
		checkedTrueList.push(pjt_pay_num);
		var json = { 'checkedTrueList' : checkedTrueList };
		
		var con = confirm("상환 완료로 처리하시겠습니까?");
		if(con){
			$.ajax({
				url : '<%= request.getContextPath() %>/admin/project/repayment',
				type : 'post',
				data: JSON.stringify(json),
		        contentType:'application/json',
				success : function(result){
					alert("상환 완료로 처리했습니다.");
					opener.location.reload();
					location.reload();
				},
				error : function(xhr,error){
					alert("서버 오류로 실패했습니다. 다시 시도해주세요!");
					//alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
				}
			})	
		}else{
			alert("취소하였습니다.");
		}
	}
	
	function fnExcelReport(id, title) {
		var tab_text = '<html xmlns:x="urn:schemas-microsoft-com:office:excel">';
		tab_text = tab_text + '<head><meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8">';
		tab_text = tab_text + '<xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>'
		tab_text = tab_text + '<x:Name>Test Sheet</x:Name>';
		tab_text = tab_text + '<x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions></x:ExcelWorksheet>';
		tab_text = tab_text + '</x:ExcelWorksheets></x:ExcelWorkbook></xml></head><body>';
		tab_text = tab_text + "<table border='1px'>";
		var exportTable = $('#' + id).clone();
		exportTable.find('input').each(function (index, elem) { $(elem).remove(); });
		tab_text = tab_text + exportTable.html();
		tab_text = tab_text + '</table></body></html>';
		var data_type = 'data:application/vnd.ms-excel';
		var ua = window.navigator.userAgent;
		var msie = ua.indexOf("MSIE ");
		var fileName = title + '.xls';
		//Explorer 환경에서 다운로드
		if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
		if (window.navigator.msSaveBlob) {
		var blob = new Blob([tab_text], {
		type: "application/csv;charset=utf-8;"
		});
		navigator.msSaveBlob(blob, fileName);
		}
		} else {
		var blob2 = new Blob([tab_text], {
		type: "application/csv;charset=utf-8;"
		});
		var filename = fileName;
		var elem = window.document.createElement('a');
		elem.href = window.URL.createObjectURL(blob2);
		elem.download = filename;
		document.body.appendChild(elem);
		elem.click();
		document.body.removeChild(elem);
		}
	}
</script>