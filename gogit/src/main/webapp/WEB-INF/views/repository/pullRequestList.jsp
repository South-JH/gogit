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

		#create-btn{
			margin-left: auto;
			background-color: #02384b;
			color: white;
		}

		#pullRequest-list{
			border: 1px solid gray;
			background-color: white;
			margin-top: 20px;
			margin-bottom: 20px;
			border-radius: 10px;
		}

		#choose-status{
			margin-top: 20px;
			margin-left: 20px;
		}

		#pullRequest-list>table{
			width: 100%;
			height: 100%;
			margin: auto;
			margin-top: 20px;
			margin-bottom: 20px;
			text-align: center;
		}

		#pullRequest-list>table td, #pullRequest-list>table th{
			padding: 5px;
		}

		#pullRequest-list>table th{
			font-size: 16px;
		}

		#pullRequest-list>table>tbody>tr:hover{
			background-color: lightgray;
			cursor: pointer;
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
								<a href="create.pullrq" class="btn" id="create-btn">Pull request 생성</a>
							</div>

							<div id="pullRequest-list">
								<div id="choose-status">
									<input type="radio" id="status-open" name="status" value="open" checked>
									<label for="status-open">Open</label>
									&nbsp;&nbsp;&nbsp;
									<input type="radio" id="status-closed" name="status" value="closed">
									<label for="status-closed">Closed</label>
								</div>
								<table>
									<thead>
										<tr>
											<th>Pull request Title</th>
											<th>Pull request 작성자</th>
											<th>Label</th>
											<th>Milestone</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>제목이어</td>
											<td>작성자여</td>
											<td>label</td>
											<td>0.1</td>
										</tr>
										<tr>
											<td>제목이어</td>
											<td>작성자여</td>
											<td>label</td>
											<td>0.1</td>
										</tr>
										<tr>
											<td>제목이어</td>
											<td>작성자여</td>
											<td>label</td>
											<td>0.1</td>
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
</body>
</html>