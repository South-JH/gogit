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
	height: auto;
	box-shadow: 0 0 6px rgba(0,0,0,0.03), 0 0 6px rgba(0,0,0,0.03);
}

.detail-top-area {
	display: flex;
	align-items: center;
	justify-content: space-between;
	border-bottom: 2px solid #e6e6e6;
}

.detail-top-area button {
	border: 1px solid #e6e6e6;
	border-radius: 7px;
	background: #13deb9;
	color: white;
	width: 100px;
	height: 40px;
}

.fileName-area>input {
	border: none;
}
</style>
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
	          <!--  Row 1 -->
	          <div class="row">
	          
	          	<jsp:include page="repositoryTab.jsp" />
	          	
	          	<div class="repo-wrap">
	          		<form id="repoUpdateForm" action="updateDesc.rp" method="post">
		          		<div>
			          		<div class="detail-top-area">
			          			<div class="repo-detail-public-area">
				          			<div>
				          				<h4>${ repoName }</h4>
				          				<input type="hidden" name="repoName" value="${ repoName }">
				          				<input type="hidden" name="visibility" value="${ visibility }">
				          				<input type="hidden" name="owner" value="${ owner }">
				          				<input type="hidden" name="filePath" value="${ filePath }">
				          				<input type="hidden" name="permission" value="${ permission }">
				          				<input type="hidden" name="repoSha" value="${ repoSha }">
				          				<input type="hidden" name="content" id="repo-desc">
				          			</div>
				          			<div>
				          				<div class="fileName-area">
				          					<input type="text" name="fileName" value="${ fileName }">
				          				</div>
				          			</div>
				          		</div>
			          			<div>
			          				<button type="submit" onclick="submitBtn();">Update</button>
			          			</div>
			          		</div>
				          	<div>
				          		<div class="repo-detail-left-area">
				          			<div id="editor"></div>
				          		</div>
				          	</div>
			          	</div>
		          	</form>
		          </div>
	          
	          </div>
	        </div>
	     </div>
	 </div>
</body>
<!-- toast -->
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<!-- Editor's Style -->
 <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script>
	
	$(function(){
		
		$("#pull-request").attr("href", "list.pullrq?repoName=${ repoName }&visibility=${ visibility }&owner=${ owner }");
		$("#code").attr("href", "detail.rp?repoName=${ repoName }&visibility=${ visibility }&owner=${ owner }&permission=${ permission }");
		$("#issue").attr("href", "list.is?repoName=${ repoName }&visibility=${ visibility }&owner=${ owner }");
		
		const repoName = "${ repoName }";
		const owner = "${ owner }";
		const fileName = "${ fileName }";
		const filePath = "${ filePath }";
		
		
		$.ajax({
			url:"getContentDesc.rp",
			data:{
				repoName:repoName,
				owner:owner,
				filePath:filePath,
			},
			success:function(content){
				//console.log(content);
				editor.setMarkdown(content);
			},
			error:function(){
				editor.setMarkdown('내용을 불러오는데 실패했습니다.');
			}
		})
		
	})
	
	const editor = new toastui.Editor({
	    el: document.querySelector('#editor'), // 에디터를 적용할 요소 (컨테이너)
	    height: '400px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
	    initialEditType: 'markdown',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
	    breaks: true,
	    toolbarItems: [
	          ['heading', 'bold', 'italic', 'quote', 'code', 'link'],
	          ['ol', 'ul', 'task'],
	          ['image'],
	    ]
	});

	editor.on('change', function() {
	let contents = editor.getMarkdown(); // 에디터 내용 가져오기
	console.log(contents); // 콘솔에 내용 출력
		
	});
	
	function submitBtn(){
		let contents = editor.getMarkdown();
		$("#repo-desc").val(contents);
		$("#repoUpdateForm").submit();
	}
	
</script>
</html>