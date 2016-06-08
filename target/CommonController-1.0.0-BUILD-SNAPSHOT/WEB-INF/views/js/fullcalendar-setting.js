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
//		themeButtonIcons : {
//			prev: 'carat-1-w',
//		    next: 'carat-1-e',
//		},
		timeFormat : "HH : mm",
		timezone : "Asia/Seoul",
		
		//drag event
		editable : data.editable ? data.editable : false,
		
		eventDrop : function (event, delta, revertFunc) {
			
			console.log(event.start._d);
			
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
		
		viewRender: function ( view, element) {
			console.log(view);
			console.log(element);
			$(".fc-left").on("click", function ( event ) {
				calenderAddDialog( data[0].userType );
			});
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
	
	function calenderAddDialog ( userType ) {
		var template = 
			"<div class='modal fade' id='calendarModal' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'>"+
			"<div class='modal-dialog'>"+
			"<div class='modal-content'>"+
			"<div class='modal-header'>"+
			"</div>" + //modal-header
			"<div class='modal-body'>"+
			"</div>" + //modal-body
			"</div>" + //modal-content
			"</div>" + //modal-dialog
			"</div>";  //modal
		
		var dialog = $(template);
		
		if ( userType === 1 ) {
			appendHtml = "<ul>" +
			 "<li><a href='" + ctx + "/teacher/classes/setClasses'>반만들기</a></li>"+
			 "<li><a>모임만들기</a></li>" + 
			 "<li><a>일정추가</a></li>" + 
			 "<li><a>기념일추가</a></li>" + 
			 "</ul>";
		} else {
			appendHtml = "<ul>" +
			 "<li><a>모임만들기</a></li>" + 
			 "<li><a>일정추가</a></li>" + 
			 "<li><a>기념일추가</a></li>" + 
			 "</ul>";
		}
		
		dialog.find(".modal-header").append("추가하실 항목을 선택해주세요.");
		dialog.find(".modal-body").append(appendHtml);
		
		dialog.modal({
	 		show : true,
	 		keyboard : true
	 	});
	}
}