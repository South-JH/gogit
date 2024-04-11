<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="webapp/resources/css/repository/repositoryList.css" rel="stylesheet">
<style>
h2 {
	margin: 0;
}

/* 전체 레파지토리 wrap */
.repo-wrap {
	display: flex;
	flex-direction: column;
}

.repo-wrap>div {
	padding: 25px 0px;
}

/* 레파지토리 목록 부분 */
.bottom-area {
	border:1px solid #e6e6e6;
	height: 500px;
	border-radius: 10px;
	padding: 20px;
}

.repo-search {
	display: flex;
}

.repo-search input {
	width: 250px;
	height: 20px;
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
	          <!-- Row 1 -->
	          <div class="row">
	          
	          <!-- 레파지토리 리스트 -->
	          <div class="repo-wrap">
	          	<div>
	          		<div>
	          			<h2>My &nbsp; Repository</h2>
	          		</div>
	          	</div>
	          	<div>
	          		<div class="bottom-area">
	          			<div class="bottom-area-wrap">
	          				<div class="repo-search">
	          					<div>
	          						<input type="text">
	          					</div>
	          					<div>
	          						<select>
	          							<option></option>
	          						</select>
	          					</div>
	          				</div>
	          				<div class="repo-create"></div>
	          			</div>
	          			<div></div>
	          		</div>
	          	</div>
	          </div>
	          <!-- 레파지토리 리스트 END -->
	          
	          </div>
	        </div>
	     </div>
	 </div>
	
			

</body>
</html>