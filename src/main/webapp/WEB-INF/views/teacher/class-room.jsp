<%@page import="com.myClass.Common.MyclassCommon"%>
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
<link rel="stylesheet" type="text/css" href="${ctx }/css/class-room.css">

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
				
					<div class="visible-xs profile-zone">
						<img class="user lazy img-circle img-thumbnail" data-original="${ctx }/img/profile/data/${member.profile}">
						<h3>${member.name }</h3>
					</div>
					
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
						<li class="visible-xs">
							<a href="${ctx }/">
								<i class="fa fa-home" aria-hidden="true"></i>
								<span><i class="fa fa-caret-up"></i>메인으로</span>
							</a>
						</li>
						
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
						<li class="drop-menu active">
							<a>
								수업
								<span>Class</span>
							</a>
							<ul class="drop-item">
								<li><a href="${ctx }/teacher/classes/manageClasses?type=1">예정반</a></li>							
								<li><a href="${ctx }/teacher/classes/manageClasses?type=2">우리반</a></li>							
								<li><a href="${ctx }/teacher/classes/manageClasses?type=3">예정반</a></li>							
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
			<div class="content row">
				<h2 class="row box-padding">${classes.name }</h2>
				
				<div class="col-sm-3">
					<div class="box-layout">
						<p class="title"><b>선생님 정보</b></p>
						
						<div class="profile-wrap row">
					
							<div class="teacher-profile">
								<p><img class="user lazy img-circle img-thumbnail" data-original="${ctx }/img/profile/data/${member.profile}"></p>
								<h3>${member.name }</h3>
								<p>교과 : </p>
								<p>슬로건 : </p>
							</div>
							
						</div>
					</div>
					
					<div class="box-layout">
						<p class="title"><b>공지사항 / 메모</b></p>
						
						<div class="row padding-box">
							<p><b>공지사항</b> : </p>
							<p><b>메모</b> : </p>
						</div>
					</div>
				</div>
				
				<div class="col-sm-9">
					<div class="box-layout">
						<div class="title row fix-title">
							<b>우리반 정보</b>
							<button type="button" class="btn btn-success btn-xs pull-right">교재관리</button>
						</div>
						<div class="btn-wrap">
							
						</div>
						
						<div class="book-info-wrap">
							<!-- forEach (s) -->
							<div class="row book-info">
								<h4 class="clearfix book-title">교재이름</h4>
								<div class="book-cover col-xs-4 col-sm-3 col-md-2">
									<img src="${ctx }/img/book_cover.jpg">
								</div>
								<div class="col-xs-8 col-sm-9 col-md-10">
									<dl>
										<dt>진도</dt>
										<dd>진도 정보가 없습니다.</dd>
									</dl>
									
									<dl>
										<dt>시험</dt>
										<dd>시험이 없습니다.</dd>
									</dl>
									
									<dl>
										<dt>과제</dt>
										<dd>과제가 없습니다.</dd>
									</dl>
								</div>
							</div>
							<!-- forEach (e) -->
							
							<div class="row book-info">
								<h4 class="clearfix book-title">교재이름</h4>
								<div class="book-cover col-xs-4 col-sm-3 col-md-2">
									<img src="${ctx }/img/book_cover.jpg">
								</div>
								<div class="col-xs-8 col-sm-9 col-md-10">
									<dl>
										<dt>진도</dt>
										<dd>진도 정보가 없습니다.</dd>
									</dl>
									
									<dl>
										<dt>시험</dt>
										<dd>시험이 없습니다.</dd>
									</dl>
									
									<dl>
										<dt>과제</dt>
										<dd>과제가 없습니다.</dd>
									</dl>
								</div>
							</div>
							
						</div>
					</div>
					
					<div class="box-layout">
						<div class="title row classes-student fix-title">
							<b>우리반 학생</b>
							<div class="select-menu form-inline pull-right">
								<a href="${ctx }/teacher/classes/manageClassMember?classId=${classes.id }" class="btn btn-success btn-xs">학생관리</a>
								<select class="form-control">
									<option>전체</option>
									<option>출석</option>
									<option>지각</option>
									<option>조퇴</option>
									<option>결석</option>
								</select>
							</div>
						</div>
						
						<div class="row padding-box student-info-wrap">
							<c:forEach items="${classStudent }" var="classStudent">
								<c:if test="${classStudent.state == 2 }">
									<div class="student-item">
										<img class="user lazy img-circle img-thumbnail" data-original="${ctx }/img/profile/data/${classStudent.profile}">
										<p>${classStudent.name }</p>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
					
					<div class="box-layout">
						<p class="title"><b>게시판</b></p>
						
						<div class="row padding-box">
						</div>
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
<script type="text/javascript">

</script>
</body>
</html>