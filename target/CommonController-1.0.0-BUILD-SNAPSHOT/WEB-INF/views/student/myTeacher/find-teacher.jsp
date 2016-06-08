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
<link rel="stylesheet" type="text/css" href="${ctx }/css/student/find-teacher.css">

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
			<div class="content box-padding">
				<h2>선생님검색</h2>
				
				<div class="input-group">
			      <input type="text" class="form-control find-name" placeholder="Search for...">
			      <span class="input-group-btn">
			        <button class="btn btn-default find-btn" type="button"><span class="visibility">검색</span><i class="fa fa-search" aria-hidden="true"></i></button>
			        <button class="btn btn-default" type="button" data-toggle="collapse" href="#selectOption" aria-expanded="false"><span class="visibility">검색옵션</span><i class="fa fa-th" aria-hidden="true"></i></button>
			      </span>
			    </div><!-- /input-group -->
			    
			    <div id="selectOption" class="box-layout search-filter collapse">
			    	<div role="tabpanel">
			    		<ul class="nav nav-tabs" role="tablist">
			    			<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">지역별</a></li>
			    			<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">교과별</a></li>
			    		</ul>
			    		
			    		<div class="tab-content padding-box">
						    <div role="tabpanel" class="tab-pane fade in active" id="home">
								
								<div class="form-inline region-select">
									<div class="form-group">
										<label class="control-label">지역선택</label>
									    <select id="city" class="form-control city">
									    	<option>시도를 선택하세요.</option>
									    	<option>대전광역시</option>
									    </select>
								    </div>
								    
									<div class="form-group">
									    <select id="district" class="form-control district">
									    	<option>시도를 먼저 선택해주세요.</option>
									    </select>
								    </div>
							    </div>
								
							</div>
						    <div role="tabpanel" class="tab-pane fade" id="profile">
								<span class="checkbox allcheck">
									<label class="checkbox-inline">
									  <input type="checkbox" id="inlineCheckbox1" value="option1"> 전체
									</label>
								</span>
								<span class="subject-wrap">
									<span class="checkbox">
										<label class="checkbox-inline">
										  <input type="checkbox" id="inlineCheckbox1" value="option1"> 국어
										</label>
									</span>
									<span class="checkbox">
										<label class="checkbox-inline">
										  <input type="checkbox" id="inlineCheckbox1" value="option1"> 영어
										</label>
									</span>
									<span class="checkbox">
										<label class="checkbox-inline">
										  <input type="checkbox" id="inlineCheckbox1" value="option1"> 수학
										</label>
									</span>
									<span class="checkbox">
										<label class="checkbox-inline">
										  <input type="checkbox" id="inlineCheckbox1" value="option1"> 과학
										</label>
									</span>
								</span>
							</div>
						</div>
			    	</div>
			    </div>
			    
			    <p>※가입된 선생님은 검색되지 않습니다.</p>
			    
			    <div class="row teacher-search-wrap">
			    	<div class="box-layout">
			    		<div id="teacherResultBox" class="box-padding">
			    		</div>
		    		</div>
			    </div>
		    </div>
		</div>
		
		<div id="footer">
		</div>
		
		<div class="modal fade" id="selectModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
		      </div>
		      <div class="modal-body">
		        ...
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary submit-btn">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
</div>

<script type="text/javascript">
var ctx = "${ctx }";
</script>

<%@include file="/WEB-INF/views/include/common-lib.jsp" %>
<script type="text/javascript">
$.material.init();

/* 과목 전체 클릭시 */
$(".allcheck").on("click", function ( event ) {
	$(".subject-wrap input").prop("checked", $(this).find("input").prop("checked"));
});

/* 과목이 모두 선택되는지 체크하는 이벤트 */
$(".subject-wrap").on("click", ".checkbox", function ( event ) {
	var totalLength = $(".subject-wrap").find("input").length,
		checkedLength = $(".subject-wrap").find("input:checked").length;
	
	$(".allcheck").find("input").prop("checked", checkedLength == totalLength);
});

/* enter event */
$(".find-name").on("keyup", function ( event ) {
	if ( event.keyCode == 13 ) {
		$(".find-btn").click();
	}
});

$(".find-btn").on("click", function ( event ) {
	var searchVal = $(this).parent().prev().val();
	if ( searchVal == "" ) {
		return false;
	}
	
	var ajaxData = {
			name : searchVal,
			studentId : "${member.id }"
	}
	publicAjax("post", "${ctx }/rest/student/teacherFind", ajaxData, function ( response ) {
		var appendHtml = "",
			resultBox = document.getElementById("teacherResultBox");
		
		
		if ( response.length > 0 ) {
			
			for ( var i = 0; i < response.length; i++ ) {
				
				appendHtml += "<div class='teacher-item row' data-item='" + response[i].id + "'>";
				appendHtml += "<a class='teacher_img pull-left'>";
				appendHtml += "<div class='img-zone'>";
				appendHtml += "<img class='user lazy' data-original='${ctx }/img/profile/data/" + response[i].profile + "'>";
				appendHtml += "</div>";
				appendHtml += "</a>";
				appendHtml += "<div class='teacher-info-wrap clearfix'>";
				appendHtml += "<div class='pull-right teacher-btn'>";
				appendHtml += "<button type='button' class='btn btn-default btn-sm'>반보기</button>";
				appendHtml += "<button type='button' class='btn btn-success btn-sm submit-btn'><span class='visibility'>추가</span><i class='fa fa-user-plus' aria-hidden='true'></i></button>";
				appendHtml += "</div>";
				appendHtml += "<div class='teacher-info'>";
				appendHtml += "<h4>" + response[i].name + "</h4>";
				
				
				if ( response[i].classes.length <= 2 && response[i].classes[1] ) {
					appendHtml += "<p><i class='fa fa-book' aria-hidden='true'></i> " + response[i].classes[1].name + "와(과) " + response[i].classes[1].name +"를(을) 개설했습니다.</p>";
				} else if ( response[i].classes[1] ) {
					appendHtml += "<p>반을 개설하지 않았습니다.</p>"
				}
				appendHtml += "</div>";
				appendHtml += "</div>";
				appendHtml += "</div>";
			}
			
			resultBox.innerHTML = appendHtml;
			imageLoad();
		} else {
			appendHtml += "<div class='no-search'>";
			appendHtml += "<p>" + searchVal  + "선생님이 존재 하지 않습니다.</p>";
			appendHtml += "</div>";
			resultBox.innerHTML = appendHtml;
		}
	});
});

var $this = document.getElementById("city");
publicAjax("post", "${ctx }/rest/getJuso", {}, function ( response ) {
	
	var list = JSON.parse(response[0]),
		appendHtml = "<option>시도를 선택하세요.</option>";
	for ( i = 0; i < list.length; i++ ) {
		appendHtml += "<option value='" + list[i].sd_cd + "'>" + list[i].sd_nm + "</option>";
	}
	$this.innerHTML = appendHtml;
});	

$(".city").on("change", function ( event ) {
	var ajaxData = {
		sdcd : $(this).val()
	};
	publicAjax("post", "${ctx }/rest/getJuso", ajaxData, function ( response ) {
		var list = JSON.parse(response[0]).SGG_LIST,
			appendHtml = "<option>시군구를 선택하세요.</option>",
			$target = document.getElementById("district");
		for ( i = 0; i < list.length; i++ ) {
			appendHtml += "<option value='" + list[i].sgg_cd + "'>" + list[i].sgg_nm + "</option>";
		}
		$target.innerHTML = appendHtml;
	});
});
	var teacherId,
		studentId,
		$this;
	
$(".teacher-search-wrap").on("click", ".submit-btn", function ( event ) {
	teacherId = $(this).closest(".teacher-item").attr("data-item");
	studentId = "${member.id }",
	$this = $(this);
	var ajaxData = {
			teacherId : teacherId
		},
		options = {
			url : "${ctx }/rest/student/getTeacherClassName",
			ajaxData : ajaxData
		};
	anywhereAjax(options, function (response) {
		
		var appendHtml = "";
			appendHtml = "<div class='class-select-wrap'>";
		for ( var i = 0; i < response.length; i++ ) {
			appendHtml += "<div class='checkbox'>";
			appendHtml += "<label>";
			appendHtml += "<input type='checkbox' value='" + response[i].id + "'> ";
			appendHtml += response[i].name;
			appendHtml += "</label>";
			appendHtml += "</div>";
		}
		appendHtml += "</div>";
		
		$target = $("#selectModal");
		$target.find(".modal-title").html("가입할 반을 선택해주세요.");
		$target.find(".modal-body").html(appendHtml);
		$target.modal("show");
	 	$.material.init();
	 	return false;
	});
});

$("#selectModal").on("click", ".submit-btn", function ( event ) {
	var $checkedInput = $("#selectModal .modal-body").find(".checkbox input:checked"),
		classIds = [];
    
    for ( var i = 0; i < $checkedInput.length; i++ ) {
    	classIds.push( $($checkedInput[i]).val() );  
    }
    var options = {
	    	url : "${ctx }/rest/student/classRequest",
	    	ajaxData : {
	    			teacherId : teacherId, 
	    			studentId : studentId,
	    			classIds : classIds.toString()
        	}
    	};
    console.log(options);
    
    anywhereAjax (options, function (response) {
    	if ( response > 0 ) {
			$this.closest(".teacher-item").animate({
				left: "150%"
			},function () {
				$(this).slideUp();
			});
			}
    });
    $("#selectModal").modal("hide");
});

</script>
</body>
</html>