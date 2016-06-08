<%@page import="com.myClass.Common.MyclassCommon"%>
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

<link rel="stylesheet" type="text/css" href="${ctx }/css/fullcalendar-setting.css">
<link rel="stylesheet" type="text/css" href="${ctx }/css/exam/view-test-paper.css">

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
				<div class="box-padding">
					<h2>시험지</h2>
					<div class="btn-wrap">
						<button type="button" class="btn btn-primary gradient" onclick="location.href='${ctx}/teacher/exam/setTestPaper'">시험지 만들기</button>
					</div>
					
					<div class="box-layout">
						<div class="table-responsive">
							<table class="table table-hover">
								<tr>
									<th width="10%">번호</th>
									<th>제목</th>
									<th width="10%">문제수</th>
									<th width="15%">제작일</th>
								</tr>
								<c:forEach items="${testPaper }" var="testPaper">
									<tr>
										<td>${testPaper.id }</td>
										<td><a href="${ctx }/teacher/exam/viewQuestion?id=${testPaper.id }">${testPaper.title }</a></td>
										<td>${testPaper.question }</td>
										<td><fmt:formatDate value="${testPaper.created }" pattern="yyyy/MM/dd"/></td>
									</tr>
								</c:forEach>
								<c:if test="${fn:length(testPaper) <= 0 }">
									<tr>
										<td colspan="4">
											<p class="info-text">만들어진 시험지가 없습니다. 시험지 만들기 버튼을 눌러 시험지를 추가해주세요.</p><p class="info-text"><a href="${ctx}/teacher/exam/setTestPaper">이곳을 눌러도 시험지 만들기를 하실 수 있습니다.</a></p>
										</td>
									</tr>
								</c:if>						
							</table>
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