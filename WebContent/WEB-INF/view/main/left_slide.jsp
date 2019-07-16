<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<script type="text/javascript">
	function logout() {
		location.href="/user/logout.do";
	}
	
</script>
				<div style="width:25%; float:left;">
	               <nav class="slide-nav aside-nav">  
				      <ul>
				      	<%-- <li> 
					      	<span style="float:left; padding:10px; cursor:pointer;" onclick="location.href='<%=request.getContextPath()%>/user_login.do'"><img src="<%=request.getContextPath()%>/resources/img/bt_icon/logout_btn.svg" style="height:4.5rem;"></span>
					      	<span style="float:right; padding:10px; cursor:pointer;" onclick="location.href='<%=request.getContextPath()%>/mypage/alim.do'"><img src="<%=request.getContextPath()%>/resources/img/bt_icon/alert_btn.svg" style="height:4.5rem;"></span>
				      	 </li>  --%>
				      	 <li style="clear:both;">  
							<div style="border-radius:60px; width:180px; height:180px; margin:0 auto;">
							</div>				      	 
				      	 </li>
<!-- 				      	 <li style="text-align:center; font-size:19px; color:#7DDFFF; font-weight:bold; padding-top:15px; padding-bottom:5px;">미어캣</li>
 -->				         <li style="padding-bottom:45px; padding-left:5px; padding-right:5px;">
				         	<%-- <div style=" text-align:center; margin-bottom:-3px; padding:0;"><img src="<%=request.getContextPath()%>/resources/img/main/trangle.svg" style="height:1rem;"></div> --%>
				         	<div style="color:#ffffff; width:100%; font-size:11px; text-align:center; padding:15px; background-color:#284757;">
				         	<%-- <p readonly value="<%=uDTO.getEmail()%>"></p> --%>
				         	</div>
				         </li>
				         <li style="padding-bottom:15px; text-align:center; font-size:16px; color:white;"><%=session.getAttribute("email") %>님<br/> 환영합니다.<br/><button class="btn btn-secondary" onclick="logout();">로그아웃</button></li>
				         <li style="padding-bottom:15px;"><a href="<%=request.getContextPath()%>/main.do" style="font-size:16px;">키즈락 홈</a></li>
				         <li style="padding-bottom:15px;"><a href="<%=request.getContextPath()%>/user/userLogin.do"  style="font-size:16px; ">로그인</a></li>
				         <li style="padding-bottom:15px;"><a href="<%=request.getContextPath()%>/user/userReg.do" style="font-size:16px;">회원가입</a></li>
				         <li style="padding-bottom:15px;"><a href="<%=request.getContextPath()%>/user/myPage.do" style="font-size:16px;">마이페이지</a></li>
		<%-- 		         <li style="padding-bottom:15px;"><a href="<%=request.getContextPath()%>/main.do" style="font-size:16px;">내 클럽</a></li> --%>
				        
				         <%-- <li style="padding-bottom:15px;"><a href="<%=request.getContextPath()%>/board/customer_center.do" style="font-size:16px;">고객센터</a></li> --%>
				        <!--  <li>
				        
				            <a>Product</a>
				            <ul>
				               <li><a>Product 1</a></li>
				               <li><a>Product 2</a></li>
				               <li>
				                  <a>Product 3</a>
				                  <ul>
				                     <li><a>Product 3-1</a></li>
				                     <li><a>Product 3-2</a></li>
				                     <li><a>Product 3-3</a></li>
				                  </ul>''
				               </li>
				            </ul>
				         </li>
				         <li>
				            <a>Company</a>
				            <ul>
				               <li><a>About</a></li>
				               <li><a>Location</a></li>
				            </ul>
				         </li>
				         <li><a>Contact</a></li> -->
				        <li style="text-align:center; width:100%; color:#999999; font-size:10px; padding-top:40px;"> 
				      		ⓒ Copyright 2018 키즈락 All rights reserved.
				      	</li>
				      </ul>
				    </nav> 
				</div>  