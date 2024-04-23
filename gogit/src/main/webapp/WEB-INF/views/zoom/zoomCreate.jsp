<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.text-success{
		margin-top: 50px;
	}
	#form-wrap{
		width: 500px;
	}
	.btn-wrap{
		margin-left: 150px;
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

             	
             	<div id="form-wrap">
             		<h3 class="text-success">Zoom 회의 생성</h3>
             	<br><br><br>

             		<label for="email">사용이메일:</label>
   					<input type="email" class="form-control" placeholder="이메일 주소를 입력해주세요" id="email">
   					<br><br>
   					<label for="title">회의 방 제목:</label>
   					<input type="text" class="form-control" id="title" placeholder="회의 주제를 입력해주세요">
   					<br><br>
   					<label for="password">회의 방 비밀번호:</label>
   					<input type="text" class="form-control" id="password" placeholder="회의 방 비밀번호를 입력해주세요">
   					<br><br>
   					<div class="btn-wrap">
	   					<button class="btn btn-primary" onclick="test('${code}')">회의 생성</button>
	   					<button class="btn btn-danger">취소</button>
   					</div>
             	</div>
             	
             	
             </div>
           </div>
        </div>
    </div>
    
    <script>
    	function test(code){
    		$.ajax({
    			url:"zoomTest.zo",
    			data:{
    				code:code,
    			},
    			success:function(accessToken){
    				zoomMeeting(accessToken);
    			}
    		})
    	}
    	
    	function zoomMeeting(accessToken){
    		$.ajax({
    			url:"zoomMeeting.zo",
    			data:{
    				accessToken:accessToken,
    				email:$("#email").val(),
    				title:$("#title").val(),
    				password:$("#password").val()
    			},
    			success:function(data){
    				console.log(data)
    				if(socket){
    					socket.send("${loginUser.memId},줌 회의가 시작되었습니다.,${loginUser.team},,zoom,"+data.start_url+","+data.join_url);
    				}
    				location.href='main';
    			}
    		})
    	}
    </script>
</body>
</html>