<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		#create-pull-request-h2{
			margin-top: 20px;
			margin-bottom: 20px;
		}

		#select-branch{
			display: flex;
			margin-top: 50px;
		}

		#select-branch>div{
			border: 1px solid #e6e6e6;
			border-radius: 5px;
			padding: 5px;
		}

		#base-branch-select, #compare-branch-select{
			border: none;
		}

		#pull-request-input-area{
			border: 1px solid #e6e6e6;
			border-radius: 10px;
			margin-top: 50px;
			margin-bottom: 20px;
			padding: 25px;
		}

		#pull-request-input-area>table,
		#pull-request-input-area>table input,
		#pull-request-input-area>table textarea{
			width: 100%;
		}

		#pull-request-input-area>table input,
		#pull-request-input-area>table textarea{
			margin-top: 5px;
			margin-bottom: 5px;
			background-color: white;
		}

		#create-pullRequest-btn{
			display: flex;
			margin-top: 30px;
			margin-bottom: 20px;
		}

		#create-pullRequest-btn>button{
			margin: auto;
			background-color: #02384b;
			color: white;
		}
		
		#content .placeholder {
			background-color: white;
		}
	</style>
</head>
<body>
	<jsp:include page="../common/sideBar.jsp"/>
	
	<jsp:include page="../common/header.jsp"/>
	
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed">
	
		<!--  Main wrapper -->
		<div class="body-wrapper">
		
			<div class="container-fluid">
			
				<!--  Row 1 -->
				<div class="row">
					<h2 id="create-pull-request-h2">Create Pull Request</h2>

					<form action="create.pullrq" method="post">
						<input type="hidden" name="repoOwner" value="${ pullrq.repoOwner }">
						<input type="hidden" name="repoName" value="${ pullrq.repoName }">
						<input type="hidden" name="repoVisibility" value="${ pullrq.repoVisibility }">
						<input type="hidden" name="pullContent">
						<div id="select-branch">
							<div id="base-branch">
								base:
								<select name="baseBranch" id="base-branch-select">
									<c:forEach var="b" items="${ list }">
										<option>${ b.name }</option>
									</c:forEach>
								</select>
							</div>

							&nbsp;
							<img width="24" height="24" src="https://img.icons8.com/material-rounded/24/left.png" alt="left"/>
							&nbsp;

							<div id="compare-branch">
								compare:
								<select name="compareBranch" id="compare-branch-select">
									<c:forEach var="b" items="${ list }">
										<option>${ b.name }</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div id="pull-request-input-area">
							<table>
								<tr>
									<th>Title</th>
									<td><input type="text" class="form-control" name="pullTitle" placeholder="pull request title"></td>
								</tr>
								<tr>
									<th width="80">Content</th>
									<td>
										<div class="mt-4 mb-4" id="content"></div>
									</td>
								</tr>
								<tr>
									<th>Assignees</th>
									<td>
										<div class="mb-4">
											<select class="form-select" name="pullManager" multiple>
												<c:forEach var="collaborator" items="${ collaboratorList }">
													<option>${ collaborator.collaborator }</option>
												</c:forEach>
											</select>
										</div>
									</td>
								</tr>
								<tr>
									<th>Reviewers</th>
									<td>
										<select class="form-select" name="pullReviewer" multiple>
											<c:forEach var="collaborator" items="${ collaboratorList }">
												<c:if test="${ loginUser.gitNick ne collaborator.collaborator }">
													<option>${ collaborator.collaborator }</option>
												</c:if>
											</c:forEach>
										</select>
									</td>
								</tr>
							</table>
						</div>

						<div id="create-pullRequest-btn">
							<button type="submit" class="btn" onclick="return validate();">Pull request 생성</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link href="https://gcore.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://gcore.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>
	$("select[name=pullManager]").select2();
	$("select[name=pullReviewer]").select2();

	const editor = new toastui.Editor({
		el: document.querySelector('#content'), // 에디터를 적용할 요소 (컨테이너)
		height: '300px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
		previewStyle: 'tab',
		initialValue: '',
		placeholder: 'pull request body'
	});
	
	function validate() {
		if($("input[name=pullTitle]").val() == "" || editor.getMarkdown() == "") {
			alertify.alert("필수 입력 항목(title, body)을 입력해주세요.");
			return false;
		}
		
		$("input[name=pullContent]").val(editor.getHTML());
	}
</script>
</html>