<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>

    <script
      type="text/javascript"
      src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"
    ></script>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

    <!-- jquery -->
    <script
      src="https://code.jquery.com/jquery-2.1.1.min.js"
      type="text/javascript"
    ></script>
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

    <!-- CSS -->
    <link
      rel="stylesheet"
      href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"
    />
    <!-- Default theme -->
    <link
      rel="stylesheet"
      href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"
    />
    <!-- Semantic UI theme -->
    <link
      rel="stylesheet"
      href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"
    />

    <link
      rel="shortcut icon"
      type="image/png"
      href="resources/images/logo/logo2.png"
    />
    <link
      rel="shortcut icon"
      type="image/png"
      href="resources/images/logos/favicon.png"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="resources/css/styles.min.css" />
    <link rel="stylesheet" href="resources/common/header.css" />
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/sidebarmenu.js"></script>
    <script src="resources/js/app.min.js"></script>
    <!-- <script src="resources/js/apexcharts.min.js"></script> -->
    <script src="resources/js/simplebar.js"></script>
    <script src="resources/js/dashboard.js"></script>

    <c:if test="${ not empty alertMsg }">
      <script>
        alertify.alert("${alertMsg}");
      </script>
      <c:remove var="alertMsg" scope="session" />
    </c:if>

    <style>
      #alarmList {
        height: 500px;
        overflow: auto;
      }
      #alarmList > ul {
        display: block;
      }
      #alarmList li {
        display: block;
        box-sizing: border-box;
        width: 320px;
        margin-bottom: 10px;
        font-size: 12px;
        float: left;
      }
      #alarmList button {
        display: block;
        width: 65px;
        height: 35px;
        margin: 1px;
        float: left;
        margin-left: 5px;
      }
      #alarmList a {
        font-size: 15px;
        color: white;
      }
    </style>
  </head>
  <body>
    <!--  Body Wrapper -->
    <div
      class="page-wrapper"
      id="main-wrapper"
      data-layout="vertical"
      data-navbarbg="skin6"
      data-sidebartype="full"
      data-sidebar-position="fixed"
      data-header-position="fixed"
    >
      <!--  Main wrapper -->
      <div class="body-wrapper">
        <!--  Header Start -->
        <header class="app-header">
          <nav class="navbar navbar-expand-lg navbar-light" id="header-nav">
            <ul class="navbar-nav" id="header-alarm">
              <li class="nav-item d-block d-xl-none">
                <a
                  class="nav-link sidebartoggler nav-icon-hover"
                  id="headerCollapse"
                  href="javascript:void(0)"
                >
                  <i class="ti ti-menu-2"></i>
                </a>
              </li>
              <li class="nav-item">
                <a
                  id="alarmLink"
                  class="nav-link nav-icon-hover"
                  href="javascript:void(0)"
                  onclick="alamList();"
                >
                  <i class="ti ti-bell-ringing"></i>
                </a>
              </li>
            </ul>
            <div
              class="navbar-collapse justify-content-end px-0"
              id="navbarNav"
            >
              <div>
                <div class="header-searchbar">
                  <div>
                    <i class="ti ti-search"></i>
                  </div>
                  <script>
                    function searchjm() {
                      let keyword =
                        document.getElementById("searchinput").value;
                      location.href = "search.jm?keyword=" + keyword;
                    }
                    function enterkey() {
                      if (window.event.keyCode == 13) {
                        let keyword =
                          document.getElementById("searchinput").value;
                        location.href = "search.jm?keyword=" + keyword;
                      }
                    }
                  </script>
                  <div>
                    <input
                      type="text"
                      onkeyup="enterkey()"
                      value="${keyword }"
                      id="searchinput"
                      placeholder="What are you looking for?"
                    />
                  </div>
                </div>
              </div>
              <ul
                class="navbar-nav flex-row ms-auto align-items-center justify-content-end"
              >
                <!-- <a
                  href="https://adminmart.com/product/modernize-free-bootstrap-admin-dashboard/"
                  target="_blank"
                  class="btn btn-primary"
                  >Download Free</a
                > -->
                <li class="nav-item dropdown" id="header-profile-img">
                  <a
                    class="nav-link nav-icon-hover"
                    href="javascript:void(0)"
                    id="drop2"
                    data-bs-toggle="dropdown"
                    aria-expanded="false"
                  >
                    <img
                      src="${ loginUser.profile }"
                      alt=""
                      width="35"
                      height="35"
                      class="rounded-circle"
                    />
                  </a>
                  <div
                    class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up"
                    aria-labelledby="drop2"
                  >
                    <div class="message-body">
                      <a
                        href="javascript:void(0)"
                        class="d-flex align-items-center gap-2 dropdown-item"
                      >
                        <i class="ti ti-user fs-6"></i>
                        <p class="mb-0 fs-3">My Profile</p>
                      </a>
                      <a
                        href="javascript:void(0)"
                        class="d-flex align-items-center gap-2 dropdown-item"
                      >
                        <i class="ti ti-mail fs-6"></i>
                        <p class="mb-0 fs-3">My Account</p>
                      </a>
                      <a
                        href="javascript:void(0)"
                        class="d-flex align-items-center gap-2 dropdown-item"
                      >
                        <i class="ti ti-list-check fs-6"></i>
                        <p class="mb-0 fs-3">My Task</p>
                      </a>
                      <a
                        href="logout"
                        class="btn btn-outline-primary mx-3 mt-2 d-block"
                        >Logout</a
                      >
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </nav>
        </header>
        <!--  Header End -->
      </div>
    </div>

    <div
      class="modal fade"
      id="alamModal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="title"></h5>
          </div>
          <div class="modal-body">
            <h3 calss="text-primary">알람</h3>
            <div id="alarmList">
              <ul class="list-group list-group-flush"></ul>
            </div>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-dismiss="modal"
              id="close"
            >
              뒤로가기
            </button>
          </div>
        </div>
      </div>
    </div>

    <script>
      $(function () {
        alarm();
        alarmCircle();
        setInterval(() => {
          alarm();
          alarmCircle();
        }, 1000);
      });

      function alarmCircle() {
        $.ajax({
          url: "alCircle.al",
          data: { memId: "${loginUser.memId}" },
          success: function (data) {
            if (data > 0) {
              $("#alarmLink").append(
                "<div class='notification bg-primary rounded-circle'></div>"
              );
            }
          },
        });
      }

      function alarm() {
        $.ajax({
          url: "alarm.me",
          data: {
            memId: "${loginUser.memId}",
          },
          success: function (data) {
            let value = "";

            for (let i in data) {
              switch (data[i].alarmType) {
                case "project":
                  value += "<div>";
                  if (data[i].alarmYn == 1) {
                    value +=
                      "<li class='list-group-item active' onclick='readAl(this);'>" +
                      data[i].gitNick +
                      "님이 프로젝트(" +
                      data[i].alarmTitle +
                      ")에 참가 요청했습니다.";
                  } else {
                    value +=
                      "<li class='list-group-item' onclick='readAl(this);'>" +
                      data[i].gitNick +
                      "님이 프로젝트(" +
                      data[i].alarmTitle +
                      ")에 참가 요청했습니다.";
                  }
                  value +=
                    "<input type='hidden' value='" +
                    data[i].memId +
                    "'>" +
                    "<input type='hidden' value='" +
                    data[i].alarmNo +
                    "'> </li>" +
                    "<button class='btn btn-warning' onclick='alapply(" +
                    data[i].alarmContentNo +
                    ",this)'>승인</button>" +
                    "<button class='btn btn-danger' onclick='alcancel(this)'>거절</button>" +
                    "</div>";
                  break;
                case "zoom":
                  value += "<div>";
                  if (data[i].alarmYn == 1) {
                    value +=
                      "<li class='list-group-item active' onclick='readAl(this)'>줌 회의가 생성되었습니다.";
                  } else {
                    value +=
                      "<li class='list-group-item' onclick='readAl(this)'>줌 회의가 생성되었습니다.";
                  }
                  value +=
                    "<input type='hidden' value='" +
                    data[i].memId +
                    "'>" +
                    "<input type='hidden' value='" +
                    data[i].alarmNo +
                    "'> </li>";

                  if (data[i].memId === data[i].rmemId) {
                    value +=
                      "<button class='btn btn-secondary' style='width:120px'>" +
                      "<a href='" +
                      data[i].alarmTitle +
                      "' target='_blank' onclick='zoUpdate(" +
                      data[i].alarmNo +
                      ");'>회의생성</a>" +
                      "</button>";
                  } else {
                    value +=
                      "<button class='btn btn-success' style='width:120px'><a href='" +
                      data[i].alarmTitle +
                      "' target='_blank' onclick='zoUpdate(" +
                      data[i].alarmNo +
                      ");'>회의참가</a>";
                  }
                  value += "</div>";

                  break;
                case "calendar":
                  value += "<div>";
                  if (data[i].alarmYn == 1) {
                    value +=
                      "<li class='list-group-item active' onclick='readAl(this); zoUpdate(" +
                      data[i].alarmNo +
                      ");'>캘린더에 '" +
                      data[i].alarmTitle +
                      "' 일정이 등록 되었습니다.'";
                  } else {
                    value +=
                      "<li class='list-group-item' onclick='readAl(this); zoUpdate(" +
                      data[i].alarmNo +
                      ");'>캘린더에 '" +
                      data[i].alarmTitle +
                      "' 일정이 등록 되었습니다.'";
                  }
                  value +=
                    "<input type='hidden' value='" +
                    data[i].memId +
                    "'>" +
                    "<input type='hidden' value='" +
                    data[i].alarmNo +
                    "'> </li>";
                  break;
                case "ucalendar":
                  value += "<div>";
                  if (data[i].alarmYn == 1) {
                    value +=
                      "<li class='list-group-item active' onclick='readAl(this); zoUpdate(" +
                      data[i].alarmNo +
                      ");'>캘린더에 '" +
                      data[i].alarmTitle +
                      "' 일정이 수정 되었습니다.'";
                  } else {
                    value +=
                      "<li class='list-group-item' onclick='readAl(this); zoUpdate(" +
                      data[i].alarmNo +
                      ");'>캘린더에 '" +
                      data[i].alarmTitle +
                      "' 일정이 수정 되었습니다.'";
                  }
                  value +=
                    "<input type='hidden' value='" +
                    data[i].memId +
                    "'>" +
                    "<input type='hidden' value='" +
                    data[i].alarmNo +
                    "'> </li>";
                  break;

                case "dcalendar":
                  value += "<div>";
                  if (data[i].alarmYn == 1) {
                    value +=
                      "<li class='list-group-item active' onclick='readAl(this); zoUpdate(" +
                      data[i].alarmNo +
                      ");'>캘린더에 '" +
                      data[i].alarmTitle +
                      "' 일정이 삭제 되었습니다.'";
                  } else {
                    value +=
                      "<li class='list-group-item' onclick='readAl(this); zoUpdate(" +
                      data[i].alarmNo +
                      ");'>캘린더에 '" +
                      data[i].alarmTitle +
                      "' 일정이 삭제 되었습니다.'";
                  }
                  value +=
                    "<input type='hidden' value='" +
                    data[i].memId +
                    "'>" +
                    "<input type='hidden' value='" +
                    data[i].alarmNo +
                    "'> </li>";
                  break;
                  
                case "applyPr":
                	value += "<li>"
                				+ data[i].alarmTitle
                			+"</li>"
                	break;
				case "cancelPr":
					value += "<li>"
		        				+ data[i].alarmTitle
		        			+"</li>"
                	break;	

                default:
                  break;
              }
            }
            $("#alarmList>ul").html(value);
          },
          error: function () {
            console.log("실패");
          },
        });
      }

      function zoUpdate(aNo) {
        $.ajax({
          url: "delete.al",
          data: { alarmNo: aNo },
          success: function (data) {
            console.log(data);
          },
        });
      }

      function alapply(num, e) {
        $.ajax({
          url: "application.pr",
          data: {
            pNo: num,
            memId: $(e).siblings("li").children("input:eq(0)").val(),
          },
          success: function (data) {
             if(socket){
            	socket.send("${loginUser.memId},프로젝트 참여 수락되었습니다.,"+$(e).siblings("li").children("input:eq(0)").val()+","+$(e).siblings('li').children('input:eq(1)').val()+",applyPr")
            	
            } 
          },
        });

        $.ajax({
          url: "delete.al",
          data: {
            alarmNo: $(e).siblings("li").children("input:eq(1)").val(),
          },
          success: function (data) {
            $(e).parent().remove();
            
            
          },
        });
      }

      function createZoom(url) {
        location.href = url;
      }

      function joinZoom(url) {
        location.href = url;
      }

      function alcancel(e) {
        $.ajax({
          url: "alcancel.pr",
          data: { memId: $(e).siblings("li").children("input:eq(0)").val() },
          success: function (data) {
        	  if(socket){
              	socket.send("${loginUser.memId},프로젝트 참여 거절되었습니다.,"+$(e).siblings("li").children("input:eq(0)").val()+","+$(e).siblings('li').children('input:eq(1)').val()+",cancelPr")
              } 
          },
        });

        $.ajax({
          url: "delete.al",
          data: {
            alarmNo: $(e).siblings("li").children("input:eq(1)").val(),
          },
          success: function (data) {
            $(e).parent().remove();
            console.log(data);
          },
        });
      }

      function alamList() {
        $("#alamModal").modal("show");
      }

      $("#close").click(function () {
        $("#alamModal").modal("hide");
      });

      function readAl(e) {
        $(e).removeClass("active");
        $.ajax({
          url: "update.al",
          data: {
            alarmNo: $(e).children("input:eq(1)").val(),
          },
          success: function (data) {
            console.log(data);
          },
        });
      }

      // 알람용 웹소켓
      socket = new SockJS("alarm.ws");

      socket.onopen = function () {};

      socket.onclose = function onClose(e) {
        console.log(e.data);
      };

      socket.onmessage = function onMessage(e) {
        let data = e.data;
        let alarm = [];
        alarm = data.split(",");
      }
    </script>
  </body>
</html>
