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
	 #stack-wrap li {
        width: 50px;
        list-style-type: none;
        display: inline-block;
        margin:5px;
        cursor: pointer;
      }
     

      #myStack li {
        width: 50px;
        list-style-type: none;
        display: inline-block;
        margin:5px;
        cursor: pointer;
      }
      
      li>img{
      	width: 50px;
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
             		<h1>PR 수정</h1>
             		<form action="update.mp">
             		<table class="table table-bordered">
             			<tr>
             				<th>글번호</th>             				
             				<th colspan="3">PR 제목</th>
             				<th>작성일</th>
             				
             			</tr>
             			<tr>
             				<td>${ pr.prNo } </td>
             				<td colspan="3"><input class="form-control" type="text" id="prTitle" name="prTitle" value="${ pr.prTitle }" required>  </td>
             				<td>${ pr.createDate } </td>
             			</tr>
             			<tr>
             				<th colspan="5">기술스택</th>
             			</tr>
             			<tr id="stack-wrap">
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
             				<td id="myStack" colspan="5">
             					<label>나의 스택</label>
                   				<br><br>
								<label>프론트엔드</label>
	             				<ul id="myfront"></ul>
	             				<label>백엔드</label>
	             				<ul id="myback"></ul>
	             				<label>모바일</label>
	             				<ul id="mymobile"></ul>
	             				<label>기타</label>
	             				<ul id="myetc"></ul>
             				</td>
             			</tr>
             			<tr>
             				<th colspan="5">프로젝트 가능시간</th>
             			</tr>
             			<tr>
             				<td colspan="5"><input class="form-control" type="date" id="prTime" name="prTime" required></td>
             			</tr>

             			<tr>
             				<td colspan="5">
             					<textarea class="form-control" rows="5" cols="100" name="prContent" style="resize: none; border: none" required>${ pr.prContent }</textarea>
             				</td>
             			</tr>
             			<input type="hidden" id="prNo" name="prNo" value="${ pr.prNo }">
             			<input type="hidden" id="stackName" name="stackName">
             		</table>
             		<div id="btn-wrap">
	             		   	<button id="updatePr" type="submit" class="btn btn-warning">수정하기</button>
	             			<button type="button" class="btn btn-danger" onclick="location.href='detail.mp?bno=${pr.prNo}'">취소하기</button>
	             		</div>
	             		
					</form>
             	</div>
             
             </div>
           </div>
        </div>
    </div>
    
    <script>
    	let front=[];
    	let back=[];
    	let mobile=[];
    	let etc=[];
    	let frontImg = [];
        let backImg = [];
        let mobileImg = [];
        let etcImg = [];
        let stackArr=[];
        let myfront=[];
        let myback=[];
        let mymobile=[];
        let myetc=[];
    
	    $(function(){	    	
	    	myStackList()
	    	$("#prTime").val('${pr.prTime}');
	    })
	    
	    function allstackList(){
    	  $.ajax({
    		  url:"select.st",
    		  success:function(data){
    			  
    			  for(let i in data){
    				  switch (data[i].stackType) {
					case "프론트엔드":
						front.push(data[i].stackName);
						frontImg.push(data[i].stackImg);
						for(let i in myfront){
							let num = front.indexOf(myfront[i])
							if(num != -1){
								front.splice(num,1);
								frontImg.splice(num,1);
							}
						}
						
						break;
					case "백엔드":
						back.push(data[i].stackName);
						backImg.push(data[i].stackImg);
						for(let i in myback){
							let num = back.indexOf(myback[i])
							if(num != -1){
								back.splice(num,1);
								backImg.splice(num,1);
							}
						}
						break;
					case "모바일":
						mobile.push(data[i].stackName);
						mobileImg.push(data[i].stackImg);
						for(let i in mymobile){
							let num = mobile.indexOf(mymobile[i])
							if(num != -1){
								mobile.splice(num,1);
								mobileImg.splice(num,1);
							}
						}
						break;

					default:
						etc.push(data[i].stackName);
						etcImg.push(data[i].stackImg);
						for(let i in myetc){
							let num = etc.indexOf(myetc[i])
							if(num != -1){
								etc.splice(num,1);
								etcImg.splice(num,1);
							}
						}
						break;
					}
    			  }
    		
    			  
    			   for(let i in front){

    				  $("#front").append("<li><img src='"+frontImg[i]+"' title='"+front[i]+"'></li>")
    			  }
    			   for(let i in back){
     				  $("#back").append("<li><img src='"+backImg[i]+"' title='"+back[i]+"'></li>")
     			  }   	
    			   for(let i in mobile){
     				  $("#mobile").append("<li><img src='"+mobileImg[i]+"' title='"+mobile[i]+"'></li>")
     			  }   	
    			   for(let i in etc){
     				  $("#etc").append("<li><img src='"+etcImg[i]+"' title='"+etc[i]+"'></li>")
     			  }   	
    		  }
    	  })
      }
	    
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
							$("#myfront").append("<li><img src='"+data[i].stackImg+"' title='"+data[i].stackName+"'>")
							stackArr.push(data[i].stackName)
							myfront.push(data[i].stackName)
							break;
						case "백엔드":
							$("#myback").append("<li><img src='"+data[i].stackImg+"' title='"+data[i].stackName+"'>")
							stackArr.push(data[i].stackName)
							myback.push(data[i].stackName)
							break;
						case "모바일":
							$("#mymobile").append("<li><img src='"+data[i].stackImg+"' title='"+data[i].stackName+"'>")
							stackArr.push(data[i].stackName)
							mymobile.push(data[i].stackName)
							break;

						default:
							$("#myetc").append("<li><img src='"+data[i].stackImg+"' title='"+data[i].stackName+"'>")
							stackArr.push(data[i].stackName)
							myetc.push(data[i].stackName)
							break;
						}
	    			}
	    			allstackList()
	    		}
	    	})
	    }
	    
	    $("#myfront").on("click","li",function(){
	    	let num = stackArr.indexOf($(this).children().attr("title"))
	    	if(num != -1){
	    		stackArr.splice(num,1);
	    	}
			if(stackArr.length == 0){
	    		$("#updatePr").attr("disabled",true)
	    	}
	    	$("#front").append("<li>"+$(this).html()+"</li>")
	    	$(this).remove();
	    	$("#stackName").val(stackArr);
	    	
	    })
	    $("#myback").on("click","li",function(){
	    	let num = stackArr.indexOf($(this).children().attr("title"))
	    	if(num != -1){
	    		stackArr.splice(num,1);
	    	}
			if(stackArr.length == 0){
	    		$("#updatePr").attr("disabled",true)
	    	}
	    	$("#back").append("<li>"+$(this).html()+"</li>");
	    	$(this).remove();
	    	$("#stackName").val(stackArr);
	    	
	    })
	    $("#mymobile").on("click","li",function(){
	    	let num = stackArr.indexOf($(this).children().attr("title"))
	    	if(num != -1){
	    		stackArr.splice(num,1);
	    	}
			if(stackArr.length == 0){
	    		$("#updatePr").attr("disabled",true)
	    	}
	    	$("#mobile").append("<li>"+$(this).html()+"</li>");
	    	$(this).remove();
	    	$("#stackName").val(stackArr);
	    	
	    })
	    $("#myetc").on("click","li",function(){
	    	let num = stackArr.indexOf($(this).children().attr("title"))
	    	if(num != -1){
	    		stackArr.splice(num,1);
	    	}
			if(stackArr.length == 0){
	    		$("#updatePr").attr("disabled",true)
	    	}
	    	$("#etc").append("<li>"+$(this).html()+"</li>");
	    	$(this).remove();
	    	$("#stackName").val(stackArr);
	    	
	    })
	    
	    
	    
	    $("#front").on("click","li",function(){
	    	stackArr.push($(this).children().attr("title"))
			if(stackArr.length != 0){
	    		$("#updatePr").attr("disabled",false)
	    	}
	    	$("#myfront").append("<li>"+$(this).html()+"</li>")
	    	$(this).remove();
	    	$("#stackName").val(stackArr);
	    })
	    $("#back").on("click","li",function(){
	    	stackArr.push($(this).children().attr("title"))
			if(stackArr.length != 0){
	    		$("#updatePr").attr("disabled",false)
	    	}
	    	$("#myback").append("<li>"+$(this).html()+"</li>")
	    	$(this).remove();
	    	$("#stackName").val(stackArr);
	    })
	    $("#mobile").on("click","li",function(){
	    	stackArr.push($(this).children().attr("title"))
			if(stackArr.length != 0){
	    		$("#updatePr").attr("disabled",false)
	    	}
	    	$("#mymobile").append("<li>"+$(this).html()+"</li>")
	    	$(this).remove();
	    	$("#stackName").val(stackArr);
	    })
	    $("#etc").on("click","li",function(){
	    	stackArr.push($(this).children().attr("title"))
			if(stackArr.length != 0){
	    		$("#updatePr").attr("disabled",false)
	    	}
	    	$("#myetc").append("<li>"+$(this).html()+"</li>")
	    	$(this).remove();
	    	$("#stackName").val(stackArr);
	    })
	    
    </script>
</body>
</html>