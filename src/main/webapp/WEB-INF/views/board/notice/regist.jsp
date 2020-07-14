<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Content Wrapper. Contains page content -->
<!--   <div  style="max-width:800px;min-width:420px;margin:0 auto;min-height:812px;"> -->
   
<%--    	<jsp:include page="/WEB-INF/views/include/open_header.jsp">
	   	<jsp:param value="공지사항" name="subject"/>
	   	<jsp:param value="notice_list" name="url"/>
	   	<jsp:param value="상세보기" name="item"/>
   </jsp:include> --%>

    <!-- Main content -->
    <section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-9" style="max-width:960px;">
				<h3 class="padding:10px;">공지사항 작성</h3>
				<hr>
						<div class ="card-tools" style="width:100%;text-align:right;">
							<button type="button" class="btn btn-outline-success btn-flat" id="registBtn" onclick="goSubmit('post');">등 록</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-outline-success btn-flat" id="cancelBtn" onclick="goSubmit('close');" >취 소</button>
						</div>
					<div class="card-body pad">
						<form id="regist" role="form" method="post" action="regist" name="regist" enctype="multipart/form-data">
						   <div class="row">
							<div class="form-group" style="padding-left: 20px" >
								<label for="title">제 목</label> 
								<input type="text" id="title" name='notice_title' class="form-control" style="width: 500px;" placeholder="제목을 쓰세요"  >
							</div>
							<div class="form-group" style="padding-left: 100px;"> 
								<label for="writer" >작성자</label>
								<input type="text" id="writer" readonly name="mem_num" class="form-control" value="${loginUser.mem_num }">
							</div>
						   </div>							
						<br>
							<div class="form-group">
								<label for="content">내 용</label>
								<textarea class="textarea" name="notice_contents" id="contents" rows="20" style="display: none;"></textarea>
							</div>
							<br/>
							<div class="form-group uploadFile">
								<i class="ace-icon fa fa-folder-open" style="font-size: 14px"></i>
								<i class="ace-icon fa fa-folder-down" style="font-size: 14px"></i>
								<span >이곳에 파일을 끌어다 놓으십시오</span>
								<div class="fileDrop col-xs-18">
									<ul class="mailbox-attachments clearfix uploadedList"></ul>
								</div>
							</div>
						</form>
					</div><!--end card-body  -->
					<div class="card-footer" style="display:none">
					
					</div><!--end card-footer  -->
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
    <!-- /.content -->
<!--   </div> -->
  <!-- /.content-wrapper -->
  
  
<!--   	$('#registBtn').on('click',function(e){
/* 		alert("regist click"); */
		var form=document.regist;
/*  		alert(form.title.value);
		alert(form.writer.value);
		alert(form.content.value);  */
		
		if(form.title.value==""){
			alert("제목은 필수입니다.");
			return;
		}
		form.submit();
	}); 
	  -->
<script>
	
	$('#cancelBtn').on('click',function(e){
		//alert("cancel btn click");
		window.opener.location.href='notice_list';
		window.close();
	});
	
	 
	// active-x control submit
	 function controlSubmit(form) {
	 	var uploader = document.getElementById("Uploader");
	 	if (uploader){
	 		//$("#fileupload_image").remove(); // 다음에디터용 이미지업로드를 제거
	 		if (uploader.Submit(form)) {
	 			var loc = uploader.Location;
	 			if (loc == "") {
	 				//document.write(uploader.Response);
	 				//새창 열었을때 response 값이 필요없다. 바로 window 닫아준다.
	 				try{
	         	    	parent.opener.location.reload();
	 					//window.close();
	         	    }catch(ex){
	 					try{
	         				window.parent.document.if_list.location.reload();
	             	    }catch(ex){
	     					window.close();
	             	    }
	 				}
	 			} else {
	 				document.location.href = loc;
	 			}
	 		}
	 	} else {
	 		form.submit();
	 	}
	 }

</script>


<%@ include file="./regist_file.jsp" %>
<%@ include file="./regist_js.jsp" %>

</body>


