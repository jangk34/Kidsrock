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
        	<h4 style="text-align:center; text-border:30px;"><Strong>회원가입</Strong></h4>
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
				<div class="form-group">
					<!--  이메일 입력란 -->
					
					<div class="col-sm-6">
						<div class="input-group">
							<input type="text" class="form-control" id="email" name="email" 
								placeholder="*이메일 입력"> <span class="input-group-btn">
								<input type="button" class="btn btn-primary" value="이메일 중복체크" id="emailCk" />
								<!-- 이메일이 중복이면  유효성 검사를 통해 안넘어가게 -->
								<input type="hidden" id="conf"value="0"/>
							</span>
						</div>
					</div>
				</div>
				<!--  패스워드 입력란 -->
				<div class="form-group">
					<div class="col-sm-6">
						<input class="form-control" id="pwd" name="password" type="password" 
							placeholder="비밀번호 입력" maxlength="20" value="">
						<font id="length" size="2" color="red">8자리 이상 20자리 이하의 [영문 + 숫자] 조합</font>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-6">
						<input class="form-control" id="pwdCheck"
							type="password" placeholder="비밀번호 확인" maxlength="20" value="">
							<font id="check" size="2" color="red"></font>
						<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
					</div>
				</div>
				<!-- 비밀번호 찾기 질문 답
				<div class="form-group">
					<label class="col-sm-3 control-label">비밀번호 찾기 질문</label>
					<div class="col-sm-6">
						<select name="pwdQ" class="form-control">
							<option disabled="disabled">*비밀번호 확인 질문 선택</option>
							<option  value="1">내가 태어난 고향은?</option>
							<option  value="2">감명 깊게 읽은 책의 제목은?</option>
							<option value="3">보물 제 1호는?</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">비밀번호 답 입력</label>
					<div class="col-sm-6">
						<input class="form-control" id="pwdA" name="pwdA" type="text" placeholder="*비밀번호 찾기 답입력">
					</div>
				</div> -->
				<!-- 이름  -->
				<div class="form-group">
					<div class="col-sm-6">
						<input class="form-control" id="name" name="name" type="text"
							placeholder="*이름입력">
											</div>
				</div>
				<!-- 전화번호 -->
				<div class="form-group">
					<div class="col-sm-6">
						<input class="form-control" id="userTel" name="userTel" type="text"
						maxlength="12"
							placeholder="* 휴대폰번호 입력(-제외 입력)">
					</div>
				</div>
				<!-- 성별 -->
				<div class="form-group">
					<div class="col-sm-6">
						<select name="gender" class="form-control">
						<option value="S">성별을 선택해주세요.</option>
							<option value="M">남자</option>
							<option value="W">여자</option>
						</select>
					</div>
				</div>
				<!--  주소 입력란 -->
				<div class="form-group">
					<div class="col-sm-6">
						<div class="input-group">
							<input type="text" class="form-control" id="post_addr"  name="postAddr"readonly
								placeholder="*우편번호"> 
								<input type="text" class="form-control" id="addr1" name="addr1" readonly
								placeholder="*주소">
								<input type="text" class="form-control" id="addr2" name="addr2"
								placeholder="*주소입력">
								<span class="input-group-btn">
								<input type="button" class="btn btn-primary" onclick="postcode_addr()" readonly value="주소 선택" />
							</span>
						</div>
					</div>
				</div>
				<!-- 회원가입 취소 버튼 -->
				<div class="form-group">
					<div class="col-sm-12 text-center">
						
						<button class="btn btn-danger"  type="reset">
							가입취소<i class="fa fa-times spaceLeft"></i>
						</button>
						<button class="btn btn-primary" id="regSub"  type="submit">
							회원가입<i class=""btn btn-primary""></i>
						</button>
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
      
      <!-- 아이디찾기 -->
      <script>
      function idFind(){  //클릭하면 네임과 텔 들어감
      var name=$('#idName').val();
	  var userTel=$('#userTel').val();
      $.ajax({
    	  url:"/idFind.do",
    	  method:"post",
    	  data:{
    		  "idName":idName,
    		  "userTel":userTel
    	  },
    	  sucess:function(data){
    				  
    			  },
    			  error:function(){
    				  
    			  }
      })
      }
      
      
      </script>
      
      <%@include file = "/WEB-INF/view/user/userScript.jsp" %>
      </body>
</html>

