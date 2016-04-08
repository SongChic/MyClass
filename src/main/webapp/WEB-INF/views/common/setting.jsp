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
<link rel="stylesheet" type="text/css" href="${ctx }/css/setting.css">

<c:set value="${member.mainColor }" var="mainColor"/>

<style type="text/css">
	#header {
		background-color : <%= MyclassCommon.mainColor[(Integer)pageContext.getAttribute("mainColor")] %>
	}
	.drop-item {
		background-color : <%= MyclassCommon.mainColor[(Integer)pageContext.getAttribute("mainColor")] %>
	}
	
	<% for (int i = 0; i < MyclassCommon.mainColorClass.length; i++) { %>
		#header.<%= MyclassCommon.mainColorClass[i] %> {
			background-color : <%= MyclassCommon.mainColor[i] %>;
		} 
	<% } %>
	
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
								<li><i class="fa fa-plus"></i> 부모님 등록</li>	
							</c:when>
							<c:when test="${member.userType == 3 }">
								<li><i class="fa fa-plus"></i> 자녀 등록</li>	
							</c:when>
						</c:choose>
						
						<li><i class="fa fa-cog"></i> 설정</li>
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
								<li>대기회원</li>							
								<li>회원</li>							
								<li>퇴원</li>							
							</ul>
						</li>
						<li class="drop-menu">
							<a>
								수업
								<span>Class</span>
							</a>
							<ul class="drop-item">
								<li>예정반</li>							
								<li>우리반</li>							
								<li>예정반</li>							
							</ul>
						
						</li>
						<li class="drop-menu">
							<a>
								교재
								<span>Textbook</span>
							</a>
							<ul class="drop-item">
								<li>전체교재</li>							
								<li>내 교재</li>							
								<li>사용 교재</li>							
								<li>시험지</li>							
							</ul>
						</li>
						<li class="drop-menu">
							<a>
								모임
								<span>Meeting</span>
							</a>
							<ul class="drop-item">
								<li>만든 모임</li>							
								<li>가입한 모임</li>							
								<li>전체 모임</li>							
							</ul>
						</li>
						<li class="drop-menu">
							<a>
								채팅
								<span>Chatting</span>
							</a>
							<ul class="drop-item">
								<li>개인 채팅</li>							
								<li>우리반 채팅</li>							
								<li>모임 채팅</li>							
							</ul>
						</li>
					</ul>
				</div>
				
			</div>
		</div>
		
		<div id="container">
			<div class="row setting-wrap content">
				<div class="row col-xs-12">
					<c:set value="${member.userType }" var="userType"/>
					<p><b>${member.name }님</b>은  <%= MyclassCommon.memberType[(Integer)pageContext.getAttribute("userType")] %>으로 로그인 하셧습니다.</p>
				</div>
				
				<div class="col-sm-8 col-sm-push-4 col-xs-12">
					<div class="box-layout">
						<div class="box-wrap">
							<p class="title"><b>설정</b></p>
							
							
							<form class="setting-form" onsubmit="saveSetting(this); return false;">
								<div class="form-group">
									<label>메인화면 설정</label>
									<div class="main-set">
									
									<div class="form-group">
										<span class="radio">
											<label>
												<input type="radio" name="main-set" />
												시험 / 과제
											</label>
										</span>
										
										<span class="radio">
											<label>
												<input type="radio" name="main-set" />
												채팅
											</label>
										</span>
									</div>
										
									</div>
								</div>
								
								<div class="form-group main-color-wrap">
									<label>테마컬러 설정</label>
									
									<div class="main-color row">
									<% for (int i = 0; i < MyclassCommon.mainColor.length; i++) { %>
										<label class="mouse-pointer" data-item="<%= MyclassCommon.mainColorClass[i] %>" style="background:<%= MyclassCommon.mainColor[i] %>">
											<span class="hide"><i class="fa fa-check"></i></span>
										</label>
									<% } %>
									</div>
								</div>
								
								<button type="submit" class="btn btn-primary btn-lg btn-block">저장</button>
							</form>
							
						</div>
					</div>
				</div>
			
				<div class="col-sm-4 col-sm-pull-8 col-xs-12">
					<div class="box-layout">
						<div class="box-wrap member-setting">
							<p class="title"><b>회원정보</b></p>
							<ul>
								<li>회원정보수정</li>
								<li>로그아웃</li>
								<li>회원탈퇴</li>
							</ul>
						</div>
					</div>
					
					<div class="box-layout">
							<ul class="member-setting">
								<li>공지사항</li>
								<li>이벤트</li>
							</ul>
					</div>
					
					<div class="box-layout">
							<ul class="member-setting">
								<li class="row">
									<p class="pull-left">버전</p>
									<p class="pull-right">1.0</p>
								</li>
							</ul>
					</div>
				</div>
				
			</div>
		</div>
		
		<div id="footer">
		</div>
</div>

<%@include file="/WEB-INF/views/include/common-lib.jsp" %>
<script type="text/javascript">
	
	$.material.init();
	var colorIndex = ${member.mainColor };
	
	$(".main-color label")
		.on({ mouseenter : function ( event ) {
			$("#header").css("backgroundColor", $(this).css("backgroundColor"));
		}, mouseleave : function ( event ) {
			$("#header").removeAttr("style", "background-color");
		} 
	})
	$(".main-color").on("click", "label", function(event){
		
		var $target = $(this).find("span"),
			$parent = $(this).parent();
		
		colorIndex = $(this).index();
		
		$("#header").removeClass().addClass($(this).attr("data-item"))
		
		for (var i = 0; i < $parent.find("label").length; i++) {
			if ($($parent.find("span")[i]).hasClass("show")) {
				$($parent.find("span")[i]).removeClass("show").addClass("hide");
			}
		}
		
		$target.removeClass("hide").addClass("show");
	});
	
	$($(".main-color span")[parseInt("${member.mainColor}")]).click();
	
	function saveSetting(form) {
		var ajaxData = {
			id : "${member.id}",
			mainColor : colorIndex
		};
		
		publicAjax ("post", "${ctx }/rest/setSetting", ajaxData, function (respose){
			if (respose > 0) {
				location.reload();
			}
		});
	}

</script>
</body>
</html>