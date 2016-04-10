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
		<div id="header">
			<div class="gnb row">
				<div class="gnb-wrap row">
					<ul class="row">
						<c:choose>
							<c:when test="${member.userType == 2 }">
								<li><i class="fa fa-plus"></i> 자녀 등록</li>	
							</c:when>
							<c:when test="${member.userType == 3 }">
								<li><i class="fa fa-plus"></i> 부모님 등록</li>	
							</c:when>
						</c:choose>
						
						<li><a href="${ctx }/setting"><i class="fa fa-cog"></i> 설정</a></li>
						<li><i class="fa fa-university"></i> 학교별정보</li>
						<li><i class="fa fa-bullhorn"></i> 공지사항</li>
						<li><i class="fa fa-television"></i> 강좌</li>
						<li><i class="fa fa-book"></i> 메뉴얼</li>
						<li><a href="${ctx }/logout"><i class="fa fa-sign-in"></i> 로그아웃</a></li>
					</ul>
				</div>
			</div>
			
			<div class="lnb row">
				
					<h3 class="logo hidden-xs pull-left"><a href="${ctx }/">My Class</a></h3>
					<h3 class="visible-xs mobile-title mouse-pointer pull-left"><i class="fa fa-bars"></i> ${member.memId }</h3>
					
			
				<div class="quick-menu pull-right">
					<ul class="row">
						<li>
							<i class="fa fa-users"></i>
							<span><i class="fa fa-caret-up"></i>그룹채팅</span>
						</li>
						<li>
							<i class="fa fa-pencil-square-o"></i>
							<span><i class="fa fa-caret-up"></i>진행반</span>
						</li>
						<li>
							<i class="fa fa-newspaper-o"></i>
							<span><i class="fa fa-caret-up"></i>진행시험</span>
						</li>
						<li>
							<i class="fa fa-search"></i>
							<span><i class="fa fa-caret-up"></i>회원검색</span>
						</li>
					</ul>
				</div>
				
				<div class="s-menu pull-left">
					<ul class="row">
						<li class="drop-menu">
							<a>
								회원
								<span>Member</span>
							</a>
							<ul class="drop-item">
								<li><a href="${ctx }/teacher/members/manageMembers?type=1">대기회원</a></li>							
								<li><a href="${ctx }/teacher/members/manageMembers?type=2">회원</a></li>							
								<li><a href="${ctx }/teacher/members/manageMembers?type=3">퇴원</a></li>							
							</ul>
						</li>
						<li class="drop-menu">
							<a>
								수업
								<span>Class</span>
							</a>
							<ul class="drop-item">
								<li><a href="${ctx }/teacher/classes/manageClasses?type=1">예정반</a></li>							
								<li><a href="${ctx }/teacher/classes/manageClasses?type=2">우리반</a></li>							
								<li><a href="${ctx }/teacher/classes/manageClasses?type=3">종강반</a></li>							
							</ul>
						
						</li>
						<li class="drop-menu">
							<a>
								교재
								<span>Textbook</span>
							</a>
							<ul class="drop-item">
								<li><a href="${ctx }/teacher/mac/textbook?type=1">전체교재</a></li>							
								<li><a href="${ctx }/teacher/mac/textbook?type=2">내 교재</a></li>							
								<li><a href="${ctx }/teacher/mac/textbook?type=3">사용 교재</a></li>							
								<li><a href="${ctx }/teacher/mac/textbook?type=4">시험지</a></li>							
							</ul>
						</li>
						<li class="drop-menu">
							<a>
								모임
								<span>Meeting</span>
							</a>
							<ul class="drop-item">
								<li><a href="${ctx }/common/club/themeClubs?type=1">만든 모임</a></li>							
								<li><a href="${ctx }/common/club/themeClubs?type=2">가입한 모임</a></li>							
								<li><a href="${ctx }/common/club/themeClubs?type=3">전체 모임</a></li>							
							</ul>
						</li>
						<li class="drop-menu">
							<a>
								채팅
								<span>Chatting</span>
							</a>
							<ul class="drop-item">
								<li><a href="${ctx }/common/chat/chatList?type=1">개인 채팅</a></li>							
								<li><a href="${ctx }/common/chat/chatList?type=1">우리반 채팅</a></li>							
								<li><a href="${ctx }/common/chat/chatList?type=1">모임 채팅</a></li>							
							</ul>
						</li>
					</ul>
				</div>
				
			</div>
		</div>
		
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