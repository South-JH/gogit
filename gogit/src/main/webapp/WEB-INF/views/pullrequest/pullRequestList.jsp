<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		/* #repository-area{
			height: auto;
		} */
		
		#pullRequest-create{
			display: flex;
		}

		#create-btn{
			margin-left: auto;
			background-color: #02384b;
			color: white;
		}

		#pullRequest-list{
			border: 1px solid #e6e6e6;
			background-color: white;
			margin-top: 20px;
			margin-bottom: 20px;
			border-radius: 7px;
			padding: 10px 30px;
		}

		#choose-status{
			margin-top: 20px;
			margin-left: 20px;
		}
		
		#pullRequest-table>thead{
			background-color: whitesmoke;
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
		
		.repo-detail-public-area {
			display: flex;
			align-items: center;
			border-bottom: 2px solid #e6e6e6;
			height: 70px;
		}
		
		.repo-detail-public-area>div {
			padding: 0px 10px;
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
		
		/* START TOOLTIP STYLES */
		[tooltip] {
  			position: relative; /* opinion 1 */
		}

		/* Applies to all tooltips */
		[tooltip]::before, [tooltip]::after {
  			text-transform: none; /* opinion 2 */
			font-size: .9em; /* opinion 3 */
			line-height: 1;
		  	user-select: none;
		  	pointer-events: none;
		  	position: absolute;
		  	display: none;
		  	opacity: 0;
		}
		[tooltip]::before {
  			content: '';
  			border: 5px solid transparent; /* opinion 4 */
  			z-index: 1001; /* absurdity 1 */
		}
		[tooltip]::after {
  			content: attr(tooltip); /* magic! */
  
  			/* most of the rest of this is opinion */
  			font-family: Helvetica, sans-serif;
  			text-align: center;
  
  			/* 
   			Let the content set the size of the tooltips 
   			but this will also keep them from being obnoxious
    		*/
  			min-width: 3em;
  			max-width: 21em;
  			white-space: nowrap;
  			overflow: hidden;
  			text-overflow: ellipsis;
  			padding: 1ch 1.5ch;
  			border-radius: .3ch;
  			box-shadow: 0 1em 2em -.5em rgba(0, 0, 0, 0.35);
  			background: #333;
  			color: #fff;
  			z-index: 1000; /* absurdity 2 */
		}

		/* Make the tooltips respond to hover */
		[tooltip]:hover::before, [tooltip]:hover::after {
  			display: block;
		}

		/* don't show empty tooltips */
		[tooltip='']::before, [tooltip='']::after {
  			display: none !important;
		}
		
		/* FLOW: DOWN */
		[tooltip][flow^="down"]::before {
  			top: 100%;
  			border-top-width: 0;
  			border-bottom-color: #333;
		}
		[tooltip][flow^="down"]::after {
  			top: calc(100% + 5px);
		}
		[tooltip][flow^="down"]::before, [tooltip][flow^="down"]::after {
  			left: 50%;
  			transform: translate(-50%, .5em);
		}
		
		/* KEYFRAMES */
		@keyframes tooltips-vert {
  			to {
    			opacity: .9;
    			transform: translate(-50%, 0);
  			}
		}

		@keyframes tooltips-horz {
  			to {
    			opacity: .9;
    			transform: translate(0, -50%);
			}
		}

		/* FX All The Things */ 
		[tooltip]:not([flow]):hover::before,
		[tooltip]:not([flow]):hover::after,
		[tooltip][flow^="down"]:hover::before,
		[tooltip][flow^="down"]:hover::after {
  			animation: tooltips-vert 300ms ease-out forwards;
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
						<jsp:include page="../repository/repositoryTab.jsp"/>
						
						<div id="pullRequest-area">
							<form action="createForm.pullrq" method="post">
								<div id="pullRequest-create">
									<input type="hidden" name="repoOwner" value=${ owner }>
									<input type="hidden" name="repoName" value=${ repoName }>
									<input type="hidden" name="repoVisibility" value=${ visibility }>
									<button type="submit" class="btn" id="create-btn">Pull request 생성</button>
								</div>
							</form>

							<div id="pullRequest-list">
								<div class="repo-detail-public-area">
				          			<div>
				          				<h4>${ repoName }</h4>
				          			</div>
				          			<div class="repo-detail-public">
				          				<div>${ visibility }</div>
				          			</div>
				          		</div>
								<div id="choose-status">
									<input type="radio" id="status-open" name="status" value="open" checked>
									<label for="status-open">Open</label>
									&nbsp;&nbsp;&nbsp;
									<input type="radio" id="status-closed" name="status" value="closed">
									<label for="status-closed">Closed</label>
								</div>
								<table id="pullRequest-table">
									<thead>
										<tr>
											<th>Pull request Title</th>
											<th>Author</th>
											<th>Assignees</th>
											<th>Create Date</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$(function() {
			$("#pull-request").attr("href", "list.pullrq?repoName=${ repoName }&visibility=${ visibility }&owner=${ owner }");
			
			const list = ${ list };
			
			let openList = [];
			let closedList = [];
			for(let i in list) {
				if(list[i].status == "open") {
					openList.push(list[i]);
				} else {
					closedList.push(list[i]);
				}
			}
			
			if($("input[name=status]:checked").val() == "open") {
				tbody = tbodyVal(openList);
			} else {
				tbody = tbodyVal(closedList);
			}
			
			$('#pullRequest-table>tbody').html(tbody);

			$("input[name=status]").on("change", function() {

				if($("input[name=status]:checked").val() == "open") {
					tbody = tbodyVal(openList);

				} else {
					tbody = tbodyVal(closedList);
				}

				$('#pullRequest-table>tbody').html(tbody);
			});
		})
		
		function tbodyVal(list) {
			let tbody = "";
			
			for(let i in list) {
				const no = list[i].pullNo;
				const title = list[i].pullTitle;
				const content = list[i].pullContent;
				const writer = list[i].pullWriter;
				const assignees = list[i].pullManager;
				const profiles = list[i].pullManagerProfile;
				const status = list[i].status;
				const createDate = list[i].createDate.split('T')[0];

				tbody += `<tr onclick="location.href='detail.pullrq?owner=${owner}&repoName=${repoName}&pullNo=\${ no }'">
							<td>\${ title }</td>
							<td>\${ writer }</td>
							<td>
						`;
				
				if(assignees != "") {
					let assigneeArr = assignees.split(','); // [south-jh,crong,jimin]
					let profileArr = profiles.split(',');

					for(let i = 0; i < profileArr.length; i++) {
						tbody += `<span tooltip="\${ assigneeArr[i] }" flow="down">
									<img class="profile" src="\${ profileArr[i] }" style="width: 25px; height: 25px; border-radius: 100%;">
								</span>
								`;
					}
				}

				tbody += `</td>
							<td>\${ createDate }</td>
						<tr>
						`;
			}
			
			return tbody;
		}
	</script>
	
</body>
</html>