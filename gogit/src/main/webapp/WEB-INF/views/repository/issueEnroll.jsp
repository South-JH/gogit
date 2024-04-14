<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.issue-enroll-wrap>div {
	background: white;
	border-radius: 7px;
	padding: 10px 30px;
	height: 710px;
}
</style>
</head>
<body>

   <jsp:include page="../common/sideBar.jsp" />
   
   <jsp:include page="../common/header.jsp" />
   
   <!-- summer note -->
	<script src="resources/summernote/summernote-lite.js"></script>
	<script src="resources/summernote/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="resources/summernote/summernote-lite.css">
   
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">

		<!--  Main wrapper -->
		<div class="body-wrapper">

			<div class="container-fluid">
				<!--  Row 1 -->
				<div class="row">

					<jsp:include page="repositoryTab.jsp" />

					<div class="issue-enroll-wrap">
						<div>
							<div>
								<div>
									<div>Add a title</div>
									<div>
										<input type="text">
									</div>
								</div>
							</div>
							<div>
								<div>
									<div>Add a description</div>
									<div>
										<div id="summernote"></div>
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
	$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	          
		});
	});
</script>
</body>
</html>