<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.myClass.Common.MyclassCommon"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set value="${pageContext.request.contextPath }" var="ctx"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/views/include/meta.jsp" %>
<%
	long date = new Date().getTime();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>

<link rel="stylesheet" type="text/css" href="${ctx }/css/fullcalendar-setting.css">
<link rel="stylesheet" type="text/css" href="${ctx }/css/main.css">
<link rel="stylesheet" type="text/css" href="${ctx }/css/parallax.css">

<c:set value="<%= date %>" var="date" />
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
		<div class="sticky-header-section hide"></div>
		<%@include file="/WEB-INF/views/include/header.jsp" %>
		<div id="container">
			<div class="section-img class-info">
			<div class="content">
				<div class="class-wrap">
					<h4>이제는 스마트하게 공부하자</h4>
					<p>MYCLASS와 함께 같이 공부하자</p>
					<i>인강부터 모임까지 이제 혼자하는 공부가 아닌 같이하는 공부로<br>
					게시판, 채팅기능으로 선생님에게 모르는 부분을 바로 물어볼 수 있습니다. 
					</i>
					<button>수업 확인하기</button>
				</div>
				
				<div class="item ipad"></div>
				<div class="item iphone"></div>
			</div>
				
			</div>
			
			<div class="section function-info">
				<div class="content">
					<h4>MYCLASS 주요 기능</h4>
					<ul class="icon-info row">
						<li><em><i class="fa fa-users" aria-hidden="true"></i></em><p>오늘의 수업도 확인하고 인강도 시청하고</p></li>
						<li><em><i class="fa fa-file-text-o" aria-hidden="true"></i></em><p>선생님이 출제해준 시험으로 실제 시험에서도 자신있게</p></li>
						<li><em><i class="fa fa-commenting-o" aria-hidden="true"></i></em><p>선생님, 친구와의 대화로 공부를 더 쉽고 재밌게</p></li>
						<li><em><i class="fa fa-coffee" aria-hidden="true"></i></em><p>모임으로 함께하는 공부</p></li>
						<li><em><i class="fa fa-line-chart" aria-hidden="true"></i></em><p>점점 성장해가는 나의 성적을 보면서 공부의지 2배UP</p></li>
						<li><em><i class="fa fa-university" aria-hidden="true"></i></em><p>학교별 대항전, 학교별 성적으로 공부를 게임처럼</p></li>
						<li><em><i class="fa fa-desktop" aria-hidden="true"></i></em><p>선생님의 인강을 인터넷이되는곳 어디서든</p></li>
						<li><em><i class="fa fa-android" aria-hidden="true"></i></em><p>안드로이드 2016년 12월 출시 예정</p></li>
					</ul>
				</div>
			</div>
			
			<div class="section-img testpaper-info row">
				<div class="testpaper-info-wrap">
					<div class="text-section">
						MyClass 시험지
					</div>
					<div class="type-section">
						선생님
						학생
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
	$(".ipad").animate({
		top : 20,
		opacity : 1
	}, 2000);
	$(".iphone").animate({
		top : 200,
		opacity : 1
	}, 2000);

	$(window).load(function ( event ) {
		$("#wrap").mCustomScrollbar({
			theme: "minimal-dark",
			callbacks : {
				whileScrolling : function(){
					
					if ( $(this).find("#mCSB_1_container").offset().top > -746 ) {
						var $ipad = $(".ipad"),
						$iphone = $(".iphone");
						$ipad.css({
							top : - $(this).find("#mCSB_1_container").offset().top / 5 + 20
						});
						
						$iphone.css({
							top : - $(this).find("#mCSB_1_container").offset().top / 4 + 200
						});
					}
					if ( $(this).find("#mCSB_1_container").offset().top >= 0 ) {
						stickyHeader(false);
					} else {
						stickyHeader(true);
					}
				}
			}
		});
	});
	
	function stickyHeader ( state ) {
		if ( state ) {
			$(".sticky-header-section").removeClass("hide");
			$("#header").addClass("sticky-header");
		} else {
			$(".sticky-header-section").addClass("hide");
			$("#header").removeClass("sticky-header");
		}
	}
	
	$(".sticky-header-section").css({
		height : $("#header").outerHeight(true)
	});
	if ( $(".class-info > .content").width() <= 522 ) {
		$(".class-info > .content").removeClass("tablet");
		$(".class-info > .content").addClass("mobile");
	} else if ( $(".class-info > .content").width() <= 772  ) {
		$(".class-info > .content").removeClass("mobile");
		$(".class-info > .content").addClass("tablet");
	} else {
		$(".class-info > .content").removeClass("tablet");
	}
	
	$(window).resize(function ( event ) {
		if ( $(".class-info > .content").width() <= 522 ) {
			$(".class-info > .content").removeClass("tablet");
			$(".class-info > .content").addClass("mobile");
		} else if ( $(".class-info > .content").width() <= 772 ) {
			$(".class-info > .content").removeClass("mobile");
			$(".class-info > .content").addClass("tablet");
		}
		else {
			$(".class-info > .content").removeClass("tablet");
		}
	})
	
</script>
</body>
</html>