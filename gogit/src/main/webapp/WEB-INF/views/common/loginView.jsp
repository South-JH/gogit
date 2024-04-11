<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link
      rel="shortcut icon"
      type="image/png"
      href="resources/image/logo/logo2.png"
    />
    <link rel="stylesheet" href="resources/css/styles.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/sidebarmenu.js"></script>
    <script src="resources/js/app.min.js"></script>
    <script src="resources/js/apexcharts.min.js"></script>
    <script src="resources/js/simplebar.js"></script>
    <script src="resources/js/dashboard.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <style>
      #loginForm-wrap {
        margin: auto;
        width: 500px;
        height: 500px;
        margin-top: 200px;
      }
      body {
        background-image: url("resources/image/common/img.gif");
      }
    </style>
  </head>

  <body>
    <div id="loginForm-wrap">
      <div class="container-fluid">
        <div class="container-fluid">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title fw-semibold mb-4" align="center">로그인</h5>
              <div class="card">
                <div class="card-body">
                  <form action="main">
                    <div class="mb-3">
                      <label for="exampleInputEmail1" class="form-label">아이디</label>
                      <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                      <!-- <div id="emailHelp" class="form-text">하이하이</div> -->
                    </div>
                    <div class="mb-3">
                      <label for="exampleInputPassword1" class="form-label"
                        >비밀번호</label
                      >
                      <input
                        type="password"
                        class="form-control"
                        id="exampleInputPassword1"
                      />
                    </div>
                    <div class="mb-3 form-check">
                      <input
                        type="checkbox"
                        class="form-check-input"
                        id="exampleCheck1"
                      />
                      <label class="form-check-label" for="exampleCheck1"
                        >Check me out</label
                      >
                    </div>
                    <button type="submit" class="btn btn-primary" onclick="">
                      로그인
                    </button>
                    <a
                      href="http://github.com/login/oauth/authorize?client_id=bafc4109aa5941b24ce1"
                      >Click here</a
                    >
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script></script>
  </body>
</html>
