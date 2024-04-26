<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script>
<script>
  document.addEventListener("DOMContentLoaded", function () {
    let commitArr = "${commitObj}";
    let commitmsgArr = "${commitmesObj}";
    
    commitArr = commitArr.slice(1, -1).split(", "); 
    commitmsgArr = commitmsgArr.slice(1, -1).split(", ");
 

    let events = [];

    for (let i = 0; i < commitArr.length; i++) {
      events.push({
        title: commitmsgArr[i],
        start: commitArr[i]
      });
    }

    var calendarEl = document.getElementById("calendar");
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: "dayGridMonth",
      height: "700px",
      slotMinTime: "08:00", // Day 캘린더에서 시작 시간
      slotMaxTime: "20:00",
      navLinks: true,
      headerToolbar: {
        left: "prev,next today",
        center: "title",
        right: "dayGridMonth timeGridDay",
      },
      dayMaxEvents: true, // 이벤트가 최대 수를 초과할 경우 더 보기 버튼 생성
      views: {
        dayGrid: {
          dayMaxEventRows: 5, // 한 날짜에 표시할 이벤트 행의 최대 수
        }
      },
    

      eventRender: function (info) {
          // 특정 날짜의 이벤트에만 클래스 추가
          if (info.event.start === '2024-04-21') { // 특정 날짜
            info.el.classList.add('fc-event'); // 원하는 클래스 추가
          }
        },
        
      locale: "ko",
      buttonText: {
        today: "오늘",
        month: "월간",
        week: "주간",
        day: "일간",
        list: "리스트",
      },
      eventAdd: function (e) {
        test();
        console.log(e.event._def.title);         
      },
      eventChange: function (e) {
      },
      eventRemove: function (e) {
      },
      events: events,
      select: function (selectDay) {
        $("#startDate").val(selectDay.startStr);

        $("#calendarModal").modal("show");

        $("#addEvent").on("click", function () {
          calendar.addEvent({
            title: $("#content").val(),
            start: $("#startDate").val() + "T" + $("#startTime").val() + ":00",
            end: $("#endDate").val() + "T" + $("#endTime").val() + ":00",
            backgroundColor: $("#eventColor").val(),
          });
          $("#calendarModal").modal("hide");
          $("#content").val("");
          $("#startDate").val("");
          $("#endDate").val("");
        });

        $("#close").on("click", function () {
          $("#calendarModal").modal("hide");
        });
      },
      eventClick: function (e) {
        let con = confirm("이벤트 삭제 하시겠습니까?");
        if (con) {
          e.event.remove();
        }
      },
 
    });   

    calendar.render();
  });
</script>
</head>
<body>

   <jsp:include page="../common/sideBar.jsp" />
   
   <jsp:include page="../common/header.jsp" />
      
   <div
     class="page-wrapper"
     id="main-wrapper"
     data-layout="vertical"
     data-navbarbg="skin6"
     data-sidebartype="full"
     data-sidebar-position="fixed"
     data-header-position="fixed">
      
      <!--  Main wrapper -->
      <div class="body-wrapper">
   
         <div class="container-fluid">
             <!--  Row 1 -->
             <div class="row">
             
             <ul class="nav nav-tabs">
             <c:forEach var="r" items="${rpList }">
             
			  <li class="nav-item">
			    <a class="nav-link active" aria-current="page" href="#">${r.repoName }</a>
			  </li>
			  
<!-- 			  <li class="nav-item"> -->
<%-- 			    <a class="nav-link" href="#">${r.repoName }</a> --%>
<!-- 			  </li> -->
			  
			  </c:forEach>
			  
			</ul>
             <div id="calendar"></div>             
             </div>
           </div>
        </div>
    </div>
</body>
</html>