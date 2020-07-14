<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



  <br><h2 style="text-align:center;color:#4f4f4f;">프로젝트 제안</h2><br><br>
<div style="width:70%; text-align:right;">




</div>
<section class="container">
<br>
					<form id="search" action="<%=request.getContextPath() %>/propose/searchList" method="post">
						<input name="page" type="hidden" value="${pageMaker.cri.page }">
						<input name="perPageNum" type="hidden" value="${pageMaker.cri.perPageNum }">
							
					<!-- 상단 우측버튼 -->
					<div class="row" style="padding:20px;">	
						<div class="col-sm-3">
							<c:if test="${loginUser.mem_name eq '관리자' }">
								<button class="btn btn-outline-success btn-flat" type="button" onclick="proposeEnabled();">블라인드</button>
							</c:if>
								<button id="proposeRegist" class="btn btn-outline-success btn-flat" type="button" onclick="regist()">글 등록</button>	
						</div>
						
							<div class="col-sm-9">
								<div class="input-group" style="width:400px;float:right;">
									<select class="form-control" name="searchType" id="searchType" style="border:none;">
										<option value="t" ${pageMaker.cri.searchType eq 't' ? 'selected':'' }>제 목</option>
										<option value="w" ${pageMaker.cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
										<option value="c" ${pageMaker.cri.searchType eq 'c' ? 'selected':'' }>내 용</option>
									</select>
									<input class="form-control" type="text" name="keyword" style="width:150px;outline: 0;border-width: 0 0 2px;" placeholder="검색어를 입력하세요." value="${param.keyword }"/>
									<div class="input-group-append">
										<button class="btn" type="submit" id="searchBtn" data-card-widget="search"><i class="fas fa-search"></i></button>
									</div>
								</div>	
							</div>	
					</div>						
																			
							<%-- <div class="wizard-inner-R">
								<select id="searchType" name="searchType" style="width:150px;float:left;" class="form-control">
									<option value="">검색구분</option>
									<option value="t" ${pageMaker.cri.searchType eq 't' ? 'selected':'' }>제목</option>
									<option value="c" ${pageMaker.cri.searchType eq 'c' ? 'selected':'' }>본문</option>
									<option value="w" ${pageMaker.cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
								</select>
							        <input style="width:300px;float:left;" class="form-control border" name="keyword"  type="text" placeholder="Search" aria-label="Search">
							        <div class="input-group-append" style="float:left;">
							          <button class="btn btn-navbar" type="submit" id="searchBtn">
							            <i class="fas fa-search"></i>
							          </button>
							        </div>
							        
							          <div style="width:100%;text-align:right;">
							          	<c:if test="${loginUser.mem_name eq '관리자' }">
											<button class="btn btn-outline-success btn-flat" style="width:100px;" type="button" onclick="proposeEnabled();">글 보이기</button>
											<button class="btn btn-outline-success btn-flat" style="width:100px;" type="button" onclick="proposeDisabled();">글 숨기기</button>
										</c:if>
										<button id="proposeRegist" class="btn btn-outline-success btn-flat" style="width:100px;" type="button" onclick="regist()">글 등록</button>							          	
							          </div>
							</div> --%>
							<!-- 상단 우측버튼 -->
					</form>
 			
	<div style="width:100%;">
      <!-- Default box -->
      		
      		
        <div class="card-body table-responsive p-0">
          <table class="table table-head-fixed text-center" style="text-align:center;">
              <thead>
                  <tr>
                  <th></th>
                  	<c:if test="${loginUser.mem_name eq '관리자' }">
                  	  <th>
                  	  	<input type="checkbox" id="enabled" onchange="allCheck();">
                  	  </th>
                  	</c:if>
                  	  
                      <th style="width: 10px;">
                          	No
                      </th>
                     
                      
                      <th style="width: 30%" class="text-center">
                          	제 목
                      </th>
                       <th style="width: 20%">
                                                       작성자
                      </th>
                      <th style="width: 15%" class="text-center">
                         	등록일자
                      </th>
                      <th style="width: 8%">
                      		조회수
                      </th>
                      
                      <th style="width: 10%">
                      		응원하기
                      </th>
                  </tr>
              </thead>
            
              <tbody>
              	<c:if test="${empty propose }">
                 		<tr>
                 			<td colspan="7">게시글이 없습니다.</td>
                 		</tr>
                 		
                 	</c:if>
              <c:if test="${loginUser.mem_name eq '관리자'}">
              	<c:forEach items="${likeDescList }" var="descList" begin="0" end="4">
              		<tr style="font-size:0.85em;">
              			<td><i class="red ace-icon fa fa-star bigger-120" title="중요" style="color:red;"></i></td>
              			<c:if test="${descList.pjtprp_enabled eq 0 }">
	              			<td><input type="checkbox" class="proposeCheck" checked value="${descList.pjtprp_num }"></td>
              			</c:if>
              			<c:if test="${descList.pjtprp_enabled eq 1 }">
	              			<td><input type="checkbox" class="proposeCheck" value="${descList.pjtprp_num }"></td>
              			</c:if>
              			<td>${descList.pjtprp_num }</td>
              			<td><a id="proposeTitle" style="color:black;" href="proposeDetailForEnabled?pjtprp_num=${descList.pjtprp_num }">${descList.pjtprp_title}<c:if test="${descList.cmt_count > 0}">&nbsp; <span style="color:red;">[${descList.cmt_count}]</span></c:if></a></td>
              			<td>${descList.mem_name }</td>
                 		<td><fmt:formatDate value="${descList.pjtprp_regdate}" pattern="yyyy-MM-dd"/></td>
                 		<td>${descList.pjtprp_view_cnt}</td>
                 		<td>${descList.pjtprp_like }</td>
              		</tr>
              	</c:forEach>
                 <c:forEach items="${propose }" var="pps">
		                 	<tr style="font-size:0.85em;">
		                 		<td></td>
		                 		<c:if test="${pps.pjtprp_enabled eq 0 }">
				                 	<td><input type="checkbox" class="proposeCheck" checked value="${pps.pjtprp_num }"></td>
		                 		</c:if>
		                 		<c:if test="${pps.pjtprp_enabled eq 1 }">
				                 	<td><input type="checkbox" class="proposeCheck" value="${pps.pjtprp_num }"></td>
		                 		</c:if>
		                 		<td>${pps.pjtprp_num }</td>
	                 			<td><a id="proposeTitle" style="color:black;overflow:hidden;" href="proposeDetailForEnabled?pjtprp_num=${pps.pjtprp_num }">${pps.pjtprp_title}<c:if test="${pps.cmt_count > 0}">&nbsp; <span style="color:red;">[${pps.cmt_count}]</span></</c:if></a></td>
		                 		<td>${pps.mem_name }</td>
		                 		<td><fmt:formatDate value="${pps.pjtprp_regdate}" pattern="yyyy-MM-dd"/></td>
		                 		<td>${pps.pjtprp_view_cnt}</td>
		                 		<td>${pps.pjtprp_like }</td>
		                 	</tr>
                 </c:forEach>
             </c:if>
             
             <c:if test="${loginUser.mem_name ne '관리자' }">
             	<c:forEach items="${likeDescList }" var="descList" begin="0" end="4">
             		<c:if test="${descList.pjtprp_enabled eq 1}">
	              		<tr style="font-size:0.85em;">
	              			<td><i class="red ace-icon fa fa-star bigger-120" title="중요" style="color:red;"></i></td>
	              			<td>${descList.pjtprp_num }</td>
	              			<td><a id="proposeTitle" style="color:black;" href="proposeDetailForEnabled?pjtprp_num=${descList.pjtprp_num }">${descList.pjtprp_title}<c:if test="${descList.cmt_count > 0}">&nbsp; <span style="color:red;">[${descList.cmt_count}]</span></</c:if></a></td>
	              			<td>${descList.mem_name }</td>
	                 		<td><fmt:formatDate value="${descList.pjtprp_regdate}" pattern="yyyy-MM-dd"/></td>
	                 		<td>${descList.pjtprp_view_cnt}</td>
	                 		<td>${descList.pjtprp_like }</td>
	              		</tr>
              		</c:if>
              	</c:forEach>
             	<c:forEach items="${propose }" var="pps">
                 	<c:if test="${pps.pjtprp_enabled eq 1}">
		                 	<tr style="font-size:0.85em;">
		                 		<td></td>
		                 		<td>${pps.pjtprp_num }</td>
		                 		<td><a id="proposeTitle" style="color:black;" href="proposeDetailForEnabled?pjtprp_num=${pps.pjtprp_num }">${pps.pjtprp_title}<c:if test="${pps.cmt_count > 0}">&nbsp; <span style="color:red;">[${pps.cmt_count}]</span></</c:if></a></td>
		                 		<td>${pps.mem_name }</td>
		                 		<td><fmt:formatDate value="${pps.pjtprp_regdate}" pattern="yyyy-MM-dd"/></td>
		                 		<td>${pps.pjtprp_view_cnt}</td>
		                 		<td>${pps.pjtprp_like }</td>
		                 	</tr>
		           </c:if>
                 </c:forEach>
             </c:if>
              </tbody>
          
          </table>
          
        </div>
        <!-- /.card-body -->
      <div class="card-footer">
          <%@ include file="pagination.jsp" %>
       </div>  
      <!-- /.card -->
	</div>
    </section>

    <script>
    
    	
    	
    	function allCheck(){
    		if($('#enabled').is(':checked') == true){
	    		$('.proposeCheck').attr('checked','checked');
    		}else{
	    		$('.proposeCheck').attr('checked',false);
    		}
    	}
    
    	/* function proposeSearch(){
    		alert("dd");
    	}
    	
    	$('proposeTitle').on('click',function(){
    		if()	
    	}); */
    	
    	function proposeDisabled(){
    		var trueChecked = new Array();
    		
    		if($(':checkbox[class="proposeCheck"]').is(':checked') == true){
    			$(':checkbox[class="proposeCheck"]:checked').each(function(i,e){
    				trueChecked.push(e.value);
    			});
    		}else{
    			alert('선택된 글이 없습니다.');
    			return;
    		}
    		var jsonn={"trueChecked":trueChecked}
    		
    		console.log(jsonn);
    		
    		$.ajax({
    			url : '<%=request.getContextPath()%>/propose/disabled',
    			type : 'post',
    			data : JSON.stringify(jsonn),
    			contentType : 'application/json',
    			success : function(data){
    				alert("선택한 게시글을 숨겼습니다.");
    				location.href="<%=request.getContextPath()%>/menu/propose";
    			},
    			error : function(err){
    				alert("선택한 게시글을 숨겼습니다.2");
    			}
    		});
    	}
    	
    	function proposeEnabled(){
			var falseChecked = new Array();
			var trueChecked = new Array();
			
    		
    		if($(':checkbox[class="proposeCheck"]').is(':checked') == true){
    			$(':checkbox[class="proposeCheck"]:checked').each(function(i,e){
    				trueChecked.push(e.value);
    			});
    		}
    		
    		if($(":checkbox[class='proposeCheck']").not(":checked")){
    			$(":checkbox[class='proposeCheck']:not(:checked)").each(function(i,e){
    				//alert("check안된거 : " + e.value);
    				falseChecked.push(e.value);
    			});
            }
    		var jsonn={"falseChecked":falseChecked,
    					"trueChecked":trueChecked}
    		
    		console.log(jsonn);
    		
    		$.ajax({
    			url : '<%=request.getContextPath()%>/propose/enabled',
    			type : 'post',
    			data : JSON.stringify(jsonn),
    			contentType : 'application/json',
    			success : function(data){
    				alert("블라인드 처리를 완료했습니다.");
    				location.href="<%=request.getContextPath()%>/menu/propose";
    			},
    			error : function(err){
    				alert("실패");
    			}
    		});
    	}
    	
    	function regist(){
    		var mem_num = '${loginUser.mem_num}';
    		
    		if(mem_num == ""){
    			alert('로그인 후 이용 가능합니다.');
    			location.href="<%=request.getContextPath()%>/commons/loginForm";
    			return false;
    		}
    		<%-- location.href="<%=request.getContextPath()%>/menu/proposeRegist"; --%>
    		$.ajax({
    			url:'<%=request.getContextPath()%>/propose/regist/check',
    			data:{'mem_num':mem_num},
    			type:'post',
    			success:function(data){
    				if(data == "OK"){
    					location.href="<%=request.getContextPath()%>/menu/proposeRegist";
    				}else{
    					alert("오늘 프로젝트 제안 글을 이미 작성하셨습니다.\n하루에 한번만 작성 가능합니다.");
    					return;
    				}
    			},
    			error:function(error){
    				alert("에러");
    			}
    		});
    	}
    	$('#searchBtn').on('click',function(e){
    		var form = $('form#search');
    				
    		var searchType=$('select#searchType');
    		if(searchType.val()==""){
    			alert("검색구분을 선택하세요.");
    			searchType.focus();
    			return false;
    		}
    		form.submit();
    	});
    	
    	
    </script>