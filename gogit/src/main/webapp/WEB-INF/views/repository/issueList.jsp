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
	padding: 10px 30px;
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

.issue-list-status button {
	border: none;
	background: white;
}

.issue-list-status button:hover {
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
             
             <jsp:include page="repositoryTab.jsp" />
             
	             <div class="issue-wrap">
	             	<div>
	             		<div class="issue-header-area">
	             			<div class="issue-list-header">
	             				<div class="issue-list-status">
	             					<div>
	             						<button type="button">3 Open</button>	
	             					</div>
	             					<div>
	             						<button type="button">1 Close</button>	
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
	             								<th>NO.</th>
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
	             								<td>3</td>
	             								<td><a href="#">회원가입이 안돼요</a></td>
	             								<td>crong9105</td>
	             								<td>crong9105</td>
	             								<td>bug good first issue</td>
	             								<td>2024-04-14</td>
	             								<td align="center">2</td>
	             							</tr>
	             							<tr>
	             								<td>2</td>
	             								<td><a href="#">로그아웃이 안돼요</a></td>
	             								<td>crong9105</td>
	             								<td>crong9105</td>
	             								<td>bug good first issue</td>
	             								<td>2024-04-14</td>
	             								<td align="center">3</td>
	             							</tr>
	             							<tr>
	             								<td>1</td>
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
</html>