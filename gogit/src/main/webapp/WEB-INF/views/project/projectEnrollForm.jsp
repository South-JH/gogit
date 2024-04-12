<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.body-wrapper > .container-fluid{max-width:1600px}
</style>

<!-- <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" /> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script> -->



</head>
<body>

	<jsp:include page="../common/sideBar.jsp"/>
	
	<jsp:include page="../common/header.jsp"/>

	<!-- Styles -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css" />
	<!-- Or for RTL support -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.rtl.min.css" />

	<!-- Scripts -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.full.min.js"></script>
	
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
								<div style="display:flex;">
									<div>1</div>
									<div>프로젝트 기본 정보를 입력해주세요</div>
									<div><hr></div>
								</div>

								<div style="display:flex;">
									<div class="left-div">

										<div class="form-group">										
											<div>
												<label for="sel1">모집인원</label>
											</div>
											<div>
												<select class="form-control" id="sel1" name="sellist1">
													<option>인원 미정</option>
													<option>2명</option>
													<option>3명</option>
													<option>4명</option>
													<option>5명</option>
												</select>
											</div>										
										</div>


										<div style="width: 600px;">
											<div>모집포지션</div>
											<div>										
												<select class="form-select" id="multiple-select-field" data-placeholder="" multiple>
													<option>기획자</option>
													<option>데브옵스</option>
													<option>디자이너</option>
													<option>백엔드</option>
													<option>안드로이드</option>
													<option>전체</option>
													<option>프론트엔드</option>
													<option>IOS</option>
													<option>PM</option>
												  </select>
											</div>
										</div>

										<script>											
											$( '#multiple-select-field' ).select2({
											theme: "bootstrap-5",
											width: $( this ).data( 'width' ) ? $( this ).data( 'width' ) : $( this ).hasClass( 'w-100' ) ? '100%' : 'style',
											placeholder: $( this ).data( 'placeholder' ),
											closeOnSelect: false,
											});									
										</script>


										<div>
											<div>기술 스택</div>
											<div>
												<select class="form-select" id="multiple-select-field1" data-placeholder="" multiple>
													<option>aws</option>
													<option>docker</option>
													<option>figma</option>
													<option>firebase</option>
													<option>flutter</option>
													<option>git</option>
													<option>go</option>
												  </select>
											</div>
										</div>


										<script>											
											$( '#multiple-select-field1' ).select2({
											theme: "bootstrap-5",
											width: $( this ).data( 'width' ) ? $( this ).data( 'width' ) : $( this ).hasClass( 'w-100' ) ? '100%' : 'style',
											placeholder: $( this ).data( 'placeholder' ),
											closeOnSelect: false,
											});									
										</script>
									</div>


									<div class="right-div">

										<div class="form-group">
											<div style="width: 600px;">
												<label for="sel1">진행기간</label>
											</div>

											<div>
												<select class="form-control" id="sel1" name="sellist1">
													<option>기간 미정</option>
													<option>2개월</option>
													<option>3개월</option>
													<option>4개월</option>
													<option>5개월</option>
												</select>
											</div>

										</div>

										<div class="form-group">
											<div>모집 마감일</div>
											<div>
												<input type="date" class="form-control" id="endDate" name="endDate">
											</div>
										</div>

										<div class="form-group">
											<div>프로젝트 시작예정일</div>
											<div>
												<input type="date" class="form-control" id="startDate" name="startDate">
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="bottom-div">
								<div style="display: flex;">
									<div>2</div>
									<div>프로젝트</div>
									<div><hr></div>
								</div>

								<div class="form-group" style="width: 1000px;">
									<div>제목</div>
									<div>
										<input type="text" class="form-control" id="content" name="content" placeholder="프로젝트 제목을 입력해주세요.">
									</div>
								</div>

								<div>
									<textarea style="width: 1200px; height: 500px;"></textarea>
								</div>
								<div style="float: right;">
									<button>작성하기</button><button>초기화</button><button>이전으로</button>
								</div>
							

							</div>

						</div>

						<div class="sideright-div">
							<div>
								<div style="border: 1px solid red; width: 300px; height: 300px;">
									<div>TeamMates</div>
									<div>
										팀원목록 보여질 자리
									</div>
								</div>

								<div style="border: 1px solid red; width: 300px; height: 300px;">
									<div>팀원추가</div>
									<div>
										프로젝트에 추가할 팀원을 선택한 후에 하단에 '팀원 추가 하기' 버튼을 눌러주세요!
										(체크: 팀원추가/체크해제: 팀원해제)
									</div>

									<div>
										<input type="text">
									</div>

									<div><button>팀원추가하기</button></div>
								</div>

							</div>
						</div>

						
					</div>
	          </div>
	        </div>
	     </div>
	 </div>


</body>
</html>