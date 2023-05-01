<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="utf-8">
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gothic+A1&family=Gowun+Batang&family=Hahmlet&family=Song+Myung&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.2/main.min.css">
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.2/main.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	var calendar = null;
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

	  calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prevYear,prev,next,nextYear today',
				center : 'title',
				right : 'dayGridMonth,dayGridWeek,dayGridDay'
				
			},
			initialDate : '2023-01-12',
			navLinks : true, // can click day/week names to navigate views
			selectable: true,
		      selectMirror: true,
		      select: function(arg) {
		        var title = prompt('일정을 입력하세요');
		        if (title) {
		          calendar.addEvent({
		            title: title,
		            start: arg.start,
		            end: arg.end,
		            allDay: arg.allDay
		          })
		        }
		        calendar.unselect()
		      },
		      eventClick: function(arg) {
		          if (confirm('Are you sure you want to delete this event?')) {
		            arg.event.remove()
		          }
		        },
			editable : true,
			dayMaxEvents : true // allow "more" link when too many events
			
		});

		calendar.render();
	});
	//1.전체 이벤트 데이터를 추출한다 2. ajax로 서버에 전송하여 db에 저장
	function allSave() {
    var allEvent = calendar.getEvents();
    var events = new Array();
    for (var i = 0; i < allEvent.length; i++) {
        var obj = new Object();
        obj.title = allEvent[i]._def.title;
        obj.allday = allEvent[i]._def.allDay;
        obj.start = allEvent[i]._instance.range.start;
        obj.end = allEvent[i]._instance.range.end;

        events.push(obj);
    }

    var jsondata = JSON.stringify(events);
    console.log(jsondata);
   // savedata(jsondata);
    savedata(jsondata);
}

function savedata(jsondata) {
	 $.ajax({
	        type: 'POST',
	        url: './insert',
	 //     data: jsondata,
	  		data: jsondata,
	  		contentType: "application/json",
			dataType: 'text',
	        async: false
    })
    .done(function(result){
        alert(result);
    })
    .fail(function(request, status, error){
    	 alert("에러"+error);
 
    });
}
</script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
	textColor : black;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
	textColor : black;
}

</style>
</head>
<body>

	<div id='calendar'></div>
<button onclick="javascript:allSave();">저장</button>
</body>
</html>