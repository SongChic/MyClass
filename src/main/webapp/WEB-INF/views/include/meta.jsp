<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="ctx"/>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="${ctx }/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${ctx }/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${ctx }/css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css" href="${ctx }/css/bootstrap-material-design.css">

<link rel="stylesheet" type="text/css" href="${ctx }/css/library/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="${ctx }/css/library/jquery.mCustomScrollbar.min.css">
<link rel="stylesheet" type="text/css" href="${ctx }/css/library/font-awesome.css">
<link rel="stylesheet" type="text/css" href="${ctx }/css/library/fullcalendar.css">
<link rel="stylesheet" type="text/css" href="${ctx }/css/library/bootstrap-datetimepicker.css">
<link rel="stylesheet" type="text/css" href="${ctx }/css/common.css">

<!-- Modal -->
<div class="modal fade" id="noticeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-primary">
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default cancel-btn" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary confirm-btn">확인</button>
      </div>
    </div>
  </div>
</div>