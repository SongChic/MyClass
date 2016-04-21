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
<link rel="stylesheet" type="text/css" href="${ctx }/css/student/find-teacher.css">

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
										<li><a href="${ctx }/student/myTeacher/manageTeachers?type=1">승인 대기중</a></li>							
										<li><a href="${ctx }/student/myTeacher/manageTeachers?type=2">내 선생님</a></li>							
										<li><a href="${ctx }/student/myTeacher/manageTeachers?type=3">퇴원</a></li>							
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
				<h2>선생님검색</h2>
				
				<div class="input-group">
			      <input type="text" class="form-control find-name" placeholder="Search for...">
			      <span class="input-group-btn">
			        <button class="btn btn-default find-btn" type="button"><span class="visibility">검색</span><i class="fa fa-search" aria-hidden="true"></i></button>
			        <button class="btn btn-default" type="button" data-toggle="collapse" href="#selectOption" aria-expanded="false"><span class="visibility">검색옵션</span><i class="fa fa-th" aria-hidden="true"></i></button>
			      </span>
			    </div><!-- /input-group -->
			    
			    <div id="selectOption" class="box-layout search-filter collapse">
			    	<div role="tabpanel">
			    		<ul class="nav nav-tabs" role="tablist">
			    			<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">지역별</a></li>
			    			<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">교과별</a></li>
			    		</ul>
			    		
			    		<div class="tab-content padding-box">
						    <div role="tabpanel" class="tab-pane fade in active" id="home">
								
								<div class="form-inline region-select">
									<div class="form-group">
										<label class="control-label">지역선택</label>
									    <select id="city" class="form-control city">
									    	<option>시도를 선택하세요.</option>
									    	<option>대전광역시</option>
									    </select>
								    </div>
								    
									<div class="form-group">
									    <select id="district" class="form-control district">
									    	<option>시도를 먼저 선택해주세요.</option>
									    </select>
								    </div>
							    </div>
								
							</div>
						    <div role="tabpanel" class="tab-pane fade" id="profile">
								<span class="checkbox allcheck">
									<label class="checkbox-inline">
									  <input type="checkbox" id="inlineCheckbox1" value="option1"> 전체
									</label>
								</span>
								<span class="subject-wrap">
									<span class="checkbox">
										<label class="checkbox-inline">
										  <input type="checkbox" id="inlineCheckbox1" value="option1"> 국어
										</label>
									</span>
									<span class="checkbox">
										<label class="checkbox-inline">
										  <input type="checkbox" id="inlineCheckbox1" value="option1"> 영어
										</label>
									</span>
									<span class="checkbox">
										<label class="checkbox-inline">
										  <input type="checkbox" id="inlineCheckbox1" value="option1"> 수학
										</label>
									</span>
									<span class="checkbox">
										<label class="checkbox-inline">
										  <input type="checkbox" id="inlineCheckbox1" value="option1"> 과학
										</label>
									</span>
								</span>
							</div>
						</div>
			    	</div>
			    </div>
			    
			    <p>※가입된 선생님은 검색되지 않습니다.</p>
			    
			    <div class="row teacher-search-wrap">
			    	<div class="box-layout">
			    		<div id="teacherResultBox" class="box-padding">
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
$.material.init();

/* 과목 전체 클릭시 */
$(".allcheck").on("click", function ( event ) {
	$(".subject-wrap input").prop("checked", $(this).find("input").prop("checked"));
});

/* 과목이 모두 선택되는지 체크하는 이벤트 */
$(".subject-wrap").on("click", ".checkbox", function ( event ) {
	var totalLength = $(".subject-wrap").find("input").length,
		checkedLength = $(".subject-wrap").find("input:checked").length;
	
	$(".allcheck").find("input").prop("checked", checkedLength == totalLength);
});

/* enter event */
$(".find-name").on("keyup", function ( event ) {
	if ( event.keyCode == 13 ) {
		$(".find-btn").click();
	}
});

$(".find-btn").on("click", function ( event ) {
	var searchVal = $(this).parent().prev().val();
	if ( searchVal == "" ) {
		return false;
	}
	
	var ajaxData = {
			name : searchVal
	}
	publicAjax("post", "${ctx }/rest/student/teacherFind", ajaxData, function ( response ) {
		var appendHtml = "",
			resultBox = document.getElementById("teacherResultBox");
		
// 		console.log( response );
		
		for ( var i = 0; i < response.length; i++ ) {
			
// 			console.log(response[i].classes[i]);
			appendHtml += "<div class='teacher-item row' data-item='" + response[i].id + "'>";
			appendHtml += "<a class='teacher_img pull-left'>";
			appendHtml += "<div class='img-zone'>";
			appendHtml += "<img class='user lazy' data-original='${ctx }/img/profile/data/" + response[i].profile + "'>";
			appendHtml += "</div>";
			appendHtml += "</a>";
			appendHtml += "<div class='teacher-info-wrap clearfix'>";
			appendHtml += "<div class='pull-right teacher-btn'>";
			appendHtml += "<button type='button' class='btn btn-default btn-sm'>반보기</button>";
			appendHtml += "<button type='button' class='btn btn-success btn-sm submit-btn'><span class='visibility'>추가</span><i class='fa fa-user-plus' aria-hidden='true'></i></button>";
			appendHtml += "</div>";
			appendHtml += "<div class='teacher-info'>";
			appendHtml += "<h4>" + response[i].name + "</h4>";
			
			if ( response[i].classes.length <= 2 ) {
				appendHtml += "<p><i class='fa fa-book' aria-hidden='true'></i> " + response[i].classes[1].name + "와(과) " + response[i].classes[1].name +"를(을) 개설했습니다.</p>";
			}
// 			appendHtml += "<p>반이름과 반이름에 가입되어있습니다.</p>";
			appendHtml += "</div>";
			appendHtml += "</div>";
			appendHtml += "</div>";
		}
		
		resultBox.innerHTML = appendHtml;
		imageLoad();
// 		$(".teacher-search-wrap").empty().append(appendHtml);
	});
});

var $this = document.getElementById("city");
publicAjax("post", "${ctx }/rest/getJuso", {}, function ( response ) {
	
	var list = JSON.parse(response[0]),
		appendHtml = "<option>시도를 선택하세요.</option>";
	for ( i = 0; i < list.length; i++ ) {
		appendHtml += "<option value='" + list[i].sd_cd + "'>" + list[i].sd_nm + "</option>";
	}
	$this.innerHTML = appendHtml;
});	

$(".city").on("change", function ( event ) {
	var ajaxData = {
		sdcd : $(this).val()
	};
	publicAjax("post", "${ctx }/rest/getJuso", ajaxData, function ( response ) {
		var list = JSON.parse(response[0]).SGG_LIST,
			appendHtml = "<option>시군구를 선택하세요.</option>",
			$target = document.getElementById("district");
		for ( i = 0; i < list.length; i++ ) {
			appendHtml += "<option value='" + list[i].sgg_cd + "'>" + list[i].sgg_nm + "</option>";
		}
		$target.innerHTML = appendHtml;
	});
});

$(".teacher-search-wrap").on("click", ".submit-btn", function ( event ) {
	var options = {
		url : "${ctx }/rest/student/classRequest",
		ajaxData : {
			teacherId : $(this).closest(".teacher-item").attr("data-item"),
			studentId : "${member.id }"
		}
	},
	$this = $(this),
	teacherName = $this.closest(".teacher-item").find(".teacher-info h4").text();
	noticeModal ({ title : "가입신청", content : teacherName + "선생님의 반을 신청하시겠습니까?"}, function ( result ) {
		if ( result ) {
			
			anywhereAjax(options, function ( response ) {
				if ( response > 0 ) {
					$this.closest(".teacher-item").animate({
						left: "150%"
					},function () {
						$(this).slideUp();
					});
				}
			});
		}
	});
});

</script>
</body>
</html>