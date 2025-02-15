<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
<script src="<%= request.getContextPath() %>/resources/bootstrap/plugins/chart.js/Chart.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/bootstrap/dist/js/demo.js"></script>
<script src="<%= request.getContextPath() %>/resources/bootstrap/dist/js/pages/dashboard3.js"></script>
</head>

	<div class="card col-3 float-left" style="height:200px;margin:0px 50px 0px 140px;">
	  <div class="card-body text-center">
	    <h3 class="card-text">${roleComHoldTotalCount }명의 소상공인이 가입 승인을 기다리고 있습니다.</h3>
	  </div>
	  <div class="card-footer text-center" style="background:white;">
	  	<a href="<%= request.getContextPath() %>/admin/comMember/list?com_state_code_val=미승인" class="btn btn-block btn-secondary">보러가기</a>
	  </div>
	</div>
	<div class="card col-3 float-left" style="height:200px;margin:0px 50px 0px 0px;">
	  <div class="card-body text-center">
	    <h3 class="card-text">${stateStandByTotalCount }개의 프로젝트가 등록 승인을 기다리고 있습니다.</h3>
	  </div>
	  <div class="card-footer text-center" style="background:white;">
	    <a href="<%= request.getContextPath() %>/admin/project/list?stateType=미승인" class="btn btn-block btn-secondary">보러가기</a>
	  </div>  
	</div>
	<div class="card col-3" style="height:200px;">
	  <div class="card-body text-center">
	    <h3 class="card-text">${calcStandByTotalCount }개의 프로젝트가 정산을 기다리고 있습니다.</h3>
	  </div>
	  <div class="card-footer text-center" style="background:white;">
	    <a href="<%= request.getContextPath() %>/admin/project/list?calcType=정산 미완료" class="btn btn-block btn-secondary">보러가기</a>
	  </div>  
	</div>
    
	<div class="card col-5 float-left" style="margin:0px 50px 0px 100px;">
       <div class="card-header border-0" style="background:white;">
         <div class="d-flex justify-content-between">
           <h2>회원 가입</h2>
           <h5 style="margin-top:8px"><a href="<%= request.getContextPath() %>/admin/member/list">회원 관리 페이지로 이동</a></h5>
         </div>
       </div>
       <div class="card-body">
         <div class="d-flex">
           <p class="d-flex flex-column">
             <span class="text-bold text-lg">총 회원 수 : <fmt:formatNumber>${memberTotalCount }</fmt:formatNumber></span>
           </p>
<!--            <p class="ml-auto d-flex flex-column text-right">
             <span class="text-success">
               <i class="fas fa-arrow-up"></i> 회원 가입 상승률
             </span>
             <span class="text-muted">Since last week</span>
           </p> -->
         </div>
         <div class="position-relative mb-4"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
           <canvas id="barChart" style="display: block; width: 388px; height: 300px;" class="chartjs-render-monitor"></canvas>
         </div>
       </div>
     </div>
     
     <div class="card col-5" style="height:483px;">
       <div class="card-header border-0" style="background:white;">
         <div class="d-flex justify-content-between">
           <h2>결제 금액</h2>
           <h5 style="margin-top:8px"><a href="<%= request.getContextPath() %>/admin/pay/list">결제 내역 관리 페이지로 이동</a></h5>
         </div>
       </div>
       <div class="card-body">
         <div class="d-flex">
           <p class="d-flex flex-column">
             <span class="text-bold text-lg">이번 주 총 결제 금액 : <fmt:formatNumber>${totalPayAmountThisWeek }</fmt:formatNumber></span>
           </p>
           <!-- <p class="ml-auto d-flex flex-column text-right">
             <span class="text-success">
               <i class="fas fa-arrow-up"></i> 12.5%
             </span>
             <span class="text-muted">Since last week</span>
           </p> -->
         </div>
	         <div class="d-flex flex-row" style="margin-left:300px;">
	         	<span class="mr-2">
		           <i class="fas fa-square text-blue"></i> 기부
		        </span>
		        <span>     
		           <i class="fas fa-square text-gray"></i> 대출
		        </span>
	         </div>
         <!-- /.d-flex -->
         <div class="position-relative mb-4"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
           <canvas id="project-chart" style="display: block; width: 388px; height: 300px;" class="chartjs-render-monitor" style="display: block; height: 200px; width: 323px;"></canvas>
         </div>
       </div>
     </div>

<script>
$(function () {
  /* ChartJS
   * -------
   * Here we will create a few charts using ChartJS
   */
   
   var joinMemDataList = ${joinMemDataList};
   var joinComMemDataList = ${joinComMemDataList};

   var memCount = new Array();
   for(var joinMemData of joinMemDataList){
	   //alert(joinMemData);
	   memCount.push(joinMemData);
   }
   var comMemCount = new Array();
   for(var joinComMemData of joinComMemDataList){
	   //alert(joinMemData);
	   comMemCount.push(joinComMemData);
   }
   
   //var now = date.getFullYear() + "." + (date.getMonth()+1) + ".";
   
   var sixDayAgo = new Date(new Date().setDate(new Date().getDate()-6));
   var sixDayAgoStr = sixDayAgo.getFullYear() + "." + (sixDayAgo.getMonth()+1) + "." + sixDayAgo.getDate();
   var fiveDayAgo = new Date(new Date().setDate(new Date().getDate()-5));
   var fiveDayAgoStr = fiveDayAgo.getFullYear() + "." + (fiveDayAgo.getMonth()+1) + "." + fiveDayAgo.getDate();
   var fourDayAgo = new Date(new Date().setDate(new Date().getDate()-4));
   var fourDayAgoStr = fourDayAgo.getFullYear() + "." + (fourDayAgo.getMonth()+1) + "." + fourDayAgo.getDate();
   var threeDayAgo = new Date(new Date().setDate(new Date().getDate()-3));
   var threeDayAgoStr = threeDayAgo.getFullYear() + "." + (threeDayAgo.getMonth()+1) + "." + threeDayAgo.getDate();
   var twoDayAgo = new Date(new Date().setDate(new Date().getDate()-2));
   var twoDayAgoStr = twoDayAgo.getFullYear() + "." + (twoDayAgo.getMonth()+1) + "." + twoDayAgo.getDate();
   var oneDayAgo = new Date(new Date().setDate(new Date().getDate()-1));
   var oneDayAgoStr = oneDayAgo.getFullYear() + "." + (oneDayAgo.getMonth()+1) + "." + oneDayAgo.getDate();
   var now = new Date();
   var nowStr = now.getFullYear() + "." + (now.getMonth()+1) + "." + now.getDate();
   
   var areaChartData = {
     //labels  : [now + (date.getDate()-6) + ".", now + (date.getDate()-5) + ".", now + (date.getDate()-4) + ".", now + (date.getDate()-3) + ".", now + (date.getDate()-2) + ".", now + (date.getDate()-1) + ".", now + date.getDate() + "."],
     labels  : [sixDayAgoStr + ".", fiveDayAgoStr + ".", fourDayAgoStr + ".", threeDayAgoStr + ".", twoDayAgoStr + ".", oneDayAgoStr + ".", nowStr + "."],
     datasets: [
       {
         label               : '소상공인 회원',
         backgroundColor     : 'rgba(60,141,188,0.9)',
         borderColor         : 'rgba(60,141,188,0.8)',
         pointRadius          : false,
         pointColor          : '#3b8bba',
         pointStrokeColor    : 'rgba(60,141,188,1)',
         pointHighlightFill  : '#fff',
         pointHighlightStroke: 'rgba(60,141,188,1)',
         data                : [comMemCount[0], comMemCount[1], comMemCount[2], comMemCount[3], comMemCount[4], comMemCount[5], comMemCount[6]]
       },
       {
         label               : '일반 회원',
         backgroundColor     : 'rgba(210, 214, 222, 1)',
         borderColor         : 'rgba(210, 214, 222, 1)',
         pointRadius         : false,
         pointColor          : 'rgba(210, 214, 222, 1)',
         pointStrokeColor    : '#c1c7d1',
         pointHighlightFill  : '#fff',
         pointHighlightStroke: 'rgba(220,220,220,1)',
         data                : [memCount[0], memCount[1], memCount[2], memCount[3], memCount[4], memCount[5], memCount[6]]
       },
     ]
   }

  //-------------
  //- BAR CHART -
  //-------------
  var barChartCanvas = $('#barChart').get(0).getContext('2d')
  var barChartData = jQuery.extend(true, {}, areaChartData)
  var temp0 = areaChartData.datasets[0]
  var temp1 = areaChartData.datasets[1]
  barChartData.datasets[0] = temp1
  barChartData.datasets[1] = temp0

  var barChartOptions = {
    responsive              : true,
    maintainAspectRatio     : false,
    datasetFill             : false
  }

  var barChart = new Chart(barChartCanvas, {
    type: 'bar', 
    data: barChartData,
    options: barChartOptions
  })
   
   //-------------
   //- PROJECT CHART -
   //-------------
  var ticksStyle = {
    fontColor: '#495057',
    fontStyle: 'bold'
  }

  var mode      = 'index'
  var intersect = true
  
  var donationPaySumList = ${donationPaySumList};
  var repaymentSumList = ${repaymentSumList};
  //alert(donationPaySumList);
  //alert(repaymentSumList);
  
  var donationPaySum = new Array();
  var repaymentSum = new Array();

  for(var donation of donationPaySumList){
	   //alert(donation);
	   donationPaySum.push(donation);
  }
  for(var repayment of repaymentSumList){
	   //alert(repayment);
	   repaymentSum.push(repayment);
  }
  
   var $projectChart = $('#project-chart')
   var projectChart  = new Chart($projectChart, {
     data   : {
       labels  : [sixDayAgoStr + ".", fiveDayAgoStr + ".", fourDayAgoStr + ".", threeDayAgoStr + ".", twoDayAgoStr + ".", oneDayAgoStr + ".", nowStr + "."],
       datasets: [{
         type                : 'line',
         data                : [donationPaySum[0], donationPaySum[1], donationPaySum[2], donationPaySum[3], donationPaySum[4], donationPaySum[5], donationPaySum[6]],
         backgroundColor     : 'transparent',
         borderColor         : '#007bff',
         pointBorderColor    : '#007bff',
         pointBackgroundColor: '#007bff',
         fill                : false
         // pointHoverBackgroundColor: '#007bff',
         // pointHoverBorderColor    : '#007bff'
       },
         {
           type                : 'line',
           data                : [repaymentSum[0], repaymentSum[1], repaymentSum[2], repaymentSum[3], repaymentSum[4], repaymentSum[5], repaymentSum[6]],
           backgroundColor     : 'tansparent',
           borderColor         : 'gray',
           pointBorderColor    : 'gray',
           pointBackgroundColor: 'gray',
           fill                : false
           // pointHoverBackgroundColor: '#ced4da',
           // pointHoverBorderColor    : '#ced4da'
         }]
     },
     options: {
       maintainAspectRatio: false,
       tooltips           : {
         mode     : mode,
         intersect: intersect
       },
       hover              : {
         mode     : mode,
         intersect: intersect
       },
       legend             : {
         display: false
       },
       scales             : {
         yAxes: [{
           // display: false,
           gridLines: {
             display      : true,
             lineWidth    : '4px',
             color        : 'rgba(0, 0, 0, .2)',
             zeroLineColor: 'transparent'
           },
           ticks    : $.extend({
             beginAtZero : true,
             suggestedMax: 200
           }, ticksStyle)
         }],
         xAxes: [{
           display  : true,
           gridLines: {
             display: false
           },
           ticks    : ticksStyle
         }]
       }
     }
   })
})
</script>