<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container-fluid {
	height: 909px;
}

h4 {
	margin: 0;
}

.repo-detail-public {
	border: 1px solid #e6e6e6;
	border-radius: 30px;
	width: 100px;
	height: 30px;
	display: flex;
	align-items: center;
	justify-content: space-around;
}

.repo-detail-public-area {
	display: flex;
	align-items: center;
	border-bottom: 2px solid #e6e6e6;
	height: 70px;
}

.repo-detail-public-area>div {
	padding: 0px 10px;
}

.repo-wrap>div {
	background: white;
	border: 1px solid #e6e6e6;
	border-radius: 7px;
	padding: 10px 30px;
	height: 700px;
}

/* 왼쪽컨텐츠 사이즈 */
.repo-detail-left-area {
	padding: 20px 0;
	width: 80%;
}

.branch-area-btn {
	border: 1px solid #e6e6e6;
	border-radius: 6px;
	background: #f8f8f8;
	width: 100px;
	height: 35px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.branch-area-btn:hover {
	background: #f1f1f1;
}

.branch-area-btn>div {
	display: flex;
	align-items: center;
	justify-content: space-around;
}

.branch-area-btn i {
	vertical-align: middle;
	font-size: 16px;
}

.branch-area-btn>div:first-child {
	width: 60%;
}

.branch-area-btn>div:last-child {
	width: 30%;
}

.top-content-branch-area {
	display: flex;
	justify-content: space-between;
	width: 200px;
}

.top-content-branch-area>div:nth-child(2)>div {
	display: flex;
	align-items: center;
	height: 35px;
}

.top-content-branch-area>div:nth-child(2)>div>* {
	padding: 0 2px;
}

.left-area-top-content {
	display: flex;
	justify-content: space-between;
	padding-bottom: 20px;
}

.top-content-search-area {
	display: flex;
	justify-content: space-between;
	width: 410px;
}

.search-area-left {
	display: flex;
	align-items: center;
	border: 1px solid #e6e6e6;
	border-radius: 6px;
	width: 300px;
	height: 35px;
	padding: 5px;
}

.search-area-left>div:first-child {
	width: 10%;
	display: flex;
	justify-content: center;
    font-size: 20px;
}

.search-area-left>div:last-child {
	width: 90%;
}

.search-area-left input {
	width: 100%;
	border: none;
	outline: none;
	padding: 0 5px;
}

.search-area-right {
	display: flex;
	align-items: center;
}

.search-area-right a {
	color: var(--bs-body-color);
	text-decoration: none;
}

.bottom-content-commit-desc {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.commit-desc-title-left {
	display: flex;
	align-items: center;
}

.commit-desc-title-left>div {
	padding-right: 8px;
}

.commit-desc-title-right {
	display: flex;
	align-items: center;
	justify-content: space-between;
	width: 170px;
}

.commit-count>a {
	display: flex;
	text-decoration: none;
	color: var(--bs-body-color);
}

.repo-table {
	border-collapse: separate;
    border-spacing: 0;
	border: 1px solid #e6e6e6;
	border-radius: 6px;
	width: 100%;
}

thead {
	background-color: #f8f8f8;
	height: 40px;
}

.repo-table td, th {
	padding: 10px 15px;
}

.ti-clock-code {
	vertical-align: middle;
	font-size: 16px;
	padding: 5px;
}

.ti-git-branch {
	font-size: 16px;
}

/* 오른쪽 detail */
.repo-detail-public-area+div {
	display: flex;
}

.repo-detail-right-area {
	width: 20%;
	padding-left: 40px;
}

.right-area-contributors {
	display: flex;
	padding: 10px 0px;
}

.contributors-count {
	background: #eeeeee;
	border-radius: 50px;
	width: 25px;
	height: 25px;
	padding: 5px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.right-area-contributors+div>div {
	display: flex;
}

.repo-detail-right-area>div>div {
	border-bottom: 1px solid #e6e6e6;
	padding: 15px 50px 15px 0px;
}

.contributors-member {
	padding: 5px 0;
}

.branch-area-div {
	position: relative;
}

.repo-table>tbody>tr>td {
	border-top: 1px solid #e6e6e6;
}

.switch-branch-area {
	border: 1px solid #e6e6e6;
	border-radius: 10px;
	background: white;
	position: absolute;
	top: 40px;
	display: none;
	width: 220px;
}

.switch-branch-area>div:first-child {
	border-bottom: 1px solid #e6e6e6;
	padding: 10px 15px;
}

.switch-branch-title {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding-bottom: 10px;
}

.switch-branch-search {
	border: 1px solid #e6e6e6;
	border-radius: 6px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 5px;
}

.switch-branch-search input {
	border: none;
	outline: none;
}

.switch-branch-area>div:nth-child(2) {
	padding: 10px 0;
}

.switch-branch-select-area {
	border-bottom: 1px solid #e6e6e6;
}

.switch-branch-select-area>div>div {
	padding: 0 10px;
}

.switch-branch-select-area>div>div>div {
	border-top: 1px solid #e6e6e6;
	border-left: 1px solid #e6e6e6;
	border-right: 1px solid #e6e6e6;
	background-color: white;
	width: 80px;
	padding: 5px;
	border-radius: 6px 6px 0 0;
	text-align: center;
}

.branch-area {
	padding: 0 15px;
}

.branch-area>div {
	height: 30px;
	padding: 0 5px;
	border-radius: 6px;
	cursor: pointer;
	display: flex;
	align-items: center;
}

.branch-area>div:hover {
	background: #f9f9f9;
}
</style>
</head>
<body>

	<jsp:include page="../common/sideBar.jsp" />
	
	<jsp:include page="../common/header.jsp" />
	
	<!-- select2 -->
	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
	<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
		
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
	          
	          	<jsp:include page="repositoryTab.jsp" />
	          	
	          	<div class="repo-wrap">
	          		<div>
		          		<div class="repo-detail-public-area">
		          			<div>
		          				<h4>01_repository</h4>
		          			</div>
		          			<div class="repo-detail-public">
		          				<div>Private</div>
		          			</div>
		          		</div>
		          		<div>
			          		<div class="repo-detail-left-area">
			          			<div>
			          				<div class="left-area-top-content">
			          					<div class="top-content-branch-area">
				          					<div class="branch-area-div">
				          						<button type="button" class="branch-area-btn">
				          							<div>
					          							<i class="ti ti-git-branch"></i>
					          							<div><b>main</b></div>
				          							</div>
				          							<div>
				          								<i class="ti ti-chevron-down"></i>
				          							</div>
				          						</button>
				          						<div>
				          							<div class="switch-branch-area">
				          								<div>
				          									<div class="switch-branch-title">
				          										<div><b>Switch branches</b></div>
				          										<div><i class="ti ti-x"></i></div>
				          									</div>
				          									<div>
				          										<div class="switch-branch-search">
				          											<div><i class="ti ti-search"></i></div>
				          											<div>
				          												<input type="text">
				          											</div>
				          										</div>
				          									</div>
				          								</div>
				          								<div>
				          									<div class="branch-area">
				          										<div>main</div>
				          									</div>
				          								</div>
				          							</div>
				          						</div>
				          					</div>
				          					<div>
				          						<div>
				          							<i class="ti ti-git-branch"></i>
				          							<div><b>3</b></div>
				          							<div><b>Branches</b></div>
				          						</div>
				          					</div>
				          				</div>
			          					<div class="top-content-search-area">
			          						<div class="search-area-left">
			          							<div>
			          								<i class="ti ti-search"></i>
			          							</div>
			          							<div>
			          								<input type="text" maxlength="30">
			          							</div>
			          						</div>
											<div class="search-area-right">
												<div>
													<i class="ti ti-clock-code"></i>
												</div>
												<div>
													<a href="list.cm">
														<b>61 Commits</b>
													</a>	
												</div>
											</div>
			          					</div>
			          				</div>
			          				<div class="left-area-bottom-content">
										<div>
											<table class="repo-table">
												<thead>
													<tr>
														<th width="150">NAME</th>
														<th>RECENT COMMIT</th>
														<th width="150">AUTHOR</th>
														<th width="120">DATE</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><i class="ti ti-folder"></i>gogit</td>
														<td>Update RepositoryController.java</td>
														<td><img src="resources/images/repo-img.png" width="20" height="20">crong9105</td>
														<td>2024-04-14</td>
													</tr>
													<tr>
														<td><i class="ti ti-folder"></i>gogit</td>
														<td>Update RepositoryController.java</td>
														<td><img src="resources/images/repo-img.png" width="20" height="20">crong9105</td>
														<td>2024-04-14</td>
													</tr>
												</tbody>
											</table>
										</div>
			          				</div>
			          				
		          			</div>
		          		</div>
		          		
		          		<div class="repo-detail-right-area">
		          			<div>
		          				<div>
		          					<div class="right-area-contributors">
		          						<div>
		          							<b>Contributors</b>
		          						</div>
		          						<div class="contributors-count">
		          							<b>2</b>
		          						</div>
		          					</div>
		          					<div>
		          						<div class="contributors-member">
		          							<div>
		          								<img src="resources/images/repo-img.png" width="20" height="20">
		          							</div>
		          							<div>crong9105</div>
		          						</div>
		          						<div>
		          							<div>
		          								<img src="resources/images/repo-img.png" width="20" height="20">
		          							</div>
		          							<div>crong9105</div>
		          						</div>
		          					</div>
		          				</div>
		          			</div>
		          		</div>
		          	</div>
	          	</div>
	          </div>
	          
	        </div>
	     </div>
	 </div>
</div>

<script>
	$(function(){
	    $(".branch-area-btn").click(function(event){
	        event.stopPropagation();
	        
	        if($(".switch-branch-area").css("display") === 'none'){
	            $(".switch-branch-area").css("display", "block");
	        }else{
	            $(".switch-branch-area").css("display", "none");
	        }
	    });
	    
	    $(".switch-branch-area").click(function(event){
	        event.stopPropagation();
	    });
	
	    $(document).click(function(event){
	        if($(".switch-branch-area").css("display") === 'block'){
	            $(".switch-branch-area").css("display", "none");
	        }
	    });
	});
	
</script>
</body>
</html>