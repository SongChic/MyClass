function publicAjax(method, url, ajaxData, callback) {
	$.ajax({
		cache : false,
		url : url,
		async : true,
		method : method,
		data : ajaxData
	}).done (function(response) {
		if (callback) {
			callback(response);
		} else {
			return alert("서버에 문제가 있습니다.\n 개발자에게 문의해주세요.");
		}
	}).fail (function(response){
		return alert("서버에 문제가 있습니다.\n 개발자에게 문의해주세요.");
	});
}