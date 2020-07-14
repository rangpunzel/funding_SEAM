<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script type="text/x-handlebars-template" id="pjt_reply-list-template">
{{#each .}}
<div class="replyLi row" data-pjt_cmts_num={{pjt_cmts_num}} enabled={{pjt_cmts_enabled}}>
	<div class="icheck-primary col-md-1">
	{{#isAdmin}}
       <input type="checkbox" value="" name="todo3" data-pjt_cmts_num={{pjt_cmts_num}} enabled={{pjt_cmts_enabled}}>
       <label for="todoCheck3"></label>
   	{{else}}
   	{{/isAdmin}}
    </div>
			<div class="col-md-2">
				<div class="name user-block" style="cursor: pointer;">
					<img class="img-circle img-bordered-sm" src="<%=request.getContextPath()%>/mypage/info/picture/{{mem_num}}" 
					alt="user image" style="object-fit:cover; object-position:center; object-repeat:no-repeat;" onerror="this.src='/resources/images/profile-picture.png'">
					&nbsp;&nbsp;<h8>{{mem_name}}</h8>
					<span class="description">{{prettifyDate pjt_cmts_regdate}}</span>
				</div>
			</div>

			<div class="col-md-9 beforeMod" data-pjt_cmts_num={{pjt_cmts_num}}>

					<div class="col-sm-1 float-left">
						<i class="ace-icon fa fa-quote-left" style="color:#555;"></i>
					</div>
					<div class="col-sm-6 float-left contents" data-pjt_cmts_num={{pjt_cmts_num}} style="width:900px;white-space:normal;">
						<span style="line-height:130%;color:#555;width:900px;word-break:break-all;" class="dd" data-pjt_cmts_num={{pjt_cmts_num}}>{{prettify pjt_cmts_contents}}</span>
					</div>
					<div class="col-sm-1 float-left">
						<i class="ace-icon fa fa-quote-right" style="color:#555;"></i>
					</div>

					<div class="btn-group btn-group-sm col-sm-1 float-left modDelDiv">
			 		   {{#isVowel}}
        				<button class="btn btn-outline-success btn-flat" id="modBtn" data-pjt_cmts_num={{pjt_cmts_num}}><i class="fas fa-wrench"></i></button>
         				<button class="btn btn-outline-success btn-flat" id="delBtn" data-pjt_cmts_num={{pjt_cmts_num}}><i class="fas fa-trash"></i></button>
   		  			   {{else}}
   		   				{{/isVowel}}
					</div>
				</div>


		<div class="col-md-9 modifyDiv" style="display:none;" data-pjt_cmts_num={{pjt_cmts_num}}>		
			<div class="input-group input-group-sm col-12">
				<textarea class="form-control modifyText" data-pjt_cmts_num={{pjt_cmts_num}} rows="3" wrap="hard">{{pjt_cmts_contents}}</textarea>
				<br>
				<div class="input-group-append">
	              <button type="button" class="btn btn-outline-success btn-flat modSendBtn" data-pjt_cmts_num={{pjt_cmts_num}}>Send</button>
	              <button type="button" class="btn btn-outline-success btn-flat canBtn" style="width:50px;" data-pjt_cmts_num={{pjt_cmts_num}}>취소</button>
				</div>
	         </div>
		</div>

</div>
<hr>
{{/each}}
</script>

<script>
Handlebars.registerHelper("prettify",function(a){
	var b=a.replace(/\n/g,'<br>')
	return b; 
});

Handlebars.registerHelper('isAdmin', function(options) {
	  var regexp = '${loginUser.code_num}';
	  if (regexp == '0') {
	    return options.fn(this);
	  } else {
	    return options.inverse(this);
	  }
	});
Handlebars.registerHelper('isVowel', function(options) {
	  var regexp = '${loginUser.mem_name}';
	  if (regexp == this.mem_name) {
	    return options.fn(this);
	  } else {
	    return options.inverse(this);
	  }
	});


Handlebars.registerHelper("prettifyDate",function(timeValue){
	var dateObj=new Date(timeValue);
	var year=dateObj.getFullYear();
	var month=dateObj.getMonth()+1;
	var date=dateObj.getDate();
	var hours=dateObj.getHours();
	var minutes=dateObj.getMinutes();
	return year+"/"+month+"/"+date+" "+hours+":"+minutes;
});

/* 댓글 목록 */
getPage("<%=request.getContextPath()%>/pjtReplies/${project.pjt_num}");

var printData=function(replyArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(replyArr);	
	$('.replyLi').remove();
	target.html(html);
	
	$(".dd").each(function(i,v){
		var h = $(this).text();
		//alert(h);
		$(this).html(h);
	});
	
}
function getPage(pageInfo){	 
	$.ajax({
		url:pageInfo,
		type:"get",
		success:function(dataMap){
			printData(dataMap.replyList,$('#repliesDiv'),$('#pjt_reply-list-template'));
			
			//비활성화인 댓글은 체크박스에 체크되어 표시
			$('input[name=todo3][enabled=0]').each(function(){
				$(this).attr('checked','checked');
			});
			
			$('.replyLi[enabled=0]').each(function(){
				if('${loginUser.code_num}'!='0'){
					//$(this).remove();
					$(this).text('[ 블라인드된 댓글입니다. ]');
				}
			});
			
			
			
		},
		error:function(error){
			alert("서버 장애로 댓글 목록이 생략됩니다.");
		}
	});
}

$('#replyText').on('click',function(){
	if(!'${loginUser.mem_num}'){
		alert('로그인이 필요합니다.');
		location.href="/commons/loginForm";
		return;
	}
})

/* 댓글 등록 */
function replyRegist(){
	if(!'${loginUser.mem_num}'){
		alert('로그인이 필요합니다.');
		location.href="/commons/loginForm";
		return;
	}
	
	var replyText = $('#replyText').val();
	replyText = replyText;
	var replyer = '${loginUser.mem_num}';
	var pjtNum='${project.pjt_num}';
	
	if(replyText==""){
		alert('댓글을 입력해주세요.');
		$('#replyText').focus();
		return;
	}
	
	var data={
			"pjt_num":pjtNum,
			"mem_num":replyer,
			"pjt_cmts_contents":replyText
	}
	
	$.ajax({
		url:"<%=request.getContextPath()%>/pjtReplies",
		type:"post",
		data:JSON.stringify(data),
		contentType:"application/json",//보내는 data 형식 지정
		dataType:"text", //받는 data 형식 지정
		success:function(data){
			alert('댓글이 등록되었습니다.');
			getPage("<%=request.getContextPath()%>/pjtReplies/${project.pjt_num}");
			$('#replyText').val(""); 
		},
		error:function(error){
			alert('댓글 등록이 취소되었습니다.');
			window.location.reload(true);
		}
	});
}

/* 댓글 삭제 */
$('#repliesDiv').on('click','div.modDelDiv #delBtn',function(e){
	var cmtNum=$(this).attr('data-pjt_cmts_num');
	$.ajax({
		method:'delete',
		url:"<%=request.getContextPath()%>/pjtReplies/"+cmtNum,
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Override":"delete"
		},
		dataType:'text',
		success:function(result){
			if(result="SUCCESS"){
				alert("삭제되었습니다.");				
				getPage("<%=request.getContextPath()%>/pjtReplies/${project.pjt_num}");
			}
		},
		error:function(error){
			alert('삭제 실패했습니다.');			
		}
	});
	
	
	
});

/* 댓글 수정버튼 눌렀을때 수정모드로 변경 */
$('#repliesDiv').on('click','div.modDelDiv #modBtn',function(e){
	var cmtNum=$(this).attr('data-pjt_cmts_num')
	$('.beforeMod[data-pjt_cmts_num='+cmtNum+']').css('display','none');
	$('.modifyDiv[data-pjt_cmts_num='+cmtNum+']').css('display','');
});

/* 댓글 수정모드에서 취소할때 다시 원래대로.. */
$('#repliesDiv').on('click','div.modifyDiv .canBtn',function(e){
	var cmtNum=$(this).attr('data-pjt_cmts_num');
	
	var t = $('.dd[data-pjt_cmts_num='+cmtNum+']').html();
	$('.modifyText[data-pjt_cmts_num='+cmtNum+']').text(t.replace(/<br>/g, '\n'));
	
	$('.beforeMod[data-pjt_cmts_num='+cmtNum+']').css('display','');
	$('.modifyDiv[data-pjt_cmts_num='+cmtNum+']').css('display','none');
});

/* 댓글 수정 */
$('#repliesDiv').on('click','div.modifyDiv .modSendBtn',function(e){
	var cmtNum=$(this).attr('data-pjt_cmts_num');
	var pjt_cmts_contents=$('.modifyText[data-pjt_cmts_num='+cmtNum+']').val();
	
 	var sendData={
			pjt_cmts_num:cmtNum,
			pjt_cmts_contents:pjt_cmts_contents
	}
	
	$.ajax({
		method:'put',
		url:"<%=request.getContextPath()%>/pjtReplies/"+cmtNum,
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"PUT"
		},
		data:JSON.stringify(sendData),
		dataType:'text',
		success:function(result){
			if(result=="SUCCESS"){
				alert("수정되었습니다.");			
				getPage("<%=request.getContextPath()%>/pjtReplies/${project.pjt_num}");
			}
		},
		error:function(error){
			alert("댓글 수정에 실패했습니다.");
		}
	});
	
	
	
});

/* 블라인드 버튼 실행 */
$('#blind').on('click',function(){
	
	var arr = new Array();
	$('input[name=todo3]:checked').each(function(){
		arr.push($(this).attr('data-pjt_cmts_num'));
	});
	
	var data={
			"pjt_cmts_num":arr,
			"pjt_num":"${project.pjt_num }"
	}

	$.ajax({
		method:'post',
		url:"<%=request.getContextPath()%>/pjtReplies/enabled/${project.pjt_num}",
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"POST"
		},
		data:JSON.stringify(data),
		dataType:"text", //받는 data 형식 지정,
		contentType:'json',
		success:function(data){
			alert('블라인드 처리를 완료하였습니다.');
			getPage("<%=request.getContextPath()%>/pjtReplies/${project.pjt_num}");
		},
		error:function(error){
			alert('블라인드 처리를 실패하였습니다.');
		}
	});

});

$("#checkAll").on('click', function(){
    $("input[name='todo3']").prop("checked", true);
    $(this).hide();
    $("#checkClearAll").show();
});
$("#checkClearAll").on('click', function(){
    $("input[name='todo3']").prop("checked", false);
    $(this).hide();
    $("#checkAll").show();
});

</script>