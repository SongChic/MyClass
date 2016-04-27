<%@page import="com.myClass.Common.MyclassCommon"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath }" var="ctx"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/meta.jsp" %>

<link rel="stylesheet" type="text/css" href="${ctx }/css/fullcalendar-setting.css">
<link rel="stylesheet" type="text/css" href="${ctx }/css/main.css">

<c:set value="${member.mainColor }" var="mainColor"/>
<style type="text/css">
	#header {
		background-color : <%= MyclassCommon.mainColor[(Integer)pageContext.getAttribute("mainColor")] %>
	}
	.drop-item {
		background-color : <%= MyclassCommon.mainColor[(Integer)pageContext.getAttribute("mainColor")] %>
	}
</style>

</head>
<body>
	<div id="wrap">
		<%@include file="/WEB-INF/views/include/header.jsp" %>
		<div id="container">
			<div class="row">
				<div class="calendar-wrap">
					<div class="calendar-btn calendar-show mouse-pointer"><i class="fa fa-chevron-down"></i></div>
					
					<div class="calendar">
					<!-- calendar -->
					</div>
				</div>
				
				<div class="content row">
					<div class="col-md-8 col-sm-7">
						<h4>우리반</h4>
					</div>
					
					<div class="col-md-4 col-sm-5">
						<h4>숙제 / 시험</h4>
						
						<!-- dummy model (s) -->
						<div class="box-layout">
							<div class="box-wrap">
								<h4>시험지 제목</h4>
								
								<ul>
									<li>기간 : 2016.04.06 ~ 2016.04.08</li>
									<li>제한시간 : 160분</li>
									<li>과목 : 수학</li>
									<li>교재 : 수학</li>
								</ul>
							</div>
							<p class="bg-primary">
								출제 선생님 : 송석우
							</p>
						</div>
						
						<!-- dummy model (e) -->
					</div>
				</div>
			</div>
		</div>
		
		<div id="footer">
		</div>
	</div>

<script type="text/javascript">
var ctx = "${ctx }";
</script>

<%@include file="/WEB-INF/views/include/common-lib.jsp" %>
<script type="text/javascript" src="${ctx }/js/fullcalendar-setting.js" ></script>	
<script type="text/javascript">
	$(".calendar-btn").on("click", function(event){
		var state = $(this).attr("class");
		
		if (state.indexOf("calendar-show") > -1) {
			$(".calendar").slideDown();
			$(this).removeClass("calendar-show")
				   .addClass("calendar-hide")
				   .find("i")
				   .removeClass("fa-chevron-down")
				   .addClass("fa-chevron-up");
		} else {
			$(".calendar").slideUp();
			$(this).removeClass("calendar-hide")
				   .addClass("calendar-show")
				   .find("i")
				   .removeClass("fa-chevron-up")
				   .addClass("fa-chevron-down");
		}
		
	});
	
</script>
</body>
</html>