<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{
		
	}
	#profile{
		width: 300px;
		float: left;
		height: 500px;
		margin-top: 50px;
	}
	#profile img{
		width: 200px;
		height: 200px;
		border-radius: 100%;
	}
	#prDetail{
		width: 500px;
		float: left;
		height: 500px;
		margin-top: 50px;
	}
	#reply-wrap{
		width: 800px;

		margin-top: 50px
	}
	#reply-wrap textarea{
		display: block;
		float: left;
		margin-left: 50px
	}
	#insertReply{
		display: block;
		width: 70px;
		height: 65px;
		float: left;
		margin-left: 10px
	}
	#reply-table{
		margin-left: 50px
	}
	#reply-table>tbody button{
		background-color: transparent;
		border: none
	}
	#stack li{
		width:90px;
		list-style-type: none;
		display:inline-block;
		background-color: #0275d8;
		color:black;
		margin: 5px;
		border-radius: 45%;
		text-align: center;
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
             
             	<div id="profile">
             		<c:choose>
             			<c:when test="${empty memProfile }">
             				<img src="https://media1.tenor.com/m/RSFvAKQkWJoAAAAd/%EC%B6%98%EC%8B%9D-%EC%B6%98%EC%8B%9D%EC%9D%B4.gif">
             			</c:when>
             			<c:otherwise>
             				<img src="${ memProfile }">
             			</c:otherwise>
             		</c:choose>
             		   		
             	</div>
             	<div id="prDetail">
             		<h1>${ pr.gitNick }님의 PR</h1>
             		<table class="table table-bordered">
             			<tr>
             				<th>글번호</th>             				
             				<th colspan="3">PR 제목</th>
             				<th>작성일</th>
             				
             			</tr>
             			<tr>
             				<td>${ pr.prNo } </td>
             				<td colspan="3">${ pr.prTitle } </td>
             				<td>${ pr.createDate } </td>
             			</tr>
             			<tr>
             				<th colspan="5">기술스택</th>
             			</tr>
             			<tr>
             				<td colspan="5" id="stack"><ul></ul></td>
             			</tr>
             			

             			<tr>
             				<td colspan="5">
             					<textarea rows="10" cols="100" readonly style="resize: none; border: none">${ pr.prContent }</textarea>
             				</td>
             			</tr>
             		</table>
             		
             		
             		
             		
             	</div>
             	
             	<div id="reply-wrap">
             		<c:choose>
             			<c:when test="${ empty loginUser }">
             				<textarea rows="3" cols="100" style="resize: none" readonly="readonly">로그인후 이용 가능한 서비스입니다.</textarea>
             			</c:when>
             			<c:otherwise>
             				<textarea rows="3" cols="70" style="resize: none" placeholder="댓글을 입력해주세요"></textarea>
             				<button class="btn btn-primary" id="insertReply" onclick="insertReply();">등록</button>
             			</c:otherwise>
             		</c:choose>
             		
             		<table class="table" id="reply-table">
             			<thead>
             				<tr>
             					<th width="500px">내용</th>
             					<th>작성자</th>
             					<th>작성일</th>
             					<th></th>
             				</tr>
             			</thead>
             			<tbody>
             			
             			</tbody>
             		</table>
             		
             	</div>
             
             	
             </div>
           </div>
        </div>
    </div>
    
    
    <script>
    	let stackArr = '${ pr.stackName }'.split(",");
    	let stack = "";
    	
    	for(let i in stackArr){
			stack += "<li>"+stackArr[i]+"</li>";
		}
    
    
    	$(function(){
    		selectReply()
    		$("#stack").html(stack);
    	})
    	
    	function insertReply(){
    		if($("#reply-wrap>textarea").val().trim().length != 0){
    			
    			$.ajax({
        			url:"rinsert.mp",
        			data:{
        				refPrNo:${pr.prNo},
        				memId:${loginUser.memId},
        				repContent:$("#reply-wrap>textarea").val()
        			},
        			success:function(msg){
        				alert(msg);
        				$("#reply-wrap>textarea").val("");
        				selectReply();
        			},
        			error:function(){
        				
        			}
        			
        		})
    			
    		}
    		
    	}
    	
    	function selectReply(){
    		$.ajax({
    			url:"rselect.mp",
    			data:{bno:${pr.prNo}},
    			success:function(data){
    				let value="";
    				for(let i in data){
    					value+= "<tr>"
    								+"<td>"+data[i].repContent+"</td>"
    								+"<td>"+data[i].gitNick+"</td>"
    								+"<td>"+data[i].repDate+"</td>";
    					if(${loginUser.memId} == data[i].memId){
    						value += "<td><button onclick='deleteReply("+data[i].replyNo+")'>X</button></td>";
    						
    					}
    					
    					
    					value += "</tr>"
    							
    				}
    				$("#reply-table>tbody").html(value);
    				
    			},
    			error:function(){
    				
    			}
    			
    		})
    	}
    	
    	
    	function deleteReply(rno){
    		$.ajax({
    			url:"rdelete.mp",
    			data:{rno:rno},
    			success:function(msg){
    				alert(msg);
    				
    				selectReply();
    			},
    			error:function(){
    				
    			}
    		})
    	}
    </script>
</body>
</html>