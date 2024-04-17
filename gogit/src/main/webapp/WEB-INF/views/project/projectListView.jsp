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
								<div style="width: 90px;" class="testtest"><a href="test.pr" style="color: rgb(2 56 75);">전체</a></div>					
								<div style="width: 100px;"><a href="#" style="color: lightgray;">모집 중</a></div>
								<div style="width: 120px;"><a href="#" style="color: lightgray;">모집 완료</a></div>
							</div>
							<br>
							<br>

							<div style="display:flex;">
								
									<div class="form-group">																				
										<div>
											<select style="background-color: #ffffff;" class="form-control" id="sel1" name="sellist1">
												<option>기술스택↓</option>
												<option>자바</option>
												<option>자바스크립트</option>
												<option>파이썬</option>
												<option>Go</option>
											</select>
										</div>										
									</div>
									
									<div class="repo-create-btn" style="width: 120px; margin-left: 5px;">
										<div><a class="repo-create-btn-color" href="enrollForm.pj">프로젝트 작성</a></div>											
									</div>								
							</div>
						</div>
						<br>


						<div class="middle-div">
							<div id="content2_3">
								<c:forEach var="p" items="${ list }">
									<div class="plist-div" style="width: 270px; height: 350px; border-radius: 25px; border: 2px solid #d4d2d2; background-color:#ffffff;" onclick="location.href='detail.pr'">
										<div class="pro-public">모집중</div>
										<br>
										<div>마감일:${ p.deadLine }</div>
										<br>
										<div>${ p.proContent }</div>
										<br>
	
										<div class="pro-public1" id="content2_31"> <!--style="display: flex; margin-bottom: 10px;"-->
										<c:set var="testu" value="${fn:split(p.positoin, ',')}"></c:set>
												<c:forEach var="textValue" items="${testu}">																														
													<div>${ textValue }</div>
												</c:forEach>																																								
										</div>					
	
										<div style="display: flex; margin-top: 5px;">
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
										<div>조회수:0</div>
										<div>작성자:${ loginUser.gitNick }</div>
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
										<li class="page-item"><a class="page-link" href="list.pj?cpage=${ p }">${ p }</a></li>
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