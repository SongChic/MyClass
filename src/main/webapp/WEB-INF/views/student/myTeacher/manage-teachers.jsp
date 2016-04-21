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
<link rel="stylesheet" type="text/css" href="${ctx }/css/student/manage-teacher.css">

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
						<c:choose>
							<c:when test="${member.userType == 1 }">
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
							</c:when>
							<c:when test="${member.userType == 3 }">
								<li class="drop-menu">
									<a>
										선생님
										<span>Teacher</span>
									</a>
									<ul class="drop-item">
										<li><a href="${ctx }/teacher/members/manageMembers?type=1">승인 대기중</a></li>							
										<li><a href="${ctx }/teacher/members/manageMembers?type=2">내 선생님</a></li>							
										<li><a href="${ctx }/teacher/members/manageMembers?type=3">퇴원</a></li>							
									</ul>
								</li>
							</c:when>
						</c:choose>
						<li class="drop-menu">
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
			<div class="content">
				<h2>내 선생님</h2>
				
				<div class="tab-menu-wrap row">
					<ul class="custom-tab-menu row" role="tablist">
						<li class="active" role="presentation"><a href="#waiting" aria-controls="home" role="tab" data-toggle="tab">대기중</a></li>			  
						<li role="presentation"><a href="#myTeacher" aria-controls="profile" role="tab" data-toggle="tab">내 선생님</a></li>			  
						<li role="presentation"><a href="#unenrolled" aria-controls="messages" role="tab" data-toggle="tab">퇴원</a></li>			  
				  	</ul>
				  	<a href="${ctx }/student/myTeacher/findTeacher" class="btn btn-primary pull-right">선생님검색</a>
				</div>
				  <!-- Tab panes -->
				  <div class="tab-content">
				  
				    <div role="tabpanel" class="tab-pane fade in active" id="waiting">
				    	<div class="box-layout">
				    		<div class="box-padding">
				    		
				    			<c:forEach items="${teacher }" var="teacher">
					    			<div class="teacher-item row">
					    				<a class="teacher_img pull-left">
					    					<div class="img-zone">
					    						<img class="user lazy" data-original="${ctx }/img/profile/data/${teacher.profile }">
					    					</div>
					    				</a>
					    				<div class="teacher-info-wrap clearfix">
											<div class="pull-right teacher-btn">
												<c:choose>
													<c:when test="${teacher.state == 1 and teacher.student_state == 1 }">
														<button type="button" class="btn btn-default btn-sm approval-btn" data-item="${teacher.id }">초대승인</button>
													</c:when>
													<c:when test="${teacher.state == 1 and teacher.student_state == 0 }">
														<button type="button" class="btn btn-default btn-sm request-cancel" data-item="${teacher.id }">신청취소</button>
													</c:when>
												</c:choose>
												
												<span class="btn-group">
												  <button type="button" class="btn btn-default btn-sm dropdown-toggle more-btn" data-toggle="dropdown" aria-expanded="false">
												    <span class="sr-only">더보기</span><i class="fa fa-ellipsis-v" aria-hidden="true"></i>
												  </button>
												  <ul class="dropdown-menu" role="menu">
												    <li><a href="#">반배정</a></li>
												    <li><a href="#">퇴원</a></li>
												  </ul>
												</span>
											</div>
					    					<div class="teacher-info">
						    					<h4>${teacher.name }</h4>
					    						<c:if test="${teacher.subject ne null }">
						    						<c:set value="${teacher.subject }" var="subject"/>
					    							<p><i class="fa fa-book" aria-hidden="true"></i> <%= MyclassCommon.subject[ (Integer) pageContext.getAttribute("subject") ] %> </p>
				    							</c:if>
<%-- 						    					<p><i class="fa fa-university" aria-hidden="true"></i>${member.school }</p> --%>
					    					</div>
					    				</div>
					    			</div>
				    			</c:forEach>
				    		</div>
				    	</div>
				    </div>
				    
				    <div role="tabpanel" class="tab-pane fade" id="myTeacher">
				    	<div class="student-item row">
		    				<a class="student_img pull-left">
		    					<div class="img-zone">
		    						<img class="user lazy" data-original="${ctx }/img/profile/data/${member.profile }">
		    					</div>
		    				</a>
		    				<div class="student-info-wrap clearfix">
		    					<div class="pull-right student-btn">
		    						<button type="button" class="btn btn-default btn-sm">초대취소</button>
		    						<button type="button" class="btn btn-success btn-sm"><span class="visibility">추가</span><i class="fa fa-user-plus" aria-hidden="true"></i></button>
		    					</div>
		    					<div class="student-info">
			    					<h4>${member.name }</h4>
			    					<p><i class="fa fa-university" aria-hidden="true"></i>${member.school }</p>
			    					<p>반이름과 반이름에 가입되어있습니다.</p>
		    					</div>
		    				</div>
		    			</div>
				    </div>
				    
				    <div role="tabpanel" class="tab-pane fade" id="unenrolled">
				    	퇴원
				    	
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

$(".approval-btn").on("click", function (event) {
	var teacherId = $(this).attr("data-item");
	
	noticeModal ({ title : "초대승인", content : "초대를 승인하시겠습니까?"}, function ( result ) {
		if ( result ) {
			var ajaxData = {
				teacherId : teacherId,
				studentId : "${member.id }"
			}
			console.log(ajaxData);
		} else {
			console.log("false");
		}
	}); 
});

$(".request-cancel").on("click", function ( event ) {
	var teacherId = $(this).attr("data-item"),
		$this = $(this);
	noticeModal ({ title : "신청취소", content : "신청을 취소하시겠습니까?"}, function ( result ) {
		if ( result ) {
			var ajaxData = {
				teacherId : teacherId,
				studentId : "${member.id }"
			},
			options = {
				url : "${ctx }/rest/student/requestCancel",
				ajaxData : ajaxData
			}
			
			anywhereAjax(options, function ( response ) {
				if ( response > 0 ) {
					$this.closest(".teacher-item").animate({
						left: "150%"
					},function () {
						$(this).slideUp();
					});
				}
			});
		} else {
			console.log("false");
		}
	});
});
</script>
</body>
</html>