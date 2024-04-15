<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
								<div style="width: 90px;" class="testtest"><a href="#" style="color: rgb(2 56 75);">전체</a></div>					
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
								<div class="plist-div" style="width: 270px; height: 320px; border-radius: 25px; border: 2px solid #d4d2d2; background-color:#ffffff;" onclick="location.href='detail.pr'">
									<div class="pro-public">모집중</div>
									<br>
									<div>마감일:2024-10-10</div>
									<br>
									<div>백엔드 개발자 구합니다!</div>
									<br>

									<div class="pro-public1" id="content2_31"> <!--style="display: flex; margin-bottom: 10px;"-->									
											<div>디자이너</div>
											<div>백엔드</div>
											<div>프론트엔트</div>																		
											<div>프론트엔트</div>																																								
									</div>								

									<div style="display: flex; margin-top: 5px;">
										<div class="stackimg"><img src="https://holaworld.io/images/languages/reactnative.svg"></div>
										<div class="stackimg"><img src="https://holaworld.io/images/languages/typescript.svg"></div>
										<div class="stackimg"><img src="https://holaworld.io/images/languages/java.svg"></div>								
									</div>

									<div><hr></div>
									<div>조회수:0</div>
									<div>작성자:박지민</div>
								</div>


								<div class="plist-div" style="width: 270px; height: 320px; border-radius: 25px; border: 2px solid #d4d2d2; background-color:#ffffff;" onclick="location.href='detail.pr'">
									<div class="pro-public">모집중</div>
									<br>
									<div>마감일:2024-10-10</div>
									<br>
									<div>백엔드 개발자 구합니다!</div>
									<br>

									<div style="display: flex; margin-bottom: 10px;" class="pro-public1">
										<div>디자이너</div>
										<div>백엔드</div>
										<div>프론트엔트</div>									
									</div>								

									<div style="display: flex; margin-top: 5px;">
										<div class="stackimg"><img src="https://holaworld.io/images/languages/reactnative.svg"></div>
										<div class="stackimg"><img src="https://holaworld.io/images/languages/typescript.svg"></div>
										<div class="stackimg"><img src="https://holaworld.io/images/languages/java.svg"></div>								
									</div>

									<div><hr></div>
									<div>조회수:0</div>
									<div>작성자:박지민</div>
								</div>

								<div class="plist-div" style="width: 270px; height: 320px; border-radius: 25px; border: 2px solid #d4d2d2; background-color:#ffffff;" onclick="location.href='detail.pr'">
									<div class="pro-public">모집중</div>
									<br>
									<div>마감일:2024-10-10</div>
									<br>
									<div>백엔드 개발자 구합니다!</div>
									<br>

									<div id="content2_31" class="pro-public1">
										<div>디자이너</div>
										<div>백엔드</div>
										<div>프론트엔트</div>									
									</div>								

									<div style="display: flex; margin-top: 5px;">
										<div class="stackimg"><img src="https://holaworld.io/images/languages/reactnative.svg"></div>
										<div class="stackimg"><img src="https://holaworld.io/images/languages/typescript.svg"></div>
										<div class="stackimg"><img src="https://holaworld.io/images/languages/java.svg"></div>								
									</div>

									<div><hr></div>
									<div>조회수:0</div>
									<div>작성자:박지민</div>
								</div>

								<div class="plist-div" style="width: 270px; height: 320px; border-radius: 25px; border: 2px solid #d4d2d2; background-color:#ffffff;" onclick="location.href='detail.pr'">
									<div class="pro-public">모집중</div>
									<br>
									<div>마감일:2024-10-10</div>
									<br>
									<div>백엔드 개발자 구합니다!</div>
									<br>

									<div id="content2_31" class="pro-public1">
										<div>디자이너</div>
										<div>백엔드</div>
										<div>프론트엔트</div>									
									</div>								

									<div style="display: flex; margin-top: 5px;">
										<div class="stackimg"><img src="https://holaworld.io/images/languages/reactnative.svg"></div>
										<div class="stackimg"><img src="https://holaworld.io/images/languages/typescript.svg"></div>
										<div class="stackimg"><img src="https://holaworld.io/images/languages/java.svg"></div>								
									</div>

									<div><hr></div>
									<div>조회수:0</div>
									<div>작성자:박지민</div>
								</div>

								<div class="plist-div" style="width: 270px; height: 320px; border-radius: 25px; border: 2px solid #d4d2d2; background-color:#ffffff;" onclick="location.href='detail.pr'">
									<div class="pro-public">모집중</div>
									<br>
									<div>마감일:2024-10-10</div>
									<br>
									<div>백엔드 개발자 구합니다!</div>
									<br>

									<div id="content2_31" class="pro-public1">
										<div>디자이너</div>
										<div>백엔드</div>
										<div>프론트엔트</div>									
									</div>								

									<div style="display: flex; margin-top: 5px;">
										<div class="stackimg"><img src="https://holaworld.io/images/languages/reactnative.svg"></div>
										<div class="stackimg"><img src="https://holaworld.io/images/languages/typescript.svg"></div>
										<div class="stackimg"><img src="https://holaworld.io/images/languages/java.svg"></div>								
									</div>

									<div><hr></div>
									<div>조회수:0</div>
									<div>작성자:박지민</div>
								</div>

								
							</div>
						</div>
						<br>
						<br>

						<div class="bottom-div">
							<div class="bottondivdiv">
								<ul class="pagination">
									<li class="page-item"><a class="page-link" href="#">Previous</a></li>
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item active"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#">Next</a></li>
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