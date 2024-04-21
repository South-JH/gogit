<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="shortcut icon" type="image/png" href="resources/image/logo/logo2.png"/>
<link rel="stylesheet" href="resources/css/styles.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.bundle.min.js"></script>
<script src="resources/js/sidebarmenu.js"></script>
<script src="resources/js/app.min.js"></script>
<!-- <script src="resources/js/apexcharts.min.js"></script> -->
<script src="resources/js/simplebar.js"></script>
<script src="resources/js/dashboard.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style>
body {
	background-color: #02384B;
}

#loginForm-wrap {
  margin: auto;
  width: 500px;
  height: 500px;
  margin-top: 200px;
}

body {
  background-image: url("resources/image/common/img.gif");
}

.login-btn-area {
	display: flex;
	justify-content: center;
}

.github-login-btn {
	border: 1px solid black;
	border-radius: 7px;
	background-color: black;
	width: 240px;
	height: 38px;
	padding: 5px;
}

.github-login-btn>a {
	color: white;
	font-weight: 600;
	font-size: 15px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.github-login-btn>a>div {
	padding: 0 5px;
	height: 100%;
}

.card-body {
	box-shadow: 0 0 6px rgba(0,0,0,0.03), 0 0 6px rgba(0,0,0,0.03);
}

.btn-primary {
	height: 38px;
}

.card-body-img-area {
	margin-bottom: 30px;
}

.card-body-img-area>div {
	display: flex;
	justify-content: center;
}

.card-body-img-area img {
	border-radius: 100px;
	padding: 15px;
}

#card-body-top {
	border: none;
	box-shadow: none;
}

.card-body-bottom {
	display: flex;
	justify-contet: space-around;
	padding: 0 40px;
}

.card-body-bottom>* {
	padding: 0 5px;
}
</style>
  </head>

  <body>
    <div id="loginForm-wrap">
      <div class="container-fluid">
        <div class="container-fluid">
          <div class="card">
            <div class="card-body">
              <div class="card-body-img-area">
              	<div>
              		<img src="resources/images/gogit-logo.png" width="300" height="250">
              	</div>
              </div>
              <div class="new-card">
                <div class="card-body" id="card-body-top">
                  <form action="main">
                    <div class="login-btn-area">
	                    <div>
	                    	<div class="github-login-btn">
			                    <a href="http://github.com/login/oauth/authorize?client_id=bafc4109aa5941b24ce1&scope=repo user project delete_repo">
			                    	<div>
			                    		<img src="resources/images/github-logo2.png" width="26" height="26">
			                    	</div>
			                    	<div>Login with GitHub</div>
			                    </a>
	                    	</div>
	                    </div>
                    </div>
                  </form>
                </div>
              </div>
              <div>
              	<div class="card-body">
              		<div class="card-body-bottom">
              			<div>New to GitHub?</div>
              			<a href="https://github.com/signup?ref_cta=Sign+up&ref_loc=header+logged+out&ref_page=%2F&source=header-home">
              				<div>Create an account</div>
              			</a>
              		</div>
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
