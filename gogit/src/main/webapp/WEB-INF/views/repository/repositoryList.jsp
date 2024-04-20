<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.bundle.min.js"></script> -->
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
	          						<input type="text" placeholder="Find a repository">
	          						<i class="ti ti-search"></i>
	          					</div>
							</div>
							<div class="repo-create">
								<div class="repo-btn">
									<a>Type</a>
								</div>
								<div class="repo-create-btn">
									<a class="repo-create-btn-color" href="enrollForm.rp">New</a>
								</div>
							</div>
	          			</div>

						<!-- 목록 시작 -->
						<div class="repo-list-total-wrap">
							<div>
								<div>
									<div class="repo-list-count">
										<div><h4>${ rpList.size() } repository</h4></div>
									</div>
									<div class="repo-list-wrap">
									<c:forEach var="rpList" items="${ rpList }" varStatus="rp">
										<div>
											<div class="repo-list-wrap-one">
												<div>
													<div class="wrap-one">
														<div class="repo-list-top-area">
															<div class="top-area-title-visibility">
																<div class="href-div">
																	<div>
																		<h4>${ rpList.repoTitle }</h4>
																	</div>
																</div>
																<div class="top-area-visibility">${ rpList.visibility }</div>
															</div>
															<div class="top-area-action">
																<div>
																	<button type="button" data-toggle="modal" data-target="#inviteModal${ rp.index }">
																		<i class="ti ti-send"></i>
																	</button>
																</div>
																<div>
																	<button type="button" data-toggle="modal" data-target="#updateModal${ rp.index }">
																		<i class="ti ti-pencil"></i>
																	</button>
																</div>
																<div onclick="deleteBtn(this);">
																	<button type="button">
																		<i class="ti ti-trash"></i>
																	</button>
																</div>
															</div>
														</div>
														<div>${ rpList.repoContent }</div>
													</div>

													<div class="repo-count-list-area">
													<c:if test="${ not empty rpList.language }">
														<div>
															<div><i class="ti ti-world"></i></div>
															<div class="repo-count-check">${ rpList.language }</div>
														</div>
													</c:if>
														<div>
															<div><i class="ti ti-carambola"></i></div>
															<div class="repo-count-check">${ rpList.stargazers }</div>
														</div>
														<div>
															<div><i class="ti ti-git-fork"></i></div>
															<div class="repo-count-check">${ rpList.fork }</div>
														</div>
														<div>
															<div><i class="ti ti-circle-dot"></i></div>
															<div class="repo-count-check">${ rpList.openIssue }</div>
														</div>
														<div>
															<div class="repo-count-check"><i></i>${ updateAt }</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
									</div>
								</div>
							</div>
						</div>
						<!-- 목록 끝 -->
	          		</div>
	          	</div>
	          </div>
	          <!-- 레파지토리 리스트 END -->
				          
	          </div>
	        </div>
	     </div>
	 </div>

<script>
	
	$(function(){
		$(".href-div").click(function(){
			console.log("왜안와..?");
			console.log($(this).children().children("h4").text());
			console.log($(this).siblings(".top-area-visibility").text());
			location.href = "detail.rp?repoName=" + $(this).children().children("h4").text() + "&visibility=" + $(this).siblings(".top-area-visibility").text();
		})
	})
	
	function deleteBtn(e){
		
		//console.log($(e).parent().siblings().eq(0).children().children().children().text());
		const repoTitle = $(e).parent().siblings().eq(0).children().children().children().text();
		//console.log(repoTitle);
		
		if(confirm("레포지토리를 삭제하시겠습니까?")){
			
			$.ajax({
				url:"delete.rp",
				data:{
					repoName:repoTitle
				},
				success:function(result){
	                alert(repoTitle + "레포지토리가 삭제되었습니다.");
	                location.reload();
				},
		        error: function(error) {
		            console.log("레포지토리 삭제 ajax 실패: " + error);
		            alert("레포지토리 삭제에 실패했습니다.");
		        }
			})
			
		} else{
			console.log("삭제 취소");
		}
	}
	
	function inviteBtn(e){
		
		const repoTitle;
		
	}
	
	
	
	
	
	
	
	
	
/* 	$(function(){
		$(".btn-close").click(function(e) {
			console.log("오냐?");
			console.log($(this).parents(".modal"));
			$(this).parents(".modal").modal.("hide");
	    });
	})
	
	// 모달이 닫히면 새로고침
    $('#updateModal${rp.index}').on('hidden.bs.modal', function (e) { 
        location.reload();
    }); */
		
</script>

<link href="resources/repository/repositoryList.css" rel="stylesheet">
</body>
</html>