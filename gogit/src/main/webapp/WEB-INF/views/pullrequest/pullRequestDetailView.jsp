<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		#comments .placeholder, #content-text-area .placeholder {
			background-color: white;
		}
		.conversation blockquote {
			background-color: #75757540;
			padding: 10px;
		}
		.conversation blockquote>p {
			margin: 0px;
		}
		.conversation .select2-container {
			display: none;
		}
		.conversation .select2-container--default.select2-container--focus .select2-selection--multiple {
			border-color: #aec3ff;
		}
		#success-badge {
			background-color: #198754 !important;
		}
		#danger-badge {
			background-color: #dc3545!important;
		}
		#merge-btn, #confirm-merge-btn, #comment-btn {
			background-color: #198754;
			border: none;
		}
		#author-badge {
		    background-color: #fafafb !important;
		    color: gray;
		    border: 1px solid gray;
		}
		#newTitle-btn, #newContent-btn {
			background-color: #0d6efd!important;
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
                	<jsp:include page="../repository/repositoryTab.jsp"/>
                
                	<h1 id="origin-title-area">
                		${ pullrq.pullTitle } <span class="me-2 text-black-50 fw-light">#${ pullrq.pullNo }</span>
                		<svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-edit" style="cursor: pointer" onclick="modifyTitle();">
	                		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
	                		<path d="M7 7h-1a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-1" />
	                		<path d="M20.385 6.585a2.1 2.1 0 0 0 -2.97 -2.97l-8.415 8.385v3h3l8.385 -8.415z" />
	                		<path d="M16 5l3 3" />
                		</svg>
               		</h1>
               		<div id="new-title-area" class="mb-2 d-none">
               			<form action="update.pullrq" method="post">
               				<input type="hidden" name="repoOwner" value="${ pullrq.repoOwner }">
               				<input type="hidden" name="repoName" value="${ pullrq.repoName }">
               				<input type="hidden" name="pullNo" value="${ pullrq.pullNo }">
	               			<input type="text" class="form-control form-control-lg w-50 me-1 d-inline" id="newTitle" name="pullTitle">
	               			<button type="submit" class="btn btn-sm btn-primary" id="newTitle-btn" onclick="return validateTitle();">Save</button>
	               			<button type="button" class="btn btn-sm btn-dark" onclick="cancelModifyTitle();">Cancel</button>
               			</form>
               		</div>
                    <h4>
                    	<c:choose>
                    		<c:when test="${ pullrq.status eq 'open' }">
		                    	<span class="badge rounded-pill bg-success" id="success-badge"><i class="ti ti-git-pull-request"></i>Open</span>
                    		</c:when>
                    		<c:when test="${ pullrq.status eq 'closed' }">
		                    	<span class="badge rounded-pill bg-danger" id="danger-badge"><i class="ti ti-git-pull-request"></i>Closed</span>
                    		</c:when>
                    		<c:otherwise>
		                    	<span class="badge rounded-pill" style="background-color: #8250df;"><i class="ti ti-git-pull-request"></i>${ pullrq.status }</span>
                    		</c:otherwise>
                    	</c:choose>
                    	${ pullrq.pullWriter } wants to merge ${ list.size() } commits into ${ pullrq.baseBranch } from ${ pullrq.compareBranch }
                    </h4>
                    <ul class="nav nav-tabs mb-3">
						<li class="nav-item">
					    	<a class="nav-link active" aria-current="page" href="#">Conversation</a>
					  	</li>
					  	<li class="nav-item">
					    	<a class="nav-link" href="#">
					    		Commits
					    		<span class="badge bg-secondary">${ pullrq.commits }</span>
				    		</a>
					  	</li>
					  	<li class="nav-item">
					    	<a class="nav-link" href="#">Checks</a>
					  	</li>
					  	<li class="nav-item">
					    	<a class="nav-link" href="#" tabindex="-1" aria-disabled="true">Files changed</a>
					  	</li>
					</ul>
                    <div class="conversation container row">
                    	<div class="col-8 p-1">
                    		<div class="row" style="border-bottom: 1px solid lightgray;">
	                    		<div class="col-1">
	                    			<a href="#">
										<img src="${ pullrq.pullWriterProfile }" alt="" width="35" height="35" class="rounded-circle">
					                </a>
	                    		</div>
	                    		<div class="col">
		                    		<div class="card">
										<div class="card-header position-relative">
									  		<span class="position-absolute top-50 end-0 translate-middle-y">
											  	<svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-edit" style="cursor: pointer" onclick="modifyContent();">
							                		<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
							                		<path d="M7 7h-1a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-1" />
							                		<path d="M20.385 6.585a2.1 2.1 0 0 0 -2.97 -2.97l-8.415 8.385v3h3l8.385 -8.415z" />
							                		<path d="M16 5l3 3" />
						                		</svg>
					                		</span>
									  		<h6 class="d-inline p-1">${ pullrq.pullWriter }</h6>
									  		<span class="p-1">commented</span>
									  		<span class="p-1">${ pullrq.createDate }</span>
									  	</div>
									  	<div class="card-body" id="origin-content-area">
									  		<c:if test="${ empty pullrq.pullContent }">
									  			No description
									  		</c:if>
									  		${ pullrq.pullContent }
									  	</div>
									  	<div class="card-body d-none" id="new-content-area">
									  		<form action="update.pullrq" method="post">
									  			<input type="hidden" name="repoOwner" value="${ pullrq.repoOwner }">
					               				<input type="hidden" name="repoName" value="${ pullrq.repoName }">
					               				<input type="hidden" name="pullNo" value="${ pullrq.pullNo }">
					               				<input type="hidden" name="pullContent">
										  		<div id="content-text-area"></div>
										  		<div class="float-end mt-2">
											  		<button type="submit" class="btn btn-primary me-1" id="newContent-btn" onclick="return validateContent();">Save</button>
											  		<button type="button" class="btn btn-dark" onclick="cancelModifyContent();">Cancel</button>
										  		</div>
									  		</form>
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
											<th colspan="2">${ pullrq.pullWriter } added ${ list.size() } commits</th>
										</tr>
										<c:forEach var="c" items="${ list }">
											<tr>
												<td>
													<svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-git-commit">
												    	<path d="M11.93 8.5a4.002 4.002 0 0 1-7.86 0H.75a.75.75 0 0 1 0-1.5h3.32a4.002 4.002 0 0 1 7.86 0h3.32a.75.75 0 0 1 0 1.5Zm-1.43-.75a2.5 2.5 0 1 0-5 0 2.5 2.5 0 0 0 5 0Z"></path>
													</svg>
												</td>
												<td class="fs-2 align-bottom">${ c.message }</td>
												<td>${ c.sha.substring(0, 7) }</d>
											</tr>
										</c:forEach>
									</table>
	                    		</div>
                    		</div>
                    		<c:if test="${ pullrq.status eq 'open' }">
	                    		<div class="row mt-3" style="border-bottom: 1px solid lightgray;">
	                    			<p style="margin-left:8.33333333%;">Add more commits by pushing to the ${ pullrq.compareBranch } branch on ${ pullrq.repoOwner }/${ pullrq.repoName }.</p>
			                    	<div class="row">
			                    		<div class="col-1">
			                    			<svg aria-hidden="true" height="24" viewBox="0 0 24 24" version="1.1" width="24" data-view-component="true" class="octicon octicon-git-merge">
												<path d="M15 13.25a3.25 3.25 0 1 1 6.5 0 3.25 3.25 0 0 1-6.5 0Zm-12.5 6a3.25 3.25 0 1 1 6.5 0 3.25 3.25 0 0 1-6.5 0Zm0-14.5a3.25 3.25 0 1 1 6.5 0 3.25 3.25 0 0 1-6.5 0ZM5.75 6.5a1.75 1.75 0 1 0-.001-3.501A1.75 1.75 0 0 0 5.75 6.5Zm0 14.5a1.75 1.75 0 1 0-.001-3.501A1.75 1.75 0 0 0 5.75 21Zm12.5-6a1.75 1.75 0 1 0-.001-3.501A1.75 1.75 0 0 0 18.25 15Z"></path><path d="M6.5 7.25c0 2.9 2.35 5.25 5.25 5.25h4.5V14h-4.5A6.75 6.75 0 0 1 5 7.25Z"></path><path d="M5.75 16.75A.75.75 0 0 1 5 16V8a.75.75 0 0 1 1.5 0v8a.75.75 0 0 1-.75.75Z"></path>
											</svg>
			                    		</div>
			                    		<div class="col">
			                    			<div class="card">
											  	<ul class="list-group list-group-flush">
											    	<li class="list-group-item py-4">
														<c:choose>
															<c:when test="${ pullrq.mergeable }">
																<div class="row" id="available-merge">
																	<div class="col-1 success-icon">
																		<svg  xmlns="http://www.w3.org/2000/svg"  width="44"  height="44"  viewBox="0 0 24 24"  fill="none"  stroke="#198754"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-circle-check">
																			<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
																			<path d="M12 12m-9 0a9 9 0 1 0 18 0a9 9 0 1 0 -18 0" />
																			<path d="M9 12l2 2l4 -4" />
																		</svg>
																	</div>
																	<div class="col">
																		<h5>This branch has no conflicts with the base branch</h5>
																		<p>Rulesets ensure specific people approve pull requests before they're merged.</p>
																	</div>
																</div>

																<div class="row d-none" id="merge-form">
																	<div class="col-1 success-icon">
																		<img src="${ loginUser.profile }" width="35" height="35" class="rounded-circle">
																	</div>
																	<div class="col">
																		<div>
																			<div class="mb-1">
																				<span><strong>Commit Title</strong></span>
																			</div>
																			<input type="text" class="form-control" name="commitTitle" value="Merge pull request #${ pullrq.pullNo } from ${ pullrq.pullWriter }/${ pullrq.compareBranch }">
																		</div>
																		<div class="mt-4">
																			<div class="mb-1">
																				<span><strong>Commit Message</strong></span>
																			</div>
																			<textarea class="form-control" name="commitMessage" style="resize: none;">${ pullrq.pullTitle }</textarea>
																		</div>
																	</div>
																</div>
															</c:when>
															<c:otherwise>
																<div class="row">
																	<div class="col-1 conflict-icon">
																		<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-alert-triangle" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#ff4500" fill="none" stroke-linecap="round" stroke-linejoin="round">
																			<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
																			<path d="M12 9v4" />
																			<path d="M10.363 3.591l-8.106 13.534a1.914 1.914 0 0 0 1.636 2.871h16.214a1.914 1.914 0 0 0 1.636 -2.87l-8.106 -13.536a1.914 1.914 0 0 0 -3.274 0z" />
																			<path d="M12 16h.01" />
																		</svg>
																	</div>
																	<div class="col">
																		<h5>This branch has no conflicts with the base branch</h5>
																		<p>Rulesets ensure specific people approve pull requests before they're merged.</p>
																	</div>
																</div>
															</c:otherwise>
														</c:choose>
											    	</li>
												</ul>
												<div class="card-footer">
													<c:choose>
														<c:when test="${ pullrq.status eq 'open' and pullrq.mergeable }">
															<button type="button" class="btn btn-success" id="merge-btn" onclick="showMergeForm();">Merge pull request</button>
															<form action="merge.pullrq" method="post" class="d-inline">
																<input type="hidden" name="pullNo" value="${ pullrq.pullNo }">
																<input type="hidden" name="repoName" value="${ pullrq.repoName }">
																<input type="hidden" name="repoOwner" value="${ pullrq.repoOwner }">
																<input type="hidden" name="title">
																<input type="hidden" name="message">
																<button type="submit" class="btn btn-success me-1 d-none" id="confirm-merge-btn" onclick="validateMerge();">Confirm merge</button>
															</form>
															<button type="button" class="btn btn-dark d-none" id="cancel-merge-btn" onclick="hideMergeForm();">Cancel</button>
														</c:when>
														<c:when test="${ pullrq.status eq 'open' and not pullrq.mergeable }">
												  			<button type="button" class="btn btn-dark" onclick="window.open('https://github.com/${ pullrq.repoOwner }/${ pullrq.repoName }/pull/${ pullrq.pullNo }/conflicts')">Resolve conflicts</button>
														</c:when>
													</c:choose>
												</div>
											</div>
										</div>
		                    		</div>
		                    	</div>
	                    	</c:if>
	                    	<c:forEach var="comment" items="${ comments }">
		                    	<div class="row mt-3">
		                    		<div class="col-1">
		                    			<a href="#">
											<img src="${ comment.commentWriterProfile }" alt="" width="35" height="35" class="rounded-circle">
						                </a>
		                    		</div>
		                    		<div class="col">
			                    		<div class="card">
											<div class="card-header position-relative">
										  		<h6 class="d-inline p-1">${ comment.commentWriter }</h6>
										  		<span class="p-1">commented</span>
										  		<span class="p-1">${ comment.createDate }</span>
										  		<c:if test="${ comment.isAuthor }">
										  			<span class="badge rounded-pill bg-primary float-end" id="author-badge">Author</span>
										  		</c:if>
										  	</div>
										  	<div class="card-body" id="origin-content-area">
										  		${ comment.comment }
										  	</div>
									  	</div>
								  	</div>
		                    	</div>
	                    	</c:forEach>
	                    	<div class="row mt-3">
	                    		<div class="col-1">
	                    			<a href="#">
										<img src="${ loginUser.profile }" width="35" height="35" class="rounded-circle">
					                </a>
	                    		</div>
		                    	<div class="col">
		                    		<h5>Add a comment</h5>
		                    		<div id="comments">
									</div>
		                    	</div>
	                    	</div>
	                    	<div class="float-end mt-2">
	                    		<form action="update.pullrq" method="post" class="d-inline">
	                    			<input type="hidden" name="repoOwner" value="${ pullrq.repoOwner }">
		               				<input type="hidden" name="repoName" value="${ pullrq.repoName }">
		               				<input type="hidden" name="pullNo" value="${ pullrq.pullNo }">
		               				<c:choose>
			               				<c:when test="${ pullrq.status eq 'open' }">
			               					<input type="hidden" name="status" value="closed">
		               					</c:when>
		               					<c:otherwise>
			               					<input type="hidden" name="status" value="open">
		               					</c:otherwise>
	               					</c:choose>
									<c:choose>
			               				<c:when test="${ pullrq.status eq 'open' }">
				                    		<button type="submit" class="btn btn-light me-1">
					               				<svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true">
											    	<path d="M3.25 1A2.25 2.25 0 0 1 4 5.372v5.256a2.251 2.251 0 1 1-1.5 0V5.372A2.251 2.251 0 0 1 3.25 1Zm9.5 5.5a.75.75 0 0 1 .75.75v3.378a2.251 2.251 0 1 1-1.5 0V7.25a.75.75 0 0 1 .75-.75Zm-2.03-5.273a.75.75 0 0 1 1.06 0l.97.97.97-.97a.748.748 0 0 1 1.265.332.75.75 0 0 1-.205.729l-.97.97.97.97a.751.751 0 0 1-.018 1.042.751.751 0 0 1-1.042.018l-.97-.97-.97.97a.749.749 0 0 1-1.275-.326.749.749 0 0 1 .215-.734l.97-.97-.97-.97a.75.75 0 0 1 0-1.06ZM2.5 3.25a.75.75 0 1 0 1.5 0 .75.75 0 0 0-1.5 0ZM3.25 12a.75.75 0 1 0 0 1.5.75.75 0 0 0 0-1.5Zm9.5 0a.75.75 0 1 0 0 1.5.75.75 0 0 0 0-1.5Z"></path>
												</svg>
			                    				Close pull request
				                    		</button>
		               					</c:when>
		               					<c:when test="${ pullrq.status eq 'closed' and pullrq.mergeable }">
		               						<p>${ pullrq.mergeable }</p>
				                    		<button type="submit" class="btn btn-light me-1">Reopen pull request</button>
		               					</c:when>
		               					<c:when test="${ pullrq.status eq 'closed' and not pullrq.mergeable }">
				                    		<button type="submit" class="btn btn-light me-1" disabled>Reopen pull request</button>
		               					</c:when>
               						</c:choose>
	                    		</form>
	                    		<form action="comment.pullrq" method="post" class="d-inline">
	                    			<input type="hidden" name="repoOwner" value="${ pullrq.repoOwner }">
		               				<input type="hidden" name="repoName" value="${ pullrq.repoName }">
		               				<input type="hidden" name="pullNo" value="${ pullrq.pullNo }">
		               				<input type="hidden" name="comment">
	                    			<button type="submit" class="btn btn-success" id="comment-btn" onclick="return validateComment();">Comment</button>
	                    		</form>
	                    	</div>
                    	</div>
                    	<div class="col-4 ps-5 pt-2">
                    		<div class="row mb-4 offset-md-1" id="reviewers">
                    			<h5>Reviewers
                    				<button class="float-end btn btn-sm" onclick="openReviewers('reviewers')"><i class="ti ti-plus"></i></button>
                    				<button class="float-end btn btn-sm d-none" onclick="closeReviewers('reviewers')"><i class="ti ti-minus"></i></button>
                    				</h5>
                    			<div class="mt-1">
                    				<select class="form-select" name="selectedReviewer" multiple>
										<c:forEach var="collaborator" items="${ collaboratorList }">
											<c:if test="${ pullrq.pullWriter ne collaborator.collaborator }">
												<c:choose>
													<c:when test="${ fn:contains(pullrq.pullReviewer, collaborator.collaborator) }">
														<option selected>${ collaborator.collaborator }</option>
													</c:when>
													<c:otherwise>
														<option>${ collaborator.collaborator }</option>
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach>
									</select>
                    				<c:set var="reviewers" value="${ fn:split(pullrq.pullReviewer, ',') }"/>
                    				<c:set var="reviewersProfiles" value="${ fn:split(pullrq.pullReviewerProfile, ',') }"/>
                    				<div id="reviewers-area">
	                    				<c:forEach var="reviewer" items="${ reviewers }" varStatus="status">
	                    					<c:if test="${ not empty reviewersProfiles[status.index] }">
		                    					<div class="mt-2">
			                    					<img class="profile" src="${ reviewersProfiles[status.index] }" style="width: 25px; height: 25px; border-radius: 100%;">
			                    					${ reviewer }
		                    					</div>
	                    					</c:if>
	                    				</c:forEach>
                    				</div>
                    			</div>
                    		</div>
                    		<div class="row offset-md-1" id="assignees" style="border-top: 1px solid lightgray;">
                    			<h5 class="mt-2">Assignees
                    				<button class="float-end btn btn-sm" onclick="openReviewers('assignees')"><i class="ti ti-plus"></i></button>
                    				<button class="float-end btn btn-sm d-none" onclick="closeReviewers('assignees')"><i class="ti ti-minus"></i></button>
                    			</h5>
                   				<select class="form-select" name="selectedAssignees" multiple>
									<c:forEach var="collaborator" items="${ collaboratorList }">
										<c:choose>
											<c:when test="${ fn:contains(pullrq.pullManager, collaborator.collaborator) }">
												<option selected>${ collaborator.collaborator }</option>
											</c:when>
											<c:otherwise>
												<option>${ collaborator.collaborator }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
                    			<div class="mt-2">
                    				<c:set var="assignees" value="${ fn:split(pullrq.pullManager, ',') }"/>
                    				<c:set var="assigneesProfiles" value="${ fn:split(pullrq.pullManagerProfile, ',') }"/>
                    				<div id="assignees-area">
	                    				<c:forEach var="assignee" items="${ assignees }" varStatus="status">
	                    					<c:if test="${ not empty assigneesProfiles[status.index] }">
		                    					<div class="mb-2">
			                    					<img class="profile" src="${ assigneesProfiles[status.index] }" style="width: 25px; height: 25px; border-radius: 100%;">
			                    					${ assignee }
		                    					</div>
	                    					</c:if>
	                    				</c:forEach>
                    				</div>
                    			</div>
                    		</div>
                    	</div>
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
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>
	$("#pull-request").attr("href", "list.pullrq?repoName=${ pullrq.repoName }&visibility=${ pullrq.repoVisibility }&owner=${ pullrq.repoOwner }");
	$("#code").attr("href", "detail.rp?repoName=${ pullrq.repoName }&visibility=${ pullrq.repoVisibility }&owner=${ pullrq.repoOwner }&permission=${ permission }");
	$("#issue").attr("href", "list.is?repoName=${ pullrq.repoName }&visibility=${ pullrq.repoVisibility }&owner=${ pullrq.repoOwner }");
	$("select[name=selectedReviewer]").select2();
	$("select[name=selectedAssignees]").select2();
	
	const editor1 = new toastui.Editor({
		el: document.querySelector('#comments'), // 에디터를 적용할 요소 (컨테이너)
		height: '200px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
		previewStyle: 'tab',
		initialValue: '',
		placeholder: 'add your comment here...'
	});
	
	const editor2 = new toastui.Editor({
		el: document.querySelector('#content-text-area'), // 에디터를 적용할 요소 (컨테이너)
		height: '200px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
		previewStyle: 'tab',
		initialValue: '',
		placeholder: 'add your pull request body here...'
	});

	function showMergeForm() {
		$("#available-merge").addClass("d-none");
		$("#merge-btn").addClass("d-none");

		$("#merge-form").removeClass("d-none");
		$("#confirm-merge-btn").removeClass("d-none");
		$("#cancel-merge-btn").removeClass("d-none");

		$("input[name=commitTitle]").val("Merge pull request #${ pullrq.pullNo } from ${ pullrq.pullWriter }/${ pullrq.compareBranch }");
		$("textarea[name=commitMessage]").val("${ pullrq.pullTitle }");
	}

	function hideMergeForm() {
		$("#merge-form").addClass("d-none");
		$("#confirm-merge-btn").addClass("d-none");
		$("#cancel-merge-btn").addClass("d-none");

		$("#available-merge").removeClass("d-none");
		$("#merge-btn").removeClass("d-none");
	}

	function validateMerge() {
		if($("input[name=commitTitle]").val() == "") {
			$("input[name=title]").val("Merge pull request #${ pullrq.pullNo } from ${ pullrq.pullWriter }/${ pullrq.compareBranch }");
		} else {
			$("input[name=title]").val($("input[name=commitTitle]").val());
		}

		if($("textarea[name=commitMessage]").val() == "") {
			$("input[name=message]").val("${ pullrq.pullTitle }");
		} else {
			$("input[name=message]").val($("textarea[name=commitMessage]").val());
		}
	}
	
	function modifyTitle() {
		$("#origin-title-area").addClass("d-none");
		$("#new-title-area").removeClass("d-none");
		$("#newTitle").val("${ pullrq.pullTitle }");
	}
	
	function cancelModifyTitle() {
		$("#new-title-area").addClass("d-none");
		$("#origin-title-area").removeClass("d-none");
	}

	function validateTitle() {
		if($("#newTitle").val() == "") {
			alertify.alert("Pull request title을 작성해주세요.");
			$("#newTitle").val("${ pullrq.pullTitle }");
			return false;
		}
	}
	
	function modifyContent() {
		$("#origin-content-area").addClass("d-none");
		$("#new-content-area").removeClass("d-none");
		editor2.setHTML(`${ pullrq.pullContent }`);
	}
	
	function cancelModifyContent() {
		$("#new-content-area").addClass("d-none");
		$("#origin-content-area").removeClass("d-none");
	}
	
	function validateContent() {
		if(editor2.getMarkdown() == "") {
			alertify.alert("Pull request content를 작성해주세요.");
			return false;
		}
		
		$("input[name=pullContent]").val(editor2.getHTML());
	}
	
	function validateComment() {
		if(editor1.getMarkdown() == "") {
			$("#comments").focus();
			return false;
		}
		
		$("input[name=comment]").val(editor1.getHTML());
	}
	
	function openReviewers(id) {
		$("#" + id + " .select2-container").show();
		$("#" + id + " .ti-plus").parent().addClass("d-none");
		$("#" + id + " .ti-minus").parent().removeClass("d-none");
		$("#" + id + "-area").addClass("mt-4");
	}
	
	function closeReviewers(id) {
		$("#" + id + " .select2-container").hide();
		$("#" + id + " .ti-plus").parent().removeClass("d-none");
		$("#" + id + " .ti-minus").parent().addClass("d-none");
		$("#" + id + "-area").removeClass("mt-4");
	}
	
	$("select[name=selectedReviewer]").change(function() {
		$.ajax({
			url: 'addReviewer.pullrq',
			data: {
				repoOwner: '${ pullrq.repoOwner }',
				repoName: '${ pullrq.repoName }',
				pullNo: ${ pullrq.pullNo },
				pullReviewer: '${ pullrq.pullReviewer }',
				newReviewer: $("select[name=selectedReviewer]").val()
			},
			success: function(result) {
				if(result) {
					$.ajax({
						url: 'selectReviewer.pullrq',
						data: {
							repoOwner: '${ pullrq.repoOwner }',
							repoName: '${ pullrq.repoName }',
							pullNo: ${ pullrq.pullNo }
						},
						success: function(result) {
							let reviewers = result.pullReviewer;
							let reviewersProfiles = result.pullReviewerProfile;

							let value = '';
							if(reviewers != '') {
								for(let i = 0; i < reviewers.split(',').length; i++) {
									value += `
											<div class="mt-2">
	                							<img class="profile" src="\${reviewersProfiles.split(',')[i]}" style="width: 25px; height: 25px; border-radius: 100%;">
	                							\${reviewers.split(',')[i]}
	            							</div>
											`;
								}
							}
							
							$('#reviewers-area').html(value);
						},
						error: function() {
							console.log('Reviewer 재조회 ajax 호출 실패');
						}
					});
					
				} else {
					alertify.alert('Reviewer 수정 실패');
				}
			},
			error: function() {
				console.log('Reviewer 추가/삭제 ajax 호출 실패');
			}
			
		});
	});
	
	$("select[name=selectedAssignees]").change(function() {
		$.ajax({
			url: 'addAssignee.pullrq',
			data: {
				repoOwner: '${ pullrq.repoOwner }',
				repoName: '${ pullrq.repoName }',
				pullNo: ${ pullrq.pullNo },
				pullManager: '${ pullrq.pullManager }',
				newManager: $("select[name=selectedAssignees]").val()
			},
			success: function(result) {
				if(result) {
					$.ajax({
						url: 'selectAssignee.pullrq',
						data: {
							repoOwner: '${ pullrq.repoOwner }',
							repoName: '${ pullrq.repoName }',
							pullNo: ${ pullrq.pullNo }
						},
						success: function(result) {
							let assignees = result.pullManager;
							let assigneesProfiles = result.pullManagerProfile;

							let value = '';
							if(assignees != '') {
								for(let i = 0; i < assignees.split(',').length; i++) {
									value += `
											<div class="mt-2">
	                							<img class="profile" src="\${assigneesProfiles.split(',')[i]}" style="width: 25px; height: 25px; border-radius: 100%;">
	                							\${assignees.split(',')[i]}
	            							</div>
											`;
								}
							}
							
							$('#assignees-area').html(value);
						},
						error: function() {
							console.log('Assignee 재조회 ajax 호출 실패');
						}
					});
					
				} else {
					alertify.alert('Assignee 수정 실패');
				}
			},
			error: function() {
				console.log('Assignee 추가/삭제 ajax 호출 실패');
			}
			
		});
	});
	
</script>
</html>