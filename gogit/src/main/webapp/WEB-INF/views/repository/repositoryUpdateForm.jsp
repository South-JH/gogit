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
	          		<div>
		          		<div class="detail-top-area">
		          			<div class="repo-detail-public-area">
			          			<div>
			          				<h4>${ repoName }</h4>
			          				<input type="hidden" value="${ owner }">
			          			</div>
			          			<div>
			          				<div>${ fileName }</div>
			          			</div>
			          		</div>
		          			<div>
		          				<button>Update</button>
		          			</div>
		          		</div>
			          	<div>
			          		<div class="repo-detail-left-area">
			          			<div id="editor"></div>
			          		</div>
			          	</div>
		          	</div>
		          	
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
	
	$(function(){
		$("#pull-request").attr("href", "list.pullrq?repoName=${ repoName }&visibility=${ visibility }&owner=${ owner }");
		$("#code").attr("href", "detail.rp?repoName=${ repoName }&visibility=${ visibility }&owner=${ owner }&permission=${ permission }");
		$("#issue").attr("href", "list.is?repoName=${ repoName }&visibility=${ visibility }&owner=${ owner }");
		
		const repoName = "${ repoName }";
		const owner = "${ owner }";
		const fileName = "${ fileName }";
		const filePath = "${ filePath }";
		const repoType = "${ repoType }";
		
		$.ajax({
			url:"updateContent.rp",
			data:{
				repoName:repoName,
				owner:owner,
				filePath:filePath,
				repoType:repoType
			},
			success:function(content){
				console.log(content);
			},
			error:function(){
				console.log("컨텐츠 수정 ajax 실패");
			}
		})
		
		
		
		
	})

	

	
</script>
</html>