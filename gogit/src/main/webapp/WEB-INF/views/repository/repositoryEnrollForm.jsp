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
	
	<link href="https://gcore.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
	<script src="https://gcore.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">

		<!--  Main wrapper -->
		<div class="body-wrapper">

			<div class="container-fluid">
				<!--  Row 1 -->
				<div class="row">

					<div class="repo-wrap">
						<div class="repo-wrap-title">
							<div>
								<h2>New &nbsp; Repository</h2>
							</div>
						</div>
						
						<form action="create.rp">
						<div class="repo-wrap-cotent">
							<div class="bottom-area">
								<div class="repo-name-desc">
									<div class="create-repo-name-area">
										<div class="create-repo-name">
											<div>
												<h5>Repository name</h5>
											</div>
											<span><h5>*</h5></span>
										</div>
										<div>
											<div class="create-repo-name-input">
												<input type="text" id="repo-name-input" name="repoName">
											</div>
											<div>
												사용할 레파지토리의 이름을 입력해주세요
											</div>
										</div>
									</div>
									<div class="create-repo-name-area">
										<div class="create-repo-desc">
											<h5>Description</h5>
										</div>
										<div class="create-repo-name-input">
											<input type="text" name="repoDesc">
										</div>
									</div>
								</div>

								<div class="create-repo-select-public-area">
									<div class="create-repo-select-public">
										<div class="select-radio-input-div">
											<input type="radio" name="visibility" value="false" id="radio1" required>
										</div>
										<div>
											<img src="resources/images/book-open.png" width="20" height="20">
										</div>
										<div><label for="radio1">Public</label></div>
									</div>
									<div class="create-repo-select-public">
										<div class="select-radio-input-div">
											<input type="radio" name="visibility" value="true" id="radio2" required>
										</div>
										<div>
											<img src="resources/images/lock.png" width="20" height="20">
										</div>
										<div><label for="radio2">Private</label></div>
									</div>
								</div>

								<div class="create-repo-checkbox-area">
									<div>
										<input type="checkbox" name="readme" value="true">
									</div>
									<div>Add a README file</div>
								</div>

								<div class="create-repo-select-ignore">
									<div>Add .gitignore</div>
									<div>
										<article class="cont-select">
											<select id="gitignore-area" name="git" class="select" multiple="multiple">
											
											</select>
										</article>
									</div>
								</div>

								<div class="create-repo-btn-area">
									<div>
										<button type="submit">CREATE</button>
									</div>
								</div>
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$(function(){
			// 입력 input 클릭하면 input에 아무것도 작성이 안되어있을때 안내 메세지가 보이고 작성이 되어있다면 안내 메세지 보이지 않음
			$("#repo-name-input").keyup(function(){
				if($("#repo-name-input").val() === ''){
					$(".create-repo-name-input+div").css("display", "block");
				}
			})
			// 입력 input에서 포커스가 해제되면 input에 작성이 되어있다면 안내 메세지가 사라지고 작성 되어있지 않다면 안내 메세지 사라지지 않음
			$("#repo-name-input").keydown(function(){
				if($("#repo-name-input").val() != ''){
					$(".create-repo-name-input+div").css("display", "none");		
				}
				
			})
		})
		
		$(document).ready(function(){
			
			let gitArr = [];
			let gitName = ${ gitName };
			console.log(${ gitName });
			
			for(let key in gitName){
				let value = gitName[key];
				gitArr.push(value);
				
			}
			
			//console.log("array confirm");
			//console.log(gitArr);
			let nameValue = "";
			
			console.log("gitArr .name");
			let count = 0;
			console.log(gitArr.length);
			
			for(let i=0; i<gitArr.length; i++){
				
				if(gitArr[i].name != "KonyVisualizer" && gitArr[i].name != "Django" ) {
					count++;
					nameValue += "<option value='" + gitArr[i].contents + "'>" + gitArr[i].name + "</option>";
					console.log(gitArr[i].name);
					
				}
			}
			console.log(count);
			
			//console.log(nameValue);
			let gitignore = $("#gitignore-area");
			gitignore.html(nameValue);
			
			$('#gitignore-area').select2();
		})
		
	</script>
	
<link href="resources/repository/repositoryEnrollForm.css" rel="stylesheet">
</body>
</html>