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
        	<h4 style="text-align:center; text-border:30px;"><Strong>아이디/비밀번호 찾기</Strong></h4>
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
				<div style="margin-bottom:15px"></div>
				<div>
				<div style="margin-bottom:15px;">
					<input type="text" id="name" name="name" class="form-control" placeholder="이름 입력">
				</div>
				<div style="margin-bottom:15px;">
					<input type="text" id="userTel" name="userTel" class="form-control" placeholder="휴대폰 번호 입력">
				</div>
				<a style="width:100%"class="btn btn-primary" onclick="javascript:idFind()">아이디 찾기</a>
				<div id="idView"></div>
				
				
				<!-- <a href="/user/userFind.do"class="btn btn-success">ID/PW찾기</a> -->
            </div>
            <div style="margin-bottom:15px"></div>
            <div>
				<div style="margin-bottom:15px;">
					<input type="text" id="pwname" name="name" class="form-control" placeholder="이름 입력">
				</div>
				<div style="margin-bottom:15px;">
					<input type="text" id="pwuserTel" name="userTel" class="form-control" placeholder="휴대폰 번호 입력">
				</div>
				<div style="margin-bottom:15px;">
					<input type="text" id="pwemail" name="email" class="form-control" placeholder="이메일 입력">
				</div>
				
				<a style="width:100%"class="btn btn-primary" onclick="javascript:pwFind()">비밀번호 찾기</a>
				<div id="pwFind"></div>
				
				<!-- <a href="/user/userFind.do"class="btn btn-success">ID/PW찾기</a> -->
            </div>
            <div>
            
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
      
      
      function idFind(){  //클릭하면 네임과 텔 들어감
      var name=$('#name').val();
	  var userTel=$('#userTel').val();
      $.ajax({
    	  url:"/idFind.do",
    	  method:"post",
    	  data:{
    		  "name":name,
    		  "userTel":userTel
    	  },
    	  success:function(data){
    				  console.log(data)
    				  var cont="";
    				  if(data==""){
    					  cont+="조회된 결과가 없습니다."
    					  $('#idView').html(cont);
    				  }else{
    				  cont+=name;
    				  cont+="님의 아이디는 ";
    	  			  cont+=data;
    	  			  cont+=" 입니다."
    				  $('#idView').html(cont);
    				  $('#pwname').val(name);
    				  $('#pwuserTel').val(userTel)
    				  $('#pwemail').val(data); /* 조회된결과값 넣기 */
    				  }
    			  },
    			  error:function(){
    			  }
      })
}
        
        //패스워드 찾기
        
        function pwFind(){  //클릭하면 네임과 텔 들어감
            var pwname=$('#pwname').val();
      	  var pwuserTel=$('#pwuserTel').val();
      	 var pwemail=$('#pwemail').val();
            $.ajax({
          	  url:"/pwFind.do",
          	  method:"post",
          	  data:{
          		  "pwname":pwname,
          		  "pwuserTel":pwuserTel,
          		  "pwemail":pwemail
          	  },
          	  success:function(data){
          		var cont="";
          				  console.log(data)
          				alet("임시 비밀번호가 발송되었습니다.")
          			  },
          			  error:function(){
          				  
          			  }
            })
            }
      </script>
      
      <%@include file = "/WEB-INF/view/user/userScript.jsp" %>
      </body>
</html>

