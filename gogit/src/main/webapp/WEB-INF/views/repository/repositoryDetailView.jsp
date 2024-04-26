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
	border-bottom: 2px solid #e6e6e6;
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

/* 왼쪽컨텐츠 사이즈 */
.repo-detail-left-area {
	padding: 20px 0;
	width: 90%;
}

.branch-area-btn {
	border: 1px solid #e6e6e6;
	border-radius: 6px;
	background: #f8f8f8;
/* 	width: 100px; */
	height: 35px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.branch-area-btn:hover {
	background: #f1f1f1;
}

.branch-area-btn>div {
	display: flex;
	align-items: center;
	justify-content: space-around;
}

.branch-area-btn i {
	vertical-align: middle;
	font-size: 16px;
}

.branch-area-btn>div:first-child {
	width: auto;
	padding: 0 10px;
}

.branch-area-btn>div:first-child>* {
	padding: 0 2px;
}

.branch-area-btn>div:last-child {
	padding: 0 10px;
}

.top-content-branch-area {
	display: flex;
	justify-content: space-between;
	width: auto;
}

.top-content-branch-area>div:nth-child(2)>div {
	display: flex;
	align-items: center;
	height: 35px;
}

.top-content-branch-area>div:nth-child(2)>div>* {
	padding: 0 2px;
}

.left-area-top-content {
	display: flex;
	justify-content: space-between;
	padding-bottom: 20px;
}

.top-content-search-area {
	display: flex;
	justify-content: space-between;
	width: 410px;
}

.search-area-left {
	display: flex;
	align-items: center;
	border: 1px solid #e6e6e6;
	border-radius: 6px;
	width: 300px;
	height: 35px;
	padding: 5px;
}

.search-area-left>div:first-child {
	width: 10%;
	display: flex;
	justify-content: center;
    font-size: 20px;
}

.search-area-left>div:last-child {
	width: 90%;
}

.search-area-left input {
	width: 100%;
	border: none;
	outline: none;
	padding: 0 5px;
}

.search-area-right {
	display: flex;
	align-items: center;
}

.search-area-right a {
	color: var(--bs-body-color);
	text-decoration: none;
}

.bottom-content-commit-desc {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.commit-desc-title-left {
	display: flex;
	align-items: center;
}

.commit-desc-title-left>div {
	padding-right: 8px;
}

.commit-desc-title-right {
	display: flex;
	align-items: center;
	justify-content: space-between;
	width: 170px;
}

.commit-count>a {
	display: flex;
	text-decoration: none;
	color: var(--bs-body-color);
}

.repo-table {
	border-collapse: separate;
    border-spacing: 0;
	border: 1px solid #e6e6e6;
	border-radius: 6px;
	width: 100%;
}

thead {
	background-color: #f8f8f8;
	height: 40px;
}

.repo-table td, th {
	padding: 10px 15px;
}

.repo-table td {
	height: 42px;
}

.ti-clock-code {
	vertical-align: middle;
	font-size: 16px;
	padding: 5px;
}

.ti-git-branch {
	font-size: 16px;
}

/* 오른쪽 detail */
.repo-detail-public-area+div {
	display: flex;
}

.repo-detail-right-area {
	width: 20%;
	padding-left: 40px;
}

.right-area-contributors {
	display: flex;
	padding: 10px 0px;
}

.contributors-count {
	background: #eeeeee;
	border-radius: 50px;
	width: 25px;
	height: 25px;
	padding: 5px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.right-area-contributors+div>div {
	display: flex;
}

.repo-detail-right-area>div>div {
	border-bottom: 1px solid #e6e6e6;
	padding: 15px 50px 15px 0px;
}

.contributors-member {
	padding: 5px 0;
}

.contributors-member img{
	border-radius: 50px;
}

.contributors-member>div{
	padding: 0 5px;
}

.branch-area-div {
	position: relative;
	width: auto;
}

.repo-table>tbody>tr>td {
	border-top: 1px solid #e6e6e6;
}

.switch-branch-area {
	border: 1px solid #e6e6e6;
	border-radius: 10px;
	background: white;
	position: absolute;
	top: 40px;
	display: none;
	width: 220px;
	box-shadow: 0 0 6px rgba(0,0,0,0.03), 0 0 6px rgba(0,0,0,0.03);
}

.switch-branch-area>div:first-child {
	border-bottom: 1px solid #e6e6e6;
	padding: 10px 15px;
}

.switch-branch-title {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding-bottom: 10px;
}

.switch-branch-search {
	border: 1px solid #e6e6e6;
	border-radius: 6px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 5px;
}

.switch-branch-search input {
	border: none;
	outline: none;
}

.switch-branch-area>div:nth-child(2) {
	padding: 10px 0;
}

.switch-branch-select-area {
	border-bottom: 1px solid #e6e6e6;
}

.switch-branch-select-area>div>div {
	padding: 0 10px;
}

.switch-branch-select-area>div>div>div {
	border-top: 1px solid #e6e6e6;
	border-left: 1px solid #e6e6e6;
	border-right: 1px solid #e6e6e6;
	background-color: white;
	width: 80px;
	padding: 5px;
	border-radius: 6px 6px 0 0;
	text-align: center;
}

.branch-area {
	padding: 0 15px;
}

.branch-area>div {
	height: 35px;
	padding: 0 5px;
	border-radius: 6px;
	cursor: pointer;
	display: flex;
	align-items: center;
	border-bottom: 1px solid #eeeeee;
}

.branch-area>div:hover {
	background: #f9f9f9;
}

.repoTitle {
	cursor: pointer;
	display: flex;
	align-items: center;
}

.repoTitle>i {
	vertical-align: middle;
	padding-right: 4px;
	padding-top: 4px;
	font-size: 17px;
}

.ti-folder {
	filled: #3385ff;
}

.repo-table>tbody>tr:hover {
	background-color: #eee;
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
		          		<div class="repo-detail-public-area">
		          			<div>
		          				<h4>${ repoName }</h4>
		          				<input type="hidden" value="${ owner }">
		          			</div>
		          			<div class="repo-detail-public">
		          				<div>${ visibility }</div>
		          			</div>
		          		</div>
		          		<div>
			          		<div class="repo-detail-left-area">
			          			<div>
			          				<div class="left-area-top-content">
			          					<div class="top-content-branch-area">
				          					<div class="branch-area-div">
				          						<button type="button" class="branch-area-btn">
				          							<div>
					          							<i class="ti ti-git-branch"></i>
					          							<div><b class="bold-title">main</b></div>
				          							</div>
				          							<div>
				          								<i class="ti ti-chevron-down"></i>
				          							</div>
				          						</button>
				          						<div>
				          							<div class="switch-branch-area">
				          								<div>
				          									<div class="switch-branch-title">
				          										<div><b>Switch branches</b></div>
				          										<div><i class="ti ti-x"></i></div>
				          									</div>
				          									<div>
				          										<div class="switch-branch-search">
				          											<div><i class="ti ti-search"></i></div>
				          											<div>
				          												<input type="text">
				          											</div>
				          										</div>
				          									</div>
				          								</div>
				          								<div>
				          									<div class="branch-area">
				          									</div>
				          								</div>
				          							</div>
				          						</div>
				          					</div>
				          					<div>
				          						<div>
				          							<i class="ti ti-git-branch"></i>
				          							<div><b class="branch-count"></b></div>
				          							<div><b>Branches</b></div>
				          						</div>
				          					</div>
				          				</div>
			          					<div class="top-content-search-area">
			          						<div class="search-area-left">
			          							<div>
			          								<i class="ti ti-search"></i>
			          							</div>
			          							<div>
			          								<input type="text" maxlength="30">
			          							</div>
			          						</div>
											<div class="search-area-right">
												<div>
													<i class="ti ti-clock-code"></i>
												</div>
												<div>
													<a href="view.cm?repoName=${ repoName }&visibility=${ visibility }&owner=${ owner }">
														<b>61 Commits</b>
													</a>	
												</div>
											</div>
			          					</div>
			          				</div>
			          				<div class="left-area-bottom-content">
										<div>
											<table class="repo-table">
												<thead>
													<tr>
														<th width="330">NAME</th>
														<th>RECENT COMMIT</th>
														<th width="130">AUTHOR</th>
														<th width="130">DATE</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="rp" items="${ rpList }">
														<tr>
															<td onclick="subContent(this);" class="repoTitle">
															<input class="hidden-repo-type" type="hidden" value="${ rp.type }">
																<c:choose>
																	<c:when test="${ rp.type eq 'file' }">
																		<i class="ti ti-file"></i>
																	</c:when>
																	<c:otherwise>
																		<i class="ti ti-folder"></i>
																	</c:otherwise>
																</c:choose>
																<div>${ rp.contentName }</div>
																<input type="hidden" value="${ rp.contentName }" id="rpContentName">
																<input type="hidden" value="${ rp.path }" id="rpPath">
															</td>
															<td>Update RepositoryController.java</td>
															<td><img src="resources/images/repo-img.png" width="20" height="20">crong9105</td>
															<td>2024-04-14</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
			          				</div>
			          				
		          			</div>
		          		</div>
		          		
		          		<div class="repo-detail-right-area">
		          			<div>
		          				<div>
		          					<div class="right-area-contributors">
		          						<div>
		          							<b>Contributors</b>
		          						</div>
		          						<div class="contributors-count">
		          							<b>${ list.size() }</b>
		          						</div>
		          					</div>
		          					<div>
		          						<c:forEach var="r" items="${ list }">
			          						<div class="contributors-member">
			          							<div>
			          								<img src="${ r.avatar }" width="20" height="20">
			          							</div>
			          							<div>${ r.collaborator }</div>
			          						</div>
		          						</c:forEach>
		          					</div>
		          				</div>
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
	$(function(){
		$("#pull-request").attr("href", "list.pullrq?repoName=${ repoName }&visibility=${ visibility }&owner=${ owner }");
		$("#code").attr("href", "detail.rp?repoName=${ repoName }&visibility=${ visibility }&owner=${ owner }&permission=${ permission }");
		$("#issue").attr("href", "list.is?repoName=${ repoName }&visibility=${ visibility }&owner=${ owner }");
		
	    $(".branch-area-btn").click(function(event){
	        event.stopPropagation();
	        
	        if($(".switch-branch-area").css("display") === 'none'){
	            $(".switch-branch-area").css("display", "block");
	        }else{
	            $(".switch-branch-area").css("display", "none");
	        }
	    });
	    
	    $(".switch-branch-area").click(function(event){
	        event.stopPropagation();
	    });
	
	    $(document).click(function(event){
	        if($(".switch-branch-area").css("display") === 'block'){
	            $(".switch-branch-area").css("display", "none");
	        }
	    });
	});
	
	const repoName = $(".repo-detail-public-area h4").text();
	const owner = $(".repo-detail-public-area input").val();
	
	function subContent(e){
		//console.log($(e).children("div").text());
		
		const fileName = $(e).children("#rpContentName").val();
		const filePath = $(e).children("#rpPath").val();
		const newFileName = $(e).children("#rpPath").val().split("/").slice(-2, -1)[0];
		const newFilePath = $(e).children("#rpPath").val().split("/").slice(0, -1).join("/");
		let repoType = $(e).children(".hidden-repo-type").val();
		console.log(repoType);
		
		/*
		// 새로운 파일 이름은 상위 폴더의 이름으로 설정
		const parentFolderName = filePath.split("/").slice(-2, -1)[0]; // 상위 폴더의 이름
		const newFileName = parentFolderName;
		
		// 새로운 파일 경로는 현재 파일 경로에서 마지막 두 단계의 폴더를 제거한 것
		const folders = filePath.split("/");
		const newFilePath = folders.slice(0, -1).join("/");
		*/
		
		console.log("파일이름", fileName);
		console.log("파일경로", filePath);
		console.log("새로운파일이름:", newFileName);
		console.log("새로운파일경로:", newFilePath);
		
		$.ajax({
			url:"selectContent.rp",
			data:{
				repoName:repoName,
				path:filePath,
				owner:owner,
				repoType:repoType
			},
			success:function(result){
				
				console.log(typeof result);
				//console.log(result.rpList);
				
				let hvalue = "";
				let value = "";
				
				if(typeof result == "string"){
					
				    hvalue += "<thead>"
			           		+ "<tr>"
			            	+ "<th colspan=\"4\">CODE</th>"
			            	+ "</tr>"
			            	+ "</thead>";
			            	
					if(filePath != ""){
						value += "<tr>"
							   + "<td onclick=\"subContent(this);\" class=\"repoTitle\">"
							   + "<i class=\"ti ti-folder\"></i>"
							   + "<div><b>" + "..." + "</b></div>"
							   + "<input type=\"hidden\" value=\"" + newFileName + "\" id=\"rpContentName\">"
							   + "<input type=\"hidden\" value=\"" + newFilePath + "\" id=\"rpPath\">"
							   + "</td>"
							   + "<td colspan=\"3\"></td>"
							   + "</tr>";
					}
			            	
					value += "<tr>"
					 	   + "<td colspan=\"4\">" + result + "</td>"
						   + "</tr>";
					
				}else {
				
					let list = result.rpList;
					$(".repo-table").text("");
					//console.log(list);
					
					let hasContentDesc = list.some(item => item.contentDesc !== undefined);
					
					if (hasContentDesc) {
					    // 하나라도 contentDesc가 정의된 경우
					    hvalue += "<thead>"
					            + "<tr>"
					            + "<th colspan=\"4\">CODE</th>"
					            + "</tr>"
					            + "</thead>";
					} else {
					    // 모든 항목의 contentDesc가 undefined인 경우
					    hvalue += "<thead>"
					            + "<tr>"
					            + "<th width=\"330\">NAME</th>"
					            + "<th>RECENT COMMIT</th>"
					            + "<th width=\"130\">AUTHOR</th>"
					            + "<th width=\"130\">DATE</th>"
					            + "</tr>"
					            + "</thead>";
					}
					

					if(filePath != ""){
						value += "<tr>"
							   + "<td onclick=\"subContent(this);\" class=\"repoTitle\">"
							   + "<i class=\"ti ti-folder\"></i>"
							   + "<div><b>" + "..." + "</b></div>"
							   + "<input type=\"hidden\" value=\"" + newFileName + "\" id=\"rpContentName\">"
							   + "<input type=\"hidden\" value=\"" + newFilePath + "\" id=\"rpPath\">"
							   + "</td>"
							   + "<td colspan=\"3\"></td>"
							   + "</tr>";
					}
					
					for(let i in list){
						
						if(list[i].contentDesc === undefined){
							// contentDesc가 undefined인 경우
							value += "<tr>"
								   + "<td onclick=\"subContent(this);\" class=\"repoTitle\">"
								   + "<input class=\"hidden-repo-type\" type=\"hidden\" value=\"" + list[i].type + "\">"
								   
								    if(list[i].type === "file"){
								        value += "<i class=\"ti ti-file\"></i>"
								    } else{
									    value += "<i class=\"ti ti-folder\"></i>"
								    }
								   
							value += "<div>" + list[i].contentName + "</div>"
								   + "<input type=\"hidden\" value=\"" + list[i].contentName + "\" id=\"rpContentName\">"
								   + "<input type=\"hidden\" value=\"" + list[i].path + "\" id=\"rpPath\">"
								   + "</td>"
								   + "<td>" + "나중에여기다가 뭘쓰지...?" + "</td>"
								   + "<td>" + "<img src=\"" + "resources/images/repo-img.png" + "\" width=\"20\" height=\"20\">" + "작성자이름" + "</td>"
								   + "<td>" + "2024-04-20" + "</td>"
								   + "</tr>";
								   
						} else {
							// contentDesc가 undefined인 경우 == 내용이 있는 경우
							value += "<tr>"
							 	   + "<td colspan=\"4\">" + list[i].contentDesc + "</td>"
								   + "</tr>";
								
						}
						
					}
				}
				
				let bvalue = "<tbody>" + value + "</tbody>";
				
				$(".repo-table").html(hvalue+bvalue);
				
			},
			error:function(){
				console.log("subContent api 조회 실패");
			}
		})
	}
	
	$(function(){
		
		$.ajax({
			url:"listBranches.rp",
			data:{
				repoName:repoName,
				owner:owner
			},
			success:function(result){
				
				$(".branch-area").text("");
				$(".branch-count").text("");
				let value = "";
				
				for(let i in result){
					//console.log(result[i].branchName);
					value += "<div onclick=\"switchBranch(this)\">" + result[i].branchName + "</div>";
				}
				
				$(".branch-area").html(value);
				$(".branch-count").text(result.length);
				
			},
			error:function(){
				console.log("브랜치 조회 실패");
			}
		})
	})
	
	function switchBranch(e){
		
		console.log($(e).text());
		let branch = $(e).text();
		$(".switch-branch-area").css("display", "none");
		$(".bold-title").text($(e).text());
		
		$.ajax({
			url:"brnachContent.rp",
			data:{
				repoName:repoName,
				owner:owner,
				branch:branch
			},
			success:function(list){
				
				console.log(list);
				$(".repo-table>tbody").text("")
				let value = "";
				
				for(let i in list){
					value += "<tr>"
						   + "<td onclick=\"branchSubContent(this);\" class=\"repoTitle\">"
						   + "<input class=\"hidden-repo-type\" type=\"hidden\" value=\"" + list[i].type + "\">"
					
						    if(list[i].type === "file"){
						        value += "<i class=\"ti ti-file\"></i>"
						    } else{
							    value += "<i class=\"ti ti-folder\"></i>"
						    }
						   
					value += "<div>" + list[i].contentName + "</div>"
						   + "<input type=\"hidden\" value=\"" + list[i].contentName + "\" id=\"rpContentName\">"
						   + "<input type=\"hidden\" value=\"" + list[i].path + "\" id=\"rpPath\">"
						   + "</td>"
						   + "<td>" + "나중에여기다가 뭘쓰지...?" + "</td>"
						   + "<td>" + "<img src=\"" + "resources/images/repo-img.png" + "\" width=\"20\" height=\"20\">" + "작성자이름" + "</td>"
						   + "<td>" + "2024-04-20" + "</td>"
						   + "</tr>";
				}
				
				$(".repo-table>tbody").html(value);
				
			},
			error:function(){
				console.log("브랜치 컨텐츠 조회 ajax 실패");
			}
		})
	}
	
	let branch = $(".bold-title").text();
	
	function branchSubContent(e){
		
		const fileName = $(e).children("#rpContentName").val();
		const filePath = $(e).children("#rpPath").val();
		const newFileName = $(e).children("#rpPath").val().split("/").slice(-2, -1)[0];
		const newFilePath = $(e).children("#rpPath").val().split("/").slice(0, -1).join("/");
		let repoType = $(e).children(".hidden-repo-type").val();
		
		console.log("파일이름", fileName);
		console.log("파일경로", filePath);
		console.log("새로운파일이름:", newFileName);
		console.log("새로운파일경로:", newFilePath);
		console.log("브랜치:", branch)
		/*
		$.ajax({
			url:"selectContent.rp",
			data:{
				repoName:repoName,
				path:filePath,
				owner:owner,
				repoType:repoType
			},
			success:function(result){
				
				console.log(typeof result);
				//console.log(result.rpList);
				
				let hvalue = "";
				let value = "";
				
				if(typeof result == "string"){
					
				    hvalue += "<thead>"
			           		+ "<tr>"
			            	+ "<th colspan=\"4\">CODE</th>"
			            	+ "</tr>"
			            	+ "</thead>";
			            	
					if(filePath != ""){
						value += "<tr>"
							   + "<td onclick=\"subContent(this);\" class=\"repoTitle\">"
							   + "<i class=\"ti ti-folder\"></i>"
							   + "<div><b>" + "..." + "</b></div>"
							   + "<input type=\"hidden\" value=\"" + newFileName + "\" id=\"rpContentName\">"
							   + "<input type=\"hidden\" value=\"" + newFilePath + "\" id=\"rpPath\">"
							   + "</td>"
							   + "<td colspan=\"3\"></td>"
							   + "</tr>";
					}
			            	
					value += "<tr>"
					 	   + "<td colspan=\"4\">" + result + "</td>"
						   + "</tr>";
					
				}else {
				
					let list = result.rpList;
					$(".repo-table").text("");
					//console.log(list);
					
					let hasContentDesc = list.some(item => item.contentDesc !== undefined);
					
					if (hasContentDesc) {
					    // 하나라도 contentDesc가 정의된 경우
					    hvalue += "<thead>"
					            + "<tr>"
					            + "<th colspan=\"4\">CODE</th>"
					            + "</tr>"
					            + "</thead>";
					} else {
					    // 모든 항목의 contentDesc가 undefined인 경우
					    hvalue += "<thead>"
					            + "<tr>"
					            + "<th width=\"330\">NAME</th>"
					            + "<th>RECENT COMMIT</th>"
					            + "<th width=\"130\">AUTHOR</th>"
					            + "<th width=\"130\">DATE</th>"
					            + "</tr>"
					            + "</thead>";
					}
					

					if(filePath != ""){
						value += "<tr>"
							   + "<td onclick=\"subContent(this);\" class=\"repoTitle\">"
							   + "<i class=\"ti ti-folder\"></i>"
							   + "<div><b>" + "..." + "</b></div>"
							   + "<input type=\"hidden\" value=\"" + newFileName + "\" id=\"rpContentName\">"
							   + "<input type=\"hidden\" value=\"" + newFilePath + "\" id=\"rpPath\">"
							   + "</td>"
							   + "<td colspan=\"3\"></td>"
							   + "</tr>";
					}
					
					for(let i in list){
						
						if(list[i].contentDesc === undefined){
							// contentDesc가 undefined인 경우
							value += "<tr>"
								   + "<td onclick=\"subContent(this);\" class=\"repoTitle\">"
								   + "<input class=\"hidden-repo-type\" type=\"hidden\" value=\"" + list[i].type + "\">"
								   
								    if(list[i].type === "file"){
								        value += "<i class=\"ti ti-file\"></i>"
								    } else{
									    value += "<i class=\"ti ti-folder\"></i>"
								    }
								   
							value += "<div>" + list[i].contentName + "</div>"
								   + "<input type=\"hidden\" value=\"" + list[i].contentName + "\" id=\"rpContentName\">"
								   + "<input type=\"hidden\" value=\"" + list[i].path + "\" id=\"rpPath\">"
								   + "</td>"
								   + "<td>" + "나중에여기다가 뭘쓰지...?" + "</td>"
								   + "<td>" + "<img src=\"" + "resources/images/repo-img.png" + "\" width=\"20\" height=\"20\">" + "작성자이름" + "</td>"
								   + "<td>" + "2024-04-20" + "</td>"
								   + "</tr>";
								   
						} else {
							// contentDesc가 undefined인 경우 == 내용이 있는 경우
							value += "<tr>"
							 	   + "<td colspan=\"4\">" + list[i].contentDesc + "</td>"
								   + "</tr>";
								
						}
						
					}
				}
				
				let bvalue = "<tbody>" + value + "</tbody>";
				
				$(".repo-table").html(hvalue+bvalue);
				
			},
			error:function(){
				console.log("branchSubContent api 조회 실패");
			}
		})
		*/
	}
	
</script>
</body>
</html>