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



<%@include file="/WEB-INF/views/include/common-lib.jsp" %>
<script type="text/javascript">
	$.material.init();
</script>
</body>
</html>