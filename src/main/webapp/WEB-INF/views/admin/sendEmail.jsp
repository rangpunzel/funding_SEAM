<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
	<title>메일 발송</title>
</head>

<div class="col-md-9">
  <div class="card card-primary card-outline">
    <div class="card-header">
      <h3 class="card-title">메일 발송</h3>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
      	<form role="form" method="post" action="sendSMS" name="sendSMSForm">
	      <div class="form-group">
	      	<table class="table text-center">
	      		<tr>
	      			<th style="width:150px;">이 름</th>
	      			<td><input class="form-control" value="${mem_name }" readonly></td>
	      		</tr>
	      		<tr>
	      			<th>이메일 주소</th>
	      			<td><input id="mem_email" class="form-control" value="${mem_email }" readonly></td>
	      		</tr>
	      		<tr>
	      			<th>제목</th>
	      			<td><input type="text" id="title" class="form-control"></td>
	      		</tr>
	      		<tr>
	      			<th colspan="2">내용</th>
	      		</tr>
	      		<tr>
	      			<td colspan="2"><textarea id="contents" class="form-control" style="height: 400px;"></textarea></td>
	      		</tr>
	      	</table>
	      </div>
	     </form>
      </div>
    <!-- /.card-body -->
    <div class="card-footer">
      <div class="float-right">
        <button type="button" class="btn btn-primary" onclick="sendMail();"><i class="far fa-envelope"></i>보내기</button>
      </div>
      <button type="button" class="btn btn-default" onclick="javascript:window.close();"><i class="fas fa-times"></i>취소</button>
    </div>
    <!-- /.card-footer -->
  </div>
  <!-- /.card -->
</div>

<%@ include file="../commons/summernote_js.jsp" %>

<script>
	function sendMail(){
 		var mem_email = $("input[id='mem_email']").val();
		var title = $("input[id='title']").val();
		var content = $("textarea[id='contents']").val();
		
		//alert(content);
		
		if (!confirm("${mem_name}님에게 메일를 발송하겠습니까?")) return false;
		
		$.ajax({
			url : '<%= request.getContextPath() %>/sendEmail',
			type : 'post',
			data : {
				'mem_email' : mem_email,
				'title' : title,
				'content' : content
			},
			dataType : 'text',
			success : function(data){
				alert('메일이 발송되었습니다.');
				window.close();
			},
			error : function(error){
				alert('서버 오류로 메일 발송을 실패했습니다.');
			}
		});
	}
</script>