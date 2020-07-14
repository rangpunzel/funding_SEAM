<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--관리자가 아닌 경우 --%>
<c:if test="${loginUser.mem_num ne 1 }">
<script id="reply-template" type="text/x-handlebars-template">
	{{#each .}}
		{{#if free_cmts_enabled includeZero=false}}
		<hr>
		<div class="itemdiv dialogdiv replyLi row" data-free_cmts_num={{free_cmts_num}}>
			<div class="col-md-2">
				<div class="name user-block" style="cursor: pointer;">
					<img class="img-circle img-bordered-sm" src="<%= request.getContextPath() %>/displayProfileImg?mem_email={{mem_email}}&fileName={{mem_profile_img}}" onerror="this.src='<%= request.getContextPath() %>/resources/images/profile-picture.png'" alt="user profile image">
					&nbsp;&nbsp;<h8>{{mem_name}}</h8>
					<span class="description">{{prettifyDate free_cmts_regdate}}</span>
				</div>
			</div>
			<div class="col-md-10  cmtsContentsDivForAdd{{free_cmts_num}}" style="1200px;">
					<div class="col-sm-1 float-left">
						<i class="ace-icon fa fa-quote-left" style="color:#555;"></i>
					</div>
					<div class="col-sm-6 float-left" style="width:900px;white-space:normal;">
						<span style="line-height:130%;color:#555;width:900px;word-break:break-all;" id="contents{{free_cmts_num}}" class="dd">{{prettify free_cmts_contents}}</span>
					</div>
					<div class="col-sm-1 float-left">
						<i class="ace-icon fa fa-quote-right" style="color:#555;"></i>
					</div>
					<div class="col-sm-3 float-left">
						<a href="#a" id="replyLikeYet-{{free_cmts_num}}" class="link-black text-sm col-sm-2 replyLikeYet" data-free_cmts_num={{free_cmts_num}} data-free_cmts_like={{free_cmts_like}}><i class="far fa-thumbs-up mr-1"></i>{{free_cmts_like}} Like</a>
						<a href="#a" style="display:none;" id="replyLike-{{free_cmts_num}}" class="link-black text-sm col-sm-2 replyLike" data-free_cmts_num={{free_cmts_num}} data-free_cmts_like={{free_cmts_like}}><i class="fas fa-thumbs-up mr-1"></i>{{free_cmts_like}} Like</a>
					</div>
					<div class="btn-group btn-group-sm col-sm-1 float-left">
						<button type="button" class="btn btn-outline-success btn-flat float-right" id="modifyReplyBtn" style="display:{{loginUserCheckForModifyBtn mem_name}};" data-mem_name={{mem_name}} data-free_cmts_num={{free_cmts_num}} data-free_cmts_contents={{free_cmts_contents}}><i class="fas fa-wrench"></i></button>
						<button type="button" class="btn btn-outline-success btn-flat replyDelBtn" style="display:{{loginUserCheckForModifyBtn mem_name}};" data-free_cmts_num={{free_cmts_num}}><i class="fas fa-trash"></i></button>
					</div>
				</div>
					<div class="col-md-9 replyModifyDiv{{free_cmts_num}}" style="display:none;">		
						<div class="input-group input-group-sm col-12">
							<textarea class="form-control replyModifyContent{{free_cmts_num}} dd" rows="3" wrap="hard" placeholder="Enter ...">{{free_cmts_contents}}</textarea>
							<br>
							<div class="input-group-append">
	                        <button type="button" class="btn btn-outline-success btn-flat replyModifyBtn" data-free_cmts_num={{free_cmts_num}}>Send</button>
	                        <button type="button" class="btn btn-outline-success btn-flat replyModifyCancelBtn" style="width:50px;" data-free_cmts_num={{free_cmts_num}} data-free_cmts_contents={{free_cmts_contents}}>취소</button>
							</div>
	                    </div>
					</div>
			</div>
		{{/if}}
	{{/each}}
</script>
</c:if>

<%--관리자인 경우 --%>
<c:if test="${loginUser.mem_num eq 1 }">
<script id="reply-template" type="text/x-handlebars-template">
	{{#each .}}
		<hr>
		<div class="itemdiv dialogdiv replyLi row" data-free_cmts_num={{free_cmts_num}}>
			<div class="col-md-1">
				<input type='checkbox' class="checkBox" name='check' value={{free_cmts_num}} style="display:{{loginUserCheckForEnabled}};" {{checked free_cmts_enabled}}>
			</div>
			<div class="col-md-2">
				<div class="name user-block" style="cursor: pointer;">
					<img class="img-circle img-bordered-sm" src="<%= request.getContextPath() %>/displayProfileImg?mem_email={{mem_email}}&fileName={{mem_profile_img}}" onerror="this.src='<%= request.getContextPath() %>/resources/images/profile-picture.png'" alt="user profile image">
					&nbsp;&nbsp;<h8>{{mem_name}}</h8>
					<span class="description">{{prettifyDate free_cmts_regdate}}</span>
				</div>
			</div>
			<div class="col-md-9 cmtsContentsDivForAdd{{free_cmts_num}}" style="width:1000px;">
					<div class="col-sm-1 float-left">
						<i class="ace-icon fa fa-quote-left" style="color:#555;"></i>
					</div>					
					<div class="col-sm-6 float-left" style="width:900px;white-space:normal;">	
						<span style="line-height:130%;color:#555;width:900px;word-break:break-all;" id="contents{{free_cmts_num}}" class="dd">{{prettify free_cmts_contents}}</span>
					</div>				
					<div class="col-sm-1 float-left">
						<i class="ace-icon fa fa-quote-right" style="color:#555;"></i>
					</div>
					<div class="col-sm-3 float-left">
						<a href="#a" id="replyLikeYet-{{free_cmts_num}}" class="link-black text-sm col-sm-2 replyLikeYet" data-free_cmts_num={{free_cmts_num}} data-free_cmts_like={{free_cmts_like}}><i class="far fa-thumbs-up mr-1"></i>{{free_cmts_like}} Like</a>
						<a href="#a" style="display:none;" id="replyLike-{{free_cmts_num}}" class="link-black text-sm col-sm-2 replyLike" data-free_cmts_num={{free_cmts_num}} data-free_cmts_like={{free_cmts_like}}><i class="fas fa-thumbs-up mr-1"></i>{{free_cmts_like}} Like</a>
					</div>
					<div class="btn-group btn-group-sm col-sm-1 float-left">
						<button type="button" class="btn btn-outline-success btn-flat float-right" id="modifyReplyBtn" style="display:{{loginUserCheckForModifyBtn mem_name}};" data-mem_name={{mem_name}} data-free_cmts_num={{free_cmts_num}} data-free_cmts_contents={{free_cmts_contents}}><i class="fas fa-wrench"></i></button>
						<button type="button" class="btn btn-outline-success btn-flat replyDelBtn" style="display:{{loginUserCheckForModifyBtn mem_name}};" data-free_cmts_num={{free_cmts_num}}><i class="fas fa-trash"></i></button>
					</div>
			     </div>
					<div class="col-md-9 replyModifyDiv{{free_cmts_num}}" style="display:none;">		
						<div class="input-group input-group-sm col-12">
							<textarea class="form-control replyModifyContent{{free_cmts_num}}" rows="3" wrap="hard" placeholder="Enter ...">{{free_cmts_contents}}</textarea>
							<br>
							<div class="input-group-append">
	                        <button type="button" class="btn btn-outline-success btn-flat replyModifyBtn" data-free_cmts_num={{free_cmts_num}}>Send</button>
	                        <button type="button" class="btn btn-outline-success btn-flat replyModifyCancelBtn" style="width:50px;" data-free_cmts_num={{free_cmts_num}} data-free_cmts_contents={{free_cmts_contents}}>취소</button>
							</div>
	                    </div>
					</div>
			</div>
		</div>
	{{/each}}
</script>
</c:if>

<script>

Handlebars.registerHelper("prettify",function(a){
	var b=a.replace(/\n/g,'<br>');
	return b; 
});

	var mem_num = "${loginUser.mem_num}";
	var free_num = ${freeBoard.free_num}; //게시글번호
	//var replyPage=1;
	//var lastPageNum=-1;
	var replyLikeButtonTag = '<a href="#" id="replyLike-{{free_cmts_num}}" class="link-black text-sm col-sm-2 replyLike" data-free_cmts_num={{free_cmts_num}} data-free_cmts_like={{free_cmts_like}}><i class="fas fa-thumbs-up mr-1"></i>${free_cmts_like } Like</a>';
	var replyLikeYetButtonTag = '<a href="#" id="replyLikeYet-{{free_cmts_num}}" class="link-black text-sm col-sm-2 replyLikeYet" data-free_cmts_num={{free_cmts_num}} data-free_cmts_like={{free_cmts_like}}><i class="far fa-thumbs-up mr-1"></i>${free_cmts_like } Like</a>';
	
	/**
	 * 리스트 출력
	 */
	getPage("<%=request.getContextPath()%>/freeBoard/replies/list/"+free_num);
	
	function getPage(replyUrl){		
		$.getJSON(replyUrl,function(data){
			printData(data.freeBoardCmtsList, $('#repliesDiv'), $('#reply-template'));
			//printPaging(data.pageMaker,$('.pagination'));
		});
	}
	
	var printData = function(replyArr, target, templateObject){
		var template=Handlebars.compile(templateObject.html());
		var html=template(replyArr);
		$('.replyLi').remove();
		target.append(html);
		
		$(".dd").each(function(i,v){
			var h = $(this).text();
			//alert(h);
			$(this).html(h);
		});


		if(mem_num != ""){
			for(i = 0; i < replyArr.length; i++){
				//console.log(replyArr[i].free_cmts_num);
				free_cmts_num = replyArr[i].free_cmts_num;
				//console.log('free_cmts_num : ' + free_cmts_num, 'mem_num : ' + mem_num);
				$.ajax({
					url : '<%= request.getContextPath() %>/freeBoard/replies/thumbUpSelect/',
					type : 'POST',
					data : {'free_cmts_num' : free_cmts_num, 'mem_num' : mem_num},
					success : function(data){
						if(data != ""){
							//alert(".replyLikeYet data-" + data.free_cmts_num);
							$("#replyLikeYet-" + data.free_cmts_num).hide();
							$("#replyLike-" + data.free_cmts_num).show();
							/* $("#data-" + data.free_cmts_num).append(replyLikeButtonTag);
							alert("data.free_cmts_like : " + data.free_cmts_like);
							$("#replyLike-" + data.free_cmts_num).html('<i class="fas fa-thumbs-up mr-1"></i>' + data.free_cmts_like + ' Like'); */
						}
					},
					error : function(error){
						$("#replyLikeYet-" + data.free_cmts_num).show();
						$("#replyLike-" + data.free_cmts_num).hide();
					}
				})
			}
		}
	};
	
	//아직 안 누른 좋아요 버튼 클릭시
	$("div#repliesDiv").on('click','.replyLikeYet',function(event){	
		var free_cmts_num = $(event.target).attr("data-free_cmts_num");
		var free_cmts_like = $(event.target).attr("data-free_cmts_like");
		
		if(mem_num != ""){
			$.ajax({
				url : '<%= request.getContextPath() %>/freeBoard/replies/thumbUpRegist/',
				type : 'POST',
				data : {'mem_num' : mem_num, 'free_cmts_num' : free_cmts_num},
				success : function(free_cmts_like){
					//alert("#replyLikeYet-" + free_cmts_num);
					$("#replyLikeYet-" + free_cmts_num).hide();
					$("#replyLike-" + free_cmts_num).show();
					// $("#data-" + free_cmts_num).append(replyLikeButtonTag);
					$("#replyLike-" + free_cmts_num).html('<i class="fas fa-thumbs-up mr-1"></i>' + free_cmts_like + ' Like');
				},
				error : function(error){
					alert('다시 시도해주세요!');
				}
			})
		}else{
			alert('로그인이 필요합니다!');
			location.href="<%= request.getContextPath() %>/commons/loginForm";
		}
	});
	
	//눌렀었던 좋아요 버튼 클릭시
	$("div#repliesDiv").on('click','.replyLike',function(event){
		var free_cmts_num = $(event.target).attr("data-free_cmts_num");
		var free_cmts_like = $(event.target).attr("data-free_cmts_like");
		
		//alert('free_cmts_num : ' + free_cmts_num);
		//alert('free_cmts_like : ' + free_cmts_like);
		
		$.ajax({
			url : '<%= request.getContextPath() %>/freeBoard/replies/thumbUpRemove/',
			type : 'POST',
			data : {'mem_num' : mem_num, 'free_cmts_num' : free_cmts_num},
			success : function(free_cmts_like){
				$("#replyLike-" + free_cmts_num).hide();
				$("#replyLikeYet-" + free_cmts_num).show();
				// $("#data-" + free_cmts_num).append(likeYetButtonTag);
				$("#replyLikeYet-" + free_cmts_num).html('<i class="far fa-thumbs-up mr-1"></i>' + free_cmts_like + " Like");
			},
			error : function(error){
				alert('다시 시도해주세요!');
			}
		})
	});
	
	<%-- var printPaging=function(pageMaker,target){
		var str="";
		lastPageNum=pageMaker.realEndPage;
		if(pageMaker.prev){
			str+="<li><a href='"+(pageMaker.startPage-1)
					+"'> << </a></li>";
		}
		for(var i=pageMaker.startPage,len=pageMaker.endPage;i<=len;i++){
			var strClass = pageMaker.cri.page==i?'class=active':'';
			str+="<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
		}
		if(pageMaker.next){
			str+="<li><a href='"+(pageMaker.endPage+1)
				+"'> >> </a></li>";
		}
		target.html(str);
	} --%>
	
	/**
	 * 날짜 출력
	 */
	Handlebars.registerHelper("prettifyDate",function(free_cmts_regdate){
		var dateObj=new Date(free_cmts_regdate);
		var year=dateObj.getFullYear();
		var month=dateObj.getMonth()+1;
		var date=dateObj.getDate();
		return year+"/"+month+"/"+date;
	});
	
	/**
	 * 로그인 유저 체크해서 작성자와 같으면 수정 버튼 띄우기
	 */
	Handlebars.registerHelper("loginUserCheckForModifyBtn",function(mem_name){
		
		var result="none";
		var strTemp = "${loginUser.mem_name}";
		
		if(strTemp == "" || strTemp != mem_name){
			result="none";
		}
		
		if(mem_name == strTemp){
			result="visible";
		}
		
		return result;
	});
	
	/**
	 * 로그인 유저 체크해서 관리자와 같으면 글 권한 수정 버튼 띄우기
	 */
	Handlebars.registerHelper("loginUserCheckForEnabled",function(){
		
		var result="none";
		var mem_num = "${loginUser.mem_num}";
		
		//if(mem_num == ""){
		//	result="none";
		//}
		
		if(mem_num == 1){
			result="visible";
		}
		
		return result;
	});
	
	/**
	 * 글 권한 조회해서 체크 박스 상태 변경하기
	 */
	Handlebars.registerHelper("checked",function(free_cmts_enabled){
		
		var result="";
		
		<%-- 비활성화 댓글인 경우 --%>
		if(free_cmts_enabled == 0){
			result="checked";
		}
		
		<%-- 활성화 댓글인 경우 --%>
		if(free_cmts_enabled == 1){
			result="";
		}
		
		return result;
	});
	
	<%-- $('.pagination').on('click','li a',function(event){
		event.preventDefault();
		replyPage=$(this).attr("href");
		getPage("<%=request.getContextPath()%>/replies/"+bno+"/"+replyPage);
	}); --%>
	
	/**
	 * 댓글 등록
	 */
	function reply_regist_go(){
		
		var mem_num = "${loginUser.mem_num}";
		var free_cmts_contents = $('#free_cmts_contents').val();
		
		if(mem_num == ""){
			alert('로그인이 필요합니다!');
			location.href="<%= request.getContextPath() %>/commons/loginForm";
			return;
		}
		
		if(free_cmts_contents==""){
			alert('댓글 내용은 필수입니다.');
			$('#free_cmts_contents').focus().css("border-color","red");					
			return;
		}
		
		if(free_cmts_contents.length > 500){
			alert('댓글 내용은 500자 이상을 초과할 수 없습니다.');
			$('#free_cmts_contents').focus().css("border-color","red");					
			return;
		}
		
		var data={	
				"free_num" : free_num,
				"mem_num" : mem_num,
				"free_cmts_contents" : free_cmts_contents,
		}
		
		$.ajax({
			url:"<%=request.getContextPath()%>/freeBoard/replies/regist",
			type:"post",
			data:JSON.stringify(data),	
			headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"post"
			},
			success:function(data){
					alert('댓글이 등록되었습니다.');
					window.location.reload();			
					$('#contents').val("");
			},
			error:function(error){
				alert('서버 오류로 인하여 댓글 등록을 실패했습니다.');
			}
		});
	}
	
	/**
	 * 댓글 수정 버튼 클릭시
	 */
	$("div#repliesDiv").on('click','#modifyReplyBtn',function(event){
		
		var free_cmts_num = $(this).attr('data-free_cmts_num');
		
		$('.cmtsContentsDivForAdd'+free_cmts_num).css('display','none');
		$('.replyModifyDiv'+free_cmts_num).css('display','');		

	});
	
	//댓글 수정 창에서 취소 버튼 클릭시
	$("div#repliesDiv").on('click', '.replyModifyCancelBtn', function(){
		var free_cmts_num = $(this).attr('data-free_cmts_num');
		//var free_cmts_contents = $(this).attr('data-free_cmts_contents');
		var free_cmts_contents = $('#contents'+free_cmts_num).html();
		//alert(free_cmts_contents);
		
		var contents = free_cmts_contents.replace(/<br>/g, '\n');
		//alert(contents);
		
		$('.replyModifyContent'+free_cmts_num).val(contents);
		
		$('.replyModifyDiv'+free_cmts_num).css('display','none');
		$('.cmtsContentsDivForAdd'+free_cmts_num).css('display','');
	});
	
	//댓글 수정 창에서 send 버튼 클릭시
	$("div#repliesDiv").on('click', '.replyModifyBtn', function(){
		var free_cmts_num = $(this).attr('data-free_cmts_num');
		var free_cmts_contents = $('.replyModifyContent'+free_cmts_num).val();
		
		//alert(free_cmts_num);
		//alert(free_cmts_contents);
		
		$.ajax({
			method:'put',
			url:"<%=request.getContextPath()%>/freeBoard/replies/modify/"+free_cmts_num,
			headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"PUT"
			},
			data:JSON.stringify({free_cmts_contents:free_cmts_contents}),
			dataType:'text',
			success:function(result){
				alert("수정되었습니다.");
				location.reload();
			},
			error:function(error){
				alert("댓글 수정에 실패했습니다.");
			}
		});	
	});
	
	
	//댓글 삭제
	$('div#repliesDiv').on('click', '.replyDelBtn', function(event){
		var free_cmts_num = $(this).attr('data-free_cmts_num');
		
		var con = confirm('댓글을 삭제하시겠습니까?');
		if(con){
			$.ajax({
				method:'delete',
				url:"<%=request.getContextPath()%>/freeBoard/replies/remove/"+free_cmts_num,
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Override":"delete"
				},
				dataType:'text',
				success:function(result){
					alert("삭제되었습니다.");				
					location.reload();
				},
				error:function(error){
					alert('삭제 실패했습니다.');			
				}
			});
		}else{
			alert('댓글 삭제를 취소하였습니다.');
		}
	});
</script>