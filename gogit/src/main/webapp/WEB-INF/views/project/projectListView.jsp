<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<style>
	/* 모집 div 몇개씩 배치할껀지*/
	#content2_3 {
	height: auto;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 10px;
	}

	/* div 호버시 앞으로 튀어나오는 효과 */
	#content2_3>div:hover {
    transition: all 0.5s ease;
	-webkit-transform: scale(1.1);
	transform: scale(1.1);

	/* transition: all 3s;
  	transform: rotate(360deg); */
	}

	/* div 그림자 효과 */
	.plist-div{
		box-shadow: 5px 5px 10px gray;
		cursor: pointer;
		width: 270px;
		height: 330px;
		border-radius: 25px;
		border: 2px solid #d4d2d2;
		background-color:#ffffff;
	}

	#content2_3>div{
		padding: 7px;
	}

	/* 모집중 모집완료 폰트 스타일*/
	.topmenu-div{font-weight: 900; font-size: 25px;}


	/* 프로젝트 작성 버튼 css*/
	.repo-create-btn {
	background-color: rgb(2 56 75);
	border: 1px solid #e6e6e6;
	border-radius: 6px;
	height: 35px;
	width: 100px;
	font-weight: 570;
	cursor: pointer;
	text-align: center;
	padding: 5px;
	}

	.repo-create-btn-color {
		color: white;
	}


	/* 페이징바 가운데로, 페이징바 스타일 */
	.bottom-div{
		display: flex;
		justify-content : center
	}
	.pagination a{
		color: rgb(2 56 75);
	}

	.active > .page-link, .page-link.active {
    color: var(--bs-pagination-active-color);
    background-color: rgb(2 56 75) !important;
    border-color: white !important;
	}


	
	.testtest>a{
		cursor: pointer;
	}

	/* 모집중 div 스타일*/
	.pro-public {
	border: 1px solid #d9d9d9;
	border-radius: 30px;
	width: 80px;
	height: 30px;
	display: flex;
	align-items: center;
	justify-content: center;
	/* font-weight: 600; */
    text-align: center;
	background-color: rgb(2 56 75);
	color: white;
    }

	/* 디자이너 프론트엔드 백엔드 div 스타일 */
	.pro-public1>div{
	border: 1px solid #d9d9d9;
	border-radius: 30px;
	width: 80px;
	height: 20px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: 600;
    text-align: center;
    }
	/* .pro-public1>button{
		background-color: #ffffff;
		color: #5a6a85;
	} */

	/* 디자이너 프론트엔드 백엔드 div 정렬 */
	#content2_31{
	height: auto;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 1px;
	}

	#contentStack{
		height: auto;
		display: grid;
		grid-template-columns: repeat(6, 1fr);
		gap: 1px;
		margin-top: 5px;
	}

	/* 기술스택 이미지 크기 */
	.stackimg>img{
		width: 38px;
		height: 38px;
	}
	.stackimg{margin: 2px;}
	
</style>
</head>
<body>

	<c:if test="${ not empty alertMsg }">
		<script>
			alertify.alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>

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
   
         <div class="container-fluid" style="max-width:1600px;">
             <!--  Row 1 -->
             <div class="row" style="display: flex;">	          	          		
				<div class="pj-wrap" style="display: flex;">
					<div style="width: 100%;" class="sideleft-div"><!-- border red 지움-->

						<div class="top-div">
							<div class="topmenu-div" style="display:flex;">
								<div style="width: 90px;" class="testtest"><a onclick="allbtn()" style="color: rgb(2 56 75);">전체</a></div>					
								<div style="width: 100px;" class="applying"><a onclick="applying(1)" id="applyingId" style="color: lightgray; cursor: pointer;">모집 중</a></div>
								<div style="width: 120px;" class="applycomplete"><a onclick="applycomplete()" style="color: lightgray; cursor: pointer;">모집 완료</a></div>
							</div>
							<br>
							<br>

							<script>
								function allbtn(){
									$(".testtest>a").css("color", "rgb(2 56 75)");
									$(".applying>a").css("color", "lightgray");
									$(".applycomplete>a").css("color", "lightgray");
									location.href="list.pj";
								}

								function applying(p){
									$(".testtest>a").css("color", "lightgray");
									$(".applying>a").css("color", "rgb(2 56 75)");
									$(".applycomplete>a").css("color", "lightgray");

									$.ajax({
										url:"applyingList.pr",
										data:{cpage:p},
										success:function(map){
											//console.log(map)
											let pi = map.pi;			
					                        let currentPage = pi.currentPage;
					                        let startPage = pi.startPage;
					                        let endPage = pi.endPage;
					                        let maxPage = pi.maxPage;
					                        let $paging = $(".pagination");
					                        
					                        $("#content2_3").html("");
					                        $paging.html("");
					                        							                       						                        
					                        let result = map.list; // array
					                        let result1 = map.stackList; // array
					                        //console.log(result);
					                        //console.log(pi);
					                        							                        
					                        let value = "";
					                        
					                        for(let i=0; i<result.length; i++){
						                        let proStatus = result[i].proStatus;
						                        
						                        		let rv = result[i];					                    		
						                        		
						                        		let deadLine = rv.deadLine;
						                        		let proContent = rv.proContent;
						                        		let positoin = rv.positoin; //"zzszs,zszzs,zszszs"
						                        		let pno = rv.proNo;				                        		
		                        
						                        		let count = rv.count;
						                        		let prowriter = rv.proWriter;
														let prostack = rv.proStack;
														
														value += 
							                        		'<div class="plist-div" onclick="location.href=\'detail.pr?pno=' + pno + '\'">'
															+ '<div class="pro-public">모집중</div>'
															+ '<br>'
															+ '<div>마감일:'+deadLine+'</div>'
															+ '<br>'
															+ '<div>'+ proContent +'</div>'
															+ '<br>'						
															+ '<div class="pro-public1" id="content2_31">';
															
														let testu = positoin.split(",");
														for(let i =0; i<testu.length; i++){
															value += '<div>'+ testu[i] +'</div>'
														}
														value += '</div>'
														      + '<div style="display: flex; margin-top: 5px;">'
														
														for(let i=0; i<result1.length; i++){
															
															let testt = prostack.split(",");
															
															for(let j=0; j<testt.length; j++){
																if(testt[j] == result1[i].stackName)
														value += '<div class="stackimg">'
															  + '<img src="'+ result1[i].stackImg +'"></div>'																  
															}															
														} 
														value += '</div>'
														      + '<div><hr></div>'
															  + '<div>조회수:'+ count +'</div>'
															  + '<div>작성자:${ loginUser.gitNick }</div>'		
														  	  + '</div>'																			                        	
						                        		}
					                        
					                        $("#content2_3").html(value);
					                        //console.log("------")
					                        //console.log(currentPage);
					                        //console.log(startPage);
					                        //console.log(endPage);
					                        
					                        if (currentPage != 1) {				                        	
						                        $paging.append(				                               
						                                "<li class='page-item'><a class='page-link' onclick=applying(" + (currentPage - 1) + ")>Previous</a></li>"
						                            );
						                        }
						                        
						                        for (let p = startPage; p <= endPage; p++) {
						                            if (p == currentPage) {
						                              $paging.append("<li class='page-item active'><a class='page-link' onclick=applying(" + p  + ")>" + p + "</a></li>");
						                            }else{
						                              $paging.append("<li class='page-item'><a class='page-link' onclick=applying(" + p  + ")>" + p + "</a></li>");
						                            }
						                          } 
						                        
						                        if (currentPage != maxPage) {
						                        	$paging.append(
						                        		    "<li class='page-item'><a class='page-link' onclick=applying(" + (currentPage + 1) + ")>Next</a></li>");
						                          }											
										},error:function(){
											
										}
									});
								}					
							
								function applycomplete(p){
									$(".testtest>a").css("color", "lightgray");
									$(".applying>a").css("color", "lightgray");
									$(".applycomplete>a").css("color", "rgb(2 56 75)");
									
									$.ajax({
										url:"applycompleteList.pr",
										data:{cpage:p},
										success:function(map){
											let pi = map.pi;			
					                        let currentPage = pi.currentPage;
					                        let startPage = pi.startPage;
					                        let endPage = pi.endPage;
					                        let maxPage = pi.maxPage;
					                        let $paging = $(".pagination");
					                        
					                        $("#content2_3").html("");
					                        $paging.html("");
					                        							                       						                        
					                        let result = map.list; // array
					                        let result1 = map.stackList; // array
					                        console.log(result);
					                        							                        
					                        let value = "";
					                        
					                        for(let i=0; i<result.length; i++){
						                        let proStatus = result[i].proStatus;
						                        
						                        		let rv = result[i];					                    		
						                        		
						                        		let deadLine = rv.deadLine;
						                        		let proContent = rv.proContent;
						                        		let positoin = rv.positoin; //"zzszs,zszzs,zszszs"
						                        		let pno = rv.proNo;				                        		
		                        
						                        		let count = rv.count;
						                        		let prowriter = rv.proWriter;
														let prostack = rv.proStack;
														
														value += 
							                        		'<div class="plist-div" onclick="location.href=\'detail.pr?pno=' + pno + '\'">'
															+ '<div class="pro-public" style="background-color: #d9d9d9;">모집마감</div>'
															+ '<br>'
															+ '<div>마감일:'+deadLine+'</div>'
															+ '<br>'
															+ '<div>'+ proContent +'</div>'
															+ '<br>'						
															+ '<div class="pro-public1" id="content2_31">';
															
														let testu = positoin.split(",");
														
														for(let i =0; i<testu.length; i++){
															value += '<div>'+ testu[i] +'</div>'
														}
														value += '</div>'
														      + '<div style="display: flex; margin-top: 5px;">'
														
														for(let i=0; i<result1.length; i++){
															
															let testt = prostack.split(",");
															
															for(let j=0; j<testt.length; j++){
																if(testt[j] == result1[i].stackName)
														value += '<div class="stackimg">'
															  + '<img src="'+ result1[i].stackImg +'"></div>'																  
															}															
														} 
														value += '</div>'
														      + '<div><hr></div>'
															  + '<div>조회수:'+ count +'</div>'
															  + '<div>작성자:${ loginUser.gitNick }</div>'		
														  	  + '</div>'																			                        	
						                        		}
					                        
					                        $("#content2_3").html(value);
					                        
					                        if (currentPage != 1) {				                        	
						                        $paging.append(				                               
						                                "<li class='page-item'><a class='page-link' onclick=applying(" + (currentPage - 1) + ")>Previous</a></li>"
						                            );
						                        }
						                        
						                        for (let p = startPage; p <= endPage; p++) {
						                            if (p == currentPage) {
						                              $paging.append("<li class='page-item active'><a class='page-link' onclick=applying(" + p  + ")>" + p + "</a></li>");
						                            }else{
						                              $paging.append("<li class='page-item'><a class='page-link' onclick=applying(" + p  + ")>" + p + "</a></li>");
						                            }
						                          } 
						                        
						                        if (currentPage != maxPage) {
						                        	console.log("야되냐3");
						                        	$paging.append(
						                        		    "<li class='page-item'><a class='page-link' onclick=applying(" + (currentPage + 1) + ")>Next</a></li>");
						                          }											
										},error:function(){
											
										}
									});
								}
							</script>

							<div style="display:flex;">								
									<div class="form-group">																				
										<div>
											<select id="name" style="background-color: #ffffff;" class="form-control" id="sel1" name="sellist1">
												<option>기술스택↓</option>
												<option value="java">자바</option>
												<option value="javascript">자바스크립트</option>
												<option value="python">파이썬</option>
												<option value="go">Go</option>
												<option value="django">디장고</option>
											</select>
										</div>										
									</div>
									
									<script>
										function searchProject(selectedName, p){
											$.ajax({
												url:"search.pr",
												data:{keyword:selectedName,
													  cpage:p
													},success:function(map){																																							
													let pi = map.pi;			
							                        let currentPage = pi.currentPage;
							                        let startPage = pi.startPage;
							                        let endPage = pi.endPage;
							                        let maxPage = pi.maxPage;
							                        let $paging = $(".pagination");
							                        
							                        let keyword = map.keyword;
							                      
							                        
							                        $("#content2_3").html("");
							                        $paging.html("");
							                        							                       						                        
							                        let result = map.list1; // array
							                        let result1 = map.stackList; // array
							                        console.log(result);
							                        
							                        let value = "";
							                        
							                        for(let i=0; i<result.length; i++){
							                        let proStatus = result[i].proStatus;
							                        //console.log(i + "status : " + proStatus)
							                        		let rv = result[i];
							                        		
							                        		
							                        		let deadLine = rv.deadLine;
							                        		let proContent = rv.proContent;
							                        		let positoin = rv.positoin; //"zzszs,zszzs,zszszs"
							                        		
							                        		let count = rv.count;
							                        		let prowriter = rv.proWriter;
															let prostack = rv.proStack;
															let pno = rv.proNo;
															
															
							                        		if(proStatus === 'Y'){
							                        			console.log("모집중");
							                        			value += 
									                        		'<div class="plist-div" onclick="location.href=\'detail.pr?pno=' + pno + '\'">'
																	+ '<div class="pro-public">모집중</div>'
																	+ '<br>'
																	+ '<div>마감일:'+deadLine+'</div>'
																	+ '<br>'
																	+ '<div>'+ proContent +'</div>'
																	+ '<br>'						
																	+ '<div class="pro-public1" id="content2_31">';							                        			
							                        		}else{
							                        			console.log("모집완료");
							                        			value += 
									                        		'<div class="plist-div" onclick="location.href=\'detail.pr?pno=' + pno + '\'">'
																	+ '<div class="pro-public" style="background-color: #d9d9d9;">모집마감</div>'
																	+ '<br>'
																	+ '<div>마감일:'+deadLine+'</div>'
																	+ '<br>'
																	+ '<div>'+ proContent +'</div>'
																	+ '<br>'						
																	+ '<div class="pro-public1" id="content2_31">';				                        			
							                        		}
							                        		
															
															let testu = positoin.split(",");
															for(let i =0; i<testu.length; i++){
																value += '<div>'+ testu[i] +'</div>'
															}
															value += '</div>'
															      + '<div style="display: flex; margin-top: 5px;">'
															
															for(let i=0; i<result1.length; i++){
																
																let testt = prostack.split(",");
																
																for(let j=0; j<testt.length; j++){
																	if(testt[j] == result1[i].stackName)
															value += '<div class="stackimg">'
																  + '<img src="'+ result1[i].stackImg +'"></div>'																  
																}
																
															} 
															value += '</div>'
															      + '<div><hr></div>'
																  + '<div>조회수:'+ count +'</div>'
																  + '<div>작성자:${ loginUser.gitNick }</div>'		
															  	  + '</div>'																			                        	
							                        		}							                        	
							                        
							                        $("#content2_3").html(value);
							                        
							                        if(result.length != 0){
							                        	if (currentPage != 1) {						                        	
									                        $paging.append(
									                                "<li class='page-item'><a class='page-link' href='search.pr?cpage=" + (currentPage - 1) + "&keyword=" + keyword + "'>Previous</a></li>"
									                            );
									                        }
									                        
									                        for (let p = startPage; p <= endPage; p++) {
									                            if (p == currentPage) {
									                              $paging.append("<li class='page-item active'><a class='page-link'>"+p+"</a></li>");
									                            } else {
									                              $paging.append("<li class='page-item'><a class='page-link' onclick=searchProject('" + keyword + "'," + p + ")>" + p +"</a></li>");
									                            }
									                          } 
									                        
									                        if (currentPage != maxPage) {
									                        	$paging.append(
									                        		    "<li class='page-item'><a class='page-link' href='search.pr?cpage=" + (currentPage + 1) + "&keyword="+ keyword + "'>Next</a></li>");
									                          }else{
									                        	  $paging.append(
										                        		    "<li class='page-item disabled'><a class='page-link'>Next</a></li>");
									                        	  
									                          }						                        	
							                        }
							                        
							                        if(keyword != null){
							                        	$("#sel1 option[value=" + keyword + "]").attr("selected", true);
							                        }
							                        						  									                        
												}, error:function(){
													console.log("ajax 통신 실패!");
												}
											});
										}									
										
										$('#name').on('change', function(){
											
											let selectedName = $(this).val();
											searchProject(selectedName,1);
										})																
									</script>
														
									
									<div class="repo-create-btn" style="width: 120px; margin-left: 5px;">
										<div><a class="repo-create-btn-color" href="enrollForm.pj">프로젝트 작성</a></div>											
									</div>								
							</div>
						</div>
						<br>


						<div class="middle-div">
							<div id="content2_3">
								<c:forEach var="p" items="${ list }">
									<div class="plist-div" onclick="location.href='detail.pr?pno=${p.proNo}'">
										<c:choose>
											<c:when test="${p.proStatus eq 'Y' }">
												<div class="pro-public">모집중</div>
											</c:when>
											<c:otherwise>
												<div class="pro-public" style="background-color: #d9d9d9;">모집마감</div>
											</c:otherwise>
										</c:choose>
										<br>
										<div>마감일:${ p.deadLine }</div>
										<br>
										<div>${ p.proTitle }</div>
										<br>
	
										<div class="pro-public1" id="content2_31"> <!--style="display: flex; margin-bottom: 10px;"-->
										<c:set var="testu" value="${fn:split(p.positoin, ',')}"></c:set>
												<c:forEach var="textValue" items="${testu}">																														
													<div>${ textValue }</div>
												</c:forEach>																																								
										</div>					
	
										<div id="contentStack">
											<c:forEach var="s" items="${ stackList }">
											<c:set var="testt" value="${fn:split(p.proStack, ',')}"></c:set>
												<c:forEach var="testValue" items="${ testt }">
												<c:if test="${ testValue eq s.stackName }">
													<div class="stackimg"><img src="${ s.stackImg }"></div>
												</c:if>
												</c:forEach>
											</c:forEach>								
										</div>
	
										<div><hr></div>
										<div>조회수:${ p.count }</div>
										<div>작성자:${ p.proWriter }</div>
									</div>
								</c:forEach>							
								
							</div>
						</div>
						<br>
						<br>

						<div class="bottom-div">
							<div class="bottondivdiv">
								<ul class="pagination">
									<c:choose>
										<c:when test="${pi.currentPage eq 1 }">
											<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="list.pj?cpage=${ pi.currentPage - 1 }">Previous</a></li>
										</c:otherwise>
									</c:choose>
									
									<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<c:choose>
											<c:when test="${ pi.currentPage eq p }">
												<li class="page-item active"><a class="page-link" href="list.pj?cpage=${ p }">${ p }</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link" href="list.pj?cpage=${ p }">${ p }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									
									<c:choose>
										<c:when test="${ pi.currentPage eq pi.maxPage }">
											<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="list.pj?cpage=${ pi.currentPage + 1 }">Next</a></li>
										</c:otherwise>
									</c:choose>
								  </ul>						
							</div>	
						</div>
					</div>					
					<jsp:include page="../common/rightBar.jsp"/>										
				</div>
		  </div>
           </div>
        </div>
    </div>
</body>
</html>