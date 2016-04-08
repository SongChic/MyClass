publicAjax ("post", ctx + "/rest/setCalendar", {}, function(response) {
	var data = [];
	
	for (var i = 0; i < response.length; i++) {
		response[i].start = moment(response[i].start).format("YYYY-MM-DD HH:mm");
		data.push(response[i]);
	}
	
	setCalendar (data);
});
//
//function setCalendar (data) {
//	
//	console.log(data);

function setCalendar (data) {
	$(".calendar").fullCalendar({
		lang : 'ko',
		customButtons : {
			addBtn : {
				text : "+"
			},
			searchBtn : {
				text : "분류"
			}
		},
		header : {
			left : 'addBtn',
			center : 'prev title next',
			right : 'searchBtn'
		},
		themeButtonIcons : {
			prev: 'carat-1-w',
		    next: 'carat-1-e',
		},
		timeFormat : "HH : mm",
		timezone : "Asia/Seoul",
		
		//drag event
//		editable : true,
		eventDrop : function (event, delta, revertFunc) {
			
			var ajaxData = {
				id : event.id,
				created : new Date(event.start._d).getTime()

			};
			
			publicAjax ("post", ctx + "/rest/setSchedule", ajaxData, function(response) {
				console.log(response);
			});
			
		},
		dayClick : function(date, jsEvent, view) {
			console.log(new Date(date).getTime());
		},

//		theme : true,
		views : {
			type: 'agenda'
		},
		
		viewDestroy : function( view, element ) {
			console.log(view);
			console.log(element);
		},
		
		events : data,
		
		monthNames :['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNameShort :['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNames : ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
		dayNamesShort : ['일', '월', '화', '수', '목', '금', '토']
		
	});
	$(".calendar").hide();
}
