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
							<div class="col-sm-3 school-year">
								<h4>학년</h4>
							</div>
							
							<div class="col-sm-6">
								<h3>과학탐구 영역</h3>
							</div>
							
							<div class="col-sm-3">
								<ul>
									<li>학교 : </li>
									<li>이름 : </li>
									<li>점수 : </li>
								</ul>
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
	globalQuestionArr = [];

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

$(".exam-body").on("mouseenter mouseleave", ".question", function ( event ) {
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
$(".exam-body").on("click", ".modify-btn", function ( event ) {
	var dialog = questionModal( $(this).parent() ),
		$question = dialog.find(".subjective-question-section .form-group");
	dialog.find(".question-title-input").val( globalQuestionArr[0].title );
	
	for ( var i = 0; i < $question.length; i++ ) {
		$($question[i]).find("input").val( globalQuestionArr[0].question[i] );
	}
	
	for ( var i = 0; i < globalQuestionArr[0].answer.length; i ++) {
		$(dialog.find("#subjectiveAnswer .circle") [ globalQuestionArr[0].answer[i] - 1 ]).addClass("bg-primary")
	}
});

$(".save-test-paper").on("click", function ( event ) {
	var $parent = $(".exam-body"),
		$item = $parent.find(".question"),
		id = 0;
	//test paper save code ( ajax return id )
	var formData = new FormData();
	
	formData.append("title", "test");
	formData.append("creator", "${member.name }")
	
	$.ajax({
		dataType : 'json',
        url : "${ctx }/rest/exam/setTestPaper",
        data : formData,
        type : "POST",
        enctype: 'multipart/form-data',
        processData: false, 
        contentType: false
    }).done( function( response ) {
    	
    	id = response;
    	for ( var i = 0; i < $item.length; i++ ) {
    		for ( var j = 0; j < $($item[i]).find(".question-answer-wrap ul li").length; j++ ) {
    			var formData = new FormData(),
    				answerArr = [];
    			formData.append( "id", id );
    			formData.append( "title", $($item[i]).find(".question-title span").text() );
    			formData.append( "selectNum", j + 1 );
    			formData.append( "questionNum", i + 1 );
    			formData.append( "question", $($($item[i]).find(".question-answer-wrap ul li span")[j]).text() );
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
    		        contentType: false
    		    }).done( function( response ) {
    		    	console.log( response );
    		    }).fail ( function ( response ){
    		    });
    		}
    	}
    	
    }).fail ( function ( response ){
    	
    });
	
});

dragula([document.getElementById("examBody")]).on('drop', function (el) {
    var $item = $(".exam-body").find(".question");
    for ( var i = 0; i < $item.length; i++ ) {
    	$($item.find(".question-title")[i]).find("em").text((i + 1) + ". ")
    } 
});

</script>
</body>
</html>