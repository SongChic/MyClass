<%@page import="com.myClass.Common.MyclassCommon"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set value="${pageContext.request.contextPath }" var="ctx"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	String appName = MyclassCommon.appName;
%>

<title><%= appName %> - 로그인</title>
<%@include file="/WEB-INF/views/include/common-lib.jsp" %>
<%@include file="/WEB-INF/views/include/meta.jsp" %>
<link rel="stylesheet" type="text/css" href="${ctx }/css/login.css">

</head>
<body>

<div id="wrap">	
	<div id="container" class="row">
		<div class="login-box row">
			<div class="app-info col-md-7">
				<h1><strong>선생님한테 질문부터
				우리반 채팅까지</strong></h1>
				
				<p>MY CLASS로 학습 지도부터 친구들과의 대화, 과제 하기,
				시험 미리 보기 등 여러 가지 기능을 한곳에!
				이제 MY CLASS로 재밌게 공부하세요.</p>
				
				<h2>2016년 12월 안드로이드
				COMMING SOON</h2>
			</div>
			<div class="login-wrap col-md-5">
				<div class="form-group">
					<label for="id">아이디</label>
					<input type="text" class="form-control" id="id">
				</div>
				<div class="form-group">
					<label for="pw">비밀번호</label>
					<input type="password" class="form-control" id="pw">
				</div>
				<div class="form-group">
					<div class="checkbox">
						<label>
							<input type="checkbox">
							자동 로그인
						</label>
					</div>
				</div>
				
				<div class="login-help">
					<p>아이디 또는 비밀번호를 잊어 버리셧나요?</p>
					<a>아이디</a> / <a>비밀번호</a> 찾기
				</div>
				
				<div class="login-btn">
					<button type="button" id="loginBtn" class="btn btn-primary btn-lg btn-block">로그인하기</button>
					<hr>
					<button type="button" class="btn btn-success btn-lg btn-block">회원가입 하러가기</button>
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
	$("#loginBtn").on("click", function(event){
		var ajaxData = {
			memId : "song_chic"	
		};
		publicAjax("POST", "${ctx }/rest/login", ajaxData, function(response){
			console.log(response);
		});
	});
</script>
</body>
</html>