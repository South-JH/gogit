<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.cont-select {
    position: relative;
    width: 200px;
}

.btn-select {
	width: 100%;
    padding: 13px 30px 13px 14px;
    font-size: 12px;
    line-height: 14px;
    background-color: #fff;
    border: 1px solid #C4C4C4;
    box-sizing: border-box;
    border-radius: 10px;
    cursor: pointer;
    text-align: left;
    /* 말줄임 */
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}

.btn-select:hover, .btn-select:focus {
    border: 1px solid #9B51E0;
    outline: 3px solid #F8E4FF;
}

.list-member {
    display: none;
    position: absolute;
    width: 100%;
    top: 49px;
    left: 0;
    border: 1px solid #C4C4C4;
    box-sizing: border-box;
    box-shadow: 4px 4px 14px rgba(0, 0, 0, 0.15);
    border-radius: 10px;
}

.btn-select.on {
    background: url("images/icon-Triangle-up.png") center right 14px no-repeat;
}

.btn-select.on+.list-member {
    display: block;
}

.list-member li {
    height: 40px;
    padding: 5px 8px;
    box-sizing: border-box;
}

.list-member li button {
    width: 100%;
    padding: 7px 10px;
    border: none;
    background-color: #fff;
    border-radius: 8px;
    cursor: pointer;
    text-align: left;
    /* 말줄임 */
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}

.list-member li button:hover, .list-member li button:focus {
    background-color: #F8E4FF;
}
</style>
</head>
<body>

	<jsp:include page="../common/sideBar.jsp" />
	
	<jsp:include page="../common/header.jsp" />

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
											<input type="radio" name="visibility" value="false">
										</div>
										<div>
											<img src="resources/images/book-open.png" width="20"
												height="20">
										</div>
										<div>Public</div>
									</div>
									<div class="create-repo-select-public">
										<div class="select-radio-input-div">
											<input type="radio" name="visibility" value="true">
										</div>
										<div>
											<img src="resources/images/lock.png" width="20" height="20">
										</div>
										<div>Private</div>
									</div>
								</div>

								<div class="create-repo-checkbox-area">
									<div>
										<input type="checkbox" name="readme" value="false">
									</div>
									<div>Add a README file</div>
								</div>

								<div class="create-repo-select-ignore">
									<div>Add .gitignore</div>
									<div>
										<article class="cont-select">
											<select id="gitignore-area">
											<%-- <c:forEach var="git" items="${gitignore}">
												<option>${ git }</option>
											</c:forEach> --%>
												<%-- <option>${ gitignore }</option> --%>
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
			console.log(${ gitignore });
			
			let gitignore = ${ gitignore };
			/* console.log(gitignore); */
			/* console.log(gitignore.c); */
			//console.log($("#gitignore-area"));
			let gitignoreArea = $("#gitignore-area");
			let value = "";
			
			for(let i in gitignore){
// 				value += "<li><button>" + i + "</button></li>";
 				value += "<option>" + i + "</option>";
				
				console.log(gitignore[i].contents);
			}
			
			gitignoreArea.html(value);
			/*
	        const btn = document.querySelector('.btn-select');
	        const list = document.querySelector('.git-list');
	        btn.addEventListener('click', () => {
	            btn.classList.toggle('on');
	        });
	        list.addEventListener('click', (event) => {
	            if (event.target.nodeName === "BUTTON") {
	                btn.innerText = event.target.innerText;
	                btn.classList.remove('on');
	            }
	        });
			*/
		})
	</script>
	
<link href="resources/repository/repositoryEnrollForm.css" rel="stylesheet">
</body>
</html>