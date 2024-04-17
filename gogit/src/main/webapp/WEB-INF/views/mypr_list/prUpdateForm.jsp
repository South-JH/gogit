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
        width: 120px;
        list-style-type: none;
        display: inline-block;
        color: white;
        font-size: 15px;
        margin: 5px;
        border-radius: 50%;
        text-align: center;
        cursor: pointer;
      }
	#front li {
        background-color: #0275d8;
      }
      #back li {
        background-color: #5cb85c;
      }
      #mobile li {
        background-color: #f0ad4e;
      }
      #etc li {
        background-color: #d9534f;
      }
      #myStack li {
        width: 120px;
        list-style-type: none;
        display: inline-block;
        color: white;
        font-size: 15px;
        margin: 5px;
        border-radius: 50%;
        text-align: center;
        cursor: pointer;
        background-color: #5bc0de;
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
             				<td colspan="3"><input class="form-control" type="text" id="prTitle" name="prTitle" value="${ pr.prTitle }">  </td>
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
             				<td colspan="5"><input class="form-control" type="date" id="prTime" name="prTime"></td>
             			</tr>

             			<tr>
             				<td colspan="5">
             					<textarea class="form-control" rows="5" cols="100" name="prContent" style="resize: none; border: none">${ pr.prContent }</textarea>
             				</td>
             			</tr>
             			<input type="hidden" id="prNo" name="prNo" value="${ pr.prNo }">
             			<input type="hidden" id="stackName" name="stackName">
             		</table>
             		<div id="btn-wrap">
	             		   	<button type="submit" class="btn btn-warning">수정하기</button>
	             			<button type="reset" class="btn btn-danger" onclick="deletePr();">취소하기</button>
	             		</div>
	             		
					</form>
             	</div>
             
             </div>
           </div>
        </div>
    </div>
    
    <script>
	    
	    let front = [];
	    let back = [];
	    let mobile = [];
	    let etc = [];
	    	
    
    	$(function(){
    		selectStack();
    		let myPrTime = new Date('${pr.prTime}');

        	$("#prTime").val(myPrTime.toISOString().substring(0,10));
        	
        	$("#myfront").html(myfront);
    		$("#myback").html(myback);
    		$("#mymobile").html(mymobile);
    		$("#myetc").html(myetc);

    	})
    	
    	
    	
    	 function selectStack() {
        let frontval = "";
        let backval = "";
        let mobileval = "";
        let etcval = "";
		let result = true;
        $.ajax({
          url: "select.st",
          success: function (data) {
            Alldata = data;
            for (let i in data) {
              switch (data[i].stackType) {
                case "프론트엔드":
                  front.push(data[i].stackName);
                  break;
                case "백엔드":
                  back.push(data[i].stackName);
                  break;
                case "모바일":
                  mobile.push(data[i].stackName);
                  break;

                default:
                  etc.push(data[i].stackName);
                  break;
              }
            }

            for (let i in front) {
            	for(let j in stackArr){
            		if(front[i].indexOf(stackArr[j])!=-1){
            			result = false;
            		}
            	}
              if(result){
            	  frontval += "<li>" + front[i] + "</li>";
              }
              result = true;
            	 
            }
            $("#front").html(frontval);

            for (let i in back) {
            	for(let j in stackArr){
            		if(back[i].indexOf(stackArr[j])!=-1){
            			result = false;
            		}
            		
            	}
            	if(result){
            	backval += "<li>" + back[i] + "</li>";
            	
            	}
            	result = true;
            }
            $("#back").html(backval);

            for (let i in mobile) {
            	for(let j in stackArr){
            		if(mobile[i].indexOf(stackArr[j])!=-1){
            			result = false;
            		}
            		
            	}
            	if(result){
        			mobileval += "<li>" + mobile[i] + "</li>";
        		}
        		result =true;
            }
            $("#mobile").html(mobileval);

            for (let i in etc) {
            	for(let j in stackArr){
            		if(etc[i].indexOf(stackArr[j])!=-1){
            			result = false;
            		}
            		
            	}
            	if(result){
        			etcval += "<li>" + etc[i] + "</li>";
        		}
        		result = true;
            }
            $("#etc").html(etcval);
          },
        });
      }
    	
    	
    	let stackArr = '${ pr.stackName }'.split(",");
    	let myfront = "";
    	let myback= "";
    	let mymobile = "";
    	let myetc = "";
    	
    	let frontval="";
    	let backval="";
    	let mobileval="";
    	let etcval="";
    	
    	let fval="";
    	let bval="";
    	let mval="";
    	let eval="";
    	
    	for(let i in stackArr){
    		switch (stackArr[i]) {
			case "javascript":
			case "typescript":
			case "react":
			case "vue":
			case "svelte":
			case "nextjs":
				
				myfront+="<li>"+stackArr[i]+"</li>"
				break;
			
			case "java":
			case "spring":
			case "nodejs":
			case "nestjs":
			case "go":
			case "kotlin":
			case "express":
			case "mysql":
			case "mongodb":
			case "python":
			case "django":
			case "php":
			case "graphql":
			case "firebase":
				
				myback+="<li>"+stackArr[i]+"</li>"
				break;
				
			case "flutter":
			case "swift":
			case "eactnative":
			case "unity":
				
				mymobile+="<li>"+stackArr[i]+"</li>"
				break;
				
				
				
			default:
				myetc+="<li>"+stackArr[i]+"</li>"
				break;
			}
    		
		}
    	
    	
    	
    	$("#myfront").on("click","li",function(){
    		
    		for(let i in stackArr){
    			if(stackArr[i] == $(this).text()){
    				stackArr.splice(i,1);
    			}
    		}
    		$("#front").append("<li>"+ $(this).text()+"</li>")
    		
    		$(this).remove();
    		$("#stackName").val(stackArr);
    	})
    	$("#myback").on("click","li",function(){
    		
    		for(let i in stackArr){
    			if(stackArr[i] == $(this).text()){
    				stackArr.splice(i,1);
    			}
    		}
    		$("#back").append("<li>"+ $(this).text()+"</li>")
    		$(this).remove();
    		$("#stackName").val(stackArr);
    	})
    	$("#mymobile").on("click","li",function(){
    		
    		for(let i in stackArr){
    			if(stackArr[i] == $(this).text()){
    				stackArr.splice(i,1);
    			}
    		}
    		$("#mobile").append("<li>"+ $(this).text()+"</li>")
    		$(this).remove();
    		$("#stackName").val(stackArr);
    	})
    	$("#myetc").on("click","li",function(){
    		
    		for(let i in stackArr){
    			if(stackArr[i] == $(this).text()){
    				stackArr.splice(i,1);
    			}
    		}
    		$("#etc").append("<li>"+ $(this).text()+"</li>")
    		$(this).remove();
    		$("#stackName").val(stackArr);
    	})
    	
    	
    	$("#front").on("click", "li", function () {
   			stackArr.push($(this).text());
   			$("#myfront").append("<li>"+$(this).text()+"</li>")
   			frontval="";
   			
   			$(this).remove();
   			$("#stackName").val(stackArr);

        });
        $("#back").on("click", "li", function () {
        	stackArr.push($(this).text());
        	$("#myback").append("<li>"+$(this).text()+"</li>")
        	backval="";
   			$(this).remove();
   			$("#stackName").val(stackArr);
   	
        });
        $("#mobile").on("click", "li", function () {
        	stackArr.push($(this).text());
        	$("#mymobile").append("<li>"+$(this).text()+"</li>")
        	mobileval="";
   			$(this).remove();
   			$("#stackName").val(stackArr);
   			
        });
        $("#etc").on("click", "li", function () {
        	stackArr.push($(this).text());
        	$("#myetc").append("<li>"+$(this).text()+"</li>")
        	etcval="";
   			$(this).remove();
   			$("#stackName").val(stackArr);
   		
        });
        
        
    </script>
</body>
</html>