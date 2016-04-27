function questionModal ( edit ) {
	var template = 
	"<div class='modal fade' id='makeQuestion' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true' data-backdrop='static'>"+
	"<div class='modal-dialog'>"+
	"<div class='modal-content'>"+
	"<div class='modal-header'>"+
	"<button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"+
	"<h4 class='modal-title' id='myModalLabel'>추가할 문제를 작성해주세요.</h4>"+
	"</div>"+
	"<div class='modal-body'>"+
	"<div class='question-header'></div>"+
	"<div class='question-body'>"+
	"<h5>문제</h5>          "+
	"<input type='text' class='form-control question-title-input' placeholder='시험 문제을 입력해주세요.'>"+
	
	"<div class='add-question-title form-group'>"+
	"<span class='checkbox'>"+
	"<label>"+
	"<input type='checkbox'> 추가내용"+
	"</label>"+
	"<label>"+
	"<input type='checkbox'> 사진추가"+
	"</label>"+
	"</span>"+
	"</div>"+
	
	"<div class='add-question form-group'>"+
	"<textarea class='form-control add-question-form' rows='3' placeholder='추가 내용을 입력해주세요.'></textarea>"+
	"</div>"+
	
	"<h5>시험 유형</h5>"+
	"<div class='question-type form-group'>"+
	"<span class='radio'>"+
	"<label><input type='radio' name='questionType' value='1' checked> 객관식</label>"+
	"<label><input type='radio' name='questionType' value='2'> 주관식</label>"+
	"</span>"+
	"</div>"+
	
	"<div class='subjective-question-wrap'>"+
	"<h5>문제 갯수</h5>"+
	"<p class='help-block text-info'>기본 문제 갯수는 <b>4개</b>입니다. 최대 <b>6개</b> 까지 추가 가능합니다.</p>"+
	"<select class='form-control subjective-number'>"+
	"<option value='4'>4개</option>"+
	"<option value='5'>5개</option>"+
	"<option value='6'>6개</option>"+
	"</select>"+
	
	"<div class='subjective-question'>"+
	"<h5>객관식 답안</h5>"+
	"<div id='subjectiveQuestionSection' class='form-horizontal subjective-question-section'>"+
	"<div class='form-group'>"+
	"<label for='inputEmail3' class='col-sm-2 control-label'>1번 답안</label>"+
	"<div class='col-sm-10'>"+
	"<input type='text' class='form-control' placeholder='답안을 입력해주세요.'>"+
	"</div>"+
	"</div>"+
	"<div class='form-group'>"+
	"<label for='inputEmail3' class='col-sm-2 control-label'>2번 답안</label>"+
	"<div class='col-sm-10'>"+
	"<input type='text' class='form-control' placeholder='답안을 입력해주세요.'>"+
	"</div>"+
	"</div>"+
	"<div class='form-group'>"+
	"<label for='inputEmail3' class='col-sm-2 control-label'>3번 답안</label>"+
	"<div class='col-sm-10'>"+
	"<input type='text' class='form-control' placeholder='답안을 입력해주세요.'>"+
	"</div>"+
	"</div>"+
	"<div class='form-group'>"+
	"<label for='inputEmail3' class='col-sm-2 control-label'>4번 답안</label>"+
	"<div class='col-sm-10'>"+
	"<input type='text' class='form-control' placeholder='답안을 입력해주세요.'>"+
	"</div>"+
	"</div>"+
	"</div>"+
	"</div>"+
	
	"<h5>객관식 답</h5>"+
	"<div id='subjectiveAnswer' class='row subjective-answer'>"+
	"<div class='circle'>1</div>"+
	"<div class='circle'>2</div>"+
	"<div class='circle'>3</div>"+
	"<div class='circle'>4</div>"+
	"</div>"+
	
	"</div>"+
	
	"<div class='objective-question hide'>"+
	"<h5>주관식 답</h5>"+
	"<input type='text' class='form-control' placeholder='문제 답을 입력해주세요.'>"+
	"</div>"+
	
	"</div>"+
	"</div>"+
	"<div class='modal-footer'>"+
	"<button type='button' class='btn btn-default cancel-question' data-dismiss='modal'>취소</button>"+
	"<button type='button' class='btn btn-primary save-question'>저장</button>"+
	"</div>"+
	"</div>"+
	"</div>"+
	"</div>";
	
	var dialog = $(template);
	
	dialog.modal({
 		show : true,
 		keyboard : false
 	});
	dialog.on("shown.bs.modal", function ( event ) {
		$.material.init();
	});
	dialog.on("hidden.bs.modal", function ( event ) {
		dialog.remove();
	});
	
	dialog.on("click", ".save-question", function ( event ) {
		var $question = dialog.find(".subjective-question-section .form-group"),
			$answer = dialog.find(".subjective-answer .circle")
			question = [],
			answer = [],
			questionArray = [];
		
		for ( var i = 0; i < $question.length; i++ ) {
			question.push($($question[i]).find("input").val());
			
			if ( $($answer[i]).hasClass("bg-primary") ) {
				answer.push( $($answer[i]).text() )
			}
		}
		questionArray.push({
			title : $(".question-title-input").val(),
			subjectiveNumber : $(".subjective-number").val(),
			question : question,
			questionType : $(".question-type input:checked").val(),
			answer : answer.toString()
		});
		
		console.log(questionArray);
		addQuestion(questionArray, edit);
		$("#makeQuestion").modal("hide");
	});
	
	dialog.on("click", ".cancel-question", function ( event ) {
		if ( count > 0 ) {
			count--;
		}
	});
	
	dialog.on("click", ".subjective-answer .circle", function ( event ) {
		if ( $(this).hasClass("bg-primary") ) {
			$(this).removeClass("bg-primary");
		} else {
			$(this).addClass("bg-primary");
		}
		
	});
	
	dialog.on("change", ".subjective-number", function ( event ) {
		var number = $(this).val(),
			numberHtml = "",
			questionHtml = "",
			numberTarget = document.getElementById("subjectiveAnswer"),
			questionTarget = document.getElementById("subjectiveQuestionSection");
		for ( var i = 0; i < number; i++ ) {
			numberHtml += "<div class='circle'>" + (i + 1) + "</div>";
			questionHtml += "<div class='form-group'>" +
			   			    "<label for='inputEmail3' class='col-sm-2 control-label'>" + (i + 1) + "번 답안</label>" +
			   			    "<div class='col-sm-10'>" + 
			   			    "<input type='text' class='form-control' placeholder='답안을 입력해주세요.'>" +
			   			    "</div>" +
			   			    "</div>";
		}
		
		questionTarget.innerHTML = questionHtml;
		numberTarget.innerHTML = numberHtml;
		
	});
	
	return dialog;
}