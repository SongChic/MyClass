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
	<%@include file="/WEB-INF/views/include/header.jsp" %>
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
												<input type="radio" name="main-set" checked />
												수업 / 시험
											</label>
										</span>
										
										<span class="radio">
											<label>
												<input type="radio" name="main-set" />
												모임
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
								<li><a href="${ctx }/editMember?id=${member.id }">회원정보수정</a></li>
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

<script type="text/javascript">
var ctx = "${ctx }";
</script>

<%@include file="/WEB-INF/views/include/common-lib.jsp" %>
<script type="text/javascript">
	var changeState = false;
	
	$.material.init();
	var colorIndex = "${member.mainColor }";
	
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
		
		changeState = true;
		
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
		
		changeState = false;
		
		publicAjax ("post", "${ctx }/rest/setSetting", ajaxData, function (respose){
			if (respose > 0) {
				location.reload();
			}
		});
	}
	
	$(window).bind('beforeunload', function() {
		if ( changeState )
			return "변경된 사항이 있습니다. 그래도 페이지에서 나가시겠습니까?";
	});

</script>
</body>
</html>