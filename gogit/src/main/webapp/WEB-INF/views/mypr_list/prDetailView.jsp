<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

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
		width: 700px;
		float: left;
		height: auto;
		margin-top: 50px;
	}
	#reply-wrap{
		width: 800px;
		margin-top: 50px;

	}
	#reply-wrap textarea{
		display: block;
		float: left;
		margin-left: 150px
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
	 #stack li {
        width: 50px;
        list-style-type: none;
        display: inline-block;
        margin:5px;
        cursor: pointer;
      }
      li>img{
      	width: 50px;
      }
	#btn-wrap>button{
		margin: 10px
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
             		<br>
             		<br>
             		<br>
             		<c:if test="${ loginUser.memId eq pr.memId}">
	             		<div id="btn-wrap">
	             		   	<button class="btn btn-warning" onclick="updatePr();">수정하기</button>
	             			<button class="btn btn-danger" onclick="deletePr();">삭제하기</button>
	             		</div>
             		</c:if>
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
             				<td colspan="5" id="stack">
             				<label>프론트엔드</label>
             				<ul id="front"></ul>
             				<label>백엔드</label>
             				<ul id="back"></ul>
             				<label>모바일</label>
             				<ul id="mobile"></ul>
             				<label>기타</label>
             				<ul id="etc"></ul>
             				
             				</td>
             			</tr>
             			<tr>
             				<th colspan="5">프로젝트 가능시간</th>
             			</tr>
             			<tr>
             				<td colspan="5">${ pr.prTime }</td>
             			</tr>

             			<tr>
             				<td colspan="5">
             					<textarea class="form-control" rows="5" cols="100" readonly style="resize: none; border: none">${ pr.prContent }</textarea>
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
             				<textarea rows="3" cols="70" style="resize: none" placeholder="댓글을 입력해주세요" onkeydown="enter();"></textarea>
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
    
    
  
    
    
    <div class="modal fade" id="deletePr" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="title">※주의※</h5>
                    
                </div>
                <div class="modal-body">
                   	<label>삭제하면 데이터를 다시 복원할 수 없습니다. 정말 삭제하시겠습니까?</label>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" id="Prdelete">삭제</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="close">취소</button>
                </div>
    
            </div>
        </div>
    </div>
    
    
    
      <script>
    	function updatePr(){
    		location.href="updateForm.mp?prNo=${pr.prNo}";
    	}
    	
    	function deletePr(){
    		$("#deletePr").modal("show");
    		$("#Prdelete").click(function(){
    			location.href="delete.mp?prNo=${pr.prNo}";
    		})
    		 $("#close").on("click",function(){
 				$("#deletePr").modal("hide");
 			}) 
    	}
    
    </script>
    
    
    <script>

    
    
    	$(function(){
    		myStackList()
    		selectReply()	
    	})
    	
    	function myStackList(){
	    	$.ajax({
	    		url:"mystack.mp",
	    		data:{
	    			prNo:"${ pr.prNo }"
	    		},
	    		success:function(data){
	    			for(let i in data){
	    				switch (data[i].stackType) {
						case "프론트엔드":
							$("#front").append("<li><img src='"+data[i].stackImg+"' title='"+data[i].stackName+"'>")
							break;
						case "백엔드":
							$("#back").append("<li><img src='"+data[i].stackImg+"' title='"+data[i].stackName+"'>")
							break;
						case "모바일":
							$("#mobile").append("<li><img src='"+data[i].stackImg+"' title='"+data[i].stackName+"'>")
							break;

						default:
							$("#etc").append("<li><img src='"+data[i].stackImg+"' title='"+data[i].stackName+"'>")
							break;
						}
	    			}
	    		}
	    	})
	    }
    	
    	
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
    	
    	function enter() {
			if(window.event.keyCode==13){
				insertReply()
			}
		}
    </script>
</body>
</html>