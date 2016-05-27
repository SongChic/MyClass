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

<link rel="stylesheet" type="text/css" href="${ctx }/css/teacher/exam/set-exam.css">
<link rel="stylesheet" type="text/css" href="${ctx }/css/library/dragula.css">

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
				<h2>시험지 만들기</h2>
				<div class="box-layout">
					<div class="padding-box">
						<div class="exam-title row">
							
							<div class="col-sm-6 col-sm-push-3">
								<div class="text-paper-title hide">
									<h3 class="test-paper-title"></h3>
									<div class="title-btn text-right">
										<button type="button" class="btn btn-info btn-xs title-edit-btn">수정</button>
									</div>
								</div>
								<div class="input-title show">
									<div class="form-group">
										<label class="text-left">시험지 제목</label>
										<input type="text" class="form-control title-input">
										<p class="info-text error-msg text-left hide">※시험지 제목을 입력해주세요.</p>
									</div>
									
									<div class="title-btn text-right">
										<button type="button" class="btn btn-default btn-xs title-edit-cacel">취소</button>
										<button type="button" class="btn btn-info btn-xs title-edit-save">완료</button>
									</div>
								</div>
							</div>
							
							<div class="col-sm-3 col-sm-pull-6 school-year">
								<div class="form-group">
									<label class="text-left">대상</label>
									<select class="form-control school-level">
										<option>교육과정을 선택해주세요.</option>
										<option value="1">초등학교</option>
										<option value="2">중학교</option>
										<option value="3">고등학교</option>
									</select>
								</div>
								<div class="form-group">
									<select class="form-control school-year-select">
										<option>먼저 교육과정을 선택해주세요.</option>
									</select>
								</div>
							</div>
							
							<div class="col-sm-3">
								<div class="form-group">
									<label>제한시간 설정</label>
									<input type="text" class="form-control limit-time">
									<p class="help-block text-success">※설정하지 않으면 시험시간은 무제한입니다.</p>
								</div>
							</div>
							
							<div class="clearfix col-sm-12">
								<div class="form-group">
									<span class="checkbox">
										<label>
											<input type="checkbox" class="date-set"> 기간 설정
										</label>
										
										<label>
											<input type="checkbox"> 교재 설정
										</label>
									</span>
								</div>
								<div class="limit-date form-inline hide">
									<div class="form-group">
										<label>시작날짜</label>
										<input type="text" class="start-date form-control">
									</div>
									<div class="form-group">
										<label>종료날짜</label>
										<input type="text" class="end-date form-control">
									</div>
								</div>
								<p class="info-text text-primary">※기간을 설정하지 않으면 시험기간은 오늘 하루입니다.</p>
							</div>
						</div>
						
						<div class="exam-content row">
							<div id="examBody" class="exam-body">
							</div> 
							<button type="button" class="btn btn-primary btn-sm add-exam-btn">문제 추가</button>
						</div>
						
						<div class="submit-btn-wrap row">
							<div class="col-sm-6 col-sm-offset-6 text-right">
								<button type="button" class="btn btn-default">취소</button>
								<button type="button" class="btn btn-primary save-test-paper">저장</button>
							</div>
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
<script type="text/javascript" src="${ctx }/js/library/dragula.js"></script>
<script type="text/javascript" src="${ctx }/js/question.dialog.js"></script>
<script type="text/javascript">
/* count global variable */
var count = 0,
	pageNum = 1,
	globalQuestionArr = [],
	$exambody = $(".exam-body");
	
var testPaper = "${testPaper }";
	
//testpaper date check
$(".date-set").on("click", function ( event ) {
	$(this).prop("checked") ? 
			$(".limit-date").removeClass("hide").addClass("show") : 
			$(".limit-date").removeClass("show").addClass("hide");
});


$(".add-exam-btn").on("click", function ( event ) {
	dialog = questionModal();
	
	count++;
	dialog.find(".question-header").html("문제번호 " + count);
});

function addQuestion ( questionArr, edit ) {
	
	
	var template = "<div class='question row' data-item='" + questionArr[0].answer + "'>" +
				   "<p class='question-title'><em></em><span><span></p>" +
				   "<div class='question-answer-wrap row'>" +
				   "</div>" +
				   "</div>",
	   $target = $(".exam-body"),
	   questionLength = questionArr[0].question.length,
	   answerArr = questionArr[0].answer.split(",");
				   
   console.log( edit );
				   
    /* array copy */
    for ( var i = 0; i < questionArr.length; i++) {
    	globalQuestionArr[i] = questionArr[i];
    }
    
    if ( edit ) {
    	edit.find(".question-title span").text( questionArray[0].title );
    	var $questionItem = edit.find(".question-answer-wrap li"),
    		answerArr = questionArray[0].answer.split(",");
    	
    	if ( questionArray[0].question.length !== $questionItem.length ) {
    		edit.find("question-answer-wrap").empty();
    		
    		var title = edit.find(".question-title"),
	    		questionAnswer = edit.find(".question-answer-wrap"), 
    			questionHtml = "";
    	    
    	    questionHtml = "<ul>";
    	    for ( var i = 0; i < questionLength; i++ ) {
    	    	questionHtml += "<li><em>" + (i + 1) + "</em><span></span></li>";
    	    }
    	    questionHtml += "</ul>";
    		
    		title.find("em").text(count + ". ");
    		title.find("span").text(questionArr[0].title);
    		questionAnswer.html(questionHtml);
    		
    		for ( var i = 0; i < questionLength; i++ ) {
    			$(questionAnswer.find("li span")[i]).text( questionArr[0].question[i] );
    		}
    		
    		for ( var i = 0; i < answerArr.length; i++) {
    			$(questionAnswer.find("li")[(answerArr[i]) - 1]).addClass("active");
    		}
    		
    	} else {
    		
    		for ( var i = 0; i < questionArray[0].question.length; i++ ) {
        		$($questionItem[i]).find("span").text( questionArray[0].question[i] );
        	}
    		
    		if ( $questionItem.find("active").length !== answerArr.length ) {
    			$questionItem.removeClass("active");
    			for ( var i = 0; i < answerArr.length; i++ ) {
    				$($questionItem[answerArr[i] - 1]).addClass("active")
    			}
    			
    		}
    	}
    	
    	
    } else {
	    var $template =  $(template).appendTo( $target ),
	    	title = $template.find(".question-title"),
	    	questionAnswer = $template.find(".question-answer-wrap"),
	    	questionHtml = "";
	    
	    questionHtml = "<ul>";
	    for ( var i = 0; i < questionLength; i++ ) {
	    	questionHtml += "<li><em>" + (i + 1) + "</em><span></span></li>";
	    }
	    questionHtml += "</ul>";
		
		title.find("em").text(count + ". ");
		title.find("span").text(questionArr[0].title);
		questionAnswer.html(questionHtml);
		
		for ( var i = 0; i < questionLength; i++ ) {
			$(questionAnswer.find("li span")[i]).text( questionArr[0].question[i] );
		}
		
		for ( var i = 0; i < answerArr.length; i++) {
			$(questionAnswer.find("li")[(answerArr[i]) - 1]).addClass("active");
		}
    }
}

$exambody.on("mouseenter mouseleave", ".question", function ( event ) {
	var appendHtml = "<div class='modal-backdrop fade'></div>" + 
					 "<button class='modify-btn btn-danger btn-sm'>수정</button>",
		$this = $(this);
	$this.clearQueue();
	if ( event.type === "mouseenter" ) {
		$this.append(appendHtml).delay(10).queue(function(){
			$this.find(".modal-backdrop").addClass("in")
		});
	} else if ( event.type === "mouseleave" ) {
		$this.find(".modal-backdrop").removeClass("in").delay(100).queue(function(){
			$this.find(".modal-backdrop, .modify-btn").remove()
		});
	}
});

//exam edit
$exambody.on("click", ".modify-btn", function ( event ) {
// 	console.log($(this).parent().find("ul"));
	var dialog = questionModal( $(this).parent().closest(".question") );
// 		$question = dialog.find(".subjective-question-section .form-group");
// 	dialog.find(".question-title-input").val( globalQuestionArr[0].title );
	
// 	for ( var i = 0; i < $question.length; i++ ) {
// 		$($question[i]).find("input").val( globalQuestionArr[0].question[i] );
// 	}
	
// 	for ( var i = 0; i < globalQuestionArr[0].answer.length; i ++) {
// 		$(dialog.find("#subjectiveAnswer .circle") [ globalQuestionArr[0].answer[i] - 1 ]).addClass("bg-primary")
// 	}
});

$(".school-year").on("change", ".school-level", function ( event ) {
	var schoolLevel = [
	     ["4학년", "5학년", "6학년"],
	     ["1학년", "2학년", "3학년"],
	     ["1학년", "2학년", "3학년"]
	                   ],
        appendHtml = "";
	
	if ( $(this).val() > 0 ) {
		for ( var i = 0; i < schoolLevel[$(this).val() - 1].length; i++) {
			appendHtml += "<option value='" + (i + 1) + "'>" + schoolLevel[$(this).val() - 1][i] + "</option>"
		}
	} else {
		appendHtml += "<option>먼저 교육과정을 선택해주세요.</option>"
	}
	$(".school-year-select").empty().append(appendHtml);
	
});

//testpaper title edit
$(".title-edit-btn").on("click", function ( event ) {
	$(".text-paper-title").removeClass("show").addClass("hide");
	$(".input-title").removeClass("hide").addClass("show");
});

$(".title-edit-save").on("click", function ( event ) {
	var $parent = $(".input-title"),
		$titleInput = $parent.find(".title-input");
	if ( $titleInput.val() !== "" ) {
		$(".text-paper-title h3").text( $titleInput.val() );
		$(".text-paper-title").removeClass("hide").addClass("show");
		$(".input-title").removeClass("show").addClass("hide");
	} else {
		$titleInput.next("p").removeClass("hide").addClass("show");
	}
});

$(".title-input").on("keydown keyup", function ( event ) {
	if ( $(this).val() !== "" ) {
		$(this).next("p").removeClass("show").addClass("hide");
	} else {
		$(this).next("p").removeClass("hide").addClass("show");
	}
	
	if ( event.keyCode == 13 ) {
		$(this).val() !== "" ? $(".title-edit-save").click() : "";
	}
});

$(".save-test-paper").on("click", function ( event ) {
	var $parent = $(".exam-body"),
		$item = $parent.find(".question"),
		id = "${id}",
		contentArr = {
			limitDate : "기간을 설정 하지 않으셧습니다. 그래도 시험지를 생성하시겠습니까?",
			limitTime : "제한시간을 설정 하지 않으셧습니다. 그래도 시험지를 생성하시겠습니까?",
			all : "제한시간과 기간을 설정하지 않으셧습니다. 그래도 시험지를 생성하시겠습니까?"
		},
		contentText = "";
	
	//testpaper validation
	
	if ( isNaN( $(".school-level").val() ) ) {
		noticeModal({title : "시험지 생성 오류", content : "교육과정을 선택해주세요."});
		return false;
	}
	
	if ( $(".input-title .title-input").val() == "" ) {
		noticeModal({title : "시험지 생성 오류", content : "시험지 제목을 입력해주세요."});
		return false;
	}
	
	if ( $(".limit-time").val() == "" && !$(".date-set").prop("checked") ) {
		contentText = contentArr.all;
	} else if ( $(".limit-time").val() == "" ) {
		contentText = contentArr.limitTime;
	} else if ( !$(".date-set").prop("checked") ) {
		contentText = contentArr.limitDate;
	} else {
		contentText = "시험지를 생성하시겠습니까?"
	}
	
	noticeModal ({title : "시험지 생성 안내", content : contentText}, function ( result ) {
		if ( result ) {
			if ( $item.length > 0 ) {
				var formData = new FormData(),
					saveState = 0,
					responseId = 0;
				
				if ( $(".text-paper-title").hasClass("hide") ) {
					$(".text-paper-title").find(".test-paper-title").text( $(".input-title input").val() );
				}
				
				formData.append("id", id);
				formData.append("title", $(".test-paper-title").text());
				formData.append("teacherId", "${member.id }");
				
				//교재선택시 들어가는 폼데이터 (현재 미구현)
				formData.append("textBook", "");
				formData.append("subject", "${member.subject }");
				formData.append("schoolLevel", $(".school-level").val() );
				formData.append("schoolYear", $(".school-year-select").val() );
				var nowDate = new Date().getTime(),
					limitTime = 0;
				
				if ( $(".limit-time").val() ) {
					var limitArr = $(".limit-time").val().split(" : "),
						dateTime = new Date(2016, 1, 1).getTime();
					
					limitTime = dateTime + (parseInt(limitArr[0]) * 60 * 60 * 1000) + (parseInt(limitArr[1]) * 60 * 1000);
				}
				
				var startDate = 0,
				endDate = 0;
				
				if ( $(".date-set").prop("checked") ) {
					
					startDate = $(".start-date").val(),
					endDate = $(".end-date").val();
					
				}
				
				formData.append("limit", limitTime );
				formData.append("startDate", new Date ( startDate ).getTime() );
				formData.append("endDate", new Date ( endDate ).getTime() );
				
				$.ajax({
					dataType : 'json',
			        url : "${ctx }/rest/exam/setTestPaper",
			        data : formData,
			        type : "POST",
			        enctype: 'multipart/form-data',
			        processData: false, 
			        contentType: false
			    }).done( function( response ) {
			    	
			    	responseId = response;
			    	for ( var i = 0; i < $item.length; i++ ) {
			    		for ( var j = 0; j < $($item[i]).find(".question-answer-wrap ul li").length; j++ ) {
			    			var formData = new FormData(),
			    				answerArr = [];
			    			formData.append( "edited", id > 0 ? true : false);
			    			formData.append( "id", id > 0 ? id : responseId);
			    			
			    			formData.append( "title", $($item[i]).find(".question-title span").text() );
			    			formData.append( "selectNum", j + 1 );
			    			formData.append( "questionNum", i + 1 );
			    			formData.append( "question", $($($item[i]).find(".question-answer-wrap ul li span")[j]).text() );
			    			
			    			console.log( $($($item[i]).find(".question-answer-wrap ul li span")[j]).text() );
			    			
			    			for ( var k = 0; k < $($item[i]).find(".question-answer-wrap ul li.active").length; k++ ) {
			    				answerArr.push($($($item[i]).find(".question-answer-wrap ul li.active")[k]).index() + 1);
			    			}
			    			formData.append( "answer", answerArr.toString() );
			    			
			    			/* 현재 추가내용, 이미지설명 기능 미구현 */
			    			formData.append( "addQuestion", "" );
			    			formData.append( "questionImg", "" );
			    			
			    			$.ajax({
			    				dataType : 'json',
			    		        url : "${ctx }/rest/exam/setQuestion",
			    		        data : formData,
			    		        type : "POST",
			    		        enctype: 'multipart/form-data',
			    		        processData: false, 
			    		        contentType: false,
			    		        async: false
			    		    }).done( function( response ) {
			    		    	saveState ++;
			    		    	if ( $item.length == saveState ) {
			    		    		noticeModal({title:"시험지 생성 완료", content:"시험지 생성을 완료했습니다."}, function ( result ) {
			    		    			if ( result ) {
			    		    				if ( id > 0 ) {
			    		    					location.href = "${ctx }/teacher/exam/viewQuestion?id=" + id;
			    		    				} else {
			    		    					location.href = "${ctx }/teacher/exam/viewQuestion?id=" + responseId;
			    		    				}
			    		    				
			    		    			}
			    		    		});
			    		    	}
			    		    }).fail ( function ( response ){
			    		    	
			    		    });
			    		}
			    	}
			    	
			    }).fail ( function ( response ){
			    	
			    });
				
			} else {
				noticeModal({title : "시험지 생성 오류", content : "시험지 문제를 추가해주세요."});
				return false;
			}
		}
	})
	
});

//bootstrap material init
$.material.init();

//drag and drop setting
dragula([document.getElementById("examBody")]).on('drop', function (el) {
    var $item = $(".exam-body").find(".question");
    for ( var i = 0; i < $item.length; i++ ) {
    	$($item.find(".question-title")[i]).find("em").text((i + 1) + ". ")
    } 
});

//datepicker setting
$('.limit-time').datetimepicker({
	locale : 'ko',
	format : 'HH : mm'
});

$(".start-date, .end-date").datetimepicker({
	locale : 'ko',
	format : 'YYYY-MM-DD'
});


//set testpaper edit
if ( testPaper ) {
	$(".title-input").val( "${testPaper.title }" );
	console.log( "${testPaper.schoolLevel }" );
	$(".title-edit-save").click();
	
	var schoolLevel = parseInt("${testPaper.schoolLevel }"),
		schoolYear = parseInt("${testPaper.schoolYear }"),
		questionList = JSON.parse('${list }');
	
	
	$($(".school-level").find("option")[schoolLevel]).prop("selected", true).change();
	$($(".school-year-select").find("option")[schoolLevel]).prop("selected", true);
	
	if ( "${testPaper.schoolLevel }" ) {
		console.log("limit");
	}
	if ( parseInt( "${testPaper.startDate }" ) > 0 ) {
		var startDate = "${testPaper.startDate }",
			endDate = "${testPaper.endDate }";
			
		$(".date-set").click();
		$(".start-date").val( moment(new Date( parseInt(startDate) )).format( "YYYY-MM-DD" ) );
		$(".end-date").val( moment(new Date( parseInt(endDate) )).format( "YYYY-MM-DD" ) );
	}
	console.log( "${testPaper.startDate }" );
	
	for ( var i = 0; i < questionList.length; i++ ) {
		
		var template = "<div class='question row'>" +
		   "<p class='question-title'><em></em><span></span></p>" +
		   "<div class='question-answer-wrap row'>" +
		   "<ul></ul>" +
		   "</div>" +
		   "</div>";
		   
		var $item = $(template);
		
		var answer = questionList[i][0].answer.split(","),
			title = questionList[i][0].title,
			item = questionList[i][0].question;
		
		$item.find(".question-title span").text(title).parent().find("em").text((i+1) + ". ");
		
		var appendHtml = "";
		
		console.log(answer);
		
		
		for ( var j = 0; j < item.length; j++ ) {
			
			appendHtml += "<li><em>" + (j + 1) + "</em><span>" + item[j].question + "</span></li>";
			
		}
		
		var items = $(appendHtml);
		
		$item.find("ul").html(appendHtml);
		
		var $examBody = $("#examBody").append($item),
			$answerBody = $($examBody.find(".question")[i])
		
		for ( var x = 0; x < answer.length; x++ ) {
			var answerInt = parseInt(answer[x]);
			$($($answerBody).find("ul li")[answerInt - 1]).addClass("active");
		}
		
		count++;
	}
	
} 

</script>
</body>
</html>