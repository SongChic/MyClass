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

<link rel="stylesheet" type="text/css" href="${ctx }/css/fullcalendar-setting.css">
<link rel="stylesheet" type="text/css" href="${ctx }/css/classes.css">

<%	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	long date = new Date().getTime();
	ServletContext context = request.getSession().getServletContext();
	String prefixUrl = context.getRealPath("/WEB-INF/views/img/data/").replace("\\", "/");
	
%>
<c:set value="<%= date %>" var="date" />
<c:set value="<%= prefixUrl %>" var="prefixUrl" />
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
			
			<div class="content tab-menu-wrap" role="tabpanel">

			  <!-- Nav tabs -->
			  <ul class="tab-menu row" role="tablist">
				<li class="active" role="presentation"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">예정반</a></li>			  
				<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">우리반</a></li>			  
				<li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">종강반</a></li>			  
			  </ul>
			  
			  <!-- Tab panes -->
			  <div class="tab-content">
			  
			  	<div class="content classes-btn-wrap row">
						<button type="button" class="btn btn-primary gradient pull-left" onclick="location.href='${ctx}/teacher/classes/setClasses'">반만들기</button>
						
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
					
			    <div role="tabpanel" class="tab-pane fade in active" id="home">
					
					<div class="content classes-content">
				
						<c:forEach items="${classes }" var="classes">
						
							<fmt:formatDate value="${classes.start_date }" pattern='yyyy-MM-dd HH:mm:ss' var="format_date" />
							<c:set value="${format_date }" var="start_date" />
							<%
								Date dateParse = sdf.parse((String) pageContext.getAttribute("start_date"));
								long parseDate = dateParse.getTime();
							%>
							<c:set value="<%= parseDate %>" var="parseDate"/>
							
							<c:if test="${classes.finished == 0 and parseDate > date  }">
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
										<div class="left-btn-wrap">
											<button type="button" class="btn btn-danger btn-sm edit-btn" data-item="${classes.id }">
												<i class="fa fa-pencil"></i> 수정
											</button>	
										</div>
										<div class="right-btn-wrap">
											<button type="button" class="btn btn-default btn-sm end-btn" data-item="${classes.id }">
												<i class="fa fa-trash" aria-hidden="true"></i>
											</button>
											<button type="button" class="btn btn-default btn-sm delete-btn" data-item="${classes.id }">
												<i class="fa fa-times" aria-hidden="true"></i>
											</button>
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
			    <div role="tabpanel" class="tab-pane fade" id="profile">
			    	<div class="content classes-content">
				
						<c:forEach items="${classes }" var="classes">
							
							<fmt:formatDate value="${classes.start_date }" pattern='yyyy-MM-dd HH:mm:ss' var="format_date" />
							<c:set value="${format_date }" var="start_date" />
							<%
								Date dateParse = sdf.parse((String) pageContext.getAttribute("start_date"));
								long parseDate = dateParse.getTime();
							%>
							<c:set value="<%= parseDate %>" var="parseDate"/>
							
							<c:if test="${classes.finished == 0 and parseDate < date  }">
							<div class="classes-item">
								<c:set value="${classes.color }" var="color"/>
								<c:choose>
									<c:when test="${not empty classes.picture }">
										<div class="view img" style="background:<%= MyclassCommon.classColor[(Integer) pageContext.getAttribute("color")] %>">
									</c:when>
									<c:otherwise>
										<div class="view" style="background:<%= MyclassCommon.classColor[(Integer) pageContext.getAttribute("color")] %>">
									</c:otherwise>
								</c:choose>
									
									<c:if test="${not empty classes.picture }">
										<img class="classes-img lazy" data-original="${ctx }/img/data/${classes.picture }">
									</c:if>
									
									<div class="title-wrap">
										<h4 class="title">${classes.name }</h4>
									</div>
									
									<div class="item mouse-pointer">
										<div class="left-btn-wrap">
											<button type="button" class="btn btn-danger btn-sm edit-btn" data-item="${classes.id }">
												<i class="fa fa-pencil"></i> 수정
											</button>	
										</div>
										<div class="right-btn-wrap">
											<button type="button" class="btn btn-default btn-sm end-btn" data-item="${classes.id }">
												<i class="fa fa-trash" aria-hidden="true"></i>
											</button>
											<button type="button" class="btn btn-default btn-sm delete-btn" data-item="${classes.id }">
												<i class="fa fa-times" aria-hidden="true"></i>
											</button>
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
				
			    <div role="tabpanel" class="tab-pane fade" id="messages">
			    
				    <div class="content classes-content">
				    	<c:forEach items="${classes }" var="classes">
							<c:if test="${classes.finished == 1 }">
							<div class="classes-item">
								<c:set value="${classes.color }" var="color"/>
								<c:choose>
									<c:when test="${not empty classes.picture }">
										<div class="view img" style="background:<%= MyclassCommon.classColor[(Integer) pageContext.getAttribute("color")] %>">
									</c:when>
									<c:otherwise>
										<div class="view" style="background:<%= MyclassCommon.classColor[(Integer) pageContext.getAttribute("color")] %>">
									</c:otherwise>
								</c:choose>
								
									<c:if test="${not empty classes.picture }">
										<img class="classes-img lazy" data-original="${ctx }/img/data/${classes.picture }">
									</c:if>
									
									<div class="title-wrap">
										<h4 class="title">${classes.name }</h4>
									</div>
									
									<div class="item mouse-pointer">
										<div class="left-btn-wrap">
											<button type="button" class="btn btn-danger btn-sm edit-btn" data-item="${classes.id }">
												<i class="fa fa-pencil"></i> 수정
											</button>	
										</div>
										<div class="right-btn-wrap">
											<button type="button" class="btn btn-default btn-sm end-btn" data-item="${classes.id }">
												<i class="fa fa-trash" aria-hidden="true"></i>
											</button>
										</div>
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
				
			    <div role="tabpanel" class="tab-pane fade" id="settings">...</div>
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
	
	$(".tab-menu").on("click", "li" , function ( event) {
		$(window).resize();
	});
	
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
	
	$(".edit-btn").on("click", function ( event ) {
        event.preventDefault();
		var id = $(this).attr("data-item");
        
        if ( id ) {
            location.href="${ctx }/teacher/classes/setClasses?id=" + id;
        } 
        
    });
	
	$(".item").on("click", "a", function ( event ) {
		event.preventDefault();
		var id = $(this).attr("data-item");
		console.log("pass");
		location.href="${ctx }/teacher/classes/classRoom?id=" + id;
	});
	
	$(document).ready(function(event) {
//		if ( $(this).width() < 332 ) {
//			$("#container").css("paddingTop", $("#header").outerHeight());
//		} else {
//			$("#container").removeAttr("style");
//		}
		
	});
	
</script>
</body>
</html>