<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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

.repo-detail-left-area {
	padding: 20px 0;
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

	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">

		<!--  Main wrapper -->
		<div class="body-wrapper">

			<div class="container-fluid">
				<!--  Row 1 -->
				<div class="row">

					<jsp:include page="../repository/repositoryTab.jsp" />

					<div class="repo-wrap">
						<div>
							<div class="repo-detail-public-area">
								<div>
									<h4>Commit List</h4>
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
															<div>
																<b>main</b>
															</div>
														</div>
														<div>
															<i class="ti ti-chevron-down"></i>
														</div>
													</button>
													<div>
														<div class="switch-branch-area">
															<div>
																<div class="switch-branch-title">
																	<div>
																		<b>Switch branches</b>
																	</div>
																	<div>
																		<i class="ti ti-x"></i>
																	</div>
																</div>
																<div>
																	<div class="switch-branch-search">
																		<div>
																			<i class="ti ti-search"></i>
																		</div>
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
											</div>
										</div>
										<div class="left-area-bottom-content">
											<div>
												<table class="repo-table">
													<thead>
														<tr>
															<th width="80">NO.</th>
															<th>MESSAGE</th>
															<th width="150">AUTHOR</th>
															<th width="120">DATE</th>
															<th width="300">SHA</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>2</td>
															<td>문제수정완료</td>
															<td>
																<img src="resources/images/repo-img.png" width="20" height="20">crong9105
															</td>
															<td>2024-04-14</td>
															<td>dfsdf237u9sdkfsj3eows2</td>
														</tr>
														<tr>
															<td>1</td>
															<td>첫머지</td>
															<td>
																<img src="resources/images/repo-img.png" width="20" height="20">crong9105
															</td>
															<td>2024-04-14</td>
															<td>dfsdf237u9sdkfsj3eows2</td>
														</tr>
													</tbody>
												</table>
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