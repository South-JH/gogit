<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 전체 레파지토리 wrap */
.repo-wrap {
	display: flex;
	flex-direction: column;
	height: auto;
}

.repo-wrap>div {
	padding: 25px 0px;
	/* width: 900px; */
}

h2 {
	margin: 0;
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
	          
				<div class="repo-wrap">
					<div>
						<div>
							<h2>New &nbsp; Repository</h2>
						</div>
					</div>
	          
	          </div>
	        </div>
	     </div>
	 </div>
</body>
</html>