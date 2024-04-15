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
										<div id="content"></div>
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
	const editor = new toastui.Editor({
	    el: document.querySelector('#content'), // 에디터를 적용할 요소 (컨테이너)
	    height: '500px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
	    initialEditType: 'markdown',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
	    initialValue: '내용을 입력해 주세요.',     // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
	    //previewStyle: 'vertical',                // 마크다운 프리뷰 스타일 (tab || vertical)
    	breaks: true
	});
</script>
</body>
</html>