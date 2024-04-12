<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#content2_3 {
	height: auto;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 15px;
	}
	#content2_3>div:hover {
    transition: all 0.5s ease;
	-webkit-transform: scale(1.1);
	transform: scale(1.1);

	/* transition: all 3s;
  	transform: rotate(360deg); */
	}
	.teamMates, .rightBar-div>div{text-align: center;}
	.topmenu-div{font-weight: 900; font-size: 25px;}
	.repo-create-btn {
	background-color: rgb(36, 87, 228);
	border: 1px solid #e6e6e6;
	border-radius: 6px;
	height: 35px;
	width: 100px;
	font-weight: 600;
	cursor: pointer;
	}

	.repo-create-btn-color {
		color: white;
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
   
         <div class="container-fluid" style="max-width:1600px;">
             <!--  Row 1 -->
             <div class="row" style="display: flex;">	          	          		
				<div class="pj-wrap" style="display: flex;">
					<div style="border:1px solid red; width: 100%;" class="sideleft-div">

						<div class="top-div">
							<div class="topmenu-div" style="display:flex;">
								<div style="width: 90px;"><a>전체</a></div>					
								<div style="width: 100px;"><a>모집 중</a></div>
								<div style="width: 120px;"><a>모집 완료</a></div>
							</div>
							<br>
							<br>

							<div style="display:flex;">
								
									<div class="form-group">																				
										<div>
											<select class="form-control" id="sel1" name="sellist1">
												<option>기술스택</option>
												<option>자바</option>
												<option>자바스크립트</option>
												<option>파이썬</option>
												<option>Go</option>
											</select>
										</div>										
									</div>
									
									<div class="repo-create-btn" style="width: 120px; margin-left: 5px;">
										<div><a class="repo-create-btn-color" href="enrollForm.pj">프로젝트 작성하기</a></div>											
									</div>								
							</div>
						</div>
						<br>


						<div class="middle-div">
							<div id="content2_3">
								<div class="plist-div" style="width: 250px; height: 300px; border-radius: 25px; border: 2px solid #d4d2d2; background-color:#ffffff;" onclick="location.href='detail.pr'">
									<div>모집중</div>
									<div>마감일:2024-10-10</div>
									<div>백엔드 개발자 구합니다!</div>
									<div>백엔드</div>
									<div>js,파이썬 그림</div>
									<div><hr></div>
									<div>조회수:0</div>
									<div>작성자:박지민</div>
								</div>

								<div class="plist-div" style="width: 250px; height: 300px; border-radius: 25px; border: 2px solid #d4d2d2; background-color:#ffffff;">
									<div>모집중</div>
									<div>마감일:2024-10-10</div>
									<div>백엔드 개발자 구합니다!</div>
									<div>백엔드</div>
									<div>js,파이썬 그림</div>
									<div><hr></div>
									<div>조회수:0</div>
									<div>작성자:박지민</div>
								</div>

								<div class="plist-div" style="width: 250px; height: 300px; border-radius: 25px; border: 2px solid #d4d2d2; background-color:#ffffff;">
									<div>모집중</div>
									<div>마감일:2024-10-10</div>
									<div>백엔드 개발자 구합니다!</div>
									<div>백엔드</div>
									<div>js,파이썬 그림</div>
									<div><hr></div>
									<div>조회수:0</div>
									<div>작성자:박지민</div>
								</div>

								<div class="plist-div" style="width: 250px; height: 300px; border-radius: 25px; border: 2px solid #d4d2d2; background-color:#ffffff;">
									<div>모집중</div>
									<div>마감일:2024-10-10</div>
									<div>백엔드 개발자 구합니다!</div>
									<div>백엔드</div>
									<div>js,파이썬 그림</div>
									<div><hr></div>
									<div>조회수:0</div>
									<div>작성자:박지민</div>
								</div>

								<div class="plist-div" style="width: 250px; height: 300px; border-radius: 25px; border: 2px solid #d4d2d2; background-color:#ffffff;">
									<div>모집중</div>
									<div>마감일:2024-10-10</div>
									<div>백엔드 개발자 구합니다!</div>
									<div>백엔드</div>
									<div>js,파이썬 그림</div>
									<div><hr></div>
									<div>조회수:0</div>
									<div>작성자:박지민</div>
								</div>
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