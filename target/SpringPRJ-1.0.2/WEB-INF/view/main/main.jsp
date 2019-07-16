<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      
      .jb-table {
        display: table;
        width: 100%;
      }
      .jb-table-row {
        display: table-row;
      }
      .jb-table-cell {
        display: table-cell;
        padding: 0px 20px;
        height: 150px;
      }
      .jb-top {
        vertical-align: top;
      }
      .jb-middle {
        vertical-align: middle;
      }
      .jb-bottom {
        vertical-align: bottom;
      }
    </style>
   
   </head>

   <body class="size-1280 slide-to-left">
      <section class="slide-content">  
        <header>
          <!-- LOGO -->
          <nav>
           <div class="line">
         		<%@include file="main_gnb.jsp"%>
         	</div>
            <div class="line">
            <!--  -->
            </div>
          </nav>
      <div style="padding-top:10px"></div>  
      
     <div style="border-top:5px solid #f2f2f2; border-bottom:2px solid #f2f2f2; border-left:1px solid #f2f2f2; border-right:1px solid #f2f2f2; padding:12px;">
   
       <div style="width:100%; padding-left:2px; padding-right:4px;">
        	<span style="border-bottom:3px solid #ff0000; padding:2px 4px 2px 4px; cursor:pointer;" onclick="location.href='#'">홈</span>
        	&nbsp;
        	<span style=" padding:2px 4px 2px 4px; cursor:pointer;" onclick="location.href='#'">추천시설</span> <!--radious 넣기  -->
        </div>
        
      </div>
           
        </header>
         <div style="padding-top:15px"></div>
	        <section class="text-center">
	        	   
	           <!-- CAROUSEL --> 
	           <div id="carousel">
	              <div id="header-carousel" class="owl-carousel owl-theme">
	                 <div class="item">
	                    <img src="<%=request.getContextPath()%>/resources/img/header-1.jpg" alt="">
	                    <div class="line">
	                    </div>
	                 </div>
	                 <div class="item">
	                    <img src="<%=request.getContextPath()%>/resources/img/header-2.jpg" alt="">
	                    <div class="line">
	                    </div>
	                 </div>
	                 <div class="item">
	                    <img src="<%=request.getContextPath()%>/resources/img/header-3.jpg"  alt="">
	                    <div class="line"> 
	                    </div>
	                 </div>
	              </div>
	           </div>
	        </section>
	        
	       <div class="container"> 
	           <div style="width:100%;">
	           		<div>
	           			<span style="float:left; color:#333333; padding-top:15px;"><b>실시간 핫챗</b></span>
						<a href="#"><span style="float:right; font-size:12px; color:#333333; padding-top:15px;">+더보기</span></a>
	           		</div>
	           		<div style="height:100%;">  
	           		<div class="text-center" id="first-block">
	        <div class="line">
	        <div class="margin">
	        
	       
	        <!-- <div style="border-top:1px solid; border-bottom:1px solid; border-left:1px solid; border-right:1px solid; padding:50px;"> -->
	        <div class ="s-3 m-6 1-3 margin-bottom " style="border: 1px solid #bcbcbc; padding:18px"> 
	        <img src="<%=request.getContextPath()%>/resources/img/info.svg" style="height:5rem;" "alt="">
	        <!-- 이미지 -->
	        <h4 class="margin-bottom">시설정보</h4>
	        </div>
	        <div class ="s-3 m-6 1-3 margin-bottom " style="border: 1px solid #bcbcbc;padding:18px"> 
	        <img src="<%=request.getContextPath()%>/resources/img/notice.svg" style="height:5rem;" "alt="">
	        <!-- 이미지 -->
	        <h4 class="margin-bottom">공지사항</h4>
	        </div>
	        <div class ="s-3 m-6 1-3 margin-bottom " style="border: 1px solid #bcbcbc;padding:18px"> 
	        <img src="<%=request.getContextPath()%>/resources/img/question.svg" style="height:5rem;" "alt="">
	        <!-- 이미지 -->
	        <h4 class="margin-bottom">질의응답</h4>
	        </div>
	        <div class ="s-3 m-6 1-3 margin-bottom " style="border: 1px solid #bcbcbc;padding:18px"> 
	        <img src="<%=request.getContextPath()%>/resources/img/chat.svg" style="height:5rem;" "alt="">
	        <!-- 이미지 -->
	        <h4 class="margin-bottom">커뮤니티</h4>
	        </div>
	        </div>
	        
	        
    </div>
	        <%-- <div class ="s-3 m-6 1-3 margin-bottom">
	        <img src="<%=request.getContextPath()%>/resources/img/warning.png" alt="">
	        <h4 class="margin-bottom">공지사항</h4>
	       </div>
	        <div class ="s-3 m-6 1-3 margin-bottom">
	        <img src="<%=request.getContextPath()%>/resources/img/question.png" alt="">
	        <!-- 이미지 -->
	        <h4 class="margin-bottom">질의응답</h4>
	        </div>
	        <div class ="s-3 m-6 1-3 margin-bottom">
	         <img src="<%=request.getContextPath()%>/resources/img/chat.png" style="width:80%" "alt="">
	        <h4 class="margin-bottom">커뮤니티</h4>
	       </div> --%>
	        
	        </div>
	        </div>
	        </div>
	           		</div>
	           </div>
	       </div>
        <!-- FOOTER -->
        <footer>
           <div class="line" style="padding-bottom:35px; padding-top:10px; border-top:1px solid #cccccc;">
                 <p style="text-align:center;">Copyright 2018, 키즈락 all rights reserved.</p>
           </div>
           <div style="width:100%;">
			</div>
        </footer>
      </section>
      <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/responsee.js"></script>
      <script type="text/javascript" src="<%=request.getContextPath()%>/resources/css/owl-carousel/owl.carousel.js"></script>
      <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.touchSlider.js"></script>
      <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/iscroll.js"></script>
     
      <script type="text/javascript">
        jQuery(document).ready(function($) {
          var owl = $('#header-carousel');
          owl.owlCarousel({
            nav: false,
            dots: true,
            items: 1,
            loop: true,
            navText: ["&#xf007","&#xf006"],
            autoplay: true,
            autoplayTimeout: 3000
          });
          var owl = $('#news-carousel');
          owl.owlCarousel({
            nav: false,
            dots: true,
            items: 1,
            loop: true,
            navText: ["&#xf007","&#xf006"],
            autoplay: true,
            autoplayTimeout: 3000
          });
        })
        
		"use strict";
		var $document = $(document);
		var $window = $(window);
        var exhibitionScroll;
		var iscroll;
		var actArrw = function() {
			$('#scroller-left,#scroller-right').addClass('active');
			-3 < iscroll.x ? $("#scroller-left").removeClass("active")
					: iscroll.x === iscroll.maxScrollX &&
			$("#scroller-right").removeClass("active");
		}
		
		var selectedTopmenu = "top-menu0";

		$document.ready(function() {
			$('#main-banner').click(function() {
				if(!($(this).attr("href"))){
					coupangApp.go('', 'homeBanner');
				}
			});

			/**
			 * GNB 선택 후 선택한 메뉴가 스크롤이 필요한 경우
			 * TODO: scrolltopage를 이용하게 되면 페이지 로딩 시 강제로 스크롤을 하게 되서 애니메이션 효과 발생
			 * 그대로 두느냐? 아예 로딩 시 iscroll객체 생성 시 기본값을 주느냐? 선택...
			 **/

			var _menuIndex = $("#scroller li a").index($("." + selectedTopmenu));
			iscroll.goToPage(_menuIndex, 0, 0);
			actArrw();

			/* Flicking */
			if($('#todayshot-section').hasClass('isFlicking')){
				var panelTime;
				$("#todayshotList").touchSlider({
					speed : 400,
					flexible : false,
					autoplay : true,
					page : 1,
					initComplete : function (e) {
						var listSize =  $("#todayshotList ul li").size();
						$('#todayshot-section .pagenation span').text(listSize);
						$('#todayshotList img').load(function(){$window.trigger('resizeImage')});
					},
					counter : function (e) {
						$('#todayshot-section .pagenation em').text(e.current);
						clearInterval(panelTime);
						panelTime = setInterval(function(){$("#todayshotList").get(0).animate(-1,true)},3000);
					},
					custom : function (){
						clearInterval(panelTime);
					},
					onTouchEnd : function() {
//                    todayshotList_show_cnt++;
					}
				});

				panelTime = setInterval(function(){$("#todayshotList").get(0).animate(-1,true)},5000);

				$window.bind({
					resizeImage : function() {
						$("#todayshotList").height($('.todayshot-deal-unit').outerHeight(true));
						$window.trigger('floatingTitle');
					},
					load : function() {
						$("#todayshotList").height($('.todayshot-deal-unit').outerHeight(true));
					}
				});
			};

            // What's New
            if($('#whatsnew-section').hasClass('isFlicking')) {
                $("#whatsnewList").touchSlider({
                    namespace : "touchslider",
                    autoplay : false,
                    flexible : true,
                    initComplete : function (e) {
                        $('#whatsnewList img').load(function(){$window.trigger('resizeImage')});
                        var count = e._len;
                        $('#tabs').html('');
                        for (var i = 0; i < count; i++) {
                            var el = $('<li class="tab"><a></a></li>');
                            el.attr('index', i);
                            $('#tabs').append(el);
                        }
                    },
                    counter : function (e) {
                        this.stopAnimation();
                        this.startAnimation(3000);

                        $('#tabs a').removeClass('active');
                        $('#tabs a').filter(function(i){return i == e.current - 1}).addClass('active');
                    },
                    custom : function (){
                        this.stopAnimation();
                    },
                    onTouchEnd : function() {

                    },

                    startAnimation: function(interval_) {
                    	var interval = interval_ || 5000;

                    	this._timer = setInterval(function(){
                    		$("#whatsnewList").get(0).animate(-1,true);
                    	}, interval);
                    },

                    stopAnimation: function() {
                    	if (this._timer) {
                    		clearInterval(this._timer);
                    		delete this._timer;
                    	}
                    }
                });

                $("#whatsnewList").get(0).opts.startAnimation();

                $window.bind({
                    resizeImage : function() {
                        $("#whatsnewList").height($('.whatsnew-deal-unit').outerHeight(true));
                        $window.trigger('floatingTitle');
                    },
                    load : function() {
                        $("#whatsnewList").height($('.whatsnew-deal-unit').outerHeight(true));
                    }
                });
            };

			/* //Flicking */
		});

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
   </body>
</html>