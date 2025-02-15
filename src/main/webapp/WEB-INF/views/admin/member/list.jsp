<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row">
	<!-- 사이드 메뉴 -->
	<nav class="guide_nav col-md-3" style="padding:0px 50px 0px 50px;">
		<ul class="list-group list-group-flush" style="list-style: none;">
			<li class="list-group-item">
	            <a href="/admin/member/list" style="text-decoration:none"><h3>회원 관리</h3></a>
	        </li>
  			<li class="list-group-item">
	            <ul class="lnb_depth p-3" style="list-style: none;">
	                <li id="memberManage"><a href="<%= request.getContextPath() %>/admin/member/list" class="navMenu">- 일반 회원 관리</a></li>
					<li id="commemberManage"><a href="<%= request.getContextPath() %>/admin/comMember/list" class="navMenu">- 소상공인 회원 관리</a></li>
	            </ul>
	        </li>    
        </ul>
	</nav>

	<!-- 일반 회원 리스트 -->
      <div class="container col-md-9" style="padding:0px 100px 0px 0px;">
      	<ul class="list-group list-group-flush" style="list-style: none;">
			<li class="list-group-item">
	    		<h3>일반 회원 리스트</h3>
	    	</li>
	    	<hr>	
	    </ul>
          <div class="card-body table-responsive p-0" style="height: auto;">
          	<div class="card-tools">
          		<table style="margin-left:160px;">
          			<tr>
          				<td style="padding-right:50px;">
							<select class="form-control" name="code_state" id="codeState" onchange="searchList_go(1,'list');" style="border:none;margin-top:5px;">
			             		<option>회원 상태</option>
			             		<c:forEach items="${memStateCodeList }" var="memStateCode">
			             			<c:if test="${memStateCode.code_state_num ne 9}">
										<option value="${memStateCode.code_state }" ${memStateCode.code_state eq param.code_state ? 'selected':'' }>${memStateCode.code_state }</option>
									</c:if>
			             		</c:forEach>
							</select>		             	
						</td>
						<td>
		                    <div class="input-group" style="float:left;">
		                      <div class="input-group-prepend">
		                      	<h7 style="padding-top:10px;">가입 날짜&nbsp;:&nbsp;</h7>
		                      	 <span class="input-group-text" style="height:30px;margin-top:7px;">
		                        	<i class="far fa-calendar-alt"></i>
		                         </span>
			                   	 <input type="text" id="startRegdate" name="first_mem_regdate" class="form-control input-group-append datepicker" style="width:120px;height:30px;margin-top:7px;" value="${param.first_mem_regdate }">
		                       </div>
			                    <h7 style="margin-top:7px;">&nbsp;~&nbsp;</h7>
			                    <div class="input-group-prepend">
			                      <span class="input-group-text" style="height:30px;margin-top:7px;">
			                        <i class="far fa-calendar-alt"></i>
			                      </span>
			                      <input type="text" id="endRegdate" name="last_mem_regdate" class="form-control input-group-append datepicker" style="width:120px;height:30px;margin-top:7px;" value="${param.last_mem_regdate }">
			                    </div>
		                    </div>
	                  	</td>
	                  	<td>
							<div class="input-group" style="width:400px;">
								<select class="form-control col-sm-4" name="searchType" id="searchType" style="border:none;">
									<option value="all"  ${pageMaker.cri.searchType eq 'all' ? 'selected':'' }>전 체</option>
									<option value="name" ${pageMaker.cri.searchType eq 'name' ? 'selected':'' }>이 름</option>
									<option value="email" ${pageMaker.cri.searchType eq 'email' ? 'selected':'' }>이메일</option>
									<option value="phone" ${pageMaker.cri.searchType eq 'phone' ? 'selected':'' }>전화번호</option>
								</select>					
								<input  class="form-control col-sm-6" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }" style="width:180px;outline: 0;border-width: 0 0 2px;"/>
								<span class="input-group-append">
									<button class="btn" type="button" id="searchBtn" onclick="searchList_go(1,'list');" data-card-widget="search"><i class="fas fa-search"></i></button>
								</span>
							</div>
						</td>
						<td>
							<button type="button" id="downloadBtn" class="btn btn-block btn-secondary float-right" style="float:right;" onclick="fnExcelReport('hiddenTable','funseamding_일반회원리스트')">Excel</button>
						</td>
					</tr>
				</table>
            </div>
            <br/>
            <hr>
			<br/>
            <table class="table text-center">
              <thead>
                <tr>
                  <th style="width:10%;">번호</th>
                  <th style="width:10%;">상태</th>
                  <th style="width:10%;">이름</th>
                  <th>이메일</th>
                  <th>프로필<br>이미지</th>
                  <th style="width:15%;">전화<br>번호</th>
                  <th style="width:15%;">가입<br>날짜</th>
                  <th style="width:3%;">문자</th>
                  <th style="width:3%;">메일</th>
                </tr>
              </thead>
              <tbody>
              <c:if test="${empty memberList }" >
				<tr>
					<td colspan="9">
						<strong>해당 내용이 없습니다.</strong>
					</td>
				</tr>
			</c:if>						
			<c:forEach items="${memberList }" var="member">
				<tr class="trForClick" style='font-size:0.85em;cursor:pointer;'>
					<td>${member.mem_num }</td>
					<td>${member.code_state }</td>
					<td><a href="#" onclick="OpenWindow('detail?mem_num=${member.mem_num }','일반 회원 상세 보기','950','900')">${member.mem_name }</a></td>
					<td>${member.mem_email }</td>
					<td><img src="<%= request.getContextPath() %>/displayProfileImg?mem_email=${member.mem_email}&fileName=${member.mem_profile_img}" onerror="this.src='<%= request.getContextPath() %>/resources/images/profile-picture.png'" alt="user profile image" style="width:80px;height:80px;"></td>
					<td>${member.mem_phone }</td>
					<td>
						<fmt:formatDate value="${member.mem_regdate }" pattern="yyyy-MM-dd"/>
					</td>
					<td onclick="event.cancelBubble=true"><button type="button" class="btn" onclick="OpenWindow('<%= request.getContextPath() %>/sendSMSForm?mem_name=${member.mem_name }&mem_phone=${member.mem_phone }','문자 보내기','700','735')"><i class="far fa-comment-dots fa-1x"></i></button></td>
					<td onclick="event.cancelBubble=true"><button type="button" class="btn" onclick="OpenWindow('<%= request.getContextPath() %>/sendEmailForm?mem_name=${member.mem_name }&mem_email=${member.mem_email }','메일 보내기','700','800')"><i class="far fa-envelope fa-1x"></i></button></td>
				</tr>
			</c:forEach>
          </tbody>
         </table>
       </div>
      <!-- /.card-body -->
      <div class="card-footer" style="background:white;">
		<%@ include file="/WEB-INF/views/admin/member/pagination.jsp" %>				
	  </div>
	  <br/>
   </div>
</div>

<table class="table text-center" id="hiddenTable" style="display:none;">
	<thead>
	  <tr>
	    <th>번 호</th>
	    <th>상 태</th>
	    <th>이 름</th>
	    <th>이메일</th>
	    <th>전화번호</th>
	    <th>가입 날짜</th>
	  </tr>
	</thead>
	<tbody>
	<c:if test="${empty memberListForDownload }" >
	<tr>
		<td colspan="6">
			<strong>해당 내용이 없습니다.</strong>
		</td>
	</tr>
	</c:if>						
	<c:forEach items="${memberListForDownload }" var="memberForDownload">
	<tr style='font-size:0.85em;'>
	<td>${memberForDownload.mem_num }</td>
	<td>${memberForDownload.code_state }</td>
	<td>${memberForDownload.mem_name }</td>
	<td>${memberForDownload.mem_email }</td>
	<td>${memberForDownload.mem_phone }</td>
	<td><fmt:formatDate value="${memberForDownload.mem_regdate }" pattern="yyyy-MM-dd"/></td>
	</tr>
	</c:forEach>
	</tbody>
</table>

<script>
	$('.datepicker').datepicker({});
	
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
		
		/* function convert_list_go(type){
			var form = $('form#search');
			
 			var searchType = $('select#searchType');
			if(searchType.val() == ""){
				alert("검색 구분을 선택하세요.");
				searchType.focus();
				return;
			}
			form.attr("action", "download/list/" + type);
			form.attr("method", "get");
			form.submit();
		} */
		
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
		var mem_num = td.eq(0).text();
		
		OpenWindow('<%= request.getContextPath() %>/admin/member/detail?mem_num=' + mem_num, '일반 회원 상세 보기', 950, 900);
	});
		
</script>

