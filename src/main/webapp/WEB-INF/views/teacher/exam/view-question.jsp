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
<link rel="stylesheet" type="text/css" href="${ctx }/css/main.css">

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
				<div class="box-layout">
					<div class="padding-box">
						<div class="exam-title row">
						
							<div class="col-sm-6 col-sm-push-3">
								<div class="text-paper-title">
									<h3 class="test-paper-title">${testPaper.title }</h3>
								</div>
							</div>
							
							<div class="col-sm-3 col-sm-pull-6 school-year">
								<div class="form-group">
									<p class="text-left">대상</p>
									<c:set value="${testPaper.schoolLevel }" var="schoolLevel"/>
									<c:set value="${testPaper.schoolYear }" var="schoolYear"/>
									<% 
										String schoolLevel = MyclassCommon.schoolLevel[ (Integer) pageContext.getAttribute("schoolLevel") - 1  ];
										String schoolYear = MyclassCommon.schoolYear[ (Integer) pageContext.getAttribute("schoolLevel") - 1 ][ (Integer) pageContext.getAttribute("schoolYear") - 1 ];
									%>
									<p><%= schoolLevel %> <%= schoolYear %></p>
								</div>
							</div>
							
							<div class="col-sm-3">
								<div class="form-group">
									<p class="text-left">제한시간</p>
									
									<c:choose>
										<c:when test="${testPaper.limit > 0 }">
										
										</c:when>
										<c:otherwise>
											<p>무제한</p>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						
						</div>
						
						<div class="exam-content row">
							<c:forEach items="${testPaperItem }" var="question" varStatus="">
								<div class="question row">
									<c:forEach items=""></c:forEach>
									<p class="question-title">${question.title }</p>
									<div class="question-answer-wrap row">
										<ul>
											<c:forEach items="${question.question }" var="item">
												<li>${item.question }</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</c:forEach>
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

</script>
</body>
</html>