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
/* 	padding: 20px 30px; */
	height: 710px;
}

.issue-enroll-top-area {
	display: flex;
	justify-content: space-between;
}

/* 왼쪽 컨텐츠 */
.issue-create-leftbar {
	width: 75%;
}

.issue-create-title-input {
	border: 1px solid #dadde6;
	border-radius: 6px;
	width: 817px;
	display: flex;
	align-items: center;
	padding: 5px 10px;
}

.issue-create-title-input>input {
	border: none;
	outline: none;
	width: 100%;
}

/* 오른쪽 컨텐츠 */
.issue-create-rightbar {
	width: 20%;
}

.leftbar-issue-title {
	padding-bottom: 20px;
}

.issue-create-select-area {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding-bottom: 10px;
}

.issue-create-select-area i {
	font-size: 18px;
	vertical-align: middle;
}

.issue-create-select-area div {
	font-weight: 600;
}

.issue-create-rightbar>div>div {
	padding: 15px 0;
	border-bottom: 1px solid #dadde6;
}

.issue-create-btn-area {
	position: relative;
}

.submit-btn>button {
	border: 1px solid #dadde6;
	border-radius: 8px;
	background: rgb(58, 153, 15);
	color: white;
	width: 100px;
	height: 40px;
	font-weight: 700;
	position: absolute;
	right: 286px;
    top: 18px;
}
</style>
</head>
<body>

   	<jsp:include page="../common/sideBar.jsp" />
   
   	<jsp:include page="../common/header.jsp" />
   
   	<!-- toast -->
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<!-- Editor's Style -->
  	<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
   
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">

		<!--  Main wrapper -->
		<div class="body-wrapper">

			<div class="container-fluid">
				<!--  Row 1 -->
				<div class="row">

					<jsp:include page="../repository/repositoryTab.jsp" />

					<div class="issue-enroll-wrap">
						<div>
							<form action="">
								<div class="issue-enroll-top-area">
									<div class="issue-create-leftbar">
										<div class="leftbar-issue-title">
											<div>
												<div><h5>Add a title</h5></div>
												<div class="issue-create-title-input">
													<input type="text">
												</div>
											</div>
										</div>
										<div>
											<div>
												<div><h5>Add a description</h5></div>
												<div>
													<div id="content"></div>
												</div>
											</div>
										</div>
									</div>
									
									<div class="issue-create-rightbar">
										<div>
											<div>
												<div>
													<div class="issue-create-select-area">
														<div>Assignees</div>
														<div><i class="ti ti-settings"></i></div>
													</div>
													<div>No One</div>
												</div>
											</div>
											<div>
												<div>
													<div class="issue-create-select-area">
														<div>Lables</div>
														<div><i class="ti ti-settings"></i></div>
													</div>
													<div>None yet</div>
												</div>
											</div>
											<div>
												<div>
													<div class="issue-create-select-area">
														<div>Milestone</div>
														<div><i class="ti ti-settings"></i></div>
													</div>
													<div>No Milestone</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="issue-create-btn-area">
									<div class="submit-btn">
										<button type="submit">CREATE</button>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

<script>

	$(function(){
		$("#pull-request").attr("href", "list.pullrq?repoName=${ repoName }&visibility=${ visibility }&owner=${ owner }");
		$("#code").attr("href", "detail.rp?repoName=${ repoName }&visibility=${ visibility }&owner=${ owner }");
		$("#issue").attr("href", "list.is?repoName=${ repoName }&visibility=${ visibility }&owner=${ owner }");
	})

	const editor = new toastui.Editor({
	    el: document.querySelector('#content'), // 에디터를 적용할 요소 (컨테이너)
	    height: '400px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
	    initialEditType: 'markdown',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
	    //initialValue: '내용을 입력해주세요.',   // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
	    //previewStyle: 'vertical',             // 마크다운 프리뷰 스타일 (tab || vertical)
	    breaks: true,
	    toolbarItems: [
	          ['heading', 'bold', 'italic', 'quote', 'code', 'link'],
	          ['ol', 'ul', 'task'],
	          ['image'],
        ]
	});
</script>
</body>
</html>