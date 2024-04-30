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
                                                <h2>${ p.proTitle }</h2>
                                            </div>
                                            <br>
                                            <div>
                                                작성자 : ${ p.proWriter }   |   마감일 : ${p.deadLine }
                                            </div>										                     

                                            <div>
                                                <div>조회수 : ${p.count }</div>                                                                    
                                            </div>                      
                                    </div>

                                    <div class="right-div" style="float: right;">                                                          
                                            <div id="markImg">
                                                <!-- <img src="resources/images/gogit-logo.png" style="width: 95px; height: 70px; margin-left: 40px;"> -->
                                                <!-- <img src="https://holaworld.io/images/info/bookmark.png" style="float:right; padding-right: 40px;" class="bookmark">-->
                                            </div>

                                            <div id="applybtn">
                                                <!-- <button id="eventbtn" class="btn btn-primary btn-sm" style="background-color: rgb(2 56 75);"></button> -->
                                            </div>                                
                                    </div>
                                    
                                                        
                                    <script>
                                    $(function(){
                                    	setInterval(()=>{
                                    		testCircle();
                                    		alarmTest();
                                    	}, 3000);
                                    });
                                    
                                            let value = true;
                                    function alarmTest() {
                                        $.ajax({
                                          url: "alarmTest.me",
                                          data: {},
                                          success: function (data) {
                                            for (let i in data) {
                                              switch (data[i].alarmType) {
                                                case "project":
                                                	if(data[i].alarmContentNo == ${p.proNo}){
                                                		value = false; // 없을때
                                                		break;
                                                	}else{
                                                		value = true; // 있을때
                                                	}
                                                	if(value){
                                                		rejectbtn();                                                 		
                                                	}
                                              }
                                            }
                                          },
                                          error: function () {
                                            console.log("실패");
                                          },
                                        });
                                      }
                                    
                                    function testCircle(value){
                                    	$.ajax({
                                    		url:"teCircle.pr",
                                    		data:{pno:${p.proNo}},
                                    		success:function(data){
                                    			console.log(data)
                                    			data.memId
                                    			if(data.team == value){
                                    			rejectbtn();                                    				
                                    			}
                                    			tata.teamStatus
                                    		}
                                    	})
                                    }
                                    // 내가 프로젝트 작성자가 아니고, teamStatus가 No, 그리고 프로젝트 모집상태가 모집중일때(걍 신청자)
                                   // alert("script read!");
                                    
                                    if('${loginUser.gitNick}' != '${p.proWriter}'){
                                    	if('${loginUser.gitNick}' != '${p.proWriter}' && '${loginUser.teamStatus}' == 'N' && '${p.proStatus}' == 'Y'){
                                        	drawApplyBtn();
                                        	
                                        	// 그냥 프로젝트가 마감되었을때
                                        }else if('${loginUser.gitNick}' != '${p.proWriter}' && '${loginUser.teamStatus}' == 'N' && '${loginUser.teamStatus}' == 'Y' && '${p.proStatus}' == 'N'){
                                        	drawEndBtn();
                                        	
                                        	// 내가 신청한 프로젝트가 아닐 때(중복신청 불가)
                                        }else if('${loginUser.gitNick}' != '${p.proWriter}' && '${loginUser.teamStatus}' == 'S' && '${p.proStatus}' == 'Y' && '${loginUser.team}' != '${p.proNo}'){
                                        	drawNotMyProject();
                                        	
                                        	// 프로젝트 취소할때
                                        }else if('${loginUser.gitNick}' != '${p.proWriter}' && '${loginUser.teamStatus}' == 'S' && '${p.proStatus}' == 'Y' && '${loginUser.team}' == '${p.proNo}'){
                                        	// alert("script function")
                                        	drawCancleBtn();
                                        }                                  	                                 	
                                    	
                                    }else{
                                    	if('${p.proStatus}' == 'Y'){ // 모집중일때 모집마감치고싶을때
                                    		drawProjectApplyComplete();
                                    	}else{ // 모집마감일때, 모집재개
                                    		drawProjectApplyRestart();
                                    	}	
                                    }
                                    
                                    function rejectbtn(){
                                    	$("#applybtn").html('<button id="eventbtn" class="btn btn-primary btn-sm" style="background-color: rgb(2, 56, 75);"></button>')
                                    	$("#eventbtn").text("신청 불가합니다.");
                                    	$("#eventbtn").attr("disabled", true);
                                    	$("#markImg").html('<img src="https://holaworld.io/images/info/bookmark_filled.png" style="float:right; padding-right: 20px;" class="bookmark">');
                                    }
                                    
                                    function drawProjectApplyRestart(){
                                    	$("#applybtn").html('<button id="eventbtn" class="btn btn-primary btn-sm" style="background-color: rgb(2, 56, 75);"></button>')
                                    	$("#eventbtn").text("모집 재개");
                                    	$("#eventbtn").attr("onclick", "projectstart()");
                                    	$("#markImg").html('<img src="https://holaworld.io/images/info/bookmark.png" style="float:right; padding-right: 20px;" class="bookmark">');
                                    }
                                    
                                    
                                    function drawProjectApplyComplete(){
                                    	$("#applybtn").html('<button id="eventbtn" class="btn btn-primary btn-sm" style="background-color: rgb(2, 56, 75);"></button>')
                                    	$("#eventbtn").text("모집 마감");
                                    	$("#eventbtn").attr("onclick", "projectEnd()");   
                                    	$("#markImg").html('<img src="https://holaworld.io/images/info/bookmark_filled.png" style="float:right; padding-right: 20px;" class="bookmark">');                                           
                                    }
                                    
                                    function drawNotMyProject(){
                                    	$("#applybtn").html('<button id="eventbtn" class="btn btn-primary btn-sm" style="background-color: rgb(2, 56, 75);"></button>')
                                    	$("#eventbtn").text("중복신청 불가합니다.");
                                    	$("#eventbtn").attr("disabled", true);
                                    	$("#markImg").html('<img src="https://holaworld.io/images/info/bookmark_filled.png" style="float:right; padding-right: 20px;" class="bookmark">');
                                    }
                                    
                                    function drawEndBtn(){
                                    	$("#applybtn").html('<button id="eventbtn" class="btn btn-primary btn-sm" style="background-color: rgb(2, 56, 75);"></button>')
                                    	$("#eventbtn").text("마감된 프로젝트");
                                    	$("#eventbtn").attr("disabled", true);
                                    	$("#markImg").html('<img src="https://holaworld.io/images/info/bookmark.png" style="float:right; padding-right: 20px;" class="bookmark">');
                                    }
                                    
                                    function drawCancleBtn(){
                                    	$("#applybtn").html('<button id="eventbtn" class="btn btn-primary btn-sm" style="background-color: rgb(2, 56, 75);"></button>')
                                    	$("#eventbtn").text("프로젝트 신청취소")
                                    	$("#eventbtn").attr("onclick", "cancel()");
                                    	$("#markImg").html('<img src="https://holaworld.io/images/info/bookmark_filled.png" style="float:right; padding-right: 20px;" class="bookmark">');                                                                    	                                 
                                    	
                                    }
                                    
                                    function drawApplyBtn(){
                                    	$("#applybtn").html('<button id="eventbtn" class="btn btn-primary btn-sm" style="background-color: rgb(2, 56, 75);"></button>')
                                    	$("#eventbtn").text("프로젝트 신청하기");
                                    	$("#eventbtn").attr("onclick", "apply();");
                                    	$("#markImg").html('<img src="https://holaworld.io/images/info/bookmark.png" style="float:right; padding-right: 20px;" class="bookmark">');
                                    }
                                    
                                    	function apply(){ // 신청하기(신청자입장)                                   	
                                    		$.ajax({
                        						url:"applypro.pr",
                        						data:{pno:${p.proNo},
                        							  userId:${loginUser.memId}},
                        						success:function(result){
                        							if(result > 0){
                        								//alert("apply function!!")
                        								drawCancleBtn();							
                        							}                   					
                        						}, error:function(){
                        							
                        						}
                        					});       
                                    	
                                    		if(socket){
                                    			socket.send("${loginUser.memId},${ p.proContent },${p.proWriter},${p.proNo},project");
                                    		}
                                    	
                                    	}
                                    	
                                    	function cancel(){ // 신청취소(신청자입장)
                                    		//alert("cancel function")
                                    		$.ajax({
                        						url:"cancel.pr",
                        						data:{pno:${p.proNo},
                        							  userId:${loginUser.memId}},
                        						success:function(result){
                        							if(result > 0){
                        								drawApplyBtn();                       								
                        							}                           							
                        						}, error:function(){
                        							
                        						}
                        					});
                                    	
                                    		
                                    	}                                  	
                                    	
                                    	function projectEnd(){ // 프로젝트 마감일때(모집자입장)
                                    		$.ajax({
                        						url:"projectEnd.pr",
                        						data:{pno:${p.proNo},
                        							  userId:${loginUser.memId}},
                        						success:function(result){
                        							drawProjectApplyRestart();
                        						}, error:function(){
                        							
                        						}
                        					});
                                    	}     
                                    	
                                    	function projectstart(){ // 프로젝트 모집재개(모집자입장)
                                    		$.ajax({
                        						url:"projectReStart.pr",
                        						data:{pno:${p.proNo},
                        							  userId:${loginUser.memId}},
                        						success:function(result){
                        							drawProjectApplyComplete();
                        						}, error:function(){
                        							
                        						}
                        					});
                                    	}
                                    	
                                    	function deleteAlarm(){
                                    		$.ajax({
                                    			url:"alDelete.al",
                                    			data:{
                                    				memId:"${loginUser.memId}",
                                    				rmemId:"${p.proWriter}",
                                    				alarmType:"project",
                                    			},
                                    			success:function(data){
                                    				console.log(data)
                                    			}
                                    		})
                                    	}
                                    </script>
  
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
                                                ${ p.proMember }명
                                            </div>		
                                        </div>
                                        <br>									

                                        <div style="display: flex;">                                      
                                            <div style="width: 75px;">사용 언어</div>
                                                <div id="content2_3">
                                                
                                                <c:forEach var="s" items="${ stackList }">
                                                <c:set var="testt1" value="${fn:split(p.proStack, ',')}"></c:set>
                                                	<c:forEach var="testValue1" items="${ testt1 }">
                                                	 	<c:if test="${ testValue1 eq s.stackName }">
                                                    		<button type="button" class="btn" style="border:1px solid lightgray; border-radius: 50px; height: 52px;padding-left: 0; margin-right: 10px;">
                                                        <div style=" border-radius:50px; ">                                                     
                                                            <span class="badge bg-transparent">                                                            
	                                                            <img src="${ s.stackImg }" alt="" style="width:35px; height:35px; ">                                                                                                                
                                                            </span>                                                                                                                                              
                                                            <span style="padding-right: 10px;">${testValue1 }</span>                                                                                                             	
                                                        </div>
                                                    </button>
                                                       </c:if> 
                                                    </c:forEach>
                                                </c:forEach>                                             
                                            </div> 
                                        </div>
                                        <br>

                                        <div style="display: flex;">
                                            <div style="width: 75px;">모집포지션</div>
                                            
                                            <div class="posi-div">
                                            <c:set var="testu" value="${fn:split(p.positoin, ',')}"></c:set>
                                            	<c:forEach var="texttext" items="${ testu }">
	                                                <div class="pro-public">${ texttext }</div>
                                                </c:forEach>
                                            </div>
                                            
                                        </div>
                                    </div>


                                    <div class="right-div">
                                        <div style="display: flex;">    
                                            <div style="width: 75px;">
                                                모집마감
                                            </div>                                  

                                            <div>
                                                ${p.deadLine }
                                            </div>
                                        </div>
                                        <br>

                                        <div style="display: flex;">
                                            <div style="width: 75px;">시작예정</div>
                                            <div>
                                                ${p.startDate }
                                            </div>
                                        </div>
                                        <br>

                                        <div style="display: flex;">
                                            <div style="width: 75px;">예상 기간</div>
                                            <div>
                                                ${p.proPeriod }
                                            </div> 
                                        </div>                               
                                    </div>
                                </div>
                            </div>


                            <div class="bottom-div">
                                <div><h2>프로젝트 소개</h2></div>
                                <hr>
                                <div style="height: 200px;">${ p.proContent }</div> 
                                <div>
                                    <div style="float: right;"><button class="btn btn-primary" style="background-color: rgb(4, 91, 122);" onclick="history.back();">뒤로가기</button></div>
                                		<c:if test="${ loginUser.gitNick eq p.proWriter }">
                                     	<div style="float: right;"><button onclick="deleteprj();" type="button" class="btn btn-warning" style="background-color: rgb(2 56 75);">삭제하기</button><button onclick="updatePr();" type="button" class="btn btn-warning" style="background-color: rgb(2 56 75);">수정하기</button></div>
                                     	</c:if>
                                </div>                        
                                <br>
                                <hr>
                                
                                <script>
                                	function updatePr(){
                                		location.href="updateForm.pr?pno=${p.proNo}"
                                	}
                                	function deleteprj(){
                                		location.href="deleteprj.pr?pno=${p.proNo}"
                                	}
                                	
                                	
                                </script>

                                <div class="replyAll-div">

                                    <div class="form-group">
                                        <div style="margin: auto; width: 500px; display: flex;">
                                            <input type="text" class="form-control" id="content" name="content" placeholder="댓글을 입력하세요">
                                            <div style="width: 150px;"><button onclick="addReply();" class="btn btn-primary" style="background-color: rgb(2 56 75);">작성</button></div>
                                        </div>
                                    </div>

                                    <br>

                                            <div style="margin: auto; width: 600px; display: flex;">
                                                <div>댓글(<span id="rcount">0</span>)</div>
                                                <div></div>
                                            </div>
                                

                                            <div id="replyArea" class="reply-div">
                                                <div style="display: flex; margin: auto; width: 600px;">
                                                    
                                                </div>
                                                <hr style="width: 600px; margin: 0px auto;">
                                                <br>
                                            </div>                              
                                        </div>
                                        
                                        <script>
                                        	$(function(){
                                        		selectReplyList();
                                        	})
                                        	function addReply(){
                                        		if($("#content").val().trim().length != 0){
                                        			$.ajax({
                                        				url:"rinsert.pr",
                                        				data:{
                                        					refProjectNo:${p.proNo},
                                        					repContent:$("#content").val(),
                                        					memId:'${loginUser.memId}'
                                        				},success:function(status){                                    					
                                        					if(status == "success"){
                                        						selectReplyList();
                                        						$("#content").val("");
                                        					}
                                        				}, error:function(){
                                        					console.log("댓글 작성용 ajax 통신 실패");
                                        				}
                                        			})
                                        		}else{
                                        			alertify.alert("댓글 작성 후 등록 요청해주세요!");
                                        		}
                                        	}
                                        	
                                        	function selectReplyList(){
                                        		$.ajax({
                                        			url:"rlist.pr",
                                        			data:{pno:${p.proNo}},
                                        			success:function(list){
                                        				console.log(list)
                                        				
                                        				let value = "";
                                        				
                                        				for (let i in list) {
                                        				    value += "<div style=\"display: flex; margin: auto; width: 600px;\">" +                                     				    	
                                        				             "<div style=\"width: 150px;\">" + list[i].gitNick + "</div>" +
                                        				             "<div style=\"width: 400px;\">" + list[i].repContent + "</div>" +
                                        				             "<div style=\"width: 200px;\">" + list[i].repDate + "</div>" +
                                        				             "<div style=\"width: 150px;\">"
                                        				             	
                                        				             	//console.log('${loginUser.gitNick}')
                                        				             	//console.log(list[i].gitNick)
                                        				            	//console.log('${loginUser.gitNick}' == list[i].gitNick)
                                        				             if('${loginUser.gitNick}' == list[i].gitNick){
                                        				            	    value += "<button id=\"deleterpbtn\" onclick=\"deleterp(" + list[i].replyNo + ")\" class=\"btn btn-primary btn-sm\" style=\"background-color: rgb(2, 56, 75);\">댓글삭제</button>";
                                        				            	}
                                        				            value += "</div></div>" +
                             				             			"<hr style=\"width: 400px; margin: 0px auto;\">"+
                             				             			"<br>"
                                        				             $("#replyArea").html(value);
                                        				             $("#rcount").text(list.length);

                                        				}
                                        			}, error:function(){
                                        				console.log("댓글 리스트 조회용 ajax 통신 실패!");
                                        			}
                                    			
                                        		});
                                        	}
                                        	
                                        	function deleterp(pno){
                                        		console.log(pno)
                                        		$.ajax({
                                        			url:"prdelete.pr",
                                        			data:{pno:pno},
                                        			success:function(status){
                                        				console.log(status)
                                        				if(status == "success"){
                                        					alertify.alert("댓글삭제가 성공적으로 완료되었습니다!");
                                        					selectReplyList(${p.proNo});
                                        				}
                                        			}, error:function(){
                                        				console.log("댓글삭제 실패!")
                                        			}
                                        		})
                                        	}
                                        </script>
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