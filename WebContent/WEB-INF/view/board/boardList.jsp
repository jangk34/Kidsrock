<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.NoticeDTO" %>
<%@page import="java.util.List"%>
<%@page import="poly.dto.UserDTO" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
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
      <script type="text/javascript" src="/assets/js/jquery-min.js"></script>
      <script src="/bootstrap-3.3.2-dist/js/jquery.form.min.js"></script>
   
   <script>
	/*공지사항 더보기 버튼 함수*/
	$(function() {
		$(".hd-list").slice(0, 4).show();//select the first 5
		$("#load").click(function(c) {
			c.preventDefault();
			$(".hd-list:hiddne()").slice(0, 3).show();//select next5 hidden divs
			if ($(".hd-list:hidden()").length == 0) {
			
				//alert if there are none left
			}
		});
	});
	/*qna 더보기 버튼 함수*/
	$(function() {
		$(".hd-list-two").slice(0, 4).show();//select the first 
		$("#load-two").click(function(c) {
			c.preventDefault();
			$(".hd-list-two:hidden()").slice(0, 4).show();//select next5 hidden divs
			if ($(".hd-list-two:hidden()").length == 0) {
			
				//alert if there are none left
			}
		});
	});
	/*리뷰 더보기 버튼 함수*/
		
	$(function() {
		$("#reviewList .hd-list-three").slice(0, 4).show();//select the first 
		$("#load-three").click(function(c) {
			c.preventDefault();
			$("#reviewList .hd-list-three:hidden").slice(0, 4).show();//select next5 hidden divs
			if ($("#reviewList .hd-list-three:hidden").length == 0) {

				//alert if there are none left
			}
		});
	});
	
	
	// 공지사항 검색 
	$(function(){
		  $("#myInput").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#menu1 .hd-list").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
</script>
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
        	<h4 style="text-align:center; text-border:30px;"><Strong>공지사항</Strong></h4>
        </div>
      </div>
         
            </div>
          </nav>
        </header>
        
        <section class="text-center">
          <div class="container">
		
			<!-- <div style="padding-top:10px"> -->
				
		
		
			<form class="form-horizontal" style="padding-top:10px" action="/user/userRegProc.do" method="post" ><!--onsubmit="checked()" -->
				
				<div class="page-wrapper">
    
        <!--게시판 넓이 -->
            <div class="col-lg-12">
            </div>
                
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="text-align:center">No</th>
                                <th style="text-align:center">제목</th>
                                <th style="text-align:center">작성자</th>
                                <th style="text-align:center">작성일</th>
                                <th style="text-align:center">조회수</th>
                            </tr>
                        </thead>
                       <tbody>
                       <%for (int i=0; i<nList.size(); i++) {  %>
                            <tr>
                                <td style="width:7%; text-align:center">
                                
                                	<input type="text"
										style="text-align:center; float: left; width: 50%; border: 0; margin-left: auto; margin-right: auto; display: block;"
										readonly value="<%=i+1 %>"/>
							
								</td>
                                
                                <td style="width:26%"><input type="text"
										style="text-align:center; float: left; width:100%; border: 0; margin-left: auto; margin-right: auto; display: block;"
										readonly value="<%=nList.get(i).getNtTitle() %>" onclick="javascript:location.href='/board/boardDetail.do?fantNo=<%=nList.get(i).getFantNo()%>'"/></td>
                                <td style="text-align:center; width:10%"><input type="text"
										style="text-align:center; float: left; width:100%; border: 0; margin-left: auto; margin-right: auto; display: block;"
										readonly value="<%=nList.get(i).getNtWriter() %>" /></td>
                                <td style="text-align:center; width:14%"><input type="text"
										style="text-align:center; float: left; width:100%; border: 0; margin-left: auto; margin-right: auto; display: block;"
										readonly value="<%=nList.get(i).getRegDate() %>" /></td>
                                <td style="text-align:center; width:10%"><input type="text"
										style="text-align:center; float: left; width:100%; border: 0; margin-left: auto; margin-right: auto; display: block;"
										readonly value="<%=nList.get(i).getNtCount() %>" /></td>
										
                            </tr>
                            <% } %>
                            
                        </tbody> 
                    </table>
                
                  <!--   <div class="row">
                  <div class="col-lg-12">
                      <button type="button" class="btn btn-outline btn-primary pull-right">
                          <div onclick="location.href='/board/boardDetail.do'" class="fa fa-edit fa-fw"></div> 글쓰기
                      </button>
                  </div>
              </div> -->
            
        
    </div>
    </div>
    
    <a href="#" id="load-two" style="width:100%">more>></a>
				
			</form>
			
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
      <%@include file="/WEB-INF/view/board/boardListScript.jsp"%>
      <%@include file="/WEB-INF/view/user/userScript.jsp" %>
      
       
      </body>
</html>

