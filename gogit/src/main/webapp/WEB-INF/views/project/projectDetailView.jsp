<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                    <div style="border:1px solid red; width: 100%; background-color: #ffffff;" class="sideleft-div">

                        <div class="top-div">
                            <div style="display:flex;">
                                <div class="left-div" style="width: 1000px;">
                                        <div>
                                            <h2>모집합니다!</h2>
                                        </div>
                                        <div>
                                            작성자 : 박지민   |   마감일 : 2024-10-20
                                        </div>										                     

                                    <div>
                                        <div>조회수 : 10</div>                                                                    
                                    </div>                      
                                </div>

                                <div class="right-div" style="float: right;">                                                          
                                        <div>
                                            ❤
                                        </div>

                                        <div>
                                            <button>프로젝트 신청완료(취소하기)</button>
                                        </div>                                
                                </div>
                            </div>
                            <hr>
                        </div>

                        <div class="middle-div">
                            <div style="display:flex;">
                                <div class="left-div" style="width: 600px;">	
                                    <div style="display: flex;">							
                                        <div>
                                            모집인원
                                        </div>
                                        <div>
                                            4명
                                        </div>		
                                    </div>									

                                    <div style="display: flex;">
                                        <div>사용 언어</div>
                                        <div>										
                                            파이썬
                                            자바스크립트
                                            flutter
                                        </div>
                                    </div>

                                    <div style="display: flex;">
                                        <div>모집포지션</div>
                                        <div>
                                            디자이너
                                            백엔드
                                            전체
                                        </div>
                                    </div>
                                </div>


                                <div class="right-div">
                                    <div style="display: flex;">    
                                        <div>
                                            모집마감
                                        </div>

                                        <div>
                                            2024-10-12
                                        </div>
                                    </div>

                                    <div style="display: flex;">
                                        <div>시작예정</div>
                                        <div>
                                            2024-04-12
                                        </div>
                                    </div>

                                    <div style="display: flex;">
                                        <div>예상 기간</div>
                                        <div>
                                            2개월
                                        </div> 
                                    </div>                               
                                </div>
                            </div>
                        </div>


                        <div class="bottom-div">
                            <div><h2>프로젝트 소개</h2></div>
                            <hr>
                            <div style="height: 200px;">모집합니다</div>
                            <div><button>뒤로가기</button></div>
                            <hr>

                            <div class="replyAll-div">

                                <div class="form-group">
                                    <div style="margin: auto; width: 500px; display: flex;">
                                        <input type="text" class="form-control" id="content" name="content" placeholder="댓글을 입력하세요">
                                        <div style="width: 150px;"><button>작성</button></div>
                                    </div>
                                </div>

                                <br>

                                <div style="margin: auto; width: 600px; display: flex;">
                                    <div>댓글(0)</div>
                                    <div></div>
                                </div>
                              

                                <div class="reply-div">
                                    <div style="display: flex; margin: auto; width: 600px;">
                                        <div style="width: 150px;">testjimin</div>
                                        <div style="width: 400px;">저 참여할게요!</div>
                                        <div style="width: 200px;">2024-04-12</div>
                                        <div style="width: 150px;"><button>댓글삭제</button></div>
                                    </div>
                                    <hr style="width: 600px; margin: 0px auto;">
                                    <br>
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