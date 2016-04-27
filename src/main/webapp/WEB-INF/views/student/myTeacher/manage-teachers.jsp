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
	<%@include file="/WEB-INF/views/include/header.jsp" %>
		
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
					    			<c:if test="${teacher.state == 1 }">
						    			<div class="teacher-item row">
						    				<a class="teacher_img pull-left">
						    					<div class="img-zone">
						    						<img class="user lazy" data-original="${ctx }/img/profile/data/${teacher.profile }">
						    					</div>
						    				</a>
						    				<div class="teacher-info-wrap clearfix">
												<div class="pull-right teacher-btn">
													<c:choose>
														<c:when test="${teacher.student_state == 1 }">
															<button type="button" class="btn btn-default btn-sm request-approve" data-item="${teacher.id }">승인</button>
															<button type="button" class="btn btn-default btn-sm" data-item="${teacher.id }">거절</button>
														</c:when>
														<c:when test="${teacher.student_state == 0 }">
															<button type="button" class="btn btn-default btn-sm request-cancel" data-item="${teacher.id }">신청취소</button>
														</c:when>
													</c:choose>
													
<!-- 													<span class="btn-group"> -->
<!-- 													  <button type="button" class="btn btn-default btn-sm dropdown-toggle more-btn" data-toggle="dropdown" aria-expanded="false"> -->
<!-- 													    <span class="sr-only">더보기</span><i class="fa fa-ellipsis-v" aria-hidden="true"></i> -->
<!-- 													  </button> -->
<!-- 													  <ul class="dropdown-menu" role="menu"> -->
<!-- 													    <li><a href="#">정보</a></li> -->
<!-- 													    <li><a href="#">퇴원</a></li> -->
<!-- 													  </ul> -->
<!-- 													</span> -->
												</div>
						    					<div class="teacher-info">
							    					<h4>${teacher.name }</h4>
						    						<c:if test="${teacher.subject ne null }">
							    						<c:set value="${teacher.subject }" var="subject"/>
						    							<p><i class="fa fa-book" aria-hidden="true"></i> <%= MyclassCommon.subject[ (Integer) pageContext.getAttribute("subject") ] %> </p>
					    							</c:if>
					    							<c:if test="${teacher.className ne '' }">
					    								<p>신청한 반 : ${teacher.className }</p>
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
				    		
				    			<c:forEach items="${teacher }" var="teacher">
					    			<c:if test="${teacher.state == 2 }">
						    			<div class="teacher-item row">
						    				<a class="teacher_img pull-left">
						    					<div class="img-zone">
						    						<img class="user lazy" data-original="${ctx }/img/profile/data/${teacher.profile }">
						    					</div>
						    				</a>
						    				<div class="teacher-info-wrap clearfix">
												<div class="pull-right teacher-btn">
													
													<span class="btn-group">
													  <button type="button" class="btn btn-default btn-sm dropdown-toggle more-btn" data-toggle="dropdown" aria-expanded="false">
													    <span class="sr-only">더보기</span><i class="fa fa-ellipsis-v" aria-hidden="true"></i>
													  </button>
													  <ul class="dropdown-menu" role="menu">
													    <li><a href="#">반 탈퇴</a></li>
													    <li><a href="#">반 더보기</a></li>
													  </ul>
													</span>
												</div>
						    					<div class="teacher-info">
							    					<h4>${teacher.name }</h4>
						    						<c:if test="${teacher.subject ne null }">
							    						<c:set value="${teacher.subject }" var="subject"/>
						    							<p><i class="fa fa-book" aria-hidden="true"></i> <%= MyclassCommon.subject[ (Integer) pageContext.getAttribute("subject") ] %> </p>
					    							</c:if>
													<p><i class="fa fa-graduation-cap" aria-hidden="true"></i>${teacher.className }</p>
						    					</div>
						    				</div>
						    			</div>
					    			</c:if>
				    			</c:forEach>
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

$(".request-approve").on("click", function ( event ) {
	var $this = $(this);
	noticeModal ({title : "승인확인", content : "초대를 승인하시겠습니까?"}, function ( result ) {
		if ( result ) {
			var options = {
					url : "${ctx }/rest/common/studentStateUpdate",
					ajaxData : {
						teacherId : $this.attr("data-item"),
						studentId : "${member.id }",
						state : 2
					}
				}
			anywhereAjax ( options, function ( response ) {
				if ( response > 0 ) {
					noticeModal ({title : "승인완료", content : "초대를 승인했습니다."}, function ( result ) {
						location.reload();
					});
				}
			});
		}
	});
});

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