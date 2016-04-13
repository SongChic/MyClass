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
}

var $gnb = $(".gnb");
$(".mobile-title").on("click", function(event){
	$("body").append("<div class='slide-backdrop'>");
	$gnb.animate({left:0})
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
	if ( $(this).width() < 332 ) {
		$("#container").css("paddingTop", $("#header").outerHeight());
	} else {
		$("#container").removeAttr("style");
	}
});

$(document).ready(function(event) {
	if ( $(this).width() < 332 ) {
		$("#container").css("paddingTop", $("#header").outerHeight());
	} else {
		$("#container").removeAttr("style");
	}
});

$(document).on("keypress", "form", function(event) {
	if ( $(event.target).attr("id") == "schoolName" ) {
		return event.keyCode != 13;
	}
});
