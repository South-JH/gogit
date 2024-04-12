<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 전체 레파지토리 wrap */
.repo-wrap {
	display: flex;
	flex-direction: column;
}

.repo-wrap>div {
	padding: 25px 0px;
	/* width: 900px; */
}

/* 레파지토리 목록 부분 */
.bottom-area {
	border:1px solid #e6e6e6;
	height: 500px;
	border-radius: 10px;
	padding: 20px;
	background-color: white;
}

.bottom-area-wrap {
	display: flex;
	justify-content: flex-end;
}

.repo-search input {
	outline: none;
	border: none;
}

h2 {
	margin: 0;
}

.repo-search-div {
	border: 1px solid #e6e6e6;
	width: 450px;
	height: 35px;
	border-radius: 6px;
	padding: 6px 10px;
}

/* 검색바 부분 버튼 스타일 변경 */
.repo-btn {
	background-color: rgb(249, 250, 255);
	border: 1px solid #e6e6e6;
	border-radius: 6px;
	height: 35px;
	width: 100px;
	font-weight: 600;
}

.repo-create-btn {
	background-color: rgb(36, 87, 228);
	color: white;
	border: 1px solid #e6e6e6;
	border-radius: 6px;
	height: 35px;
	width: 100px;
	font-weight: 600;
}

.repo-create {
	display: flex;
	justify-content: space-between;
	width: 28%;
}

/* 레포지토리 리스트 목록 스타일 */
.repo-list-one {
	border: 1px solid #e6e6e6;
	border-radius: 6px;
	height: 100px;
	width: 100%;
	display: flex;
	align-items: center;
	padding: 15px;
}

.repo-list-area {
	padding-top: 30px;
}

.repo-search {
	padding-right: 7px;
}

.body-wrapper {
	background-color: #f9f9ff;
}

</style>
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
	          <!-- Row 1 -->
	          <div class="row">
	          
	          <!-- 레파지토리 리스트 -->
	          <div class="repo-wrap">
	          	<div>
	          		<div>
	          			<h2>My &nbsp; Repository</h2>
	          		</div>
	          	</div>
	          	<div>
	          		<div class="bottom-area">
	          			<div class="bottom-area-wrap">
	          				<div class="repo-search">
	          					<div class="repo-search-div">
	          						<input type="text">
	          					</div>
							</div>
							<div class="repo-create">
								  <div>
									  <button type="button" class="repo-btn">Language</button>
								  </div>
								<div>
									<button type="button" class="repo-btn">Sort</button>
								</div>
								<div>
									<button type="button" class="repo-create-btn">New</button>
								</div>
							</div>
	          			</div>
	          			<div class="repo-list-wrap">
							<div class="repo-list-area">
								<div class="repo-list-one">
									<div>
										<img src="resources/images/repo-img.png" width="80px" height="80px">
									</div>
									<div>
										<a href="">
											<div>01_repository</div>
											<div>개발 첫걸음</div>
										</a>
										<div>Java &nbsp; JavaScript</div>
									</div>
								</div>
							</div>
						</div>
	          		</div>
	          	</div>
	          </div>
	          <!-- 레파지토리 리스트 END -->
	          
	          </div>
	        </div>
	     </div>
	 </div>
	
			
<link href="resources/repository/repositoryList.css" rel="stylesheet">
</body>
</html>