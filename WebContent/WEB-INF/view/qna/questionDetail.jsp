<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.NoticeDTO" %>
<%@page import="java.util.List"%>
<%@page import="poly.dto.UserDTO" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	UserDTO uDTO = (UserDTO) request.getAttribute("uDTO");
	NoticeDTO nDTO = (NoticeDTO) request.getAttribute("nDTO");
	List<NoticeDTO> uList= (List<NoticeDTO>)request.getAttribute("uList");
	List<NoticeDTO> nList= (List<NoticeDTO>)request.getAttribute("nList");
	/* System.out.println("jsp : " + CmmUtil.nvl(nDTO.getNtNo()));
	//고친부분 리스트 써서 널값은 없앴는데 이렇게 해도되는지 */
%>
    
    <%
	//모델에서 받는것은 getAttribute();
	NoticeDTO nDTO = (NoticeDTO) request.getAttribute("nDTO");
	System.out.println("jsp : " + CmmUtil.nvl(nDTO.getNtNo()));
	//고친부분 리스트 써서 널값은 없앴는데 이렇게 해도되는지
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
  
  
  <script>
//글 삭제  
function noticeDelete(ntNo){
	location.href="/notice/noticeDelete.do?ntNo="+ntNo;
}

// 답글 체크여부
$(function ansChk(){
	$("#ansChk").click(function(){
		
		//ntNo와 qaGrpNo일치 여부확인
		var noticeNo=$('#answerNo').val();
		//regNo
		var regUserNo=$('#regUserNo').val();
		
		
		$.ajax({
			type : 'POST',
			data : {'ntNo':noticeNo}, // parameter
			url  : "/notice/ansChk.do",
			success : function(data){
				if(data>0){
					alert("답글이 존재합니다.");
					//이벤트 제거 만들기
					//넘어가는거없음
				}else{
					location.href="/notice/answerReg.do?regNo="+regUserNo+"&ntNo="+noticeNo+"&qaGrpNo="+noticeNo;
				}
			},
			error:function(error){
				alert("error : "+error)
			}
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
        	<h4 style="text-align:center; text-border:30px;"><Strong>질의응답</Strong></h4>
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
				<script>
			// 답글 체크여부
$(function ansChk(){
	$("#ansChk").click(function(){
		
		//ntNo와 qaGrpNo일치 여부확인
		var noticeNo=$('#answerNo').val();
		//regNo
		var regUserNo=$('#regUserNo').val();
		
		
		$.ajax({
			type : 'POST',
			data : {'ntNo':noticeNo}, // parameter
			url  : "/notice/ansChk.do",
			success : function(data){
				if(data>0){
					alert("답글이 존재합니다.");
					//이벤트 제거 만들기
					//넘어가는거없음
				}else{
					location.href="/notice/answerReg.do?regNo="+regUserNo+"&ntNo="+noticeNo+"&qaGrpNo="+noticeNo;
				}
			},
			error:function(error){
				alert("error : "+error)
			}
		});
	});
	
});
</script>

</head>
<body>

	<!--  입력창 -->
	<div class="container">


		<!--  제목   -->
			<div class="form-group">
				<label class="col-sm-3 control-label">제목</label>
				<div class="col-sm-9">
					<input class="form-control" name="ntTitle" type="text"
						value="<%=CmmUtil.nvl(nDTO.getNtTitle())%>" readonly >
				</div>
			</div>
		
		<!-- 작성자 -->
			<div class="form-group">
				<label class="col-sm-3 control-label">작성자</label>
				<div class="col-sm-9">
					<input class="form-control" name="ntWriter" type="text"
					value="<%=CmmUtil.nvl(nDTO.getNtWriter())%>" readonly >
				</div>
			</div>
		<!-- 작성일 -->


		<% if(CmmUtil.nvl(nDTO.getUpdNo())==""){ %>
		
			<div class="form-group">
				<label class="col-sm-3 control-label">작성일</label>
				<div class="col-sm-9">
					<input class="form-control" name="regDate" type="text"
						value="<%=CmmUtil.nvl(nDTO.getRegDate())%>" readonly>
				</div>
			</div>
		<%} else {%>	
		
					<div class="form-group">
				<label class="col-sm-3 control-label">작성일</label>
				<div class="col-sm-9">
					<input class="form-control" name="regDate" type="text"
						value="<%=CmmUtil.nvl(nDTO.getUpdDate())%>" readonly>
				</div>
			</div>
		<%} %>
		
		
		<!-- 글내용 -->
		<div class="form-group">
			<label class="col-sm-3 control-label">내용</label>
			<div class="col-sm-9">
			<input class="form-control" name="ntWriter" type="text"
					value="<%=CmmUtil.nvl(nDTO.getNtWriter())%>" readonly >
				<textarea class="form-control" rows="10" name="ntCont"
					readonly="readonly"><%=CmmUtil.nvl(nDTO.getNtCont())%></textarea>
			</div>
		</div>
		<!-- 답글 체크여부를 위한 인풋  이값은 ntNo-->
		<input type="hidden" id="answerNo" value="<%=nDTO.getFantNo()%>"/>
		<input type="hidden" id="regUserNo" value="<%=nDTO.getRegNo()%>"/>	 
		
		<!--  등록일 등록번호 -->
		<!-- <input type="hidden" value="a" name="ntSort"/> -->
		<div class="form-group">
			<div class="col-sm-12 text-center">
			<% if (userNo.equals("1")) {%>
			<button class="btn btn-danger" onclick="noticeDelete('<%=nDTO.getFantNo()%>');">삭제<i class="fa fa-check spaceLeft "></i></button>
			<button class="btn btn-success" onclick="ansChk();" id="ansChk">답글<i class="fa fa-times spaceLeft"></i></button>
			<a href="/notice/noticeUpdateView.do?regNo=<%=nDTO.getRegNo()%>&ntNo=<%=nDTO.getNtNo()%>" class="btn btn-success">
					수정<i class="fa fa-times spaceLeft"></i>
				</a>
			
			<%} %>
			<% if(userNo.equals(nDTO.getRegNo())&&!userNo.equals("1")) { %>
			<button class="btn btn-danger" onclick="noticeDelete('<%=nDTO.getFantNo()%>');">삭제<i class="fa fa-check spaceLeft "></i></button>
			<a href="/notice/noticeUpdateView.do?regNo=<%=nDTO.getRegNo()%>&ntNo=<%=nDTO.getFantNo()%>" class="btn btn-success">
					수정<i class="fa fa-times spaceLeft"></i>
				</a>
			<%} %>
	
		</div>
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

 --%>