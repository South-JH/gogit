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
	width: 80%;
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

.select-area-name {
	 display: flex;
}

.select-area-name input {
	 vertical-align: middle;
	 outline: 0;
}

.name-select-btn, .name-select-btn>div {
	 display: flex; 
	 align-items: center;
}

.name-select-btn img {
	border-radius: 100px;
}

.labelcolor {
	width: 15px;
	height: 15px;
	border-radius: 100px;
	border: 1px solid #e6e6e6;
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
							<form action="create.is" method="post" id="issueForm">
							<input type="hidden" name="repoName" value="${ repoName }">
							<input type="hidden" name="owner" value="${ owner }">
							<input type="hidden" name="body" id="is-desc">
								<div class="issue-enroll-top-area">
									<div class="issue-create-leftbar">
										<div class="leftbar-issue-title">
											<div>
												<div><h5>Add a title</h5></div>
												<div class="issue-create-title-input">
													<input type="text" name="title">
												</div>
											</div>
										</div>
										<div>
											<div>
												<div><h5>Add a description</h5></div>
												<div>
													<div id="editor">
													
													</div>
													
													<div id="contents">
													
													</div>
												</div>
											</div>
										</div>
									</div>
									
									<div class="issue-create-rightbar">
										<div>
											<div>
												<div>
													<div class="issue-create-select-area" id="1">
														<div>Assignees</div>
														<div><i class="ti ti-settings"></i></div>
													</div>
													<div>
														<c:forEach var="a" items="${ aList }" varStatus="as">
															<div>
																<label for="asscheck${ as.index }" class="select-area-name">
																	<div>
																		<div>
																			<input type="checkbox" id="asscheck${ as.index }" name="assignees" class="asscheck" value="${ a.assignees }">
																		</div>
																	</div>
																	<div class="name-select-btn">
																		<div>
																			<img src="${ a.assigneesAvatar }" width="20" height="20">
																		</div>
																		<div>${ a.assignees }</div>
																	</div>
																</label>
															</div>
														</c:forEach>
													</div>
												</div>
											</div>
											<div>
												<div>
													<div class="issue-create-select-area" id="3">
														<div>Lables</div>
														<div><i class="ti ti-settings"></i></div>
													</div>
													<div>
														<c:forEach var="l" items="${ lList }" varStatus="la">
															<div>
																<label for="lacheck${ la.index }" class="select-area-name">
																	<div>
																		<div>
																			<input type="checkbox" id="lacheck${ la.index }" name="label" class="lacheck" value="${ l.laName }">
																		</div>
																	</div>
																	<div class="name-select-btn">
																		<div>
																			<div class="labelcolor" style="background-color: #${ l.laColor };"></div>
																		</div>
																		<div>${ l.laName }</div>
																	</div>
																</label>
															</div>
														</c:forEach>
													</div>
												</div>
											</div>
											<div>
												<div>
													<div class="issue-create-select-area" id="5">
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
										<button type="submit" onclick="submitBtn();">CREATE</button>
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
		$("#code").attr("href", "detail.rp?repoName=${ repoName }&visibility=${ visibility }&owner=${ owner }&permission=${ permission }");
		$("#issue").attr("href", "list.is?repoName=${ repoName }&visibility=${ visibility }&owner=${ owner }");
		
	})

	const editor = new toastui.Editor({
	    el: document.querySelector('#editor'), // 에디터를 적용할 요소 (컨테이너)
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
	
	editor.on('change', function() {
		let contents = editor.getMarkdown(); // 에디터 내용 가져오기
		//document.querySelector('#contents').innerText = contents; // 화면에 보이는 div에 내용 업데이트
		console.log(contents); // 콘솔에 내용 출력
		
	});
	
	function submitBtn(){
		let contents = editor.getMarkdown();
		$("#is-desc").val(contents);
		$("#issueForm").submit();
	}
	
</script>
</body>
</html>