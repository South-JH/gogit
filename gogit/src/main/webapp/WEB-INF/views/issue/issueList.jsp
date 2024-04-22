<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.issue-wrap>div {
	background: white;
	border-radius: 7px;
/* 	padding: 10px 30px; */
	height: 710px;
}

.issue-header-area {
	display: flex;
	align-items: center;
	padding-bottom: 20px;
}

.issue-list-header {
	display: flex;
	justify-content: space-between;
	width: 100%;
}

.issue-list-status {
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 110px;
}

.issue-list-table {
	border: 1px solid #e6e6e6;
	border-radius: 6px;
	border-collapse: separate;
    border-spacing: 0;
    width: 100%;
}

.issue-list-table>thead {
	background-color: #e6e6e6;
	height: 40px;
}

.issue-list-table td, .issue-list-table th {
	padding: 10px 15px;
}

.issue-create-btn>a {
	color: var(--bs-body-color);
	color: white;
}

.issue-create-btn {
	border: 1px solid gray;
	border-radius: 10px;
	width: 100px;
	height: 35px;
	display: flex;
	align-items: center;
    justify-content: center;
    background: rgb(36, 87, 228);
}

.issue-list-status>div {
	display: flex;
}

.issue-list-status button {
	border: none;
	background: white;
}

.issue-list-status>div:hover {
	border-bottom: 2px solid gray;
}

.issue-modi-btns {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.issue-list-table>tbody a {
	color: var(--bs-body-color);
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
             
             <jsp:include page="../repository/repositoryTab.jsp" />
             
	             <div class="issue-wrap">
	             	<div>
	             		<div class="issue-header-area">
	             			<div class="issue-list-header">
									<div class="issue-list-status">
									<input type="hidden" id="hidden-name" value="${ repoName }">
									<input type="hidden" id="hidden-owner" value="${ owner }">
										<div>
											<div>3</div>
											<button type="button" onclick="issueStatus(this);">open</button>
										</div>
										<div>
											<div>1</div>
											<button type="button" onclick="issueStatus(this);">closed</button>
										</div>
									</div>
									<div class="issue-modi-btns">
	             					<div>
	             						<select>
	             							<option>OPEN</option>
	             							<option>CLOSE</option>
	             						</select>
	             					</div>
		             				<div class="issue-create-btn">
		             					<a href="create.is"><b>New issue</b></a>
		             				</div>
		             			</div>
	             			</div>
	             		</div>
	             		<div>
	             			<div>
	             				<div>
	             					<table class="issue-list-table">
	             						<thead>
	             							<tr>
	             								<th><input type="checkbox"></th>
	             								<th>TITLE</th>
	             								<th>WRITER</th>
	             								<th>ASSIGNEE</th>
	             								<th>LABEL</th>
	             								<th>DATE</th>
	             								<th width="60">COMMENT</th>
	             							</tr>
	             						</thead>
	             						<tbody>
	             							<tr>
	             								<td><input type="checkbox"></td>
	             								<td><a href="detail.is">회원가입이 안돼요</a></td>
	             								<td>crong9105</td>
	             								<td>crong9105</td>
	             								<td>bug good first issue</td>
	             								<td>2024-04-14</td>
	             								<td align="center">2</td>
	             							</tr>
	             							<tr>
	             								<td><input type="checkbox"></td>
	             								<td><a href="#">로그아웃이 안돼요</a></td>
	             								<td>crong9105</td>
	             								<td>crong9105</td>
	             								<td>bug good first issue</td>
	             								<td>2024-04-14</td>
	             								<td align="center">3</td>
	             							</tr>
	             							<tr>
	             								<td><input type="checkbox"></td>
	             								<td><a href="#">로그인이안돼요</a></td>
	             								<td>crong9105</td>
	             								<td>crong9105</td>
	             								<td>bug good first issue</td>
	             								<td>2024-04-14</td>
	             								<td align="center"></td>
	             							</tr>
	             						</tbody>
	             					</table>
	             				</div>
	             			</div>
	             		</div>
	             	</div>
	             </div>
             
             </div>
           </div>
        </div>
    </div>
</body>

<script>

	let repoName = $("#hidden-name").val();
	let owner = $("#hidden-owner").val();
	
	function issueStatus(e){
		
		let status = $(e).text();
		console.log(status);
		console.log(repoName);
		console.log(owner);
		
		$.ajax({
			url:"getList.is",
			data:{
				repoName:repoName,
				owner:owner,
				status:status
			},
			success:function(){
				
			},
			error:function(){
				console.log("커밋리스트조회 실패");
			}
		})
			
		
	}
		
	

</script>

</html>