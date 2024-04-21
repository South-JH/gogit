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

					<form action="create.pullrq">
						<div id="select-branch">
							<div id="base-branch">
								base:
								<select name="baseBranch" id="base-branch-select">
									<c:forEach var="b" items="${ list }">
										<option value="">${ b.name }</option>
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
										<option value="">${ b.name }</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div id="pull-request-input-area">
							<table>
								<tr>
									<th>Title</th>
									<td><input type="text" class="form-control" name="pullTitle"></td>
								</tr>
								<tr>
									<th>Content</th>
									<td><textarea name="pullContent" class="form-control" id="" cols="30" rows="10" style="resize: none;"></textarea></td>
								</tr>
							</table>
						</div>

						<div id="create-pullRequest-btn">
							<button type="submit" class="btn">Pull request 생성</button>
						</div>
					</form>
					
				</div>
				
			</div>
			
		</div>
		
	</div>
</body>
</html>