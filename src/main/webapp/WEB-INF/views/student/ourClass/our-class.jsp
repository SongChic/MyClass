<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
<%
	long now = new Date().getTime();
	long startDate = 0;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	String tabType = "1";
	if ( request.getParameter("type") != null ) {
		tabType = request.getParameter("type");
	}
%>

<link rel="stylesheet" type="text/css" href="${ctx }/css/fullcalendar-setting.css">
<link rel="stylesheet" type="text/css" href="${ctx }/css/classes.css">
<link rel="stylesheet" type="text/css" href="${ctx }/css/student/our-class.css">

<c:set value="${member.mainColor }" var="mainColor"/>
<c:set value="<%= tabType %>" var="tabType"></c:set>
<c:set value="<%= now %>" var="now"></c:set>

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
		
			<!-- Nav tabs -->
		
			<div class="content classes-btn-wrap row">
<%-- 				<button type="button" class="btn btn-primary gradient pull-left" onclick="location.href='${ctx}/teacher/classes/setClasses'">반만들기</button> --%>
				<ul class="custom-tab-menu row pull-left" role="tablist">
					<li class="active" role="presentation"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">예정반</a></li>			  
					<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">우리반</a></li>			  
					<li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">종강반</a></li>			  
			 	</ul>
			 	
				<div class="btn-group pull-right">
					<button type="button" class="btn btn btn-default gradient"><span class="visibility">더보기</span><i class="fa fa-cog"></i></button>
					<button type="button" class="btn btn btn-default gradient dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						<span class="visibility">더보기</span>
						<i class="fa fa-caret-down" aria-hidden="true"></i>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">요일순</a></li>
						<li><a href="#">시간순</a></li>
						<li><a href="#">제목순</a></li>
						<li><a href="#">개강순</a></li>
					</ul>
				</div>
			</div>
			
			<div class="tab-content content classes-content">
				<div role="tabpanel" class="tab-pane fade in active" id="home">
					<c:forEach items="${classes }" var="classes">
						<fmt:formatDate value="${classes.start_date }" pattern='yyyy-MM-dd HH:mm:ss' var="format_date" />
						<c:set value="${format_date }" var="startDate"/>
						<% 	
							Date dateStartDate = sdf.parse( (String) pageContext.getAttribute("startDate") );
							startDate = dateStartDate.getTime();
						%>
						<c:set value="<%= startDate %>" var="startDate"/>
						<c:if test="${classes.finished == 0 and startDate > now  }">
							<div class="classes-item">
								<c:set value="${classes.color }" var="color"/>
									<div class="view" style="background:<%= MyclassCommon.classColor[(Integer) pageContext.getAttribute("color")] %>">
									
									<c:if test="${not empty classes.picture }">
										<img class="classes-img lazy" data-original="${ctx }/img/data/${classes.picture }">
									</c:if>
									
									<div class="title-wrap">
										<h4 class="title">${classes.name }</h4>
									</div>
									
									
									<div class="item mouse-pointer" data-item="${classes.id }">
										<div class="right-btn-wrap">
											<i class="fa fa-ellipsis-v dropdown-toggle " aria-hidden="true" data-toggle="dropdown" aria-expanded="false"></i>
											<ul class="dropdown-menu" role="menu">
											    <li><a href="#">Action</a></li>
											    <li><a href="#">Another action</a></li>
											    <li><a href="#">Something else here</a></li>
											    <li class="divider"></li>
											    <li><a href="#">Separated link</a></li>
											  </ul>
										</div>
										<a href="" data-item="${classes.id }"></a>
									</div>
									
								</div>
								<ul class="classes-info">
									<li>기간 : <fmt:formatDate value="${classes.start_date }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${classes.end_date }" pattern="yyyy-MM-dd"/></li>
									<c:choose>
										<c:when test="${classes.days == 0}">
										</c:when>
										<c:otherwise>
											<li>요일 : </li>
										</c:otherwise>
									</c:choose>
									
									<li>시간 : <fmt:formatDate value="${classes.start_date }" pattern="HH:mm"/> ~ <fmt:formatDate value="${classes.end_date }" pattern="HH:mm"/></li>
									<li>인원 : ${classes.number }</li>
									<li class="divider"></li>
									<li class="creator">${classes.teacher_name }</li>
								</ul>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="profile">
					<c:forEach items="${classes }" var="classes">
						<fmt:formatDate value="${classes.start_date }" pattern='yyyy-MM-dd HH:mm:ss' var="format_date" />
						<c:set value="${format_date }" var="startDate"/>
						<% 	
							Date dateStartDate = sdf.parse( (String) pageContext.getAttribute("startDate") );
							startDate = dateStartDate.getTime();
						%>
						<c:set value="<%= startDate %>" var="startDate"/>
						<c:if test="${classes.finished == 0 and startDate < now  }">
							<div class="classes-item">
								<c:set value="${classes.color }" var="color"/>
									<div class="view" style="background:<%= MyclassCommon.classColor[(Integer) pageContext.getAttribute("color")] %>">
									
									<c:if test="${not empty classes.picture }">
										<img class="classes-img lazy" data-original="${ctx }/img/data/${classes.picture }">
									</c:if>
									
									<div class="title-wrap">
										<h4 class="title">${classes.name }</h4>
									</div>
									
									
									<div class="item mouse-pointer" data-item="${classes.id }">
										<div class="right-btn-wrap">
											<i class="fa fa-ellipsis-v dropdown-toggle " aria-hidden="true" data-toggle="dropdown" aria-expanded="false"></i>
											<ul class="dropdown-menu" role="menu">
											    <li><a href="#">Action</a></li>
											    <li><a href="#">Another action</a></li>
											    <li><a href="#">Something else here</a></li>
											    <li class="divider"></li>
											    <li><a href="#">Separated link</a></li>
											  </ul>
										</div>
										<a href="" data-item="${classes.id }"></a>
									</div>
									
								</div>
								<ul class="classes-info">
									<li>기간 : <fmt:formatDate value="${classes.start_date }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${classes.end_date }" pattern="yyyy-MM-dd"/></li>
									<c:choose>
										<c:when test="${classes.days == 0}">
										</c:when>
										<c:otherwise>
											<li>요일 : </li>
										</c:otherwise>
									</c:choose>
									
									<li>시간 : <fmt:formatDate value="${classes.start_date }" pattern="HH:mm"/> ~ <fmt:formatDate value="${classes.end_date }" pattern="HH:mm"/></li>
									<li>인원 : ${classes.number }</li>
									<li class="divider"></li>
									<li class="creator">${classes.teacher_name }</li>
								</ul>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="messages">
					<c:forEach items="${classes }" var="classes">
						<fmt:formatDate value="${classes.start_date }" pattern='yyyy-MM-dd HH:mm:ss' var="format_date" />
						<c:set value="${format_date }" var="startDate"/>
						<% 	
							Date dateStartDate = sdf.parse( (String) pageContext.getAttribute("startDate") );
							startDate = dateStartDate.getTime();
						%>
						<c:set value="<%= startDate %>" var="startDate"/>
						<c:if test="${classes.finished == 1  }">
							<div class="classes-item">
								<c:set value="${classes.color }" var="color"/>
									<div class="view" style="background:<%= MyclassCommon.classColor[(Integer) pageContext.getAttribute("color")] %>">
									
									<c:if test="${not empty classes.picture }">
										<img class="classes-img lazy" data-original="${ctx }/img/data/${classes.picture }">
									</c:if>
									
									<div class="title-wrap">
										<h4 class="title">${classes.name }</h4>
									</div>
									
									
									<div class="item mouse-pointer" data-item="${classes.id }">
										<div class="right-btn-wrap">
											<i class="fa fa-ellipsis-v dropdown-toggle " aria-hidden="true" data-toggle="dropdown" aria-expanded="false"></i>
											<ul class="dropdown-menu" role="menu">
											    <li><a href="#">Action</a></li>
											    <li><a href="#">Another action</a></li>
											    <li><a href="#">Something else here</a></li>
											    <li class="divider"></li>
											    <li><a href="#">Separated link</a></li>
											  </ul>
										</div>
										<a href="" data-item="${classes.id }"></a>
									</div>
									
								</div>
								<ul class="classes-info">
									<li>기간 : <fmt:formatDate value="${classes.start_date }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${classes.end_date }" pattern="yyyy-MM-dd"/></li>
									<c:choose>
										<c:when test="${classes.days == 0}">
										</c:when>
										<c:otherwise>
											<li>요일 : </li>
										</c:otherwise>
									</c:choose>
									
									<li>시간 : <fmt:formatDate value="${classes.start_date }" pattern="HH:mm"/> ~ <fmt:formatDate value="${classes.end_date }" pattern="HH:mm"/></li>
									<li>인원 : ${classes.number }</li>
									<li class="divider"></li>
									<li class="creator">${classes.teacher_name }</li>
								</ul>
							</div>
						</c:if>
					</c:forEach>
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

<script type="text/javascript" src="${ctx }/js/library/masonry.js"></script>
<script type="text/javascript">
	var tabType = parseInt("${tabType }");
	
	//tab menu controll
	$($(".custom-tab-menu li")[tabType - 1]).find("a").click();
	
	//marsonry and lazy setting
	var $container = $('.classes-content');
	 $(".lazy").lazyload({
		  load : function () {
			  $container.masonry({
		    	 	itemSelector: '.classes-item',
		  		  	columnWidth: 254,
		  		  	originLeft: true
		      });   
		  }
	  });
	
	//tab menu click lazy reset
	$('a[data-toggle=tab]').each(function () {
	  var $this = $(this);

	  $this.on('shown.bs.tab', function () {
		  $(".lazy").lazyload({
			  load : function () {
				  $container.masonry({
			    	 	itemSelector: '.classes-item',
			  		  	columnWidth: 254,
			  		  	originLeft: true
			      });   
			  }
		  });
	      
	  });
	});
	
	$(".tab-pane").on("click", "a", function( event ) {
		event.preventDefault();
	});
	
	$('.right-btn-wrap').on('show.bs.dropdown', function () {
		var $item = $(this).closest(".item"),
			$list = $(this).find(".dropdown-menu"),
			$btn = $(this).find(".dropdown-toggle");
		
		$list.css({
			left : - ($list.outerWidth(true) - $btn.outerWidth(true) )
		})
		
		$item.css({
			opacity: .98
		})
	});
	$('.right-btn-wrap').on('hide.bs.dropdown', function () {
		var $item = $(this).closest(".item");
		
		$item.removeAttr("style");
	});
</script>
</body>
</html>