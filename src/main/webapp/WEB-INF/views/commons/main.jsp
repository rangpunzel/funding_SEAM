<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<script src="<%=request.getContextPath()%>/resources/js/flickity-docs.min.js" ></script>
<script src="<%=request.getContextPath()%>/resources/js/flickity.pkgd.js" ></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/flickity-docs.css" media="screen">
	<script src="<%=request.getContextPath()%>/resources/js/cookie.js"></script>

<style>
.projectCard:hover {
  border:2px solid #28a745;
}
</style>
</head>

<body>

<!-- 메인 배너 -->
<div class="carousel hero-carousel flickity-enabled is-draggable">
<c:forEach items="${activeMainBannerList }" var="ban" end="2">
  <div class="hero-carousel__cell hero-carousel__cell--1" style="width:100%; height:400px; background:#CEFBC9; display:flex; align-items:center; justify-content:center;">
		<img onclick="javascript:window.open('${ban.b_url}')" data-flickity-lazyload="<%=request.getContextPath() %>/resources/uploadImg/banner/${ban.b_filename}" style="height:100%; cursor:pointer;">
  </div>
</c:forEach>
</div>
<!-- /메인배너 -->
                
 		<section class="page-section portfolio" id="portfolio">
            <div class="container">
                <!-- Portfolio Section Heading-->
                                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">신규 프로젝트</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><svg class="svg-inline--fa fa-star fa-w-18" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"></path></svg><!-- <i class="fas fa-star"></i> --></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Portfolio Grid Items-->
				<div class="album py-5">
				  <div class="container">
				      <div class="row contents1 text-center">
				
				      </div>
				  </div>
				</div>
            </div>
        </section>           
   
       
<section class="page-section portfolio" id="portfolio">
            <div class="container">
                <!-- Portfolio Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">마감임박 프로젝트</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><svg class="svg-inline--fa fa-star fa-w-18" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"></path></svg><!-- <i class="fas fa-star"></i> --></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Portfolio Grid Items-->
				<div class="album py-5">
				  <div class="container">
				      <div class="row contents2 text-center">
				
				      </div>
				  </div>
				</div>
            </div>
        </section>
<section class="page-section portfolio" id="portfolio">
            <div class="container">
                <!-- Portfolio Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">추천 프로젝트</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><svg class="svg-inline--fa fa-star fa-w-18" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"></path></svg><!-- <i class="fas fa-star"></i> --></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Portfolio Grid Items-->
				<div class="album py-5">
				  <div class="container">
				      <div class="row contents3 text-center">
				
				      </div>
				  </div>
				</div>
            </div>
        </section>
<section class="page-section portfolio" id="portfolio">
            <div class="container">
                <!-- Portfolio Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">인기 프로젝트</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><svg class="svg-inline--fa fa-star fa-w-18" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"></path></svg><!-- <i class="fas fa-star"></i> --></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Portfolio Grid Items-->
                				<div class="album py-5">
				  <div class="container">
				      <div class="row contents4 text-center">
				
				      </div>
				  </div>
				</div>
            </div><br><br><br>
                   <%@ include file="./projectList_js.jsp" %>  
            <!-- 뉴스 div-->
            
            <div class="" style="background-color:beige;padding:50px;">
            <h2 class="page-section-heading text-center text-uppercase text-success mb-0">소상공인 뉴스</h2>
            <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><svg class="svg-inline--fa fa-star fa-w-18" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z"></path></svg><!-- <i class="fas fa-star"></i> --></div>
                    <div class="divider-custom-line"></div>
                </div>
            	<div class="row justify-content-md-center">
            		<div class="col-5">
            			<ol id="news">
            			
            			</ol>
            		</div>
            	</div>
            </div>
            <br><br><br><br><br>
            <div class="container">
            	<h2 style="font-size:26px; " class="page-section-heading text-left mb-0">파트너십</h2>

            	<c:forEach items="${activePartnerBannerList }" var="partner">
	            	<div style="float:left; margin:10px;">
	            		<a href="javascript:window.open('${partner.b_url }','_blank')" >
	            			<img style="width:170px;height:80px;" src="../resources/uploadImg/banner/${partner.b_filename }">
	            		</a>
	            	</div>
	            </c:forEach>	
            </div>
            
            
	<c:forEach items="${activePopupList }" var="pop">
		<input type="hidden" name="p_num" value="${pop.p_num }"/>
 		<div class="popup1 myPop${pop.p_num }" style="position:absolute; top:${pop.p_top}; left:${pop.p_left};">
			 <div class="gnbFullBanner gnbFullBannerOpen" id="GNB_FullBanner" style="width:auto;height:auto;">
                        <div class="gnbFullBannerSec">
                        		
                                <img onclick="javascript:window.location.href='https://${pop.p_url}'" id="publicbanner-player" style="overflow:hidden;cursor:pointer;" width="${pop.p_width}" height="${pop.p_height}" src="<%=request.getContextPath() %>/resources/uploadImg/popup/${pop.p_filename }" data-gtm-yt-inspected-11184324_280="true"></iframe>
                            <div class="gnbFullBannerBt" style="background:black;color:white;">
	                                
	                            <a href="#today" class="gnbFullBannerBtToday" id="GNB_BannerBtToday" obj="P_BANNER" opt="{&quot;Name&quot;:&quot;mainpopup_video_today&quot;,&quot;Value&quot;:&quot;1867&quot;,&quot;PageCode&quot;:&quot;65533&quot;}">
	                                <span>오늘 하루 보지 않기</span>
	                            </a>
	                                
	                            <a href="#" class="gnbFullBannerBtClose" obj="P_BANNER" opt="{&quot;Name&quot;:&quot;mainpopup_video_close&quot;,&quot;Value&quot;:&quot;1867&quot;,&quot;PageCode&quot;:&quot;65533&quot;}">
	                                <span>닫기</span>
	                            </a>
                            </div>
                            <div>
                        </div>
                    </div></div>	
		</div>
		</c:forEach>
        </section>
       
 
        
        <script>
        $('.hero-carousel').flickity({
        	  // options
        	wrapAround: true,
        	autoPlay: 3000,
        	fullscreen: true,
        	lazyLoad: 1,
        	pauseAutoPlayOnHover: false
        	});
/*         $('.hero-carousel').on('settle.flickity', function() {
        	
        	  console.log( 'Flickity settled at ');
        	});
		 */
        
        $(function(){
        	
        	
        	
 			$('.popup1').each(function(i,v){
	 			var classNames = $(this).attr("class");
	 			var className = classNames.substring( classNames.indexOf("myPop") )
	 			var cookie=getCookie(className);
	        	
	        	if(cookie=='Y'){
	        		$(this).fadeOut(0);
	        	}	
 			});

        	
        	
        	
        	$.ajax({
        		url:'main/news',
        		type:"post",
        		dataType:"json",
        		success:function(data){
        			for(i=0;i<data.items.length;i++){
	        			var str="";
	        			str+="<li style='white-space : nowrap;  overflow: hidden; text-overflow: ellipsis;'>"
        				str+="<a id="+i+" href="+data.items[i].link+" style='color:black;'>"+(i+1)+". ";
        				str+=data.items[i].title;
        				str+="</a></li>";
        				$('#news').append(str);
        			}
	        			/* $('#newsDiv').html(data.items[0].title+"<br>");
	        			$('#newsDiv').attr('href',data.items[0].link); */
	        			console.log(data.items);
        			/* $('#newsDiv').append(data); */
        		}
        	});
        });
        
        
        
        	function mainSearch(){
        		search();
        	}
        	
        	function search(){
				event.preventDefault();
				event.stopPropagation();
        		var value = $('#search-input');
        		var val = value.val();
        		console.log(val);
        		 if (window.event.keyCode == 13) {
        			 
        			 if(value.val()==""){
						alert("검색어를 입력하세요");
						return;
        			 }else{
        				 $.ajax({
        					url : '<%=request.getContextPath()%>/commons/main/search',
        					type : 'post',
        					//data : JSON.stringify({"val":val}),        					
        					//data : {"val":encodeURIComponent(val)},        					
        					data : {"val":val},        					
        					//contentType : 'application/json; charset=utf-8',
        					success : function(projectList){
        						location.href="<%=request.getContextPath()%>/project/search/list/"+val;
        					},
        					error : function(){
        						alert("검색 실패");
        					}
        					
        				 });
        			 }
                }


        	}
        	
        	/* function hidePopup(){
        		$(this).hide();
        	}
 */
 		$('.gnbFullBannerBtClose').on('click',function(){
 			$(this).parents('.popup1').remove();
 		});
 

	 
 		$('.gnbFullBannerBtToday').on('click',function(){
 			var $pop = $(this).parents('.popup1');
 			var classNames = $pop.attr("class");
 			var className = classNames.substring( classNames.indexOf("myPop") );
 			
 			//alert(className);
 			var today = new Date();
 			setCookie(className,'Y', today.getDate()+1);
 		    $(this).parents('.popup1').fadeOut(0);
 		});
 		
 		


 	
        </script>
</body>