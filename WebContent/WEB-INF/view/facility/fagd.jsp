<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.NoticeDTO" %>
<%@page import="java.util.List"%>
<%@page import="poly.dto.UserDTO" %>
<%@page import="poly.dto.FaDTO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	FaDTO fDTO=(FaDTO) request.getAttribute("fDTO");
	List<FaDTO> fList= (List<FaDTO>)request.getAttribute("fList");
	List<NoticeDTO> nList= (List<NoticeDTO>)request.getAttribute("nList");

	/* System.out.println("jsp : " + CmmUtil.nvl(nDTO.getNtNo()));
	//고친부분 리스트 써서 널값은 없앴는데 이렇게 해도되는지 */
%>
<!DOCTYPE html>
<html lang="en-US">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />

      <title>키즈락</title>
      <!-- Bootstrap -->
     <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.css">
     
      <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/components.css">
      <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/icons.css">
      <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/responsee.css">
      <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/owl-carousel/owl.carousel.css">
      <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/owl-carousel/owl.theme.css">
      <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/m.v2.min.css" type="text/css">
      <!-- CUSTOM STYLE -->
      <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/template-style.css">
      <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
      <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-1.8.3.min.js"></script>
      <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-ui.min.js"></script>    
   
   <style>
   .overlayo {
    content: "";
    position: absolute;
    left: 0;
    right: 0;
    bottom: 0;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#374050), to(#798696));
    background-image: linear-gradient(to bottom, #374050 0%, #798696 100%);
    opacity: 0.7;
   }
   
   .overA {
   display: grid; 
   width:100%;
   height:250px;
   position: relative;/* z-index: 100; */
   }
   
   .overB {
   opacity: 0.7;
   overlay: 0.7;
   display: -webkit-inline-box;
   height: 70px;
   position: absolute;
   width: 100%;
   top: 347px;
   bottom: 100px; 
   background: gray;
   }
   
   .contianer-relative{ 
  position: relative;
 }

.content-center-text-absolute{ 
  position: absolute; 
  text-align: center;
  width: 100%;
  height: 0%;
  margin: auto;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  z-index: 51;
}
         
   </style>
   </head>

   <body class="size-1280 slide-to-left">
      <section class="slide-content">  
        <header>
          <!-- LOGO -->
          <nav>
             <div class="line">
               <%@include file="/WEB-INF/view/main/main_gnb.jsp"%>
            </div>
            <div style="padding-top:10px;"></div>
            <div class="line">
   
      <!-- 로고 밑 박스틀  -->
     <div style="border-top:5px solid #f2f2f2; border-bottom:2px solid #f2f2f2; border-left:1px solid #f2f2f2; border-right:1px solid #f2f2f2; padding:12px;">
   
       <div style="width:100%; padding-left:2px; padding-right:4px;">
        	<h4 style="text-align:center; text-border:30px;"><Strong>추천시설</Strong></h4>
        </div>
      </div>
             
            </div>
          </nav>
        </header>
        
        <section class="text-center">
          <div>
		<div class="col-md-12">
			<!-- <div style="padding-top:10px"> -->
				
			</div>
		
			<form class="form-horizontal" style="padding-top:10px" action="/user/userRegProc.do" method="post" ><!--onsubmit="checked()" -->

			
			
			<div style="padding-top:15px"></div>
			
	        <section class="text-center">
	        <%for (int i=0; i<1; i++) {  %>
	        <div style="width:100%">
	        	  <!-- <div class="overlayo"> -->
	        	  <div class="col remove-padding contianer-relative">
	        	   
	        	  <div class="item item-image clear-border" >
	        	  
	    <img style="width:100%; height:250px;" onclick="javascript:location.href='/facility/fagdDetail.do?fano=<%=fList.get(3).getFano() %>'" src="<%=request.getContextPath()%>/resources/img/11111.jpg" style="height:5rem;" "alt="">
	    <div style="height: 70px; width: 700px; opacity: 0.7; background: #333333b9; position: absolute; top: 180px;"></div>
	       <h4 style="margin-bottom:55px; color:#FFFFFF" class="content-center-text-absolute white-text"><strong><%=fList.get(3).getFaname() %> <br> <%=fList.get(3).getFaaddr1() %></strong></h4>
	       <!--disply:grid; position:relative; z-index:100;"   -->
	       <!-- <div style="opacity:0.7; overlay:0.7; display:-webkit-inline-box; height:70px; position:absolute; width:100%; top:347px; bottom:100px; background:gray;"></div> -->

	       </div>
	       	       
	       </div>
	        	 <div style="margin-top:8%">
	        	 <div class="col remove-padding contianer-relative">
	        	  <div class="item item-image clear-border" >  
	    <img style="width:100%; height:250px;" onclick="javascript:location.href='/facility/fagdDetail.do?fano=<%=fList.get(8).getFano() %>'" src="<%=request.getContextPath()%>/resources/img/123123.jpg" style="height:5rem;" "alt="">
	        <div style="height: 65px; width: 700px; opacity: 0.7; background: #333333b9; position: absolute; top: 184px;"></div>
	       <h4 style="margin-bottom:55px; color:#FFFFFF" class="content-center-text-absolute white-text"><strong><%=fList.get(8).getFaname() %> <br> <%=fList.get(8).getFaaddr1() %></strong></h4></div>
	       </div>
	       <% } %>
	        </section>

			</form>
		</div>
	</div>
        <!-- FOOTER -->
        <footer>
           <div style="width:100%;">
               <%@include file="/WEB-INF/view/main/main_bottom.jsp"%>
         </div>
        </footer>
      </section>
      <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/responsee.js"></script>
      <script type="text/javascript" src="<%=request.getContextPath()%>/resources/css/owl-carousel/owl.carousel.js"></script>
      <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.touchSlider.js"></script>
      <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/iscroll.js"></script>
      <script type="text/javascript">

      /* v3. script */
      if($('#topMenu').size() > 0 && $('#scroller').size() > 0){
         var totalWidth = 0;
         var lists = $('#scroller li');

         lists.each(function(index) {
            totalWidth += $(this).width();
         });
         $('#scroller').width(totalWidth + lists.length);

         var scrollOption = {
            snap : 'li',
            scrollX : true,
            scrollY : false,
            eventPassthrough : true
         };
         if(navigator.userAgent.match(/iphone/i) ||
               navigator.userAgent.match(/ipad/i)){
            scrollOption.useTransform = false;
         }
         iscroll = new IScroll('#topMenu', scrollOption);
         iscroll.on('scrollEnd', actArrw);
         $('#scroller-left,#scroller-right').click(function() {
            var newXPos;
            if($(this).hasClass("scroller-arr-left")){
               newXPos = iscroll.currentPage.pageX - 3;
               newXPos = newXPos < 0 ? 0 : newXPos;
               iscroll.goToPage(newXPos ,0);
            }else{
               newXPos = iscroll.currentPage.pageX + 3;
               newXPos = newXPos <= iscroll.pages.length ? newXPos : iscroll.pages.length;
               iscroll.goToPage(newXPos ,0);
            }
         });
      }

      var coupangWrap = $("#coupangWrap"),
         sectionGroup = $("#whatsnewList"),
            sectionList = $("#whatsnew-section-list"),
            sectionTitle = $("#whatsnew-all-title");

        $("#whatsnewAll").on("click", function(e){
            e.preventDefault();

            coupangWrap.addClass("showWhatsnew");
            sectionGroup.css("height","auto");
            sectionList.children().css("position", "static");

            sectionGroup[0].opts.stopAnimation();

            sectionTitle.appendTo(coupangWrap);
            sectionGroup.appendTo(coupangWrap);
        });

        $("#whatsnew-all-close").on("click", function(e){
            e.preventDefault();

            coupangWrap.removeClass("showWhatsnew");
            $(window).scrollTop(0);
            sectionList.children().css("position", "absolute");

            $("#whatsnew-section").append(sectionGroup);
            sectionTitle.insertBefore(sectionGroup);
            sectionGroup.height($('.whatsnew-deal-unit').outerHeight(true));

            sectionGroup[0].opts.startAnimation();
        });
        
        
        /* 스크롤 막기 */
        /* $('html, body').css({'overflow': 'hidden', 'height': '100%'});
        $('#element').on('scroll touchmove mousewheel', function(event) {
          event.preventDefault();
          event.stopPropagation();
          return false;
        }); */
      </script>
      
      <%@include file = "/WEB-INF/view/user/userScript.jsp" %>
      </body>
</html>
