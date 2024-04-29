<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.bundle.min.js"></script>
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
	          					<div class="repo-search-div">
	          						<input type="text" placeholder="Find a repository">
	          						<i class="ti ti-search"></i>
	          					</div>
							</div>
							<div class="repo-create">
								<div class="repo-select-btn">
									<div class="repo-btn">
										<div class="type-btn">Type</div>
										<div>
											<i class="ti ti-chevron-down"></i>
										</div>
									</div>
									<div class="hidden-select-btn">
										<div>
											<div class="select-btn-title-area">
												<div class="hidden-select-btn-title">
													<div><b class="select-type">select type</b></div>
													<div>
														<i class="ti ti-x"></i>
													</div>
												</div>
											</div>
											<div class="hidden-btn-select-area">
												<input type="hidden" value="${ loginUser.gitNick }" >
												<div>
													<div onclick="typeSelect(this);">All</div>
												</div>
												<div>
													<div onclick="typeSelect(this);">public</div>
												</div>
												<div>
													<div onclick="typeSelect(this);">private</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="repo-create-btn">
									<a class="repo-create-btn-color" href="enrollForm.rp">New</a>
								</div>
							</div>
	          			</div>
	          			
						<!-- 목록 시작 -->
						<div class="repo-list-total-wrap">
							<div>
								<div>
									<div class="repo-list-count">
										<div><h4 class="repo-count-div">${ rpList.size() } repository</h4></div>
									</div>
									<div class="repo-list-wrap">
									<c:forEach var="rpList" items="${ rpList }" varStatus="rp">
										<div>
											<div class="repo-list-wrap-one">
												<div>
													<div class="wrap-one">
														<div class="repo-list-top-area">
															<div class="top-area-title-visibility">
																<a class="href-div" href="detail.rp?repoName=${ rpList.repoTitle }&visibility=${ rpList.visibility }&owner=${ rpList.owner }&permission=${ rpList.permission }">
																	<div>
																		<h4>${ rpList.repoTitle }</h4>
																		<input type="hidden" name="owner" value="${ rpList.owner }">
																	</div>
																</a>
																<div class="top-area-visibility">${ rpList.visibility }</div>
															</div>
															<c:choose>
																<c:when test="${ loginUser.gitNick eq rpList.owner }">
																	<div class="top-area-action unabled-area">
																		<div>
																			<button class="invite-btn" type="button" data-toggle="modal" data-target="#inviteModal${ rp.index }">
																				<i class="ti ti-send"></i>
																			</button>
																		</div>
																		<div>
																			<button class="update-btn" type="button" data-toggle="modal" data-target="#updateModal${ rp.index }">
																				<i class="ti ti-pencil"></i>
																			</button>
																		</div>
																		<div onclick="deleteBtn(this);">
																			<button type="button">
																				<i class="ti ti-trash"></i>
																			</button>
																		</div>
																	</div>
																</c:when>
																<c:otherwise>
																	<div class="top-area-action">
																		<div class="disabled-btn">
<%-- 																			<button type="button" data-toggle="modal" data-target="#inviteModal${ rp.index }" disabled> --%>
																			<button type="button" data-toggle="modal" data-target=".inviteModal" disabled>
																				<i class="ti ti-send"></i>
																			</button>
																		</div>
																		<div class="disabled-btn">
																			<button type="button" data-toggle="modal" data-target=".updateModal" disabled>
																				<i class="ti ti-pencil"></i>
																			</button>
																		</div>
																		<div class="disabled-btn" onclick="deleteBtn(this);">
																			<button type="button" disabled>
																				<i class="ti ti-trash"></i>
																			</button>
																		</div>
																	</div>
																</c:otherwise>
															</c:choose>
														</div>
														<div>${ rpList.repoContent }</div>
													</div>
													
													<%-- 초대Form 모달 --%>
													<div class="modal inviteModal" tabindex="-1" id="inviteModal${ rp.index }">
													  <div class="modal-dialog modal-dialog-centered">
													    <div class="modal-content">
													      <div class="modal-header">
													        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													      </div>
													      <div class="modal-body modal-body-inviteform">
													        <div>
													        	<div>
													        		<div class="invite-header-modal">
													        			<div>
													        				<i class="ti ti-user-plus"></i>
													        			</div>
													        			<div class="invite-header-modal-title">
													        				<div>
													        					<h4>Add a Collaborator to &nbsp;</h4>
													        				</div>
													        				<div>
													        					<h4>${ rpList.repoTitle }</h4>
													        				</div>
													        			</div>
													        		</div>
													        		<div>
													        			<div class="invite-body-modal">
													        				<input type="text" class="collaborator-input">
													        			</div>
													        		</div>
													        		<div>
											        					<div class="invite-footer-modal">
													        				<button type="button" onclick="inviteBtn(this);">Add to this repository</button>
													        			</div>
													        		</div>
													        	</div>
													        </div>
													      </div>
													    </div>
													  </div>
													</div>
													<%-- 초대Form 모달 End --%>
												
													<%-- 수정Form 모달 --%>
													<div class="modal updateModal" tabindex="-1" id="updateModal${ rp.index }">
														<div class="modal-dialog modal-dialog-centered">
															<div class="modal-content">
																<div class="modal-header updateModal-header">
																	<h3 class="modal-title">Repository Update</h3>
																	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
																</div>
																<form action="update.rp" method="post"> 
																<input type="hidden" name="repoName" value="${ rpList.repoTitle }">
																<div class="modal-body">
																	<div>
																		<div>
																			<div class="modal-body-repo">
																				<div><h5>Repository Rename</h5></div>
																				<div class="moda-body-repo-input">
																					<input type="text" name="repoRename" value="${ rpList.repoTitle }" maxlength="30">
																				</div>
																			</div>
																			<div class="modal-body-repo">
																				<div><h5>Description</h5></div>
																				<div class="moda-body-repo-input">
																					<input type="text" name="repoContent" value="${ rpList.repoContent }" maxlength="30">
																				</div>
																			</div>
																			<div class="modal-body-repo">
																				<div>
																					<label for="public-radio${ rp.index }" class="modal-body-repo-radio">
																						<div>
																							<input type="radio" id="public-radio${ rp.index }" name="visibility" value="public" required>
																						</div>
																						<div class="modal-body-repo-visibility">
																							<div>
																								<img src="resources/images/book-open.png" width="20" height="20">
																							</div>
																							<div>Public</div>
																						</div>
																					</label>
																				</div>
																				<div>
																					<label for="private-radio${ rp.index }" class="modal-body-repo-radio">
																						<div>
																							<input type="radio" id="private-radio${ rp.index }" name="visibility" value="private" required>
																						</div>
																						<div class="modal-body-repo-visibility">
																							<div>
																								<img src="resources/images/lock.png" width="20" height="20">
																							</div>
																							<div>Private</div>
																						</div>
																					</label>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="modal-footer">
<!-- 																	<button type="button" class="btn btn-primary" onclick="updateBtn(this);">Save changes</button> -->
																	<button type="submit" class="btn btn-primary">Save changes</button>
																</div>
																</form>
															</div>
														</div>
													</div>
													<%-- 수정Form 모달 End --%>
													
													<div class="repo-count-list-area">
													<c:if test="${ not empty rpList.language }">
														<div>
															<div><i class="ti ti-world"></i></div>
															<div class="repo-count-check">${ rpList.language }</div>
														</div>
													</c:if>
														<div>
															<div><i class="ti ti-carambola"></i></div>
															<div class="repo-count-check">${ rpList.stargazers }</div>
														</div>
														<div>
															<div><i class="ti ti-git-fork"></i></div>
															<div class="repo-count-check">${ rpList.fork }</div>
														</div>
														<div>
															<div><i class="ti ti-circle-dot"></i></div>
															<div class="repo-count-check">${ rpList.openIssue }</div>
														</div>
														<div>
															<div class="repo-count-check repo-date"><i></i>${ rpList.updateAt }</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
									</div>
								</div>
							</div>
						</div>
						<!-- 목록 끝 -->
	          		</div>
	          	</div>
	          </div>
	          <!-- 레파지토리 리스트 END -->
	          
	          </div>
	        </div>
	     </div>
	 </div>

<script>

	$(function() {
		let inBtn = $(".invite-btn");
		let colInput = $(".collaborator-input");
		inBtn.click(function(){
			console.log(inBtn.index($(this)));
			colInput.eq(inBtn.index($(this))).val("");
			
		})
	})	
			
// 	$(function(){
// 		$(".href-div").click(function(){
// 			//console.log($(this).children().children("h4").text());
// 			//console.log($(this).siblings(".top-area-visibility").text());
// 			//console.log($(this).children().children("input").val());
// 			location.href = "detail.rp?repoName=" + $(this).children().children("h4").text() + "&visibility=" + $(this).siblings(".top-area-visibility").text() + "&owner=" + $(this).children().children("input").val();
// 		})
// 	})
	
	$(function(){
		
		$(".repo-btn").click(function(){
			if($(".hidden-select-btn").css("display") === "none"){
				$(".hidden-select-btn").css("display", "block");
			}else{
				$(".hidden-select-btn").css("display", "none");
			}
		})	
	})
	
	function deleteBtn(e){
		
		//console.log($(e).parent().siblings().eq(0).children().children().children().text());
		const repoTitle = $(e).parent().siblings().eq(0).children().children().children().text();
		//console.log(repoTitle);
		
		if(confirm("레포지토리를 삭제하시겠습니까?")){
			
			$.ajax({
				url:"delete.rp",
				data:{
					repoName:repoTitle
				},
				success:function(result){
	                alert(repoTitle + "레포지토리가 삭제되었습니다.");
	                location.reload();
				},
		        error: function(error) {
		            console.log("레포지토리 삭제 ajax 실패: " + error);
		            alert("레포지토리 삭제에 실패했습니다.");
		        }
			})
			
		} else{
			console.log("삭제 취소");
		}
	}
	
	function inviteBtn(e){
		
		console.log($(e).parent().parent().siblings().eq(1).children().children().val());
		console.log($(e).parent().parent().siblings().eq(0).children().eq(1).children().eq(1).children().text());
		let cbName = $(e).parent().parent().siblings().eq(1).children().children().val();
		let repoTitle = $(e).parent().parent().siblings().eq(0).children().eq(1).children().eq(1).children().text();
		
		$.ajax({
			url:"invite.rp",
			data:{
				cbName:cbName,
				repoName:repoTitle
			},
			success:function(result){
				alert(result);
			},
			error:function(xhr){
				console.log("협력자초대 ajax 실패");
				alert(xhr.responseText);
			}
		})
	}
	
	function typeSelect(e){
		
		console.log($(e).text());
		let type = $(e).text();
		let user = $(e).parent().siblings().eq(0).val();
		console.log(user);
		
		$(".type-btn").text(type);
		$(".hidden-select-btn").css("display", "none");
		
		$.ajax({
			url:"typeList.rp",
			data:{
				type:type
			},
			success:function(list){
				
				console.log(list);
				$(".select-type").text(type);
				
				$(".repo-list-wrap").text("");
				let value = "";
				
				let length = list.length;
				$(".repo-count-div").text(length + " repository");
				
				for(let i in list){
					
					value += "<div>"
						   + "<div class=\"repo-list-wrap-one\">"
						   + "<div>"
						   + "<div class=\"wrap-one\">"
						   + "<div class=\"repo-list-top-area\">"
						   + "<div class=\"top-area-title-visibility\">"
						   + "<a class=\"href-div\" href=\"detail.rp?repoName=" + list[i].repoTitle + "&visibility=" + list[i].visibility + "&owner=" + list[i].owner + "&permission=" + list[i].permission + "\">"
						   + "<div>"
						   + "<h4>" + list[i].repoTitle + "</h4>"
						   + "<input type=\"hidden\" name=\"owner\" value=\"" + list[i].owner + "\">"
						   + "</div>"
						   + "</a>"
						   + "<div class=\"top-area-visibility\">" + list[i].visibility + "</div>"
						   + "</div>"
						   
						   if(user === list[i].owner){
							   value += "<div class=\"top-area-action unabled-area\">"
							   		  + "<div>"
							   		  + "<button class=\"invite-btn\" type=\"button\" data-toggle=\"modal\" data-target=\"#inviteModal" + i + "\">"
							   		  + "<i class=\"ti ti-send\"></i>"
							   		  + "</button>"
							   		  + "</div>"
							   		  + "<div>"
							   		  + "<button class=\"update-btn\" type=\"button\" data-toggle=\"modal\" data-target=\"#updateModal" + i + "\">"
							   		  + "<i class=\"ti ti-pencil\"></i>"
							   		  + "</button>"
							   		  + "</div>"
							   		  + "<div onclick=\"deleteBtn(this);\">"
							   		  + "<button type=\"button\">"
							   		  + "<i class=\"ti ti-trash\"></i>"
							   		  + "</button>"
							   		  + "</div>"
							   		  + "</div>"
						   }else{
							   value += "<div class=\"top-area-action\">"
								      + "<div class=\"disabled-btn\">"
							   		  + "<button type=\"button\" data-toggle=\"modal\" data-target=\"#inviteModal" + i + "\" disabled>"
							   		  + "<i class=\"ti ti-send\"></i>"
							   		  + "</button>"
							   		  + "</div>"
							   		  + "<div class=\"disabled-btn\">"
							   		  + "<button type=\"button\" data-toggle=\"modal\" data-target=\"#updateModal" + i + "\" disabled>"
							   		  + "<i class=\"ti ti-pencil\"></i>"
							   		  + "</button>"
							   		  + "</div>"
							   		  + "<div class=\"disabled-btn\" onclick=\"deleteBtn(this);\">"
							   		  + "<button type=\"button\" disabled>"
							   		  + "<i class=\"ti ti-trash\"></i>"
							   		  + "</button>"
							   		  + "</div>"
							   		  + "</div>"
						   }
					
				   value += "</div>"
				   		  + "<div>" + list[i].repoContent + "</div>"
				   		  + "</div>"
				   		  /* 초대Form 모달 */
				   		  + "<div class=\"modal\" tabindex\"-1\" id=\"inviteModal" + i + "\">"
				   		  + "<div class=\"modal-dialog modal-dialog-centered\">"
				   		  + "<div class=\"modal-content\">"
				   		  + "<div class=\"modal-header\">"
				   		  + "<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>"
				   		  + "</div>"
				   		  + "<div class=\"modal-body modal-body-inviteform\">"
				   		  + "<div>"
				   		  + "<div>"
				   		  + "<div class=\"invite-header-modal\">"
						  + "<div>"
						  + "<i class=\"ti ti-user-plus\"></i>"
						  + "</div>"
						  + "<div class=\"invite-header-modal-title\">"
						  + "<div>"
						  + "<h4>Add a Collaborator to &nbsp;</h4>"
						  + "</div>"
						  + "<div>"
						  + "<h4>" + list[i].repoTitle + "</h4>"
						  + "</div>"
						  + "</div>"
						  + "</div>"
						  + "<div>"
						  + "<div class=\"invite-body-modal\">"
						  + "<input type=\"text\" class=\"collaborator-input\">"
						  + "</div>"
						  + "</div>"
						  + "<div>"
						  + "<div class=\"invite-footer-modal\">"
						  + "<button type=\"button\" onclick=\"inviteBtn(this);\">Add to this repository</button>"
						  + "</div>"
						  + "</div>"
						  + "</div>"
						  + "</div>"
						  + "</div>"
						  + "</div>"
						  + "</div>"
						  + "</div>"
						  /* 초대Form 모달 End */
						  /* 수정Form 모달 */
						  + "<div class=\"modal\" tabindex=\"-1\" id=\"updateModal" + i + "\">"
						  + "<div class=\"modal-dialog modal-dialog-centered\">"
						  + "<div class=\"modal-content\">"
						  + "<div class=\"modal-header updateModal-header\">"
						  + "<h3 class=\"modal-title\">Repository Update</h3>"
						  + "<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>"
						  + "</div>"
						  + "<form action=\"update.rp\" method=\"post\">"
						  + "<input type=\"hidden\" name=\"repoName\" value=\""+ list[i].repoTitle + "\">"
						  + "<div class=\"modal-body\">"
						  + "<div>"
						  + "<div>"
						  + "<div class=\"modal-body-repo\">"
						  + "<div><h5>Repository Rename</h5></div>"
						  + "<div class=\"moda-body-repo-input\">"
						  + "<input type=\"text\" name=\"repoRename\" value=\"" + list[i].repoTitle + "\" maxlength=\"30\">"
						  + "</div>"
						  + "</div>"
						  + "<div class=\"modal-body-repo\">"
						  + "<div><h5>Description</h5></div>"
						  + "<div class=\"moda-body-repo-input\">"
						  + "<input type=\"text\" name=\"repoContent\" value=\"" + list[i].repoContent + "\" maxlength=\"30\">"
						  + "</div>"
						  + "</div>"
						  + "<div class=\"modal-body-repo\">"
						  + "<div>"
						  + "<label for=\"public-radio" + i + "\" class=\"modal-body-repo-radio\">"
						  + "<div>"
						  + "<input type=\"radio\" id=\"public-radio" + i + "\" name=\"visibility\" value=\"public\" required>"
						  + "</div>"
						  + "<div class=\"modal-body-repo-visibility\">"
						  + "<div>"
						  + "<img src=\"resources/images/book-open.png\" width=\"20\" height=\"20\">"
						  + "</div>"
						  + "<div>Public</div>"
						  + "</div>"
						  + "</label>"
						  + "</div>"
						  + "<div>"
						  + "<label for=\"private-radio" + i + "\" class=\"modal-body-repo-radio\">"
						  + "<div>"
						  + "<input type=\"radio\" id=\"private-radio" + i + "\" name=\"visibility\" value=\"private\" required>"
						  + "</div>"
						  + "<div class=\"modal-body-repo-visibility\">"
						  + "<div>"
						  + "<img src=\"resources/images/lock.png\" width=\"20\" height=\"20\">"
						  + "</div>"
						  + "<div>Private</div>"
						  + "</div>"
						  + "</label>"
						  + "</div>"
						  + "</div>"
						  + "</div>"
						  + "</div>"
						  + "</div>"
						  + "<div class=\"modal-footer\">"
						  + "<button type=\"submit\" class=\"btn btn-primary\">Save changes</button>"
						  + "</div>"
						  + "</form>"
						  + "</div>"
						  + "</div>"
						  + "</div>"
						  /* 수정Form 모달 End */
						  
						  + "<div class=\"repo-count-list-area\">"
						  if(list[i].language != null){
							  value += "<div>"
							  		 + "<div><i class=\"ti ti-world\"></i></div>"
							  		 + "<div class=\"repo-count-check\">" + list[i].language + "</div>"
							  		 + "</div>"
						  }
					
					value += "<div>"
						   + "<div><i class=\"ti ti-carambola\"></i></div>"
						   + "<div class=\"repo-count-check\">" + list[i].stargazers + "</div>"
						   + "</div>"
						   + "<div>"
						   + "<div><i class=\"ti ti-git-fork\"></i></div>"
						   + "<div class=\"repo-count-check\">" + list[i].fork + "</div>"
						   + "</div>"
						   + "<div>"
						   + "<div><i class=\"ti ti-circle-dot\"></i></div>"
						   + "<div class=\"repo-count-check\">" + list[i].openIssue + "</div>"
						   + "</div>"
						   + "<div>"
						   + "<div class=\"repo-count-check repo-date\"><i></i>" + list[i].updateAt + "</div>"
						   + "</div>"
						   + "</div>"
						   + "</div>"
						   + "</div>"
						   + "</div>"
				}
				
				$(".repo-list-wrap").html(value);
				
			},
			error:function(){
				console.log("타입별 레파지토리 리스트 조회 ajax 실패");
			}
		})
		
	}
	
	/*
	function updateBtn(e){
		
		let form = e.form;
		let formData = new FormData(form);
		
	    for (let pair of formData.entries()) {
	        console.log(pair[0] + ': ' + pair[1]);
	    }
		
		$.ajax({
			url: "update.rp",
			data: formData,
			method: "POST",
	        processData: false,
	        contentType: false,
			success:function(result){
				alert(result);
				location.reload();
			},
			error:function(xhr){
				alert(xhr.responseText);
			}
		})
	}
	*/
	
</script>
			
<link href="resources/repository/repositoryList.css" rel="stylesheet">
</body>
</html>