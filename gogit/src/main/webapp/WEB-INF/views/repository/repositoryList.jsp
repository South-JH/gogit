<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
								<div class="repo-btn">
									<a>Language</a>
								</div>
								<div class="repo-btn">
									<a>Sort</a>
								</div>
								<div class="repo-create-btn">
									<a class="repo-create-btn-color" href="enrollForm.rp">New</a>
								</div>
							</div>
	          			</div>

						<!-- 목록 시작 -->
	          			<div class="repo-list-wrap">
							<div class="repo-list-area">
								<div class="repo-list-one">
									<div class="repo-list-one-area">
										<div>
											<img src="resources/images/repo-img.png" width="80px" height="80px">
										</div>
										<div class="repo-title-area">
											<a href="detail.rp">
												<div>
													<h3>01_repository</h3>
												</div>
											</a>
											<div>에휴</div>
											<div>Java &nbsp; JavaScript</div>
										</div>
										<div>
											<div class="repo-public">
												<div>Private</div>
											</div>
										</div>
									</div>
									<div class="repo-other-area">
										<div class="repo-other-img" onclick="openBtn(this);">
											<img src="resources/images/menu-dots.png" width="20px" height="20px">
										</div>
										<div class="repo-other">
											<div>
												<a id="repo-other-a">수정</a>
											</div>
											<div>
												<button type="button">초대</button>
											</div>
											<div>
												<button type="button">삭제</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 목록 끝 -->

						<!-- 목록 시작 -->
						<div class="repo-list-wrap">
							<div class="repo-list-area">
								<div class="repo-list-one">
									<div class="repo-list-one-area">
										<div>
											<img src="resources/images/repo-img.png" width="80px" height="80px">
										</div>
										<div class="repo-title-area">
											<a href="">
												<div>
													<h3>01_repository</h3>
												</div>
											</a>
											<div>에휴</div>
											<div>Java &nbsp; JavaScript</div>
										</div>
										<div>
											<div class="repo-public">
												<div>Private</div>
											</div>
										</div>
									</div>
									<div class="repo-other-area">
										<div class="repo-other-img" onclick="openBtn(this);">
											<img src="resources/images/menu-dots.png" width="20px" height="20px">
										</div>
										<div class="repo-other">
											<div>
												<a id="repo-other-a">수정</a>
											</div>
											<div>
												<button type="button">초대</button>
											</div>
											<div>
												<button type="button">삭제</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 목록 끝 -->

						<!-- 목록 시작 -->
						<div class="repo-list-wrap">
							<div class="repo-list-area">
								<div class="repo-list-one">
									<div class="repo-list-one-area">
										<div>
											<img src="resources/images/repo-img.png" width="80px" height="80px">
										</div>
										<div class="repo-title-area">
											<a href="">
												<div>
													<h3>01_repository</h3>
												</div>
											</a>
											<div>에휴</div>
											<div>Java &nbsp; JavaScript</div>
										</div>
										<div>
											<div class="repo-public">
												<div>Private</div>
											</div>
										</div>
									</div>
									<div class="repo-other-area">
										<div class="repo-other-img" onclick="openBtn(this);">
											<img src="resources/images/menu-dots.png" width="20px" height="20px">
										</div>
										<div class="repo-other">
											<div>
												<a id="repo-other-a">수정</a>
											</div>
											<div>
												<button type="button">초대</button>
											</div>
											<div>
												<button type="button">삭제</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 목록 끝 -->

						<!-- 목록 시작 -->
						<div class="repo-list-wrap">
							<div class="repo-list-area">
								<div class="repo-list-one">
									<div class="repo-list-one-area">
										<div>
											<img src="resources/images/repo-img.png" width="80px" height="80px">
										</div>
										<div class="repo-title-area">
											<a href="">
												<div>
													<h3>01_repository</h3>
												</div>
											</a>
											<div>에휴</div>
											<div>Java &nbsp; JavaScript</div>
										</div>
										<div>
											<div class="repo-public">
												<div>Private</div>
											</div>
										</div>
									</div>
									<div class="repo-other-area">
										<div class="repo-other-img" onclick="openBtn(this);">
											<img src="resources/images/menu-dots.png" width="20px" height="20px">
										</div>
										<div class="repo-other">
											<div>
												<a id="repo-other-a">수정</a>
											</div>
											<div>
												<button type="button">초대</button>
											</div>
											<div>
												<button type="button">삭제</button>
											</div>
										</div>
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

	/* 점점점 누르면 div 보이게 */

	function openBtn(e){
		//console.log($(e).siblings());

		const other = $(e).siblings();

		if(other.css("display") === 'none'){
			other.css("display", "block");
		}else{
			other.css("display", "none");
		}

	}

</script>
	
			
<link href="resources/repository/repositoryList.css" rel="stylesheet">
</body>
</html>