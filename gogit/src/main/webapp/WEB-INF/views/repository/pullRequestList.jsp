<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		#pullRequest-create{
			display: flex;
		}

		#pullRequest-create>button{
			margin-left: auto;
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
					<div id="repository-area">
						<jsp:include page="repositoryTab.jsp"/>
						
						<div id="pullRequest-area">
							<div id="pullRequest-create">
								<button type="button" class="btn btn-primary">Pull request 생성</button>
							</div>
						</div>
					</div>
				</div>
				
			</div>
			
		</div>
		
	</div>
</body>
</html>