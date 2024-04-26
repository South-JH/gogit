<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script src="resources/js/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script>

    <style type="text/css">
      #calendar {
        background-color: white;
        margin-top: 20px;
      }
    </style>
    <script>
      (function () {
        $(function () {
          // calendar element 취득
          var calendarEl = $("#calendar")[0];
          // full-calendar 생성하기
          var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: "dayGridMonth",
            height: "700px",
            slotMinTime: "00:00", // Day 캘린더에서 시작 시간
            slotMaxTime: "00:00",
            navLinks: true,
            headerToolbar: {
              left: "prev,next today",
              center: "title",
              right: "dayGridMonth timeGridDay",
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
              let end = "";
              if (e.event.end == null) {
                end = e.event.startStr;
              } else {
                end = e.event.endStr;
              }

              $.ajax({
                url: "insert.cal",
                data: {
                  calTitle: e.event._def.title,
                  startDate: e.event.startStr,
                  endDate: end,
                  groupId: "${loginUser.team}",
                  backgroundCol: e.event.backgroundColor,
                },
                success: function (data) {
                  if (data != "") {
                    alertify.alert(data);
                    //location.href="main"
                  }
                },
                error: function () {},
              });
            },

            eventChange: function (e) {
              let end = "";
              if (e.event.end == null) {
                end = e.event.startStr;
              } else {
                end = e.event.endStr;
              }

              $.ajax({
                url: "update.cal",
                data: {
                  calNo: e.event._def.publicId,
                  startDate: e.event.startStr,
                  endDate: end,
                },
                success: function (data) {
                  if (data != "") {
                    alertify.alert(data);
                  }

                  if (socket) {
                    console.log(e);
                    socket.send(
                      "${loginUser.memId}," +
                        e.event._def.title +
                        ",${loginUser.team}," +
                        e.event._def.publicId +
                        ",ucalendar"
                    );
                    location.href = "main";
                  }
                },
                error: function () {},
              });
            },

            eventRemove: function (e) {
              let end = "";
              if (e.event.end == null) {
                end = e.event.startStr;
              } else {
                end = e.event.endStr;
              }

              $.ajax({
                url: "delete.cal",
                data: { calNo: e.event._def.publicId },
                success: function (data) {
                  if (data != "") {
                    alertify.alert(data);
                  }
                  if (socket) {
                    socket.send(
                      "${loginUser.memId}," +
                        e.event._def.title +
                        ",${loginUser.team}," +
                        e.event._def.publicId +
                        ",dcalendar"
                    );
                    location.href = "main";
                  }
                },
                error: function () {},
              });
            },

            select: function (e) {
              let num;
              $.ajax({
                url: "checkNo.cal",
                success: function (data) {
                  num = data;
                },
              });

              $("#startDate").val(e.startStr);

              $("#calendarModal").modal("show");

              $("#addEvent").on("click", function () {
                calendar.addEvent({
                  id: num,
                  title: $("#content").val(),
                  start:
                    $("#startDate").val() + "T" + $("#startTime").val() + ":00",
                  end: $("#endDate").val() + "T" + $("#endTime").val() + ":00",
                  backgroundColor: $("#eventColor").val(),
                  groupId: "${loginUser.team}",
                });

                if (socket) {
                  socket.send(
                    "${loginUser.memId}," +
                      $("#content").val() +
                      ",${loginUser.team}," +
                      num +
                      ",calendar"
                  );
                }

                $("#calendarModal").modal("hide");
                $("#content").val("");
                $("#startDate").val("");
                $("#endDate").val("");
                $("#startTime").val("");
                $("#endTime").val("");
              });
            },
            eventClick: function (e) {
              let con = confirm("이벤트 삭제 하시겠습니까?");
              if (con) {
                e.event.remove();
              }
            },

            editable: true,
            dayMaxEvents: true,
            selectable: true,
          });
          $.ajax({
            url: "select.cal",
            data: {
              groupId: "${loginUser.team}",
            },
            success: function (data) {
              for (let i in data) {
                calendar.addEvent({
                  id: data[i].calNo,
                  groupId: data[i].groupId,
                  start: data[i].startDate,
                  end: data[i].endDate,
                  title: data[i].calTitle,
                  backgroundColor: data[i].backgroundCol,
                });
              }
            },
          });
          calendar.render();
        });
      })();

      function checkInput() {
        if (
          $("#content").val().length != 0 &&
          $("#startTime").val().length != 0 &&
          $("#endDate").val().length != 0 &&
          $("#endTime").val().length != 0
        ) {
          $("#addEvent").attr("disabled", false);
        }
      }
    </script>
  </head>
  <body>
    <div id="calendar"></div>

    <div
      class="modal fade"
      id="calendarModal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="title">일정을 입력하세요.</h5>
          </div>
          <div class="modal-body">
            <div class="form-group">
              <label for="content" class="col-form-label">일정 내용</label>
              <input
                type="text"
                class="form-control"
                id="content"
                name="content"
                onkeyup="checkInput();"
              />

              <label for="startDate" class="col-form-label">시작 날짜</label>
              <input
                type="date"
                class="form-control"
                id="startDate"
                name="startDate"
              />
              <input
                type="time"
                class="form-control"
                id="startTime"
                name="startTime"
                onchange="checkInput();"
              />

              <label for="endDate" class="col-form-label">종료 날짜</label>
              <input
                type="date"
                class="form-control"
                id="endDate"
                name="endDate"
                onchange="checkInput();"
              />
              <input
                type="time"
                class="form-control"
                id="endTime"
                name="endTime"
                onchange="checkInput();"
              />

              <label for="eventColor" class="col-form-label"
                >이벤트 바 색상</label
              >
              <input
                type="color"
                class="form-control"
                id="eventColor"
                name="eventColor"
                style="width: 50px"
              />
            </div>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-warning"
              id="addEvent"
              disabled
            >
              추가
            </button>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
