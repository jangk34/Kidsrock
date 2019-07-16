<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.NoticeDTO" %>
<%@page import="poly.dto.UserDTO" %>
<%@page import="java.util.List"%>
<%@page import="poly.util.DateUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//모델에서 받는것은 getAttribute();

	NoticeDTO nDTO=(NoticeDTO) request.getAttribute("nDTO");
	UserDTO uDTO=(UserDTO) request.getAttribute("uDTO");
	/* System.out.println("jsp : " + CmmUtil.nvl(nDTO.getNtNo()));
	//고친부분 리스트 써서 널값은 없앴는데 이렇게 해도되는지 */
%>
<%
	List<NoticeDTO> nList = (List<NoticeDTO>)request.getAttribute("nList");
	List<UserDTO> uList = (List<UserDTO>)request.getAttribute("uList");
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
	  <script src="/bootstrap-3.3.2-dist/js/jquery.form.min.js"></script>

<script>
	// 방식으로 보여주기
	$(function() {
		$("#reviewListView")
				.click(
						function() {

							$
									.ajax({

										url : "/notice/reviewList.do",
										type : 'GET',
										success : function(data) {
											var contents = "";
											var jsonObj = new Array();
											for (var i = 0; i < data.length; i++) {
												var value = data[i];
												if (i < 4) {
													contents += '<div class="hd-list-three" style="display: block;" >';//style="display: block;"
													
													var menuName = '';
													
													for (var p = 0; p <Number(value.menuName); p++) {
														
													}
												
													
														
												    contents += '<div><p><a href="#">'
															+ value.menuName
															+ '</a></p></div>';

													var Star = '';

													for (var j = 0; j < Number(value.Star); j++) {
														Star += '<img src = "/resouces/Img/Yello1.png" style="width:20" >'
													}
													for (var k = 0; k < 5 - Number(value.Star); k++) {
														Star += '<img src = "/resouces/Img/White.png" style="width:20" >'
													}
													contents += '<div>'
															+ Star
															+ '</div>';
													contents += '<div><p>'
															+ value.Review
															+ '</p></div>';
													contents += '<div><p>'
															+ value.rvWriter
															+ '</p></div>';
													contents += '</div>';

												} else {
													contents += '<div class="hd-list-three">';//style="display: block;"
													contents += '<div><p><a href="#">'
															+ value.menuName
															+ '</a></p></div>';
													var Star = '';

													for (var j = 0; j < Number(value.Star); j++) {
														Star += '<img src = "/resouces/Img/Yello1.png" style="width:20" >'
													}
													for (var k = 0; k < 5 - Number(value.Star); k++) {
														Star += '<img src = "/resouces/Img/White.png" style="width:20" >'
													}

													contents += '<div>'
															+ Star
															+ '</div>';
													contents += '<div><p>'
															+ value.Review
															+ '</p></div>';
													contents += '<div><p>'
															+ value.rvWriter
															+ '</p></div>';
													contents += '</div>';

												}
												$('#reviewList').html(contents);
											}

										},
										error : function(error) {
										}

									});
						});

	});

	//눌렀을때 계속 추가
	function ReviewReg() {

		$('#ajaxform')
				.ajaxForm(
						{
							beforeSubmit : function() {
								if ($('#menuName').val() == '0') {
									alert("구매했던 메뉴를 선택해주세요");
									$('#menuName').focus();
									return false;
								} else if ($('#Review').val() == "") {
									alert("내용을 입력해주세요");
									$('#Review').focus();
									return false;
								}
								;

							},
							success : function(data) {
								alert('성공');
								var contents = ""
								console.log(data);
								for (var i = 0; i < data.length; i++) {
									var value = data[i];

									if (i < 4) {
										contents += '<div class="hd-list-three" style="display: block;" >';//style="display: block;"
										contents += '<div><p><a href="#">'
												+ value.menuName
												+ '</a></p></div>';
										var Star = '';

										for (var j = 0; j < Number(value.Star); j++) {
											Star += '<img src = "/resources/img/Yello1.png" style="width:20" >'
										}
										for (var k = 0; k < 5 - Number(value.Star); k++) {
											Star += '<img src = "/resources/img/White.png"  style="width:20">'
										}

										contents += '<div>' + Star
												+ '</div>';
										contents += '<div><p>'
												+ value.Review
												+ '</p></div>';
										contents += '<div><p>' + value.rvWriter
												+ '</p></div>';
										contents += '</div>';

									} else {
										contents += '<div class="hd-list-three">';//style="display: block;"
										contents += '<div><p><a href="#">'
												+ value.menuName
												+ '</a></p></div>';
										var Star = '';

										for (var j = 0; j < Number(value.Star); j++) {
											Star += '<img src = "/resources/img/Yello1.png" style="width:20" >'
										}
										for (var k = 0; k < 5 - Number(value.Star); k++) {
											Star += '<img src = "/resources/img/White.png"  style="width:20">'
										}

										contents += '<div>' + Star
												+ '</div>';
										contents += '<div><p>'
												+ value.Review
												+ '</p></div>';
										contents += '<div><p>' + value.rvWriter
												+ '</p></div>';
										contents += '</div>';

									}
									$('#reviewList').html(contents);
								}

							},
							error : function() {
								alert("에러발생");
							}
						}).submit();
	};
</script>
<script>
	function ansUncom(str) {
		alert(str);
	};
</script>
<script>
	$(function() {
		var comId = $('#comId').val();
		if (comId == "") {
			cont = '커뮤니티';
			$('#chgWrite').html(cont);
		} else if (comId == '1') {
			cont2 = '커뮤니티 <a href="/notice/noticeReg.do" style="100px; float:right">공지 글쓰기</a> ';
			$('#chgWrite').html(cont2)
			$('#chgWrite1')
					.click(
							function() {
								cont = '커뮤니티 <a href="/board/boardReg.do" style="100px; float:right">공지 글쓰기</a> ';
								$('#chgWrite').html(cont)

							});
			$('#chgWrite2')
					.click(
							function() {
								cont = '커뮤니티 <a href="/qna/questionReg.do" style="100px; float:right">질문 글쓰기</a>';
								$('#chgWrite').html(cont);
							})
			$('#reviewListView').click(function() {
				cont = '커뮤니티';
				$('#chgWrite').html(cont);
			});

		} else {
			$('#chgWrite1').click(function() {
				cont = '커뮤니티';
				$('#chgWrite').html(cont)

			});
			$('#chgWrite2')
					.click(
							function() {
								cont = '커뮤니티 <a href="/qna/questionReg.do" style="100px; float:right">질문 글쓰기</a>';
								$('#chgWrite').html(cont);
							})
			$('#reviewListView').click(function() {
				cont = '커뮤니티';
				$('#chgWrite').html(cont);
			});

		}
	})
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
        	<h4 style="text-align:center; text-border:30px;"><Strong>커뮤니티</Strong></h4>
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
		
			<form class="form-horizontal" style="padding-top:25px" action="/user/userRegProc.do" method="post" ><!--onsubmit="checked()" -->

			<!-- review 및 별점입니다.  크기 조절은 알아서 해주세요 css  적용-->
			<div id="menu3" class="tab-pane">
				<div class="hd-list-top-three">
					<div>상품명</div>
					<div>별점</div>
					<div>리뷰</div>
					<div>작성자</div>
				</div>
				<!--  별점 기능 넣기 인터넷 찾아서 -->
				<div id="reviewList"></div>
				<div style="clear: both;"></div>
				<!-- 문자밀림 방지하기 위해서 -->

				<!-- 리뷰 목록 끝-->
				<div style="clear: both;"></div>
				<!-- -------------------------------리뷰 별점 등록 화면 ------------------------------------------------- -->
				<!-- 여기도 modal 구현해야됨 -->

				<%-- <%
					if (userNo != "") {
				%> --%>
				<!-- 보내기  폼-->
				<form id="ajaxform" action="/community/communtityOneProc.do"
					method="post">
					<!-- 회원이 구매한 메뉴 보여주기 -->
					<div class="form-group" style="width: 30%; float: left">
						<select class="form-control" id="menuName" name="menuName">
							<option value="1">1111</option>
							<option value="2">2222</option>
							<option value="3">3333</option>
							

						</select>
					</div>
					<!-- 별점 -->
					<div style="width: 30%; float: left; text-align: center">
						<select id="example" name="Star">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</div>
					<script type="text/javascript">
						$(function() {
							$('#example').barrating({
								theme : 'fontawesome-stars'
							});
						});
					</script>

					<!-- 회원번호  -->
				<input type="hidden" name="ntWriter" <%-- value="<%=nDTO.getNtWriter()%>" --%> /> 

					<div style="width: 30%; float: left">
						<input type="text" id="Review" name="Review"
							class="form-control" placeholder="*댓글을 입력해주세요" />
					</div>
					<div>
						<a href="javascript:ReviewReg()" class="btn btn-success">등록</a>
					</div>
				</form>
				<%-- <%
					}
				%> --%>
				<!-- 리뷰등록 -->

				<a href="#" id="load-three" style="width: 100%"
					class="btn btn-primary">리뷰 더보기</a>
				<!-- ------------------------------------------------------------------------ -->
			</div>
		</div>

	</div>

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