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

.td-flex-css {
	display: flex;
	align-items: center;
}

.td-flex-css>* {
	padding: 0 2px;
}

.label-color {
	width: 15px;
	height: 15px;
	border-radius: 100px;
}

.img-flex-css {
	display:flex;
}

.img-flex-css>img {
	border-radius: 100px;
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
											<div id="open-count">${ list.size() }</div>
											<button type="button" onclick="issueStatus(this);">open</button>
										</div>
										<div>
											<div id="close-count"></div>
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
		             					<a href="enrollForm.is?repoName=${ repoName }&visibility=${ visibility }&owner=${ owner }"><b>New issue</b></a>
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
	             								<th width="400">TITLE</th>
	             								<th width="150">WRITER</th>
	             								<th width="150">ASSIGNEE</th>
	             								<th width="200">LABEL</th>
	             								<th width="130">DATE</th>
	             								<th width="60">COMMENT</th>
	             							</tr>
	             						</thead>
	             						<tbody>
	             							<c:forEach var="is" items="${ list }">
		             							<tr>
		             								<td><input type="checkbox"></td>
		             								<td><a href="detail.is?title=${ is.title }&">${ is.title }</a></td>
		             								<td>
		             									<div class="td-flex-css">
			             									<div class="img-flex-css"><img src="${ is.userAvatar }" width="20" height="20"></div>
		             									</div>
		             								</td>
	             									<td>
	             										<div class="td-flex-css">
		             										<c:choose>
		             											<c:when test="${ not empty is.assigneesAvatar }">
				             										<c:forEach var="a" items="${ is.assigneesAvatar }">
				             											<div class="img-flex-css"><img src="${ a }" width="20" height="20"></div>
				             										</c:forEach>
		             											</c:when>
			             										<c:otherwise>
			             											<div></div>
			             										</c:otherwise>
		             										</c:choose>
	             										</div>
	             									</td>
	             									<td>
	             										<div class="td-flex-css">
	             											<c:choose>
		             											<c:when test="${ not empty is.labelColors }">
					             									<c:forEach var="c" items="${ is.labelColors }">
					             										<div class="label-color" style="background-color:#${ c };">
					             										</div>
					             									</c:forEach>
		             											</c:when>
		             											<c:otherwise>
		             												<div></div>
		             											</c:otherwise>
		             										</c:choose>
	             										</div>
	             									</td>
		             								<td>${ is.createAt }</td>
		             								<td align="center">${ is.comment }</td>
		             							</tr>
		             						</c:forEach>
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

	$(function(){
		$("#pull-request").attr("href", "list.pullrq?repoName=${ repoName }&visibility=${ visibility }&owner=${ owner }");
		$("#code").attr("href", "detail.rp?repoName=${ repoName }&visibility=${ visibility }&owner=${ owner }&permission=${ permission }");
		$("#issue").attr("href", "list.is?repoName=${ repoName }&visibility=${ visibility }&owner=${ owner }");
	})

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
			success:function(list){
				
				$(".issue-list-table>tbody").text("");
				let value = "";
				
				for(let i in list){
					
					value += "<tr>"
						   + "<td><input type=\"checkbox\"></td>"
						   + "<td><a href=\"detail.is\">" + list[i].title + "</a></td>"
						   + "<td>"
						   + "<div class=\"td-flex-css\">"
						   + "<div class=\"img-flex-css\"><img src=\"" + list[i].userAvatar + "\" width=\"20\" height=\"20\"></div>"
						   + "</div>"
						   + "</td>"
						   + "<td>"
						   + "<div class=\"td-flex-css\">"
						   
			   			if(list[i].assigneesAvatar != null){
			   				for(let j in list[i].assigneesAvatar){
			   					value += "<div class=\"img-flex-css\"><img src=\"" + list[i].assigneesAvatar[j] + "\" width=\"20\" height=\"20\"></div>"
			   				}
			   			}else{
			   				value += "<div></div>"
			   			}
						   
					value += "</div>"
						   + "</td>"
						   + "<td>"
						   + "<div class=\"td-flex-css\">"
						   
						if(list[i].labelColors != null){
							for(let j in list[i].labelColors){
								value += "<div class=\"label-color\" style=\"background-color:#" + list[i].labelColors[j] + ";\"></div>"
							}
						}else{
							value += "<div></div>"
						}
						   
					value += "</div>"
						   + "</td>"
						   
						if(list[i].state === "open"){
						   value += "<td>" + list[i].createAt + "</td>"
						}else if(list[i].state === "closed"){
							value += "<td>" + list[i].closeAt + "</td>"
						}
						
					value += "<td align=\"center\">" + list[i].comment + "</td>"
						   + "</tr>"
				}
				
				$(".issue-list-table>tbody").html(value);
				
			},
			error:function(){
				console.log("커밋리스트조회 실패");
			}
		})
			
		
	}
		
	

</script>

</html>