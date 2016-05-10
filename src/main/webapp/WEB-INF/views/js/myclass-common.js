/* lazy load setting */
function imageLoad() {
	$('.user').attr('src', ctx + '/img/no_img.jpg');
	$('.book').attr('src', ctx + '/img/book_cover.jpg');
	$('.classes-img').attr('src', ctx + '/img/no_class_img.jpg');
	$('.classes-back-img').css('backgroundImage', ctx + '/img/no_class_img.jpg');
	$(".lazy").lazyload();
}

function anywhereAjax (options, callback) {
	var option = {
		method : "post",
		ajaxData : {},
		url : ""
	}
	$.extend(option, options);
	
	if ( option.url == "" ) {
		alert ("url을 입력해주세요.");
		return false;
	}
	
	$.ajax({
		cache : false,
		url : option.url,
		method : option.method,
		data : option.ajaxData
	}).done (function(response) {
		if (callback) {
			callback(response);
		} else {
			console.log("ajax");
			return alert("서버에 문제가 있습니다.\n 개발자에게 문의해주세요.");
		}
	}).fail (function(response){
		return alert("서버에 문제가 있습니다.\n 개발자에게 문의해주세요.");
	});
	
}

function publicAjax(method, url, ajaxData, callback) {
	$.ajax({
		cache : false,
		url : url,
		method : method,
		data : ajaxData
	}).done (function(response) {
		if (callback) {
			callback(response);
		} else {
			console.log("ajax");
			return alert("서버에 문제가 있습니다.\n 개발자에게 문의해주세요.");
		}
	}).fail (function(response){
		return alert("서버에 문제가 있습니다.\n 개발자에게 문의해주세요.");
	});
};

var $gnb = $(".gnb");
$(".mobile-title").on("click", function(event){
	$("body").append("<div class='slide-backdrop'>");
	$gnb.animate({left:0}, function () {
		imageLoad();
	});
	
});

$("body").on("click", ".slide-backdrop", function(event){
	$gnb.animate({left:-$gnb.outerWidth()});
	$(this).remove();
});

$(".drop-menu").mouseenter(function(event){
	$item = $(this).find(".drop-item");
	
	var thisIndex = $(this).index() + 1,
		totalLength = Math.ceil($(this).parent().children().length / 2);
	
	if (totalLength > thisIndex) {
		$item.css("left",0)
	} else if (totalLength === thisIndex) {
		$item.css({
			left : "50%",
			marginLeft : - $item.outerWidth() / 2
		})
	} else if (totalLength < thisIndex) {
		$item.css("right",0)
	}
	$item.show();
}).mouseleave(function(event){
	$item.hide();
});

$(".quick-menu li").mouseenter(function(event){
	$item = $(this).find("span")
	$item.show();
}).mouseleave(function(event){
	$item.hide();
});

$(window).resize(function(event) {
//	if ( $(this).width() < 332 ) {
//		$("#container").css("paddingTop", $("#header").outerHeight());
//	} else {
//		$("#container").removeAttr("style");
//	}
});

$(document).on("keypress", "form", function(event) {
	if ( $(event.target).attr("id") == "schoolName" ) {
		return event.keyCode != 13;
	}
});

imageLoad();

$(document).ready(function(event) {
//	if ( $(this).width() < 332 ) {
//		$("#container").css("paddingTop", $("#header").outerHeight());
//	} else {
//		$("#container").removeAttr("style");
//	}
	
});

function noticeModal (options, callback) {
	
	var option = {
				title : "알림",
				content : "",
				msg : ""
		},
		$target = $("#noticeModal");
	
	/* 매개인자가 하나일때의 처리 */
	callback = typeof options !== 'function' ? callback : options;
	
	
	if ( options ) {
		$.extend(option, options);
	}
	
	var appendHtml = "<div class='modal fade' id='noticeModal' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true' data-backdrop='static'>" +
				    "<div class='modal-dialog'>" +
				    "<div class='modal-content'>" +
				    "<div class='modal-header bg-primary'>" +
				    "<h4 class='modal-title' id='myModalLabel'>Modal title</h4>" +
				    "</div>" +
				    "<div class='modal-body'>" +
				    "..." +
				    "</div>" +
				    "<div class='modal-footer'>" +
				    "<button type='button' class='btn btn-default cancel-btn' data-dismiss='modal'>취소</button>" +
				    "<button type='button' class='btn btn-primary confirm-btn'>확인</button>" +
				    "</div>" +
				    "</div>" +
				    "</div>" +
				    "</div>",
	    dialog = $(appendHtml);
	
	dialog.modal("show").on("keydown", function ( event ) {
		if (event.keyCode === 27) {
			if (typeof callback === "function" ) callback( false );
        }
	});
	
	
	dialog.on("hidden.bs.modal", function ( event ) {
		if ( event.target == this ) {
			dialog.remove();
		}
	});
	
	dialog.find(".confirm-btn").on("click", function ( evetn ) {
		if (typeof callback === "function" ) callback( true );
		dialog.modal("hide");
	});
	
	dialog.find(".modal-title").html(option.title);
	dialog.find(".modal-body").html(option.content);
	
//	$target.on("mouseup", ".confirm-btn", function ( event ) {
//		processCallback ( event, $target, callback );
//	});
//	
//	$target.on("click", ".cancel-btn", function ( event ) {
//		if (callback) callback(false);
//	});
//	
//	$("#noticeModal").modal("show");
};

function processCallback ( e, dialog, callback ) {
	event.stopPropagation();
	event.preventDefault();
	
	if (typeof callback === "function") {
		callback(true);
		$("#noticeModal").modal("show");
	}
	
}

function customModal ( callback ) {
	var appendHtml = "<div class='modal fade' id='noticeModal' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'>" +
    "<div class='modal-dialog'>" +
    "<div class='modal-content'>" +
    "<div class='modal-header bg-primary'>" +
    "<!--         <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button> -->" +
    "<h4 class='modal-title' id='myModalLabel'>Modal title</h4>" +
    "</div>" +
    "<div class='modal-body'>" +
    "..." +
    "</div>" +
    "<div class='modal-footer'>" +
    "<button type='button' class='btn btn-default cancel-btn' data-dismiss='modal'>취소</button>" +
    "<button type='button' class='btn btn-primary confirm-btn'>확인</button>" +
    "</div>" +
    "</div>" +
    "</div>" +
    "</div>",
    dialog = $(appendHtml);
	
//	$body.append(appendHtml);
	dialog.modal("show");
	
	dialog.find(".confirm-btn").on("click", function ( evetn ) {
		if ( callback ) callback( true );
		dialog.modal("hide");
	});
	
	dialog.on("hidden.bs.modal", function ( event ) {
		dialog.remove();
	});
	
}

