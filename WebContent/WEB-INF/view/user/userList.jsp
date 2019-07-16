<%@page import="java.util.List"%>
<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//모델에서 받는것은 getAttribute();
	UserDTO nDTO=(UserDTO) request.getAttribute("uDTO");
	/* System.out.println("jsp : " + CmmUtil.nvl(nDTO.getNtNo()));
	//고친부분 리스트 써서 널값은 없앴는데 이렇게 해도되는지 */
%>
<%
	List<UserDTO> uList = (List<UserDTO>)request.getAttribute("uList");
%>
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
        	<h4 style="text-align:center; text-border:30px;"><Strong>유저목록</Strong></h4>
        </div>
      </div>
         
             
            </div>
          </nav>
        </header>
        
        <section class="text-center">
          <div class="container">
		<div class="col-md-12">
			<!-- <div style="padding-top:10px"> -->
				
			</div>
		
			<form class="form-horizontal" style="padding-top:10px" action="/user/userRegProc.do" method="post" ><!--onsubmit="checked()" -->
				
				<div class="container">

		<div class="us-list-top hd-font">
			<!--  리스트를 꺼내기위한 -->
			<div>
				<input id="allCheck" type="checkbox" />
			</div>
			<div>회원번호</div>
			<div>이름</div>
			<div>전화번호</div>
			<div>공란</div>
		</div>
		<div id="myTable">
	<!-- 반복되게 생성되는곳에서 for문 -->
			<%for (int i=0; i<uList.size();i++) {%>
			<div class="us-list hd-font">
			
				
				<div><%=uList.get(i).getUserNo()%></div>
				<div>
					<%=uList.get(i).getName() %>
				</div>
				<div class="ellipsis">
					<a href="/user/userDetail.do?userNo=<%=uList.get(i).getUserNo()%>"><%=uList.get(i).getEmail() %></a>
				</div>
				<div><%=uList.get(i).getUserTel() %></div>
			</div>
			<%} %>
			<div>
				<p>회원정보를 아래 검색창에 입력해주세요.</p>
			</div>
			
			<input class="form-control" id="myInput" type="text"
				placeholder="Search.."> <a href="#" id="load-list"
				style="width: 100%" class="btn btn-primary">더보기</a> <br /> <br />
			

		</div>
	</div>
				
				
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

