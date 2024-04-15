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

/*숫자 1번 스타일*/
.top-div button, #cssbtn{
        border: 0;
        border-radius: 100px;
       
        color: darkslategray;
        font-weight: 900;
        width: 30px;
        height: 30px;
}

.sideleft-div{
	border-radius: 10px;
}

.select2-container--bootstrap-5 .select2-selection--multiple .select2-selection__choice {
    background-color: rgb(2 56 75);
    color: white !important; 
    border: 1px solid white !important; 
	border-radius: 45px !important;
}
</style>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
</head>
<body>

	<jsp:include page="../common/sideBar.jsp"/>
	
	<jsp:include page="../common/header.jsp"/>

	<!-- Styles -->
	<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" /> -->
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
						<div style="width: 100%; background-color: #ffffff;" class="sideleft-div">

							<div class="top-div" style="padding: 10px;">
								<div style="display:flex;">
									<div style="width: 35px;"><button>1</button></div>
									<div style="margin-top: 5px;"><p>프로젝트 기본 정보를 입력해주세요</p></div>								
								</div>
								<hr>

								<div style="display:flex;">
									<div class="left-div" style="margin-right: 15px;">

										<div class="form-group" style="margin-top: 10px;">										
											<div>
												<label for="sel1">모집인원</label>
											</div>
											<div style="margin-bottom: 10px;">
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
											<div style="margin-bottom: 10px;">										
												<select class="form-select" id="multiple-select-field" data-placeholder="" multiple>
													<option id="">전체</option>
													<option>기획자</option>
													<option>데브옵스</option>
													<option>디자이너</option>
													<option>백엔드</option>
													<option>안드로이드</option>
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
													<option value="JavaScript">JavaScript</option>
													<option value="TypeScript">TypeScript</option>
													<option value="React">React</option>
													<option value="Vue">Vue</option>
													<option value="Nodejs">Nodejs</option>
													<option value="Spring">Spring</option>
													<option value="Java">Java</option>
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
											<div style="width: 600px; margin-top: 10px;">
												<label for="sel1">진행기간</label>
											</div>

											<div style="margin-bottom: 10px;">
												<select class="form-control" id="sel1" name="sellist1">
													<option value="기간미정">기간 미정</option>
													<option value="2개월">2개월</option>
													<option value="3개월">3개월</option>
													<option value="4개월">4개월</option>
													<option value="5개월">5개월</option>
												</select>
											</div>

										</div>

										<div class="form-group">
											<div>모집 마감일</div>
											<div style="margin-bottom: 10px;">
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

							<div class="bottom-div" style="padding: 10px;">
								<div style="display: flex; margin-top: 50px;">
									<div style="width: 35px;"><button id="cssbtn">2</button></div>
									<div style="margin-top: 5px;"><p>프로젝트에 대한 소개해주세요</p></div>
								</div>
								<hr>

								<div class="form-group" style="width: 1000px;">
									<div>제목</div>
									<div>
										<input type="text" class="form-control" id="content" name="content" placeholder="프로젝트 제목을 입력해주세요.">
									</div>
								</div>
								<br>

								<div id="content1" style="margin-bottom: 15px;">
									
								</div>

								<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
								<script>
									const editor = new toastui.Editor({
										el: document.querySelector('#content1'), // 에디터를 적용할 요소 (컨테이너)
										height: '500px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
										initialEditType: 'markdown',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
										// initialValue: '내용을 입력해 주세요.',     // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
										// previewStyle: 'vertical'                // 마크다운 프리뷰 스타일 (tab || vertical)
									});
								</script>


								<div style="float: right;">
									<button class="btn btn-primary" style="background-color: rgb(2 56 75);">작성하기</button><button class="btn btn-primary" style="background-color: rgb(4, 91, 122);">초기화</button><button class="btn btn-primary" style="background-color: rgb(4, 91, 122);">이전으로</button>
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