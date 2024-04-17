<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .posi-div>div{display: inline-block;}

    .bottom-div{margin-top: 100px;}
    .headerment-div{margin-bottom: 30px;}

    /*모집포지션 div 스타일*/
    .pro-public {
	border: 1px solid #d9d9d9;
	border-radius: 30px;
	width: 80px;
	height: 30px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: 600;
    text-align: center;
    }

    /*일단 안쓰는 스타일임 나중에 필요하면 쓸지도*/
    /* .pro-public1 {
	border: 1px solid red;
	border-radius: 30px;
	width: 120px;
	height: 40px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: 600;
    text-align: center;
    } */


    /*전체 div 스타일*/
    .sideleft-div{padding: 20px;
    border-radius: 10px;}

    /* 사용언어 div 몇개씩 배치할껀지*/
    #content2_3{
	height: auto;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 5px;
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
                    <div>
                        <div class="headerment-div">
                            <h2>Detatil &nbsp; Project</h2>
                        </div>
                    </div>	          	          		
                    <div class="pj-wrap" style="display: flex;">                                   
                        <div style="border:1px solid #f1f0f0; width: 100%; background-color: #ffffff;" class="sideleft-div">

                            <div class="top-div">
                                <div style="display:flex;">
                                    <div class="left-div" style="width: 1000px;">
                                            <div>
                                                <h2>모집합니다!</h2>
                                            </div>
                                            <br>
                                            <div>
                                                작성자 : 박지민   |   마감일 : 2024-10-20
                                            </div>										                     

                                            <div>
                                                <div>조회수 : 10</div>                                                                    
                                            </div>                      
                                    </div>

                                    <div class="right-div" style="float: right;">                                                          
                                            <div>
                                                <img src="resources/images/gogit-logo.png" style="width: 95px; height: 70px; margin-left: 40px;">
                                            </div>

                                            <div>
                                                <button class="btn btn-primary btn-sm" style="background-color: rgb(2 56 75);">프로젝트 신청완료(취소하기)</button>
                                            </div>                                
                                    </div>
                                </div>
                                <hr>
                                <br>
                            </div>

                            <div class="middle-div">
                                <div style="display:flex;">
                                    <div class="left-div" style="width: 600px;">	
                                        <div style="display: flex;">							
                                            <div style="width: 75px;">
                                                모집인원
                                            </div>
                                            <div>
                                                4명
                                            </div>		
                                        </div>
                                        <br>									

                                        <div style="display: flex;">                                      
                                            <div style="width: 75px;">사용 언어</div>
                                                <div id="content2_3">
                                                    <button type="button" class="btn" style="border:1px solid lightgray; border-radius: 50px; height: 52px;padding-left: 0; margin-right: 10px;">
                                                        <div style=" border-radius:50px; ">
                                                            <span class="badge bg-transparent">
                                                                <img src="https://holaworld.io/images/languages/javascript.svg" alt="" style="width:35px; height:35px; ">
                                                            </span>
                                                            <span style="padding-right: 10px;">JavaScript</span>
                                                        </div>
                                                    </button>

                                                    <button type="button" class="btn" style="border:1px solid lightgray; border-radius: 50px; height: 52px;padding-left: 0; margin-right: 10px;">
                                                        <div style=" border-radius:50px; ">
                                                            <span class="badge bg-transparent">
                                                                <img src="https://holaworld.io/images/languages/reactnative.svg" alt="" style="width:35px; height:35px; ">
                                                            </span>
                                                            <span style="padding-right: 10px;">Vue</span>
                                                        </div>
                                                    </button>                                   
                                            
                                                    <button type="button" class="btn" style="border:1px solid lightgray; border-radius: 50px; height: 52px;padding-left: 0; margin-right: 10px;">
                                                        <div style=" border-radius:50px; ">
                                                            <span class="badge bg-transparent">
                                                                <img src="https://holaworld.io/images/languages/figma.svg" alt="" style="width:35px; height:35px; ">
                                                            </span>
                                                            <span style="padding-right: 10px;">Figma</span>
                                                        </div>
                                                    </button>    
                                                    
                                                    <button type="button" class="btn" style="border:1px solid lightgray; border-radius: 50px; height: 52px;padding-left: 0; margin-right: 10px;">
                                                        <div style=" border-radius:50px; ">
                                                            <span class="badge bg-transparent">
                                                                <img src="https://holaworld.io/images/languages/figma.svg" alt="" style="width:35px; height:35px; ">
                                                            </span>
                                                            <span style="padding-right: 10px;">Figma</span>
                                                        </div>
                                                    </button> 
                                            </div> 
                                        </div>
                                        <br>

                                        <div style="display: flex;">
                                            <div style="width: 75px;">모집포지션</div>
                                            <div class="posi-div">
                                                <div class="pro-public">디자이너</div>
                                                <div class="pro-public">백엔드</div>
                                                <div class="pro-public">전체</div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="right-div">
                                        <div style="display: flex;">    
                                            <div style="width: 75px;">
                                                모집마감
                                            </div>                                  

                                            <div>
                                                2024-10-12
                                            </div>
                                        </div>
                                        <br>

                                        <div style="display: flex;">
                                            <div style="width: 75px;">시작예정</div>
                                            <div>
                                                2024-04-12
                                            </div>
                                        </div>
                                        <br>

                                        <div style="display: flex;">
                                            <div style="width: 75px;">예상 기간</div>
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
                                <div style="float: right;"><button class="btn btn-primary" style="background-color: rgb(4, 91, 122);">뒤로가기</button><button type="button" class="btn btn-warning" style="background-color: rgb(2 56 75);">수정하기</button></div>
                                <br>
                                <hr>

                                <div class="replyAll-div">

                                    <div class="form-group">
                                        <div style="margin: auto; width: 500px; display: flex;">
                                            <input type="text" class="form-control" id="content" name="content" placeholder="댓글을 입력하세요">
                                            <div style="width: 150px;"><button class="btn btn-primary" style="background-color: rgb(2 56 75);">작성</button></div>
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
                                                    <div style="width: 150px;"><button class="btn btn-primary btn-sm" style="background-color: rgb(2 56 75);">댓글삭제</button></div>
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