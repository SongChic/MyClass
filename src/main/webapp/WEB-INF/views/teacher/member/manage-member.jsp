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
<link rel="stylesheet" type="text/css" href="${ctx }/css/teacher/manage-member.css">

<c:set value="${member.mainColor }" var="mainColor"/>
<style type="text/css">
	#header {
		background-color : <%= MyclassCommon.mainColor[(Integer)pageContext.getAttribute("mainColor")] %>
	}
	.drop-item {
		background-color : <%= MyclassCommon.mainColor[(Integer)pageContext.getAttribute("mainColor")] %>
	}
	
	#noticeModal .modal-header {
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
			<div class="content box-padding">
				<h2>내 학생</h2>
				
				<div class="tab-menu-wrap row">
					<ul class="custom-tab-menu row" role="tablist">
						<li class="active" role="presentation"><a href="#waiting" aria-controls="home" role="tab" data-toggle="tab">대기중</a></li>			  
						<li role="presentation"><a href="#myTeacher" aria-controls="profile" role="tab" data-toggle="tab">내 학생</a></li>			  
						<li role="presentation"><a href="#unenrolled" aria-controls="messages" role="tab" data-toggle="tab">퇴원</a></li>			  
				  	</ul>
				  	<a href="${ctx }/student/myTeacher/findTeacher" class="btn btn-primary pull-right">학생검색</a>
				</div>
				  <!-- Tab panes -->
				  <div class="tab-content">
				  
				    <div role="tabpanel" class="tab-pane fade in active" id="waiting">
				    	<div class="box-layout">
				    		<div class="box-padding">
				    		
				    			<c:forEach items="${students }" var="students">
				    				<c:if test="${students.state == 1 or students.state == 1 }">
						    			<div class="students-item row">
						    				<a class="students_img pull-left">
						    					<div class="img-zone">
						    						<img class="user lazy" data-original="${ctx }/img/profile/data/${students.profile }">
						    					</div>
						    				</a>
						    				<div class="students-info-wrap clearfix">
												<div class="pull-right students-btn">
													<c:choose>
														<c:when test="${students.state == 1 and students.student_state == 1 }">
															<button type="button" class="btn btn-default btn-sm approval-btn" data-item="${students.id }">초대취소</button>
														</c:when>
														<c:when test="${students.state == 1 and students.student_state == 0 }">
															<button type="button" class="btn btn-default btn-sm request-approve" data-item="${students.id }">승인</button>
															<button type="button" class="btn btn-default btn-sm request-cancel" data-item="${students.id }">거절</button>
															
														</c:when>
													</c:choose>
													
	<!-- 												<span class="btn-group"> -->
	<!-- 												  <button type="button" class="btn btn-default btn-sm dropdown-toggle more-btn" data-toggle="dropdown" aria-expanded="false"> -->
	<!-- 												    <span class="sr-only">더보기</span><i class="fa fa-ellipsis-v" aria-hidden="true"></i> -->
	<!-- 												  </button> -->
	<!-- 												  <ul class="dropdown-menu" role="menu"> -->
	<!-- 												    <li><a href="#">반배정</a></li> -->
	<!-- 												    <li><a href="#">퇴원</a></li> -->
	<!-- 												  </ul> -->
	<!-- 												</span> -->
												</div>
						    					<div class="students-info">
							    					<h4>${students.name }</h4>
						    						<c:if test="${students.school ne null }">
							    						<p><i class="fa fa-university" aria-hidden="true"></i>${students.school }</p>
							    					</c:if>
							    					
							    					<c:if test="${students.className ne '' }">
							    						<p>신청한 반 : ${students.className }</p>
							    					</c:if>
							    					
						    					</div>
						    				</div>
						    			</div>
					    			</c:if>
				    			</c:forEach>
				    		</div>
				    	</div>
				    </div>
				    
				    <div role="tabpanel" class="tab-pane fade" id="myTeacher">
				    	<div class="box-layout">
				    		<div class="box-padding">
				    		
				    			<c:forEach items="${students }" var="students">
				    				<c:if test="${students.state == 2 }">
						    			<div class="students-item row">
						    				<a class="students_img pull-left">
						    					<div class="img-zone">
						    						<img class="user lazy" data-original="${ctx }/img/profile/data/${students.profile }">
						    					</div>
						    				</a>
						    				<div class="students-info-wrap clearfix">
												<div class="pull-right students-btn">
													<span class="btn-group">
													  <button type="button" class="btn btn-default btn-sm dropdown-toggle more-btn" data-toggle="dropdown" aria-expanded="false"  data-item="${students.id }">
													    <span class="sr-only">더보기</span><i class="fa fa-ellipsis-v" aria-hidden="true"></i>
													  </button>
													  <ul class="dropdown-menu" role="menu">
													    <li><a href="#">학생정보</a></li>
													    <li><a href="#">반배정</a></li>
													    <li><a href="unenrolled">퇴원</a></li>
													  </ul>
													</span>
												</div>
						    					<div class="students-info">
							    					<h4>${students.name }</h4>
						    						<c:if test="${students.school ne null }">
							    						<p><i class="fa fa-university" aria-hidden="true"></i> ${students.school }</p>
							    					</c:if>
							    					
							    					<c:if test="${students.className ne '' }">
							    						<p><i class="fa fa-graduation-cap" aria-hidden="true"></i> ${students.className }</p>
							    					</c:if>
							    					
						    					</div>
						    				</div>
						    			</div>
					    			</c:if>
				    			</c:forEach>
				    		</div>
				    	</div>
				    </div>
				    
				    <div role="tabpanel" class="tab-pane fade" id="unenrolled">
				    	<div class="box-layout">
				    		<div class="box-padding">
				    		
				    			<c:forEach items="${students }" var="students">
				    				<c:if test="${students.state == 3 }">
						    			<div class="students-item row">
						    				<a class="students_img pull-left">
						    					<div class="img-zone">
						    						<img class="user lazy" data-original="${ctx }/img/profile/data/${students.profile }">
						    					</div>
						    				</a>
						    				<div class="students-info-wrap clearfix">
												<div class="pull-right students-btn">
													<span class="btn-group">
													  <button type="button" class="btn btn-default btn-sm dropdown-toggle more-btn" data-toggle="dropdown" aria-expanded="false"  data-item="${students.id }">
													    <span class="sr-only">더보기</span><i class="fa fa-ellipsis-v" aria-hidden="true"></i>
													  </button>
													  <ul class="dropdown-menu" role="menu">
													    <li><a href="#">학생정보</a></li>
													    <li><a href="studentRecover">복귀</a></li>
													    <li><a href="deleteStudentFromClass">삭제</a></li>
													  </ul>
													</span>
												</div>
						    					<div class="students-info">
							    					<h4>${students.name }</h4>
						    						<c:if test="${students.school ne null }">
							    						<p><i class="fa fa-university" aria-hidden="true"></i> ${students.school }</p>
							    					</c:if>
							    					
							    					<c:if test="${students.className ne '' }">
							    						<p><i class="fa fa-graduation-cap" aria-hidden="true"></i> ${students.className }</p>
							    					</c:if>
							    					
						    					</div>
						    				</div>
						    			</div>
					    			</c:if>
				    			</c:forEach>
				    		</div>
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

$(".students-info-wrap").on("click", ".dropdown-menu a", function ( event ) {
	event.preventDefault();
	var type = $(this).attr("href");
	
	if ( type === "unenrolled" ) {
		var	ajaxOption = {
				url : "${ctx }/rest/teacher/studentStateUpdate",
				ajaxData : {
					studentId : $(this).closest(".btn-group").find(".more-btn").attr("data-item"),
					teacherId : "${member.id }",
					state : 3,
					studentState : 1
				}
			}
		noticeModal ({title : "학생 퇴원", content : $(this).closest(".students-btn").next().find("h4").text() + " 학생을 퇴원하시겠습니까?"}, function ( result ) {
			if ( result ) {
				anywhereAjax (ajaxOption, function ( response ) {
					if ( response > 0 ) {
						noticeModal ({title : "퇴원완료", content : "퇴원 되었습니다."}, function ( result ) {
							location.reload();
						});
					}
				});
			}
		});
	} else if ( type === "studentRecover" ) {
		var ajaxOption = {
				url : "${ctx }/rest/teacher/studentStateUpdate",
				ajaxData : {
					studentId : $(this).closest(".btn-group").find(".more-btn").attr("data-item"),
					teacherId : "${member.id }",
					state : 2,
					studentState : 1
				}
			}
		
		noticeModal ({title : "학생 복귀", content : $(this).closest(".students-btn").next().find("h4").text() + " 학생을 복귀하시겠습니까?"}, function ( result ) {
			if ( result ) {
				anywhereAjax (ajaxOption, function ( response ) {
					if ( response > 0 ) {
						noticeModal ({title : "복귀완료", content : "복귀 되었습니다."}, function ( result ) {
							location.reload();
						});
					}
				});
			}
		});
	} else if ( type === "deleteStudentFromClass" ) {
		var ajaxOption = {
				url : "${ctx }/rest/teacher/deleteStudentFromClass",
				ajaxData : {
					studentId : $(this).closest(".btn-group").find(".more-btn").attr("data-item"),
					teacherId : "${member.id }"
				}
			} 
		
		noticeModal ({title : "학생 삭제", content : $(this).closest(".students-btn").next().find("h4").text() + " 학생을 삭제하시겠습니까? <br> <b>삭제를 하면 학생에 대한 정보가 모두 삭제됩니다.</b>"}, function ( result ) {
			if ( result ) {
				anywhereAjax (ajaxOption, function ( response ) {
					if ( response > 0 ) {
						noticeModal ({title : "삭제 완료", content : "삭제 되었습니다."}, function ( result ) {
							location.reload();
						});
					}
				});
			}
		});
	}
}) 

$(".request-approve").on("click", function ( event ) {
	var modalOption = {
			title : "신청 승인",
			content : "신청을 승인하시겠습니까?"
		},
		ajaxOption = {
			url : "${ctx }/rest/teacher/studentStateUpdate",
			ajaxData : {
				studentId : $(this).attr("data-item"),
				teacherId : "${member.id }",
				state : 2,
				studentState : 1
			}
		}
		$this = $(this);
	noticeModal (modalOption, function ( result ) {
		if ( result ) {
			anywhereAjax (ajaxOption, function ( response ) {
				if ( response > 0 ) {
					$this.closest(".students-item").animate({
						left: "150%"
					},function () {
						$(this).slideUp(function ( event ) {
							noticeModal ({title : "완료", content : "신청이 승인되었습니다."}, function ( result ) {
								
							});
						});
					});
				}
			});
		}
	});
});

$(".request-cancel").on("click", function ( event ) {
	var modalOption = {
			title : "신청 거절",
			content : "신청을 거절하시겠습니까?"
		},
		ajaxData = {
			url : "${ctx }/rest/teacher/deleteStudentFromClass",
			ajaxData : {
				studentId : $(this).attr("data-item"),
				teacherId : "${member.id }"
			}
		},
		$this = $(this);
	
	noticeModal (modalOption, function ( result ) {
		if ( result ) {
			anywhereAjax (ajaxData, function ( response ) {
				if ( response > 0 ) {
					$this.closest(".students-item").animate({
						left: "150%"
					},function () {
						$(this).slideUp(function ( event ) {
							noticeModal ({title : "완료", content : "신청이 거절되었습니다."}, function ( result ) {
								
							});
						});
					});
				}
			});
		}
	});
});

</script>
</body>
</html>