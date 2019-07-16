<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.NoticeDTO" %>
<%@page import="poly.dto.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
 	String email = CmmUtil.nvl((String) session.getAttribute("email"));
	String name = CmmUtil.nvl((String) session.getAttribute("name"));
	String userNo = CmmUtil.nvl((String) session.getAttribute("userNo"));
	String msg = (String)request.getAttribute("msg");
	String url = (String)request.getAttribute("url");

	//모델에서 받는것은 getAttribute();
	NoticeDTO nDTO=(NoticeDTO) request.getAttribute("nDTO");
	UserDTO uDTO=(UserDTO) request.getAttribute("uDTO");
	/* System.out.println("jsp : " + CmmUtil.nvl(nDTO.getNtNo()));
	//고친부분 리스트 써서 널값은 없앴는데 이렇게 해도되는지 */
%>
      <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-1.8.3.min.js"></script>
      <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-ui.min.js"></script>   
<%-- <script type="text/javascript">
if (msg=="") {
	alert("<%=msg%>");
location.href = "<%=url%>";
	}
</script> --%>

<!DOCTYPE html>
<html>
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
      
 <style>

@import url(http://weloveiconfonts.com/api/?family=fontawesome);
@import url(http://fonts.googleapis.com/css?family=Open+Sans:400,700);
[class*="fontawesome-"]:before {
  font-family: 'FontAwesome', sans-serif;
}

* {
  box-sizing: border-box;
}


a {
  color: #eee;
  outline: 0;
  text-decoration: none;
}
a:focus, a:hover {
  text-decoration: underline;
}

input {
  border: 0;
  color: inherit;
  font: inherit;
  margin: 0;
  outline: 0;
  padding: 0;
  -webkit-transition: background-color .3s;
          transition: background-color .3s;
}


.form input[type="password"], .form input[type="text"], .form input[type="submit"] {
  width: 100%;
}
.form--login {
  color: #606468;
}
.form--login label,
.form--login input[type="text"],
.form--login input[type="password"],
.form--login input[type="submit"] {
  border-radius: 0.25rem;
  padding: 1rem;
}
.form--login label {
  background-color: #363b41;
  border-bottom-right-radius: 0;
  border-top-right-radius: 0;
  padding-left: 1.25rem;
  padding-right: 1.25rem;
}
.form--login input[type="text"], .form--login input[type="password"] {
  background-color: #ffffff;
  border-bottom-left-radius: 0;
  border-top-left-radius: 0;
}
.form--login input[type="text"]:focus, .form--login input[type="text"]:hover, .form--login input[type="password"]:focus, .form--login input[type="password"]:hover {
  background-color: #ffffff;
}
.form--login input[type="submit"] {
  background-color: #3399cc;
  color: #eee;
  font-weight: bold;
  text-transform: uppercase;
}
.form--login input[type="submit"]:focus, .form--login input[type="submit"]:hover {
  background-color: #d44179;
}
.form__field {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  margin-bottom: 1rem;
}
.form__input {
  -webkit-box-flex: 1;
  -webkit-flex: 1;
      -ms-flex: 1;
          flex: 1;
}

.align {
  -webkit-box-align: center;
  -webkit-align-items: center;
      -ms-flex-align: center;
          align-items: center;
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
  -webkit-flex-direction: row;
      -ms-flex-direction: row;
          flex-direction: row;
}

.hidden {
  border: 0;
  clip: rect(0 0 0 0);
  height: 1px;
  margin: -1px;
  overflow: hidden;
  padding: 0;
  position: absolute;
  width: 1px;
}

.text--center {
  text-align: center;
}

.grid__container {
  margin: 0 auto;
  max-width: 20rem;
  width: 90%;
}

</style>
<script type="text/javascript">
	function logout() {
		location.href="/main.do";
	}
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
        	<h4 style="text-align:center; text-border:30px;"><Strong>로그인</Strong></h4>
        </div>
      </div>
             
            </div>
          </nav>
        </header>
        </section>
        <section class="text-center">
          <div class="container">
		<div class="col-md-12">
			<!-- <div style="padding-top:10px"> -->
				
		<%-- 	</div>
	<!-- 뒤늦게 찾은  if문 -->	
		<div align="right">
	<%if(!"".equals(email)) {%>
		<!-- 로그인 된 상태 -->
		<b><%=email + "님 환영합니다." %></b>
		<b><button onclick="logout();">로그아웃</button></b>
	<%}
	else
	{%>
		<!-- 로그인 안 된 상태 -->
		<form action="/user/loginProc.do" method="post">
			<b>ID</b> 
			<input type="text" name="id" /> 
			<b>Password</b>
			<input type="password" name="password" /> 
			<input type="submit" value="로그인" />
		</form>
	<%} %>
</div>
		 --%>
		
		
			<form class="form-horizontal form form--login" style="padding-top:25px" action="/main.do" method="post" ><!--onsubmit="checked()" -->
				</form>
		<%-- 		<!-- 로그인  -->

 <div class="grid__container">

		<div style="text-border:1px">
        <div class="form__field">
          <label class="fontawesome-user" for="login__username"><span class="hidden">아이디</span></label>
          <input id="login__username" type="text" class="form__input" placeholder="아이디" required>
        </div>
        </div>

        <div class="form__field">
          <label class="fontawesome-lock" for="login__password" style="maring-top:100px"><span class="hidden">비밀번호</span></label>
          <input id="login__password" type="password" class="form__input" placeholder="비밀번호" required>
        </div>

       

      </form>

      <p class="text--center">아직 회원이 아니신가요? <a href="<%=request.getContextPath()%>/user/userReg.do">회원가입</a> <span class="fontawesome-arrow-right"></span></p>
    </div>

  </div> 
  
  
  <div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="/menu/menuList.do">메뉴<span class="sr-only"></span></a></li>
				<li><a href="/cafe/cafeInfo.do?cafeNo=1">카페 정보<span class="sr-only"></span></a></li>
				<li><a href="/notice/communityTab.do">커뮤니티<span class="sr-only"></span></a></li> --%>
				
				<!-- 여기도 if문  userno =1 인거 관리자-->
				<%-- 
				<% if(userNo.equals("1")) { %>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<!--  연습용으로 넘어가게 지정해놓음 -->
						<li><a href="/user/userList.do">회원 관리</a></li>
						<li><a href="/menu/menuReg.do">메뉴 관리</a></li>
						<li><a href="/order/orderList.do">주문 관리</a></li><!--  해야됨 -->
						<li><a href="/cafe/cafeInfoManage.do">카페 관리</a></li>
						<li><a href="/bigData/bigData.do">빅데이터 분석 관리</a></li>
					</ul></li>
				<%} %> --%>
			
				<!--  장바구니 마이페이지 -->
			<!--  email 이 공백이 아니면 로그인 성공 -->
			<% if (!"".equals(email)) {%>
			<!--  로그인 성공 -->
			<div class="navbar-form navbar-right">
				<b><%=email + "님 환영합니다"%></b> 
				<%-- <a href="/user/userLogin.do?userNo=<%=email%>" class="btn btn-info">로그인</a>  --%>
				<button class="btn btn-secondary" onclick="logout();">로그아웃</button>
			</div>
			
			<%} else { %>
			
			<!--  로그인 패스워드 입력 -->
			
			<form class="navbar-form navbar-right" action="/user/userLoginProc.do" method="post">
			<div>
					<input style="margin-top:15px; margin-bottom:15px;" type="text" name="email" class="form-control" placeholder="이메일 아이디 입력">
				</div>
				<div style="margin-bottom:15px;">
					<input type="password" name="password" class="form-control" placeholder="비밀번호 입력">
				</div>
				<input style="width:100%; margin-bottom:15px;" type="submit" class="btn btn-primary" id="" value="로그인" />
				<!-- <a href="/user/userFind.do"class="btn btn-success">ID/PW찾기</a> -->
				
				
					<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>   

   <!-- 카카오 로그인 시작 -->
                                         <div class="col-sm-12 text-center">
                                            <a id = "kakao-login-btn"></a>
                                         </div>
                                         <script type='text/javascript'>
                                    //<![CDATA[
                                    // 사용할 앱의 JavaScript 키를 설정해 주세요.
                                    Kakao.init('43345c9ebcab9cfdb9af11b8112451b4');
                                    var kId = '';
                                    var kName = '';
                                    // 카카오 로그인 버튼을 생성합니다.
                                    Kakao.Auth.createLoginButton({
                                       container : '#kakao-login-btn',
                                       success : function(authObj) {
                                          // 로그인 성공시, API를 호출합니다.
                                          Kakao.API.request({
                                             url: '/v2/user/me',
                                             success: function(res){
                                                alert(JSON.stringify(res));
                                                kId = JSON.stringify(res.id);
                                                kName = JSON.stringify(res.properties.nickname);
                                                kEmail = JSON.stringify(res.kakao_account.email);
                                                console.log(" res.id : " +JSON.stringify(res.id));
                                                console.log(" res.properties.nickname : " + JSON.stringify(res.properties.nickname));
                                                console.log(" kId : " + JSON.stringify(res.id));
                                                console.log(" kName : " + JSON.stringify(res.properties.nickname));
                                                location.href='/kakaoCallback.do?kId='+kId+'&kName='+kName+'&kEmail='+kEmail;
                                             },
                                             fail: function(error){
                                                alert(JSON.stringify(error));
                                             }
                                          });
                                          alert(JSON.stringify(authObj));
                                       },
                                       fail : function(err) {
                                          alert(JSON.stringify(err));
                                       }
                                    });
                                    //]]>   
                                 </script>


	
			
				
				<%} %>
			<!-- 로그인 하고 나서  '아이디' 님 환영합니다. -->
	
		</div>
				
				
				
				<div style="margin-bottom:15px;">
				   	 <p class="text--center">아직 회원이 아니신가요? <a href="<%=request.getContextPath()%>/user/userReg.do">회원가입</a> <span class="fontawesome-arrow-right"></span></p>
	  				 <p class="text--center">아이디&비밀번호를 잊으셨나요? <a href="<%=request.getContextPath()%>/user/userSearch.do">아이디/비밀빈호 찾기</a> <span class="fontawesome-arrow-right"></span></p>
				   
				   </div>.
			</form>
			
	
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
