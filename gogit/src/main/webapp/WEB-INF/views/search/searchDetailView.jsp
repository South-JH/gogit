<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .avatar-user {
        border-radius: 50%; !important
    }
    .reponame{
        color:#0969da;
        font-weight: 600;
    }
    .contentfont{
        font-size: 0.75rem;
    }
    .publicfont{
        color: #636c76;
        font-size: 0.75rem;
        line-height: 18px;
        font-weight: 500;
    }
    .repdo-language-color{
        position: relative;
        top: 1px;
        width: 12px;
        height: 12px;
        border: 1px solid #d0d7deb3;
        border-radius: 50%;
        /* background-color: #b07219; */
    }
    .nickName-div{
        font-size: 20px;
        color: #636c76;
    }
    .btn-block{
        text-align: center;
        width: 100%;
        display: block;
    }
    .btn1{
        background-color: #f6f8fa;
        border-color: #d0d7de;
        font-size: 14px;
        border: 1px solid #d0d7de;
        border-radius: 6px;
        line-height: 20px;
        height: 30px;
        color: #24292f;
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
   
         <div class="container-fluid">
             <!--  Row 1 -->
             <div class="row">
                <div class="searchdetail-wrap">
                    <div class="top-div">
                        <div style="display: flex;">
                            <div style="width: 296px;">
                                <div>
                                	<img style="height:auto;" alt="View hijimin's full-sized avatar" src="${avatar}" width="260" height="260" class="avatar avatar-user width-full border color-bg-default">
								</div>
								<br>
                                <div class="nickName-div">${nickName}</div>
                                <br>
                                <div>
                                	<c:choose>
	                                	<c:when test="${ isFollow }">
	                                		<input type="button" value="Unfollow" class="btn1 btn-block" onclick="unfollow();">
	                                	</c:when>
	                                	<c:otherwise>
	                                		<input type="button" value="Follow" class="btn1 btn-block" onclick="follow();">
	                                	</c:otherwise>
                                	</c:choose>
                                	<script>
                                		function follow() {
                                			$.ajax({
                                				url: 'follow.me',
                                				data: {nickname: '${nickName}'},
                                				success: function(result) {
                                					if(result) {
                                						$('input[value=Follow]').attr('onclick', 'unfollow();');
                                						$('input[value=Follow]').val('Unfollow');
                                						
                                					} else {
                                						alertify.alert('Follow 실패');
                                					}
                                				},
                                				error: function() {
                                					console.log('follow ajax 호출 실패');
                                				}
                                			});
                                		}
                                		
                                		function unfollow() {
                                			$.ajax({
                                				url: 'unfollow.me',
                                				data: {nickname: '${nickName}'},
                                				success: function(result) {
                                					if(result) {
                                						$('input[value=Unfollow]').attr('onclick', 'follow();');
                                						$('input[value=Unfollow]').val('Follow');
                                						
                                					} else {
                                						alertify.alert('Unfollow 실패');
                                					}
                                				},
                                				error: function() {
                                					console.log('unfollow ajax 호출 실패');
                                				}
                                			});
                                		}
                               		</script>
                               	</div>
                                <div>
                                    <a href="#">🚻1 follwer ·</a>
                                    <a href="#">0 following</a>                                     
                                </div>
                            </div>
                            <div style="margin-left: 20px;">
                                <div><h2>Popular repositiry</h2></div>
						<c:choose>
					    <c:when test="${empty list}">
					        <div class="repo-div" style="width: 440px; height:140px; border: 1px solid #d0d7de; border-radius: 0.375rem; padding: 16px;">
					            <div>${nickName } doesn't have any public repositories yet.</div>                                                                
					        </div>                                 
					    </c:when>
					    <c:otherwise>
					        <c:forEach var="s" items="${list}">
					            <div class="repo-div" style="width: 440px; height:140px; border: 1px solid #d0d7de; border-radius: 0.375rem; padding: 16px;">
					                <div style="display: flex;">
					                    <div class="reponame" style="width: 370px; margin-bottom: 10px;">${s.name}</div>
					                    <div>
					                        <div style="width: 60px; height: 20px; border-radius: 2em; border: 1px solid #d0d7de; padding:0 7px;">
					                            <span class="publicfont">${s.visibility}</span> 
					                        </div>
					                    </div>
					                </div>
					
					                <div class="contentfont" style="margin-bottom: 20px;">${s.description}</div>
					                <div>
					                    <div style="display: flex; align-items:center">
					                        <c:if test="${not empty s.language}">
					                            <div style="width: 15px;">
					                                <div class="repdo-language-color"></div>    
					                            </div>                                       
					                        </c:if>
					                        <div>${s.language}</div> 
					                    </div>   
					                </div>                                  
					            </div>
					            <br>
					        </c:forEach>
					    </c:otherwise>
					</c:choose>
                                
                                <script>
                                   	function getRandomColor() {
                                   	    var letters = '0123456789ABCDEF';
                                   	    var color = '#';
                                   	    for (var i = 0; i < 6; i++) {
                                   	        color += letters[Math.floor(Math.random() * 16)];
                                   	    }
                                   	    return color;
                                   	}

                                   	// 각 요소에 무작위 색상 할당
                                   	document.querySelectorAll('.repdo-language-color').forEach(function(element) {
                                   	    var randomColor = getRandomColor();
                                   	    element.style.backgroundColor = randomColor;
                                   	});
                                  </script>
                             
                                <div style="margin-top: 20px;">358 contributions in the last year</div>
                                <div class="green-div">
                                    <div>
                                        <img src="https://ghchart.rshah.org/${ nickName }">
                                    </div>
                                </div>
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