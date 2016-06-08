<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<link rel="stylesheet" type="text/css" href="${ctx }/css/edit-member.css">

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
			<div class="content member-wrap row">
			
			<div class="col-sm-3">
				<div class="box-layout">
					<p class="title"><b>프로필 사진</b></p>
					
					<div class="profile-wrap row">
					
						<div class="profile-zone">
							<div class="hidden-input-box">
								<input type="file" name="profileFile" class="profile-file" value="">
							</div>
							<p><img class="user lazy img-circle img-thumbnail" data-original="${ctx }/img/profile/data/${member.profile}"></p>
							<h3>${member.name }</h3>
							<p><button type="button" class="btn btn-primary btn-sm" onclick="document.all.profileFile.click();">사진 수정</button></p>
						</div>
						
					</div>
					
				</div>
				
				<div class="box-layout">
						<p class="title"><b>회원메뉴</b></p>
						
						<div class="list-group">
						  <a href="#" class="list-group-item">비밀번호 변경</a>
						  <a href="#" class="list-group-item">회원탈퇴</a>
						</div>
					</div>
			</div>
			
			<div class="col-sm-9">
				<div class="box-layout">
					<p class="title"><b>회원정보 수정</b></p>
					<form id="editMember" class="form-horizontal row">
						
						<div class="form-group">
							<label class="col-sm-2 control-label">이름</label>
							<div class="col-sm-10">
								<input type="text" name="name" class="form-control" placeholder="이름을 입력해주세요." value="${member.name }">
							</div>
						</div>
					
						<div class="form-group">
							<label class="col-sm-2 control-label">이메일</label>
							<div class="col-sm-10">
								<input type="text" name="email" class="form-control" placeholder="이메일을 입력해주세요." value="${member.email }">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">전화번호</label>
							<div class="col-sm-10">
								<input type="text" name="phone" class="form-control" placeholder="전화번호를 입력해주세요." value="${member.phone }">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">성별</label>
							<div class="col-sm-10">
								<div class="form-group">
									<div class="radio">
										<label>
											<input type="radio" name="gender" value="1" checked>
											남성
										</label>
										
										<label>
											<input type="radio" name="gender" value="2">
											여성
										</label>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row birthday-wrap form-group">
						<label class="col-sm-2 control-label">생년월일</label>
							<div class="col-sm-10 birthday-group row">
								
								<div class="col-sm-6">
									<input type="text" name="year" id="year" class="form-control year" maxlength="4" value="${member.birthdayYear > 0 ? member.birthdayYear : '' }">
								</div>
								<div class="col-sm-3">
									<select name="month" id="month" class="form-control month">
										<c:set var="now" value="<%=new java.util.Date()%>" />
										<option value="">월</option>
										<c:forEach begin="1" end="12" varStatus="status">
											<option value="${status.count }" ${member.birthdayMonth == status.count ? "selected" : "" }> ${status.count } </option>
										</c:forEach>
									</select>
								</div>
								<div class="col-sm-3 day-input">
									<input type="text" name="day" id="day" class="form-control day" maxlength="2" value="${member.birthdayDay > 0 ? member.birthdayDay : '' }">
								</div>
								<p class="info-text error-msg clearfix"></p>
							</div>
							
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">학교 지역</label>
							<div class="col-sm-10">
								<select name="schoolRegion" class="form-control">
								<option value="">지역을 선택해주세요.</option>
								<%
									for ( int i = 0; i < MyclassCommon.schoolRegion.length; i++ ) {
								%>
									<option value=<%= MyclassCommon.schoolRegion[i][0] %>><%= MyclassCommon.schoolRegion[i][1] %></option>
								<% 		
									} 
								%>
								
								</select>
							</div>
						</div>
						
						<div class="form-group school-wrap">
							<label class="col-sm-2 control-label">학교</label>
							<div class="col-sm-10 school-wrap">
								<div class="select-box">
								<select class="school-select form-control hide" multiple="" name="schoolSelect">
								</select>
								<input type="text" name="schoolName" class="form-control school-name" placeholder="학교이름을 입력해주세요." value="${member.school }">
								</div>
							</div>
						</div>
						
						<div class="pull-right">
							<button type="button" class="btn btn-default">취소</button>
							<button type="submit" class="btn btn-primary">수정</button>
						</div>
						
					</form>					
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
var oldFileName = "${member.profile }";

$.material.init();

$(".birthday-group").on("keyup focus", "input, select", function ( event ) {
	birthDayVaildate ();
});

function birthDayVaildate () {
	var $year = $("#year"),
		$month = $("#month"),
		$day = $("#day"),
		$targt = $(".birthday-group p"),
		errorArry = [
			"※태어난 년도 4자리를 정확하게 입력하세요.",
			"※태어난 월을 선택해주세요.",
			"※태어난 일을 2자리를 정확하게 입력하세요."
		             ];
	
	if ( $year.val() == "" || $year.val().length < 4 ) {
		$targt.text(errorArry[$year.parent().index()]).show();
		return false;
	}
	if ( $month.val() == "" ) {
		$targt.text(errorArry[$month.parent().index()]).show();
		return false;
	}
	if ( $day.val() == "" || $day.val().length < 2 ) {
		$targt.text(errorArry[$day.parent().index()]).show();
		return false;
	}
	$targt.text("");
}

$("#editMember").validate({
	errorClass: "info-text error-msg clearfix",
	errorElement: "p",
	onfocusout: function (element) {
        $(element).valid();
    },
    groups: {
		birthday: "year month day"
	},
	submitHandler: function ( form ) {
		var formData = new FormData();
		if ( $(".profile-file").val() != "" ) {
			formData.append("oldFileName", oldFileName);
			formData.append("profile", $(".profile-file")[0].files[0]);
		} else {
			formData.append("profile", oldFileName);
		}
		
		formData.append("id", "${member.id }");
		formData.append("name", form.name.value);
		formData.append("email", form.email.value);
		formData.append("phone", form.phone.value);
		formData.append("gender", form.gender.value);
		formData.append("birthdayYear", form.year.value);
		formData.append("birthdayMonth", form.month.value);
		formData.append("birthdayDay", form.day.value);
		formData.append("userType", "${member.userType }");
		
		formData.append("schoolRegion", form.schoolRegion.value);
		formData.append("schoolName", form.schoolName.value);
		
		$.ajax({
			dataType : 'json',
            url : "${ctx }/rest/setMember",
            data : formData,
            type : "POST",
            enctype: 'multipart/form-data',
            processData: false, 
            contentType: false
        }).done( function( response ) {
        	
        	if ( response > 0 ) {
				location.href = "${ctx }/setting";
			}
        	
        }).fail ( function ( response ){
        	
        });
		
	},
	rules: {
		name: {
			required: true
		},
		email: {
			required: true,
			email: true
		},
		phone: {
			required: true
		},
		schoolRegion: {
			required: true
		},
		year : {
			required: true,
			minlength: 4
		},
		month : {
			required: true
		},
		day : {
			required: true,
			minlength: 2
		}
	},
	messages: {
		name: {
			required: "※필수 입력사항입니다."
		},
		email: {
			required: "※필수 입력사항입니다.",
			email : "※이메일을 다시 확인해주세요."
		},
		phone: {
			required: "※필수 입력사항입니다."
		},
		schoolRegion: {
			required: "※필수 입력사항입니다."
		},
	},
	errorPlacement: function ( error, element ) {
		if (element.attr("name") == "year" || element.attr("name") == "month" || element.attr("name") == "day" ) {
		} else {
			error.insertAfter(element);
		}
	}
	
});

$(".school-name").on("keyup", function ( event ) {
	var searchSchulNm = $(this).val();
	
	searchSchulNm = searchSchulNm.trim();
	
	if ( searchSchulNm != "" ) {
		getSchoolName (searchSchulNm);
	}
});

$(".school-select").on("mousedown", "option", function ( event ) {
	$(".school-name").val( $(this).text() );
});

$(".school-name").on("blur", function ( event ) {
	$(".school-select").removeClass("show").addClass("hide");
});

$(".school-name").on("focus", function ( event ) {
	
	if ( $(".school-select option").length > 0 ) {
		if ( $(this).val().trim() != "" ) {
			$(".school-select").removeClass("hide").addClass("show");	
		}
	} else {
		if ( $(this).val().trim() != "" ) {
			getSchoolName ( $(this).val() );
		}
	}
	
	
});

function getSchoolName ( searchSchulNm ) {
	
	var schoolData = {
			url : "http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=af16ae577e3165afd7a430929691f573&svcType=api&svcCode=SCHOOL&contentType=json&gubun=high_list&region=100271&perPage=10000",
					//http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=af16ae577e3165afd7a430929691f573&svcType=api&svcCode=SCHOOL&contentType=json&gubun=high_list&region=100271&perPage=10000&searchSchulNm=
			searchSchulNm : searchSchulNm
		};
	
	$.ajax({
	 	method : "post",
        url : "${ctx }/rest/getSchool",
        data : schoolData
	}).done (function ( response ) {
		 if ( JSON.parse(response[0]).dataSearch.content.length > 0 ) {
			 var insertHtml = "",
			 	 schoolInfo = JSON.parse(response[0]).dataSearch.content;
			 
			 for (var i = 0; i < schoolInfo.length; i++) {
				 insertHtml += "<option>" + schoolInfo[i].schoolName + "</option>";
			 }
			 
			 $(".school-select").html(insertHtml).removeClass("hide").addClass("show");
		 }
	}).fail (function ( response ) {
		
	});
	
}

$(".profile-file").on("change", function ( event ) {
	
	if ( this.files && this.files[0] ) {
		var reader = new FileReader();
		reader.onload = function ( e ) {
			
			var imgHtml = "<img src='" + e.target.result + "'>";
			$(".user").attr("data-original", e.target.result);
			$(".user").lazyload();
		}
		reader.readAsDataURL(this.files[0]);
	}
	
});

</script>
</body>
</html>