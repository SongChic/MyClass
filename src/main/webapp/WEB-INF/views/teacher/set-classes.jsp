<%@page import="com.myClass.Common.MyclassCommon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set value="${pageContext.request.contextPath }" var="ctx"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%@include file="/WEB-INF/views/include/meta.jsp" %>

<link rel="stylesheet" type="text/css" href="${ctx }/css/fullcalendar-setting.css">
<link rel="stylesheet" type="text/css" href="${ctx }/css/set-classes.css">

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

<jsp:useBean id="longToDate" class="java.util.Date" />

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
			<div class="content">
				<h3>새반 만들기</h3>
				
				<form onsubmit="onsetClass(this); return false;">
				<div class="row">
					<div class="box-layout">
						<p class="title"><b>기본정보</b></p>
						
						<div class="box-padding input-box">
							<div class="form-group row">
								<label class="col-sm-2 hidden-xs control-label">반 이름</label>
								<div class="col-sm-10 col-xs-12">
									<input type="text" class=" form-control" name="name" placeholder="반 이름을 입력해주세요." value="${classes.name }" />
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-2 hidden-xs control-label">대상</label>
								<div class="col-sm-10 col-xs-12">
									<select class="form-control" name="target">
										<option value="0">전체 학년</option>
										<option value="1">초등학교 4학년</option>
									</select>
								</div>
							</div>
							
							<div class="form-group row">
								<div class="checkbox col-xs-12">
									<label>
										<input type="checkbox" name="summative" class="summative">
										부가사항
									</label>
								</div>
							</div>
							
							<div class="summative-wrap hide">
								<div class="form-group row">
									<label class="col-sm-2 hidden-xs control-label">교과</label>
									<div class="col-sm-10 col-xs-12">
										<input type="text" class=" form-control" name="subject" placeholder="교과 (예 : 중등영어)" />
									</div>
								</div>
								
								<div class="form-group row">
									<label class="col-sm-2 hidden-xs control-label">특성</label>
									<div class="col-sm-10 col-xs-12">
										<input type="text" class=" form-control" name="summary" placeholder="교과 (예 : 독해반)" />
									</div>
								</div>
							</div>
						</div>
						
						<p class="title"><b>반 정보</b></p>
<!-- 						<p class="divider"></p> -->
						<div class="box-padding input-box">
							<div class="form-group row">
								<label class="col-sm-2 hidden-xs control-label">시작일</label>
								<div class="col-sm-10 col-xs-12">
								<c:if test="${classes.startDate > 0 }">
									<jsp:setProperty property="time" name="longToDate" value="${classes.startDate }"/>
									<fmt:formatDate value="${longToDate }" pattern="yyyy/MM/dd" var="startDate"/>
								</c:if>
								
									<input type="text" class=" form-control" name="startDate" id="start-date" placeholder="시작일을 선택해주세요." value="${startDate }" />
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-2 hidden-xs control-label">종료일</label>
								<div class="col-sm-10 col-xs-12">
								<c:if test="${classes.endDate > 0 }">
									<jsp:setProperty property="time" name="longToDate" value="${classes.endDate }"/>
									<fmt:formatDate value="${longToDate }" pattern="yyyy/MM/dd" var="endDate"/>
								</c:if>
								
									<input type="text" class=" form-control" name="endDate" id="end-date" placeholder="종료일을 선택해주세요." value="${endDate }" />
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-2 hidden-xs control-label">요일</label>
								<div class="col-sm-10 col-xs-12">
									<span>월</span>
									<span>화</span>
									<span>수</span>
									<span>목</span>
									<span>금</span>
									<span>토</span>
									<span>일</span>
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-2 hidden-xs control-label">시작시간</label>
								<div class="col-sm-10 col-xs-12">
									<c:if test="${classes.endDate > 0 }">
										<jsp:setProperty property="time" name="longToDate" value="${classes.startDate }"/>
										<fmt:formatDate value="${longToDate }" pattern="HH:mm" var="startTime"/>
									</c:if>
									<input type="text" class=" form-control" name="startTime" id="start-time" placeholder="시작시간을 선택해주세요." value="${startTime }" />
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-2 hidden-xs control-label">종료시간</label>
								<div class="col-sm-10 col-xs-12">
									<c:if test="${classes.endDate > 0 }">
										<jsp:setProperty property="time" name="longToDate" value="${classes.endDate }"/>
										<fmt:formatDate value="${longToDate }" pattern="HH:mm" var="endTime"/>
									</c:if>
									<input type="text" class=" form-control" name="endTime" id="end-time" placeholder="종료시간을 선택해주세요." value="${endTime }" />
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-2 hidden-xs control-label">색상 / 이미지</label>
								<div class="col-sm-10 col-xs-12 class-date-type form-group">
									<span class="radio">
										<label>
											<input type="radio" name="imageAndColor" value="1" checked/>
											색상
										</label>
									</span>
									
									<span class="radio">
										<label>
											<input type="radio" name="imageAndColor" value="2"/>
											이미지
										</label>
									</span>
								</div>
							</div>
							
							<div class="form-group color-picker row">
								<div class="color-picker-wrap col-sm-8 col-xs-12 row">
									<p><b>색상 선택</b></p>
									<% for ( int i = 0; i < MyclassCommon.classColor.length; i++ ) { %>
									<label class="picker-wrap mouse-pointer" style="background : <%= MyclassCommon.classColor[i] %>">
										
										<input type="radio" class="hide" name="colorPicker" value="<%= i %>"/>
										<span class="checked hide"><i class="fa fa-check"></i></span>
										
									</label>
									<% } %>
									<div class="clearfix"></div>
									<p class="info-text error-msg hide">※색상을 선택해주세요.</p>
								</div>
								
								<div class="form-group col-sm-4 col-xs-12">
									<p><b>색상 미리보기</b></p>
									
									<div class="box-layout preview">
										<div class="classes-wrap">
											<ul>
												<li>교과 : 샘플</li>
												<li>특성 : 샘플</li>
											</ul>
										</div>
										
										<ul class="classes-info">
											<li>기간 : 샘플</li>
											<li>요일 : 샘플</li>
											<li>시간 : 샘플</li>
											<li>인원 : 샘플</li>
											<li class="divider"></li>
											<li class="creator">선생님</li>
										</ul>
									</div>
								</div>
							</div>
							
							<div class="form-group file-wrap row hide">
								<div class="color-picker-wrap col-sm-8 col-xs-12 row">
									<p><b>이미지 첨부</b></p>
									
									<div class="input-group">
										<input type="file" id="classesImg" name="classesImg" style="display: none;">
										<input type="text" class="form-control file-name" placeholder="파일을 선택해주세요." value="${classes.picture }" disabled>
										
								        <span class="input-group-btn">
								       		<button class="btn btn-info file-btn" type="button" onclick="document.all.classesImg.click();"><i class="fa fa-folder-open" aria-hidden="true"></i> 파일 첨부</button>
								        </span>
							        </div>
							        
									<div class="clearfix"></div>
									<p class="info-text error-msg hide">※색상을 선택해주세요.</p>
								</div>
								
								<div class="form-group col-sm-4 col-xs-12">
									<p><b>이미지 미리보기</b></p>
									
									<div class="box-layout preview">
										<div class="classes-wrap img-type">
											<ul>
												<li>교과 : 샘플</li>
												<li>특성 : 샘플</li>
											</ul>
											
											<div class="image-zone">
												<c:choose>
													
													<c:when test="${not empty classes.picture }">
														<img src="${ctx }/img/data/${classes.picture }" />
													</c:when>

													<c:otherwise>
														<i class="fa fa-camera img-preview-icon" aria-hidden="true"></i>
													</c:otherwise>
													
												</c:choose>
											
												
											</div>
											
										</div>
										
										<ul class="classes-info">
											<li>기간 : 샘플</li>
											<li>요일 : 샘플</li>
											<li>시간 : 샘플</li>
											<li>인원 : 샘플</li>
											<li class="divider"></li>
											<li class="creator">선생님</li>
										</ul>
									</div>
								</div>
							</div>
							
							
							
							
						</div>
						
						<div class="box-padding btn-wrap">
						<c:choose>
						<c:when test="${classes.id > 0 }">
							<button type="submit" class="btn btn-primary btn-lg btn-block create-btn">수정</button>
						</c:when>
						
						<c:otherwise>
							<button type="submit" class="btn btn-primary btn-lg btn-block create-btn">만들기</button>
						</c:otherwise>
						</c:choose>
							
						</div>
						
					</div>
				</div>
				</form>
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
	var pictureChange = 0,
		oldFileName = "${classes.picture }";
		
	var id = <%= request.getParameter("id") %>;
	
	
	$('#start-date, #end-date').datetimepicker({
		locale : 'ko',
		format : 'YYYY/MM/DD'
	});
	
	$('#start-time, #end-time').datetimepicker({
		locale : 'ko',
		format : 'HH:mm'
	});
	
	$(".summative").on("change", function ( event ) {
		console.log( $(this).prop("checked") );
		if ( $(this).prop("checked") ) $(".summative-wrap").removeClass("hide").addClass("show");
		else $(".summative-wrap").removeClass("show").addClass("hide");
	});
	
	var classesType = 1;
	$(".class-date-type").on("change", "input[name=imageAndColor]", function( event ) {
		
		classesType = $(this).val();
		
		if ( classesType == 1 ) {
			$(".color-picker").removeClass("hide").addClass("show");
			$(".file-wrap").removeClass("show").addClass("hide");
		} else {
			$(".file-wrap").removeClass("hide").addClass("show");
			$(".color-picker").removeClass("show").addClass("hide");
		}
		
		console.log("change");
		console.log($(this).val())
	});
	
	
	if ( id ) {
		$($(".class-date-type input")[parseInt("${classes.classesViewType}") - 1]).click()
	}
	
	$(".picker-wrap").on("click", function ( event ){
		
		for ( var i = 0; i < $(".picker-wrap").length; i++ ) {
			if ( $($(".picker-wrap")[i]).find("input").prop("checked") ) {
				$($(".picker-wrap")[i]).find(".checked").removeClass("hide").addClass("show");
			} else {
				$($(".picker-wrap")[i]).find(".checked").removeClass("show").addClass("hide");
			}
		}
		
		$(this).closest(".color-picker").find(".classes-wrap").css({
			background : $(this).css("background"),
			color : $(this).css("backgroundColor") == "rgb(254, 234, 58)"? "#000" : "#fff"
		})
	});
	
// 	$(".picker-wrap")[0].click();
	function onsetClass ( form ) {
		
		if ( form.name.value == "" ) {
			form.name.focus();
			return false;
		}
		
		if ( form.summative.checked ) {
			if ( form.subject.value == "" ) {
				form.subject.focus();
				return false;
			}
			if ( form.summary.value == "" ) {
				form.summary.focus();
				return false;
			}
		}
		
		if ( form.startDate.value == "" ) {
			form.startDate.focus();
			return false;
		}
		if ( form.endDate.value == "" ) {
			form.endDate.focus();
			return false;
		}
		
		if ( form.startTime.value == "" ) {
			form.startTime.focus();
			return false;
		}
		if ( form.endTime.value == "" ) {
			form.endTime.focus();
			return false;
		}
		
		var color = -1;
		if ( classesType == 1 ) {
		
			for ( var i = 0; i < form.colorPicker.length; i++ ) {
				if ( form.colorPicker[i].checked == true ) {
					color = form.colorPicker[i].value;
					$(".color-picker-wrap .info-text").removeClass("show").addClass("hide");
					break;
				}
			}
			
			if ( color < 0 ) {
				$(".color-picker-wrap .info-text").removeClass("hide").addClass("show");
				return false;
			}
		}
		
		
		var startTime = form.startTime.value.split(":"),
			endTime = form.endTime.value.split(":"),
			date = new Date(),
			picture = new FormData();
		
		
		
		var colorLength = <%= MyclassCommon.classColor.length %>;
		
		console.log (Date.parse(form.startDate.value) + startTime[0] * 60 * 60 * 1000 + startTime[1] * 60 * 1000);
		
		if ( id ) {
			picture.append("id", id);
			
			if ( oldFileName !== $(".file-name").val() ) {
				picture.append("oldFileName", oldFileName);
			}
		} else {
			picture.append("id", 0);
		}
		
		picture.append("name", form.name.value);
		picture.append("startDate", Date.parse(form.startDate.value) + startTime[0] * 60 * 60 * 1000 + startTime[1] * 60 * 1000);
		picture.append("endDate", Date.parse(form.endDate.value) + endTime[0] * 60 * 60 * 1000 + endTime[1] * 60 * 1000);
		picture.append("target", form.target.value);
		picture.append("subject", form.subject.value);
		picture.append("summary", form.summary.value);
		picture.append("days", 0);
		picture.append("classesViewType", classesType);
		picture.append("color", classesType == 1 ? color : Math.floor(Math.random() * colorLength));
		
		if ( classesType != 1 ) {
			picture.append("picture", pictureChange > 0 ? $("#classesImg")[0].files[0] : $(".file-name").val());	
		} else {
			picture.append("picture", "");
		}
		picture.append("thumbnail", "");
		picture.append("finished", 0);
		picture.append("maxNum", 30);
		picture.append("teacherId", "${member.id }");
		
		$.ajax({
			dataType : 'json',
            url : "${ctx }/rest/teacher/setClass",
            data : picture,
            type : "POST",
            enctype: 'multipart/form-data',
            processData: false, 
            contentType:false
            }).done( function( response ) {
            	
            	if ( response > 0 ) {
    				location.href = "${ctx }/teacher/classes/manageClasses?type=1";
    			}
            	
            }).fail ( function ( response ){
            	
            });
	}
	
	$("#classesImg").on("change", function ( event ) {
		
		if ( this.files && this.files[0] ) {
			var reader = new FileReader();
			reader.onload = function ( e ) {
				
				var imgHtml = "<img src='" + e.target.result + "'>";
				$(".image-zone").html(imgHtml);
				
			}
		}
		reader.readAsDataURL(this.files[0]);
		
		$(this).next().val(event.target.value);
		pictureChange = 1;
		
		console.log("change");
		console.log(event.target.result);
	});
	
	
</script>
</body>
</html>