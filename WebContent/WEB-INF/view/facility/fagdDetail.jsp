<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.NoticeDTO" %>
<%@page import="java.util.List"%>
<%@page import="poly.dto.UserDTO" %>
<%@page import="poly.dto.FaDTO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<FaDTO> fList= (List<FaDTO>)request.getAttribute("fList");
	List<NoticeDTO> nList= (List<NoticeDTO>)request.getAttribute("nList");
	FaDTO fDTO=(FaDTO) request.getAttribute("fDTO");

	/* System.out.println("jsp : " + CmmUtil.nvl(nDTO.getNtNo()));
	//고친부분 리스트 써서 널값은 없앴는데 이렇게 해도되는지 */
%>
<script>
/* <!-- 다음주소 --> */
function postcode_addr(){
new daum.Postcode({
    oncomplete: function(data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
        // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        //팝업에서 검색결과 항목을 클릭했을떄 실행할코드 작성
        var fullAddr='';
        var extraAddr='';
        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            fullAddr = data.roadAddress;

        } else { // 사용자가 지번 주소를 선택했을 경우(J)
            fullAddr = data.jibunAddress;
        }
     // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
        if(data.userSelectedType === 'R'){
            //법정동명이 있을 경우 추가한다.
            if(data.bname !== ''){
                extraAddr += data.bname;
            }
            // 건물명이 있을 경우 추가한다.
            if(data.buildingName !== ''){
                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
            fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
        }
     // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.getElementById('post_addr').value = data.zonecode; //5자리 새우편번호 사용
        document.getElementById('addr1').value = fullAddr;

        // 커서를 상세주소 필드로 이동한다.
        document.getElementById('addr2').focus();
    }
}).open();
}


</script>
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
   <script  src="http://code.jquery.com/jquery-3.3.1.js"></script>
   <link rel="stylesheet" type="text/css" href="/bootstrap-3.3.2-dist/css/fainfo.css" />
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

			 <div class="col remove-padding contianer-relative">
	        	  <div class="item item-image clear-border" >
	  	 	<img style="width:100%; height:250px;" src="<%=request.getContextPath()%>/resources/img/11111.jpg" style="height:5rem;" "alt="">
	       <h4 class="content-center-text-absolute white-text"></h4>
	       <!--disply:grid; position:relative; z-index:100;"   -->
	       <!-- <div style="opacity:0.7; overlay:0.7; display:-webkit-inline-box; height:70px; position:absolute; width:100%; top:347px; bottom:100px; background:gray;"></div> -->

	       </div>
	       	       
	       </div>
				
	       <!--disply:grid; position:relative; z-index:100;"   -->
	       <!-- <div style="opacity:0.7; overlay:0.7; display:-webkit-inline-box; height:70px; position:absolute; width:100%; top:347px; bottom:100px; background:gray;"></div> -->

	       </div>
	       	       
	       </div>

	<!-- 시설정보 내용 -->
		<div class="container">
			<!--이미지 -->
			<!--이미지 불러오기 -->

			<div id="infocontent" class="infocontent">
				<div class="ci_box_areai">

					<div class="ciz_name_areai">

						<input type="text" maxlength="30"
							style="word-break: break-all; width: 100%; border: 0; margin-left: auto; margin-right: auto; display: block; text-align: center;"
							class="name" readonly value="<%=fDTO.getFaname()%>" />
					</div>
				</div>
				<div class="ci_box_areai"
					style="margin-top: 2%; width: 100%; margin-bottom: 2%">
					<div class="cizinfo_areai">
						<div class="list_cizinfo" style="padding:15px;">
							<!-- 주소  -->
							<div style="width: 100%">
								<div style="margin-top:6px; margin-bottom:40px;">
									<p style="float: right" class="icon-pointer"></p>
									<p style="text-align:center; font-size:18px; line-height:18px; font-weight:bold;"><주소></p>
									<p name="txt" style="font-size:12px; width: 100%; border: 0; ">
										<%=fDTO.getFaaddr1()%>
									</p>
								</div>
							<!-- 전화번호  -->
								<div style="margin-top:6px; margin-bottom:40px;">
									<p style="text-align:center; font-size:18px; line-height:18px; font-weight:bold;"><핸드폰번호></p>
									<p style="width: 100%; border: 0; font-size:12px; text-align:center;"/><%=fDTO.getFatel()%></p>
								</div>
							<!-- 여는 시간  -->
								<div style="margin-top:6px; margin-bottom:40px;">
									<p style="text-align:center; font-size:18px; line-height:18px; font-weight:bold;"><여는시간></p>
									<p style="width: 100%; border: 0; font-size:12px; text-align:center;"/><%=fDTO.getFaopt()%></p>
								</div>
							<!-- 닫는 시간  -->
								<div style="margin-top:6px; margin-bottom:40px;">
									<p style="text-align:center; font-size:18px; line-height:18px; font-weight:bold;"><닫는시간></p>
									<p style="width: 100%; border: 0; font-size:12px; text-align:center;"/><%=fDTO.getFaclt()%></p>
								</div>
								<div style="margin-top:6px; margin-bottom:40px;">
									<p style="text-align:center; font-size:18px; line-height:18px; font-weight:bold;"><내용></p>
									<p style="width: 100%; border: 0; font-size:12px; text-align:center;"/><%=fDTO.getFacontent()%></p>
								</div>
							</div>

							<!-- 글 내용 -->
									<%-- <p style="float: left">CONTENT :</p>
								</div>
								<div class="col-sm-8 wrapi">
									<textarea class="autosize" onkeydown="resize(this)"
										onkeyup="resize(this)" name="txt"
										style="cols: 10; float: left; overflow: hidden; resize: none; width: 100%; border: 0; margin-left: auto; margin-right: auto;"><%=fDTO.getFacontent()%></textarea>
								</div> --%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- <input type="text" id="sample5_address" placeholder="주소">
<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br> -->
		<div style="width: 100%">
			<div id="map"
				style="width: 100%; height: 100%;"></div></div>


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
      			<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
			<script
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c09c0f4cae21431cb83a41042bbed743&libraries=services"></script>
<script>
		function geoFindMe() {
			  var output = document.getElementById("out");

			  if (!navigator.geolocation){
			    output.innerHTML = "<p>사용자의 브라우저는 지오로케이션을 지원하지 않습니다.</p>";
			    return;
			  }

			  function success(position) {
			    var latitude  = position.coords.latitude;
			    var longitude = position.coords.longitude;

			    output.innerHTML = '<p>위도 : ' + latitude + '° <br>경도 : ' + longitude + '°</p>';

			    var img = new Image();
			    img.src = "http://maps.googleapis.com/maps/api/staticmap?center=" + latitude + "," + longitude + "&zoom=13&size=300x300&sensor=false";

			    output.appendChild(img);
			  };

			  function error() {
			    output.innerHTML = "사용자의 위치를 찾을 수 없습니다.";
			  };

			  output.innerHTML = "<p>Locating…</p>";

			  navigator.geolocation.getCurrentPosition(success, error);
			}
		</script>
	
	
<div style="width: 100%">
			<div id="map"
				style="width: 100%; height: 100%;"></div></div>

			<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
			<script
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c09c0f4cae21431cb83a41042bbed743&libraries=services"></script>

			<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch("<%=fDTO.getFaaddr1()%>", function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === daum.maps.services.Status.OK) {

    var coords = new daum.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new daum.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">"<%=fDTO.getFaname() %>"</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
    
    map.addOverlayMapTypeId(daum.maps.MapTypeId.TRAFFIC);  
    
    
} 
}); 
			</script>	
	
			</script>
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
