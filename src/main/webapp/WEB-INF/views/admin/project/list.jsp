<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container col-10">
<!-- 프로젝트 승인 대기 정보 -->
<%-- <div class="info-box bg-warning">
	<span class="info-box-icon bg-warning elevation-1"><i class="fas fa-users"></i></span>
 	<div class="info-box-content">
   		<span class="info-box-text"><a href="#" onclick="stateStandByListGo();" style="font-size:35px;color:black;"><b>${stateStandByTotalCount }</b>개의 프로젝트가 등록 승인 대기 중입니다!</a></span>
 	</div>
 	<!-- /.info-box-content -->
</div>
<div class="info-box bg-warning">
	<span class="info-box-icon bg-warning elevation-1"><i class="fas fa-users"></i></span>
	<div class="info-box-content">
	  	<span class="info-box-text"><a href="#" onclick="calcStandByListGo();" style="font-size:35px;color:black;"><b>${calcStandByTotalCount }</b>개의 프로젝트가 정산 대기 중입니다!</a></span>
	</div>
 	<!-- /.info-box-content -->
</div> --%>

<!-- 프로젝트 리스트 -->
    <ul class="list-group list-group-flush" style="list-style: none;">
		<li class="list-group-item">
    		<h3 class="float-left">프로젝트 리스트</h3>
    	</li>
    	<hr>	
    </ul>
          
       <!-- /.card-header -->
       <div class="card-body table-responsive p-0" style="height: auto;">
        <div class="card-tools">
              <table>
              	<tr>
              		<td style="padding:0px 10px 0px 20px;">
              			<select class="form-control" name="stateType" id="stateType" onchange="searchList_go(1,'list');" style="border:none;">
	             		<option>승인 여부</option>
		             		<c:forEach items="${pjtStateCodeList }" var="pjtStateCode">
								<option value="${pjtStateCode.pjt_state_code_val }" ${pjtStateCode.pjt_state_code_val eq pageMaker.cri.stateType ? 'selected':'' }>${pjtStateCode.pjt_state_code_val }</option>
		             		</c:forEach>
						</select>
              		</td>
              		<td style="padding-right:10px;">
              			<select class="form-control" name="pjtType" id="pjtType" onchange="searchList_go(1,'list');" style="border:none;">
	             		<option>유형</option>
	             		<c:forEach items="${pjtTypeCodeList }" var="pjtTypeCode">
							<option value="${pjtTypeCode.pjt_type_code_val }" ${pjtTypeCode.pjt_type_code_val eq pageMaker.cri.pjtType ? 'selected':'' }>${pjtTypeCode.pjt_type_code_val }</option>
	             		</c:forEach>
						</select>
              		</td>
              		<td style="padding-right:10px;">
              			<select class="form-control" name="categoryType" id="categoryType" onchange="searchList_go(1,'list');"  style="border:none;">
		             		<option>카테고리</option>
							<option value="음식점" ${pageMaker.cri.categoryType eq '음식점' ? 'selected':'' }>음식점</option>
							<option value="서비스/문화" ${pageMaker.cri.categoryType eq '서비스/문화' ? 'selected':'' }>서비스/문화</option>
							<option value="도소매" ${pageMaker.cri.categoryType eq '도소매' ? 'selected':'' }>도소매</option>
							<option value="교육" ${pageMaker.cri.categoryType eq '교육' ? 'selected':'' }>교육</option>
							<option value="제조" ${pageMaker.cri.categoryType eq '제조' ? 'selected':'' }>제조</option>
							<option value="기타" ${pageMaker.cri.categoryType eq '기타' ? 'selected':'' }>기타</option>
						</select>
              		</td>
              		<td style="padding-right:10px;">
              			<select class="form-control" name="progressType" id="progressType" onchange="searchList_go(1,'list');" style="border:none;">
		             		<option>진행 상태</option>
							<option value="진행중" ${pageMaker.cri.progressType eq '진행중' ? 'selected':'' }>진행중</option>
							<option value="종료" ${pageMaker.cri.progressType eq '종료' ? 'selected':'' }>종료</option>
						</select>
              		</td>
              		<td style="padding-right:10px;">
              			<select class="form-control" name="successOrFailure" id="successOrFailure" onchange="searchList_go(1,'list');" style="border:none;">
		             		<option>달성 여부</option>
							<option value="성공" ${pageMaker.cri.successOrFailure eq '성공' ? 'selected':'' }>성공</option>
							<option value="실패" ${pageMaker.cri.successOrFailure eq '실패' ? 'selected':'' }>실패</option>
						</select>
              		</td>
              		<td style="padding-right:10px;">
              			<select class="form-control" name="calcType" id="calcType" onchange="searchList_go(1,'list');" style="border:none;">
		             		<option>정산 상태</option>
							<option value="정산 미완료" ${pageMaker.cri.calcType eq '정산 미완료' ? 'selected':'' }>정산 미완료</option>
							<option value="정산 완료" ${pageMaker.cri.calcType eq '정산 완료' ? 'selected':'' }>정산 완료</option>
							<option value="상환 미완료" ${pageMaker.cri.calcType eq '상환 미완료' ? 'selected':'' }>상환 미완료</option>
							<option value="상환 완료" ${pageMaker.cri.calcType eq '상환 완료' ? 'selected':'' }>상환 완료</option>
						</select>
              		</td>
              		<td>
              			<div class="input-group-prepend" style="float:left;padding-right:30px;">
              			<div style="width:70px;padding-top:10px;">
              				<h7>정산일&nbsp;:&nbsp;</h7>
              			</div>
	                    <span class="input-group-text" style="height:30px;margin-top:7px;">
	                    	<i class="far fa-calendar-alt"></i>
	                    </span>
	                    <input type="text" id="calcDate" name="calcDate" class="form-control input-group-append datepicker" style="width:120px;height:30px;margin-top:7px;" value="${param.calcDate }">
	                	</div>
              		</td>
              		<td>
              			<div class="input-group row float-right" style="width:400px;">
							<select class="form-control col-md-4" name="searchType" id="searchType" style="border:none;">
								<option value="all"  ${pageMaker.cri.searchType eq 'all' ? 'selected':'' }>전 체</option>
								<option value="title" ${pageMaker.cri.searchType eq 'title' ? 'selected':'' }>제 목</option>
								<option value="contents" ${pageMaker.cri.searchType eq 'contents' ? 'selected':'' }>내용</option>
								<option value="comName" ${pageMaker.cri.searchType eq 'comName' ? 'selected':'' }>사업장명</option>
							</select>					
					        <input  class="form-control col-md-6" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }" style="width:180px;outline: 0;border-width: 0 0 2px;"/>
							<span class="input-group-append">
								<button class="btn" type="button" id="searchBtn" onclick="searchList_go(1,'list');" data-card-widget="search"><i class="fas fa-search"></i></button>
							</span>
						</div>
              		</td>
              		<td style="padding-left:30px;">
              			<button type="button" id="downloadBtn" class="btn btn-block btn-secondary" style="float:right;" onclick="fnExcelReport('hiddenTable','funseamding_프로젝트리스트')">Excel</button>
              		</td>
				</tr>
			</table>
		 <br/>
       </div>
		<hr>
		<br/>
         <table class="table text-center">
           <thead>
             <tr>
               <th style="width:7%;">번호</th>
               <th style="width:5%;">상태</th>
               <th style="width:7%;">유형</th>
               <th style="width:7%;">카테고리</th>
               <th>프로젝트</th>
               <th style="width:5%;">목표<br>금액</th>
               <th style="width:9%;">진행기간</th>
               <th style="width:8%;">상호명</th>
               <th style="width:7%;">활성화<br>여부</th>
               <th style="width:7%;">추천 여부</th>
             </tr>
           </thead>
         <tbody>
         <c:if test="${empty projectList }" >
			<tr>
				<td colspan="10">
					<strong>해당 내용이 없습니다.</strong>
				</td>
			</tr>
		</c:if>						
		<c:forEach items="${projectList }" var="project">
			<tr class="trForClick" style='cursor:pointer;'>
				<td>${project.pjt_num }<input type="hidden" value="${project.mem_num }"/></td>
				<td>${project.pjt_state_code_val }</td>
				<td>${project.pjt_type_code_val }</td>
				<td>${project.pjt_category }</td>
				<td>
					<table style="font-size:14px;">
						<tr>
							<th rowspan='2'><img src="<%= request.getContextPath() %>/project/picture/get?picture=${project.pjt_atc_sum_name}" onerror="this.src='https://source.unsplash.com/category/nature'" alt="image" style="width:80px;height:80px;"></th>
							<td><a href="#a" onclick="OpenWindow('detail?pjt_num=${project.pjt_num }&mem_num=${project.mem_num }','프로젝트 상세 보기','1400','900')">${project.pjt_title }</a></td>
						</tr>
						<tr>
							<td style="width:400px;">
								<div class="progress progress-sm">
			                       <div class="progress-bar bg-danger" style="width: ${project.pjtPaySum/project.pjt_cash*100}%"></div>
			                    </div>
		                    </td>
						</tr>
					</table>
				</td>
				<td><fmt:formatNumber>${project.pjt_cash }</fmt:formatNumber></td>
				<td>
					<fmt:formatDate value="${project.pjt_startdate }" pattern="yyyy-MM-dd"/>
					<span>~</span>
					<fmt:formatDate value="${project.pjt_enddate }" pattern="yyyy-MM-dd"/>
				</td>
				<td>${project.com_bsns_name }</td>
				<td>
					<c:if test="${project.pjt_enabled eq 0 }">비노출</c:if>
					<c:if test="${project.pjt_enabled eq 1 }">노출</c:if>
				</td>
				<td>
					<c:if test="${project.pjt_thumbsup eq 0 }">N</c:if>
					<c:if test="${project.pjt_thumbsup eq 1 }">Y</c:if>
				</td>
			</tr>
		</c:forEach>
        </tbody>
       </table>
      </div>
     <!-- /.card-body -->
     <div class="card-footer" style="background:white;">
	<%@ include file="/WEB-INF/views/admin/project/pagination.jsp" %>			
  </div>
</div>
<br/>
<table class="table text-center" id="hiddenTable" style="display:none;">
	<thead>
	  <tr>
	    <th>번 호</th>
        <th>상 태</th>
        <th>유 형</th>
        <th>카테고리</th>
        <th>프로젝트</th>
        <th>목표금액</th>
        <th>진행기간</th>
        <th>상호명</th>
	  </tr>
	</thead>
	<tbody>
	<c:if test="${empty projectListForDownload }" >
		<tr>
			<td colspan="8">
				<strong>해당 내용이 없습니다.</strong>
			</td>
		</tr>
	</c:if>						
	<c:forEach items="${projectListForDownload }" var="projectForDownload">
		<tr style='font-size:0.85em;'>
			<td>${projectForDownload.pjt_num }</td>
			<td>${projectForDownload.pjt_state_code_val }</td>
			<td>${projectForDownload.pjt_type_code_val }</td>
			<td>${projectForDownload.pjt_category }</td>
			<td>${projectForDownload.pjt_title }</td>
			<td><fmt:formatNumber>${projectForDownload.pjt_cash }</fmt:formatNumber></td>
			<td>
				<fmt:formatDate value="${projectForDownload.pjt_startdate }" pattern="yyyy-MM-dd"/>
				<span>&nbsp;~&nbsp;</span>
				<fmt:formatDate value="${projectForDownload.pjt_enddate }" pattern="yyyy-MM-dd"/>
			</td>
			<td>${projectForDownload.com_bsns_name }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<script>
	$('.datepicker').datepicker({});

	$(".datepicker").datepicker({
	    onSelect: function(dateText) {
	      $(this).change();
	    }
	}).on("change", function() {
	  searchList_go(1,'list');
	});

		  /* function display(msg) {
		    $("<p>").html(msg).appendTo(document.body);
		  } */
		  
/* 	$(function(){
		var option = {
		// datepicker 애니메이션 타입
		// option 종류 : "show" , "slideDown", "fadeIn", "blind", "bounce", "clip", "drop", "fold", "slide"
		showAnim : "slideDown",
		// 해당 월의 다른 월의 날짜가 보이는 여부, 예를 들면 10월이면 전후에 9월 마지막과 11월의 시작 일이 보이는 여부입니다. 즉, 달력이 꽉 차 보이게 하는 것
		showOtherMonths: true,
		// 선택 여부 (showOtherMonths 옵션과 같이 일치시키지 않으면 에러가 발생합니다.)
		selectOtherMonths: true,
		// 달력 밑에 오늘과 닫기 버튼이 보인다.
		showButtonPanel: true,
		// 년 월이 셀렉트 박스로 표현 되어서 선택할 수 있다.
		changeMonth: true,
		changeYear: true,
		// 한번에 보이는 개월 수
		numberOfMonths: 3,
		// 데이터 포멧
		dateFormat: "yy-mm-dd",
		// 텍스트 박스 옆의 달력 포시
		showOn: "button",
		//이미지 타입인지 버튼 타입인지 설정
		buttonImageOnly: true,
		// 이미지 경로
		buttonImage: "https://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
		// 버튼 타입이면 버튼 값
		buttonText: "Select date",
		// alt 데이터 포멧
		altFormat: "DD, d MM, yy",
		// 선택 가능한 날짜(수 형식) - 현재 기준 -20일
		minDate: -20,
		// 선택 가능한 최대 날짜(문자 형식) - 현재 기준 +1월 +20일
		maxDate: "+1M +20D",
		// 주 표시
		showWeek: true
		};
		var optionFrom = option;
		optionFrom.altField = "#alternateFrom";
		var dateFormat = "mm/dd/yy";
		// 시작일이 선택이 되면 종료일은 시작일 보다 앞을 선택할 수 없다.
		var from = $( "#from" )
		.datepicker(optionFrom)
		.on( "change", function() {
		to.datepicker( "option", "minDate", getDate( this ) );
		});
		var optionTo = option;
		optionTo.altField = "#alternateTo";
		// 종료일이 선택이 되면 시작일은 시작일 보다 앞을 선택할 수 없다.
		var to = $( "#to" )
		.datepicker(optionTo)
		.on( "change", function() {
		from.datepicker( "option", "maxDate", getDate( this ) );
		});
		function getDate( element ) {
		return moment(element.value).toDate();
		}
		}); */
		
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
		
	$(".trForClick").on('click', function(){
		var tr = $(this);
		var td = tr.children();
		var pjt_num = td.eq(0).text();
		var mem_num = td.eq(0).children().val();
		//alert(pjt_pay_num);
		OpenWindow("<%= request.getContextPath() %>/admin/project/detail?pjt_num="+pjt_num+"&mem_num="+mem_num, '프로젝트 상세 보기', 1400, 900);	
	});
</script>

