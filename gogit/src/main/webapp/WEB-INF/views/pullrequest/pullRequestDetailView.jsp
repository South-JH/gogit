<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
    .time-line *:not(svg) {
    	padding: 5px !important;
    	border: none;
    }
    .time-line tr {
    	border-left: 2px solid lightgray;
    }
    .time-line svg {
    	margin-left: -14px;
    	background-color: white;
    }
    </style>
</head>
<body>

    <jsp:include page="../common/sideBar.jsp" />
    
    <jsp:include page="../common/header.jsp" />
        
    <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed">
      
        <!--  Main wrapper -->
        <div class="body-wrapper">
    
            <div class="container-fluid">
                <!--  Row 1 -->
                <div class="row">
                    <h1>pull request api test1 <span>#8</span></h1>
                    <h4>
                    	<span class="badge rounded-pill bg-success"><i class="ti ti-git-pull-request"></i>Open</span>
                    	South-JH wants to merge 3 commits into main from jhnam
                    </h4>
                    <ul class="nav nav-tabs mb-3">
					  <li class="nav-item">
					    <a class="nav-link active" aria-current="page" href="#">Conversation</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="#">Commits</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="#">Checks</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="#" tabindex="-1" aria-disabled="true">Files changed</a>
					  </li>
					</ul>
                    <div class="conversation container">
                    	<div class="col-8">
                    		<div class="row">
	                    		<div class="col-1">
	                    			<a href="#">
										<img src="resources/images/profile/user-1.jpg" alt="" width="35" height="35" class="rounded-circle">
					                </a>
	                    		</div>
	                    		<div class="col">
		                    		<div class="card">
									  <div class="card-header">
									  	<h6 class="d-inline p-1">Sout-JH</h6>
									  	<span class="p-1">commented</span>
									  	<span class="p-1">yesterday</span>
									  </div>
									  <div class="card-body">
									    이게 되나여
									  </div>
									</div>
									<table class="time-line table .table-borderless .table-sm">
										<colgroup>
											<col width="5%">
											<col>
											<col width="10%">
										</colgroup>
										<tr>
											<th>
												<div class="rounded-circle" style="margin-left: -22px; background-color: lightgray; width:32px;">
													<svg style="margin-left: 3px; background: none;" "aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-repo-push">
													    <path d="M1 2.5A2.5 2.5 0 0 1 3.5 0h8.75a.75.75 0 0 1 .75.75v3.5a.75.75 0 0 1-1.5 0V1.5h-8a1 1 0 0 0-1 1v6.708A2.493 2.493 0 0 1 3.5 9h3.25a.75.75 0 0 1 0 1.5H3.5a1 1 0 0 0 0 2h5.75a.75.75 0 0 1 0 1.5H3.5A2.5 2.5 0 0 1 1 11.5Zm13.23 7.79h-.001l-1.224-1.224v6.184a.75.75 0 0 1-1.5 0V9.066L10.28 10.29a.75.75 0 0 1-1.06-1.061l2.505-2.504a.75.75 0 0 1 1.06 0L15.29 9.23a.751.751 0 0 1-.018 1.042.751.751 0 0 1-1.042.018Z"></path>
													</svg>
												</div>
											</th>
											<th colspan="2">South-JH added 3 commits last week</th>
										</tr>
										<tr>
											<td>
												<svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-git-commit">
											    	<path d="M11.93 8.5a4.002 4.002 0 0 1-7.86 0H.75a.75.75 0 0 1 0-1.5h3.32a4.002 4.002 0 0 1 7.86 0h3.32a.75.75 0 0 1 0 1.5Zm-1.43-.75a2.5 2.5 0 1 0-5 0 2.5 2.5 0 0 0 5 0Z"></path>
												</svg>
											</td>
											<td>pull request 테스트</td>
											<td>15718ac</d>
										</tr>
										<tr>
											<td>
												<svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-git-commit">
											    	<path d="M11.93 8.5a4.002 4.002 0 0 1-7.86 0H.75a.75.75 0 0 1 0-1.5h3.32a4.002 4.002 0 0 1 7.86 0h3.32a.75.75 0 0 1 0 1.5Zm-1.43-.75a2.5 2.5 0 1 0-5 0 2.5 2.5 0 0 0 5 0Z"></path>
												</svg>
											</td>
											<td>Test01.java 수정</td>
											<td>e3c9d61</td>
										</tr>
										<tr>
											<td>
												<svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-git-commit">
											    	<path d="M11.93 8.5a4.002 4.002 0 0 1-7.86 0H.75a.75.75 0 0 1 0-1.5h3.32a4.002 4.002 0 0 1 7.86 0h3.32a.75.75 0 0 1 0 1.5Zm-1.43-.75a2.5 2.5 0 1 0-5 0 2.5 2.5 0 0 0 5 0Z"></path>
												</svg>
											</td>
											<td>수정</td>
											<td>93f15b7</td>
										</tr>
									</table>
	                    		</div>
                    		</div>
                    	</div>
                    	<div class="col"></div>
                    </div>
                    <div class="commits">
                    </div>
                    <div class="checks">
                    </div>
                    <div class="files-changed">
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>