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

	String userId = "";
	if (request.getRemoteUser() != null) {
		userId = request.getRemoteUser();
	}
%>

<title><%= appName %> - 로그인</title>
<%@include file="/WEB-INF/views/include/meta.jsp" %>

<link rel="stylesheet" type="text/css" href="${ctx }/css/login.css">
</head>
<body>

<div id="wrap">	
	<div id="container" class="row">
		
	</div>
	<!-- container (e) -->
	
	<%-- modal zone (s) --%>
	
	<!-- Modal -->
	<div class="modal fade" id="findStudentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">학생 찾기</h4>
	      </div>
	      <div class="modal-body">
	      <form onsubmit="findStudent(this); return false;">
	      
			<div class="input-group">
		      <input type="text" class="form-control student-name" name="studentName" placeholder="학생의 이름을 입력해주세요.">
		      <span class="input-group-btn">
		        <button class="btn btn-default find-student-btn" type="submit">검색</button>
		      </span>
		    </div><!-- /input-group -->
		    
		    <p class="info-text error-msg hide">※학생이름을 입력해주세요.</p>
		    
		    </form>
			
			<div class="find-student-wrap">
				<div class="find-student-content">
				</div>
			</div>
			
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary save-student">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<%-- modal zone (e) --%>
	
	<div id="footer">
	
	</div>
</div>

<script type="text/javascript">
var ctx = "${ctx }";
</script>

<%@include file="/WEB-INF/views/include/common-lib.jsp" %>
<script type="text/javascript" src="${ctx }/js/library/jquery.tmpl.js" ></script>

<script id="signUp" type="text/html" language="java">

<div class="sign-up-box row tmpl-type">
	<div class="app-info col-md-5">
		<h1><strong>선생님한테 질문부터<br>
		우리반 채팅까지</strong></h1>
				
		<p>MY CLASS로 학습 지도부터 친구들과의 대화, 과제 하기,<br>
		시험 미리 보기 등 여러 가지 기능을 한곳에!<br>
		이제 MY CLASS로 재밌게 공부하세요.</p>
				
		<h2>2016년 12월 안드로이드<br>
		COMMING SOON</h2>
	</div>

	<div class="signup-wrap col-md-7">
		<form id="signUpProcess" onsubmit="onSignUp(this); return false;" autocomplete="off">
			<h2 class="title">회원가입</h2>

			<div class="btn-group user-type" role="group">
  				<button type="button" class="btn btn-default active" data-item="3">학생</button>
				<button type="button" class="btn btn-default" data-item="2">부모님</button>
				<button type="button" class="btn btn-default" data-item="1">선생님</button>
			</div>

			<div class="form-group">
				<label>프로필</label>
				<div class="profile-wrap row">
					<div class="col-xs-12 row">
						<div class="photo-zone mouse-pointer" onclick="document.all.profile.click(); return false;">
							<i class="fa fa-camera" aria-hidden="true"></i>
						</div>
						<div class="photo-input">
							<input type="file" id="profile" name="profile" style="display: none;">
							
							<button class="btn btn-success" onclick="document.all.profile.click(); return false;">파일 선택</button>
							<p class="help-block">파일을 선택해주세요.</p>
						</div>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label for="id">아이디</label>
				<input type="text" id="id" name="id" class="form-control">
				<p class="info-text error-msg hide">※아이디를 입력해주세요.</p>
			</div>

			<div class="form-group">
				<label for="pw1">비밀번호</label>
				<input type="password" id="pw1" class="form-control">
				<p class="info-text error-msg hide">※필수 정보입니다.</p>
			</div>

			<div class="form-group">
				<label for="pw2">비밀번호 확인</label>
				<input type="password" id="pw2" class="form-control">
				<p class="info-text error-msg hide">※필수 정보입니다.</p>
			</div>

			<div class="form-group">
				<label for="name">이름</label>
				<input type="text" id="name" class="form-control">
				<p class="info-text error-msg hide">※필수 정보입니다.</p>
			</div>

			<div class="form-group">
				<label for="email">이메일</label>
				<input type="text" id="email" class="form-control">
				<span id="helpBlock" class="help-block">
					※아이디 / 비밀번호 찾기시 이메일로 발송됩니다. 사용하는 이메일을 입력해주세요.
				</span>
				<p class="info-text error-msg hide">※필수 정보입니다.</p>	
			</div>

			<div class="form-group">
				<label for="phone">전화번호</label>
				
				<input type="text" id="phone" class="form-control">
				<p class="info-text error-msg hide">※필수 정보입니다.</p>	
			</div>

			<div class="form-group">
				<label>성별</label>
				<div class="gender-select">
					<span class="radio radio-inline">
						<label>
							<input type="radio" name="gender" value="1" checked />
							남
						</label>
					</span>
					<span class="radio radio-inline">
						<label>
							<input type="radio" name="gender" value="2" />
							여
						</label>
					</span>
				</div>
			</div>

			<div class="form-group">
				<label>생년월일</label>
				<div class="row birthday-wrap">
					<div class="col-md-6">
						<input type="text" id="year" class="form-control" maxlength="4"/>
					</div>
					<div class="col-md-3 month-wrap">
						<select id="month" class="form-control">
							<option selected>월</option>
							<option value="11">11</option>
						</select>
					</div>
					<div class="col-md-3 day-wrap">
						<input type="text" id="day" class="form-control" maxlength="2"/>
					</div>
					<p class="info-text error-msg hide">※태어난 년도 4자리를 정확하게 입력하세요.</p>
				</div>

			</div>

			<div class="form-group slogan hide">
				<label>슬로건</label>
				<input type="text" id="slogan" class="form-control">
			</div>

			<div class="form-group school hide">
				<label for="school">슬로건</label>
				<input type="text" id="school" class="form-control">
			</div>

			<div class="form-group find-student hide">
				<label>학생찾기</label>
				<div class="input-group">
					<input type="text" class="form-control student-name-text" readonly/>
					<span class="input-group-btn">
     				   <button class="btn btn-default find-student-btn" type="button">찾기</button>
     				</span>
				</div>
			</div>
			
			<div class="student-info show">
				<div class="form-group">
					<label>학교분류</label>
					<div class="gender-select">
						<span class="radio radio-inline">
							<label>
								<input type="radio" name="schoolLevel" value="1" checked />
								초등학교
							</label>
						</span>
						<span class="radio radio-inline">
							<label>
								<input type="radio" name="schoolLevel" value="2" />
								중학교
							</label>
						</span>
						<span class="radio radio-inline">
							<label>
								<input type="radio" name="schoolLevel" value="3" />
								 고등학교
							</label>
						</span>
					</div>
				</div>
				<div class="form-group school-wrap">
					<label for="school">학교이름</label>
					<input type="text" id="schoolName" name="schoolName" class="form-control">
					<div class="school-name-wrap hide">
						<div class="school-name">
						</div>
					</div>
					<p class="info-text error-msg hide">※필수 정보입니다.</p>	
				</div>
			</div>
			

			<div class="signup-btn">
				<button type="submit" id="signupBtn" class="btn btn-primary btn-lg btn-block">회원가입하기</button>
					<hr>
				<button type="button" class="btn btn-success btn-lg btn-block tmpl-btn">로그인 하러가기</button>
			</div>
		</form>
	</div>
</div>

</script>

<script id="login" type="text/html" language="java">

	<div class="login-box row tmpl-type">
			<div class="app-info col-md-7">
				<h1><strong>선생님한테 질문부터<br>
				우리반 채팅까지</strong></h1>
				
				<p>MY CLASS로 학습 지도부터 친구들과의 대화, 과제 하기,<br>
				시험 미리 보기 등 여러 가지 기능을 한곳에!<br>
				이제 MY CLASS로 재밌게 공부하세요.</p>
				
				<h2>2016년 12월 안드로이드<br>
				COMMING SOON</h2>
			</div>
			<div class="login-wrap col-md-5">
			<form id="loginProcess" method="post" onsubmit="onSubmit(this); return false;">
				<div class="login-box-wrap">
					<div class="form-group">
					<p>${sessionScope.userLoginInfo.username}</p>
						<label for="id">아이디</label>
						<input type="text" class="form-control" id="id" name="id">
					</div>
					<div class="form-group">
						<label for="pw">비밀번호</label>
						<input type="password" class="form-control" id="pw" name="pw">
					</div>
<!-- 					<div class="form-group"> -->
<!-- 						<div class="checkbox"> -->
<!-- 							<label> -->
<!-- 								<input type="checkbox" class="auto-login"> -->
<!-- 								자동 로그인 -->
<!-- 							</label> -->
<!-- 						</div> -->
<!-- 					</div> -->
					
					<div class="login-help">
						<p>아이디 또는 비밀번호를 잊어 버리셧나요?</p>
						<a>아이디</a> / <a>비밀번호</a> 찾기
					</div>
					
					<div class="login-btn">
						<button type="submit" id="loginBtn" class="btn btn-primary btn-lg btn-block">로그인하기</button>
						<hr>
						<button type="button" class="btn btn-success btn-lg btn-block tmpl-btn">회원가입 하러가기</button>
					</div>
				</div>
			</form>
			</div>
		</div>


</script>
<script type="text/javascript">
	var loginReportArr = [
			"입력하신 아이디가 존재하지 않습니다.",
			"입력하신 아이디와 비밀번호가 일치하지 않습니다."
	                      ],
	    loginCheckArr = [
	        "아이디를 입력해주세요.",
	        "비밀번호를 입력해주세요."
	                     ];
	
	var $container = $("#container"),
		userType = 3,
		signUpState = 1,
		studentArr = [];

	function onSubmit (form) {
		
		var ajaxData = {
			memId : form.id.value,	
			memPw : form.pw.value	
		};
		
		publicAjax("post", "${ctx }/rest/loginCheck", ajaxData, function(response){
			console.log(response);
			if (response == 2) {
				
				if ($(".auto-login").prop("checked")) {
					setMember(form.id.value)
				}
				
				form.action = "${ctx }/loginProcess";
				form.submit();
			} else {
				form.pw.value = "";
				$(".login-wrap").effect("shake");
			}
		});
		return false;
	}
	
	function onSignUp ( form ) {
		
		$(".signup-wrap").find(".error-msg").removeClass("hide").addClass("show");
		
		if ( form.id.value === "" ) {
			$(form.id).next().text("※아이디를 입력해주세요.");
			return false;
		}
		
		if ( form.id.value.length < 5 ) {
			$(form.id).next().text("※아이디는 최소 5자 이상으로 적어주세요.");
			return false;
		}
		
		if ( form.pw1.value == "" ) {
			$(form.pw1).next().removeClass("hide").addClass("show").text("※필수 정보입니다.");
			return false;
		} else {
            $(form.pw1).next().removeClass("show").addClass("hide");
        }
		
		if ( form.pw2.value == "" ) {
			$(form.pw2).next().removeClass("hide").addClass("show").text("※필수 정보입니다.");
		} else {
            $(form.pw2).next().removeClass("show").addClass("hide");
        }
		
		if (form.pw1.value !== form.pw2.value) {
			$(form.pw1).next().removeClass("hide").addClass("show").text("※비밀번호가 일치하지 않습니다.");
		} else {
			$(form.pw1).next().removeClass("show").addClass("hide");
		}
		
		if ( form.name.value == "" ) {
			$(form.name).next().removeClass("hide").addClass("show");
		} else {
            $(form.name).next().removeClass("show").addClass("hide");
        }
		
		if ( form.email.value == "" ) {
			$(form.email).next().removeClass("hide").addClass("show");
		} else {
            $(form.email).next().removeClass("show").addClass("hide");
        }
		
		if ( form.phone.value == "" ) {
			$(form.phone).next().removeClass("hide").addClass("show");
		} else {
            $(form.phone).next().removeClass("show").addClass("hide");
        }
		
		//birthday check
		if ( form.year.value === "" || form.year.value.length < 4 ) {
			$(form).find(".birthday-wrap .error-msg")
			       .text("※태어난 년도 4자리를 정확하게 입력하세요.");
			return false;
		} else {
			$(form).find(".birthday-wrap .error-msg").removeClass("show").addClass("hide");
		}
		
		if ( isNaN(form.month.value) ) {
			$(form).find(".birthday-wrap .error-msg")
		       .text("※태어난 월을 선택하세요.");
			return false;
		} else {
			$(form).find(".birthday-wrap .error-msg").removeClass("show").addClass("hide");
		}
		
		if ( form.day.value === "" || form.day.value.length < 2 ) {
			$(form).find(".birthday-wrap .error-msg")
		       .text("※태어난 일(날짜) 2자리를 정확하게 입력하세요.");
			return false;
		} else {
			$(form).find(".birthday-wrap .error-msg").removeClass("show").addClass("hide");
		}
		
		if ( form.schoolName.value === "" && userType === 3 ) {
			$(form.schoolName).parent().find("p").removeClass("hide").addClass("show");
			return false;
		} else {
			$(form.schoolName).parent().find("p").removeClass("show").addClass("hide");
		}
		
		var gender = 1;
		
		for (var i = 0; i < form.gender.length; i++) {
			if ( form.gender[i].checked == true ) gender = form.gender[i].value;
		}
		
		var ajaxData = {
				memId : form.id.value
			};
		
		
		if ( signUpState > 0 ) {
			$(form.id).next().text("※이미 사용중이거나 탈퇴한 아이디입니다.");
			return false;
		} else {
			$(form.id).next().removeClass("show").addClass("hide");
		}
		
		// sign up process
		var formData = new FormData();
		
		formData.append("id", 0);
		
		formData.append("profile", $("#profile").val() != "" ? $("#profile")[0].files[0] : "");
		
		formData.append("memId", form.id.value);
		formData.append("memPw", form.pw1.value);
		formData.append("name", form.name.value);
		formData.append("email", form.email.value);
		formData.append("phone", form.phone.value);
		formData.append("userType", userType);
		formData.append("gender", gender);
		formData.append("birthdayYear", form.year.value);
		formData.append("birthdayMonth", form.month.value);
		formData.append("birthdayDay", form.day.value);
		
		if ( userType == 3 ){
			formData.append("schoolName", form.schoolName.value);
		} else if ( userType == 2 ) {
			formData.append("studentArr", studentArr.toString());
		} else if ( userType == 1 ) {
			formData.append("slogan", form.slogan.value);
		}
		
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
        		
        		noticeModal({title : "회원가입 완료", content : "회원가입이 완료되었습니다."}, function ( result ) {
       				location.href = "${ctx }/teacher/classes/manageClasses?type=1";
        		})
        		
				
			}
        	
        }).fail ( function ( response ){
        	
        });
		
	}
	
	$("#login").tmpl().appendTo($container);
	$(".login-wrap").css({left : 0});
	$.material.init();
	
	$container.on("click", ".tmpl-btn", function ( event ) {
		
		if ( $(this).closest(".tmpl-type").hasClass("login-box") ) {
			$container.clearQueue();
			$(".login-wrap").animate ({
				left : $(".login-wrap").outerWidth()
			},500);
			
			$container.delay(500).queue(function (){
				$(this).empty();
			});
			$("#signUp").tmpl().delay(500).queue(function (){
				$(this).appendTo($container);
				$.material.init();
				$(".signup-wrap").animate ({
					left : 0
				},500);
			});
		} else {
			$container.clearQueue();
			
			$(".signup-wrap").animate ({
				left : $(".signup-wrap").outerWidth()
			},500);
			
			$container.delay(500).queue(function (){
				$(this).empty();
			});
			$("#login").tmpl().delay(500).queue(function (){
				$(this).appendTo($container);
				$(".login-wrap").animate ({
					left : 0
				},500);
			});
		}
	});
	
	$container.on("click", ".user-type", function ( event ) {
		userType = $(event.target).attr("data-item");
		
		$(event.currentTarget).children().removeClass("active");
		$(event.target).addClass("active");
		
		/* slogan show hide event */
		if ( userType == 1 ) {
			if ( $container.find(".slogan").hasClass("hide") ) $container.find(".slogan").removeClass("hide").addClass("show");
		} else {
			if ( $container.find(".slogan").hasClass("show") ) $container.find(".slogan").removeClass("show").addClass("hide");
		}
		
		/* find student show hide event */
		if ( userType == 2 ) {
			if ( $container.find(".find-student").hasClass("hide") ) $container.find(".find-student").removeClass("hide").addClass("show");
		} else {
			if ( $container.find(".find-student").hasClass("show") ) $container.find(".find-student").removeClass("show").addClass("hide");
		}
		
		/* school show hide event */
		if ( userType == 3 ) {
			if ( $container.find(".student-info").hasClass("hide") ) $container.find(".student-info").removeClass("hide").addClass("show");
		} else {
			if ( $container.find(".student-info").hasClass("show") ) $container.find(".student-info").removeClass("show").addClass("hide");
		}
		
	});
	
	$container.on("blur", ".signup-wrap input, .signup-wrap select", function ( event ) {
		var $this = $(event.target);
		
		if ( $(event.target).attr("id") === "id" ) {
			if ( $(this).val() === "" ) {
				$(this).parent().find("p").removeClass("hide").addClass("show").text("※아이디를 입력해주세요.");
				return false;
			} else {
				$(this).parent().find("p").removeClass("show").addClass("hide");
			}
			
			if ( $(this).val().length < 5 ) {
				$(this).parent().find("p").removeClass("hide").addClass("show").text("※아이디는 최소 5자 이상으로 적어주세요.");
				return false;
			} else {
				$(this).parent().find("p").removeClass("show").addClass("hide");
			}
			
			var ajaxData = {
				memId : $(this).val()
			};
			
			publicAjax("post", "${ctx }/rest/idCheck", ajaxData, function ( response ) {
				if ( response > 0) {
					signUpState = 1;
					$this.parent().find("p").removeClass("hide").addClass("show").text("※이미 사용중이거나 탈퇴한 아이디입니다.");
					return false;
				} else {
					signUpState = 0;
					$this.parent().find("p").removeClass("show").addClass("hide");
				}
			});
		}
		
		if ( $(event.target).attr("id") === "pw1" ) {
			if ( $this.val() == "" ) {
				$this.parent().find("p").removeClass("hide").addClass("show");
				$this.closest(".form-group")
					 .next()
					 .find("p")
					 .removeClass("error-msg hide")
					 .addClass("error-msg show")
					 .text("※필수 정보입니다.");
				return false;
			} else {
				$this.parent().find("p").removeClass("show").addClass("hide");
			}
		}
		if ( $(event.target).attr("id") === "pw2" ) {
			if ( $this.val() == "" ) {
				$this.parent().find("p").removeClass("hide").addClass("show").text("※필수 정보입니다.");
				return false;
			} else {
				$this.parent().find("p").removeClass("show").addClass("hide");
			}
			
			if ( $this.val() != $(event.target).closest(".form-group").prev().find("#pw1").val() ) {
				$this.parent().find("p").removeClass("hide").addClass("show").text("※비밀번호가 일치하지 않습니다.");
				return false;
			} else {
				$this.parent().find("p").removeClass("show").addClass("hide");
			}
		}
		if ( $(event.target).attr("id") === "name" ) {
			if ( $this.val() == "" ) {
				$this.parent().find("p").removeClass("hide").addClass("show");
				return false;
			} else {
				$this.parent().find("p").removeClass("show").addClass("hide");
			}
		}
		if ( $(event.target).attr("id") === "email" ) {
			if ( $this.val() == "" ) {
				$this.parent().find("p").removeClass("hide").addClass("show");
				return false;
			} else {
				$this.parent().find("p").removeClass("show").addClass("hide").text("");
			}
		}
		if ( $(event.target).attr("id") === "phone" ) {
			if ( $this.val() == "" ) {
				$this.parent().find("p").removeClass("hide").addClass("show");
				return false;
			} else {
				$this.parent().find("p").removeClass("show").addClass("hide").text("");
			}
		}
		if ( $(event.target).attr("id") === "year") {
			if ( $this.val() == "" || $this.val().length < 4 ) {
				$this.closest(".row").find("p").removeClass("hide").addClass("show");
			} else {
				if ( isNaN( $this.closest(".row").find("#month").val() ) ) {
					$this.closest(".row").find("p").removeClass("hide").addClass("show").text("※태어난 월을 선택하세요.");
				}
				
			}
			return false;
		}
		if ( $(event.target).attr("id") === "month") {
			if ( isNaN($this.val()) ) {
				$this.closest(".row").find("p").removeClass("hide").addClass("show").text("※태어난 월을 선택하세요.");
			}
			return false;
		}
		
		if ( $(event.target).attr("id") === "day" ) {
			if ( $this.val() == "" || $this.val().length < 2 ) {
				$this.closest(".row").find("p").removeClass("hide").addClass("show").text("※태어난 일(날짜) 2자리를 정확하게 입력하세요.");
				return false;
			} else {
				$this.closest(".row").find("p").removeClass("show").addClass("hide").text("");
			}
		}
		if ( $(event.target).attr("id") === "schoolName") {
			if ( $this.val() == "" ) {
				$this.closest(".school-wrap").find("p").removeClass("hide").addClass("show");
				return false;
			} else {
				$this.closest(".school-wrap").find("p").removeClass("hide").addClass("hide");
			}
		}
		
	});
	$container.on("change", "#month", function ( event ) {
		var $this = $(event.target);
		$this.closest(".row").find("p").removeClass("hide").addClass("show").text("※태어난 일(날짜) 2자리를 정확하게 입력하세요.");
	});
	
	$container.on("click", ".find-student-btn", function ( event ) {
		$("#findStudentModal").modal("show");
	});
	
	$container.on("click", ".find-school-btn", function ( event ) {
		$(".school-name").val( $container.find("#schoolName").val() );
		
		$("#findSchoolModal").modal("show");
	});
	
	function findStudent (form) {
		if ( form.studentName.value == "" ) {
			$(form).find(".info-text").removeClass("hide").addClass("show");
			return false;
		} else {
			$(form).find(".info-text").removeClass("show").addClass("hide");
		}
		
		var ajaxData = {
			name : 	form.studentName.value
		};
		
		publicAjax ( "post", "${ctx }/rest/findStudent", ajaxData, function ( response ) {
			var appendHtml = "";
			
			if ( response.length > 0 ) {
				appendHtml = "<table class='table table-hover table-responsive'>";
				
				for (var i = 0; i < response.length; i++) {
					appendHtml += "<tr class='student-info-wrap'>";
					
					appendHtml += "<td>";
					appendHtml += "<div class='form-group'>";
					appendHtml += "<div class='checkbox'>";
					
					appendHtml += "<label>";
					appendHtml += "<input type='checkbox' class='student-select' data-item='" + response[i].id + "'>";
					appendHtml += "</label>";
					
					appendHtml += "</div>";
					appendHtml += "</div>";
					appendHtml += "</td>";
					
					appendHtml += "<td class='student-name-info'>";
					appendHtml += response[i].name;
					appendHtml += "</td>";
					
					appendHtml += "<td>";
					appendHtml += response[i].school;
					appendHtml += "</td>";
					
					appendHtml += "</tr>";
				}
				
				appendHtml += "</table>";
			} else {
				appendHtml = "<table class='table table-responsive'>";
				appendHtml += "<tr>";
				appendHtml += "<td class='text-center'>";
				appendHtml += "등록된 학생이 없습니다.";
				appendHtml += "</td>";
				appendHtml += "</tr>";
				appendHtml += "</table>";
			}
			$(".find-student-content").empty().append(appendHtml);
			
			if ( $(".find-student-content").outerHeight() > 610 ) {
				$(".find-student-wrap").mCustomScrollbar({
					axis : "y",
					theme : "minimal-dark",
					autoExpandScrollbar : true,
					mouseWheelPixels: 100,
					setHeight : 610,
					advanced : {
						updateOnContentResize: true,
						autoScrollOnFocus : "textarea"
					}
				});
			} else {
				$(".find-student-wrap").mCustomScrollbar("destroy").removeAttr("style");
			}
			
			$.material.init();
			
		});
	}
	
// 	$.ajaxPrefilter('json', function(options, orig, jqXHR) {
//         return 'jsonp';
//     });
	
	var focusNum = -1;
	
	$container.on("keyup", "#schoolName", function( event ) {
		var searchSchulNm = $(this).val(),
			$target = $(this).next();
		
		searchSchulNm = searchSchulNm.trim();
		
		var schoolData = {
				url : "http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=af16ae577e3165afd7a430929691f573&svcType=api&svcCode=SCHOOL&contentType=json&gubun=high_list&region=100271&perPage=10000",
						//http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=af16ae577e3165afd7a430929691f573&svcType=api&svcCode=SCHOOL&contentType=json&gubun=high_list&region=100271&perPage=10000&searchSchulNm=
				searchSchulNm : searchSchulNm
			};
		
		if ( event.keyCode == 40 ) {
			event.preventDefault();
			
			if ( $container.find(".school-name td").length - 1 <= focusNum ) focusNum = -1;
			focusNum++;
			console.log(focusNum);
			$container.find(".school-name td").removeClass("active");
			$($container.find(".school-name td")[focusNum]).addClass("active");
			
			
			console.log(focusNum);
			
		} else if ( event.keyCode == 38 ) {
			event.preventDefault();
			
			focusNum--;
			if ( focusNum < 0 ) focusNum = $container.find(".school-name td").length - 1;
			$container.find(".school-name td").removeClass("active");
			$($container.find(".school-name td")[focusNum]).addClass("active");
			console.log(focusNum);
			
		} else if ( event.keyCode == 13 ) {
			event.preventDefault();
			
			$container.find("#schoolName").val( $container.find(".school-name td.active").text() );
			$container.find("#schoolName").blur();
			return false;
			
		} else {
			if ( searchSchulNm !== "" ) {
				
				focusNum = -1;
				
				$.ajax({
					method : "post",
					url : "${ctx }/rest/getSchool",
					data : schoolData,
					async : false
				}).done (function ( response ) {
					if ( JSON.parse(response[0]).dataSearch.content.length > 0 ) {
						var insertHtml = "",
							schoolInfo = JSON.parse(response[0]).dataSearch.content;
						insertHtml = "<table class='table table-hover table-responsive'>";
						
						for (var i = 0; i < schoolInfo.length; i++) {
							insertHtml += "<tr class='school-info-wrap'>";
							insertHtml += "<td>";
							insertHtml += schoolInfo[i].schoolName;
							insertHtml += "</td>";
							insertHtml += "</tr>";
						}
						insertHtml += "</table>";
						
						$target.removeClass("hide").addClass("show");
						$target.find(".school-name").html(insertHtml);
						
						if ( $target.find(".school-name").outerHeight() > 200 ) {
							$target.mCustomScrollbar({
								axis : "y",
								theme : "minimal-dark",
								autoExpandScrollbar : true,
								mouseWheelPixels: 100,
								setHeight : 200,
								advanced : {
									updateOnContentResize: true,
									autoScrollOnFocus : "textarea"
								}
							});
						} else {
							$target.mCustomScrollbar("destroy").removeAttr("style");
						}
						
					}
				});
			}
		}
		
	});
	
	$container.on("mousedown", ".school-name-wrap td", function ( event ) {
		$container.find("#schoolName").val($(this).text());
	});
	
	$container.on("blur", "#schoolName", function ( event ) {
		$(this).next().removeClass("show").addClass("hide");
		$container.find(".school-name td").removeClass("active");
		focusNum = 0;
		
	});
	$container.on("focus", "#schoolName", function ( event ) {
		if ( $(this).val().trim() != "" ) {
			$(this).next().removeClass("hide").addClass("show");	
		}
		
	});
	
	$(".save-student").on("click", function ( event ){
		var $checked = $(".find-student-content input:checked"),
			studentName = [];
		studentArr = [];
		for ( var i = 0; i < $checked.length; i++ ) {
			studentArr.push( $($checked[i]).attr("data-item") );
			studentName.push( $($checked[i]).closest(".student-info-wrap").find(".student-name-info").text() );
		}
		
		$(".student-name-text").val( studentName.toString() );
		$("#findStudentModal").modal( "hide" );
		
	});
	
	$container.on("change", "#profile", function (event) {
		if ( this.files && this.files[0] ) {
			var reader = new FileReader();
			reader.onload = function ( e ) {
				
				var imgHtml = "<img src='" + e.target.result + "' class='user' >";
				$container.find(".photo-zone").html(imgHtml);
				
			}
		}
		reader.readAsDataURL(this.files[0]);
	});
</script>
</body>
</html>