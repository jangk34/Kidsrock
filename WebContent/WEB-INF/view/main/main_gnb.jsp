<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	 <%@include file="/WEB-INF/view/main/left_slide.jsp"%> 
   <div style="width:50%; float:left; text-align:center;">
   		<img src="<%=request.getContextPath()%>/resources/img/logo.png" style="width:8.5rem; margin-top:5px;">
   </div>
   <div style="width:25%; float:left; text-align:right;">
   <img onclick="javascript:location.href='/facility/faSearch.do'" src="<%=request.getContextPath()%>/resources/img/search.svg" style="width:2.8rem; margin-top:20px; margin-right:10px; "alt="">
   </div>
