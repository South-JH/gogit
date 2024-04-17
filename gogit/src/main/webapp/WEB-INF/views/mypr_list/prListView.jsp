<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		#pagination-wrap{
			display: flex;
   			 align-items: center;
   		 	justify-content: center;
		}
		#searchForm{
			margin-left: 300px
		}
		#searchForm *{
			float: left;
		}
		#searchPr{
			width: 300px
		}
		.row>div{
			margin-top: 50px
		}
	
		.table>thead>tr {
			text-align: center;
		}
		.table>tbody>tr {
			text-align: center;
			cursor: pointer;
		}
		.table>tbody>tr:hover{
			background-color: #f0ad4e;
		}
		
		.pagination>li{
			cursor: pointer;
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
             
             	<div>
             		<h3 class="display-5" align="center">PR</h3>
             		<div id="searchForm" class="form-group">	        
		             		<div class="select">
			                    <select id="condition" class="form-select" name="condition" onchange="searchPr();">
			                        <option value="writer">작성자</option>
			                        <option value="title">제목</option>
			                        <option value="content">내용</option>
			                    </select>
			                </div>
			                <div id="input-wrap">
		             			<input id="searchPr" type="text" name="searchPr" class="form-control" onkeyup="searchPr();" value="${ searchPr }">
		             		</div>
		             		<!-- <button type="button" class="searchBtn btn btn-primary"  onclick="searchPr(1);">검색</button> -->
	             		
             		</div>
             		<button class="btn btn-sm btn-primary" style="float: right;" onclick="location.href='insertForm.mp'">나의 PR 등록</button>
	             	<table class="table">
	             		<thead>
		             		<tr>
		             			<th width="30px"> NO </th>
		             			<th width="300px"> 제목 </th>
		             			<th width="50px"> ID </th>
		             			<th width="30px"> 조회수 </th>
		             		</tr>
	             		</thead>
	             		<tbody></tbody>
	             	</table>
	             	<div id="pagination-wrap">
	             		<div>
		             	<ul class="pagination">
		             	  
						</ul>
						</div>
	             	</div>
             	</div>
             </div>
           </div>
        </div>
    </div>
    
    <script>
    	$(function(){
    		
    		searchPr(1);
    	})
    	
    	
    	function detail(data){
    		location.href="detail.mp?bno="+$(data).children().eq(0).text();
    	}
    	
    	function searchPr(cpage){
    		$.ajax({
    			url:"search.mp",
    			data:{
    				condition:$("#condition").val(),
    				searchPr:$("#searchPr").val(),
    				cpage:cpage,
    			},
    			success:function(data){
    				
    				$(".table>tbody").children().remove();
    				$(".pagination").children().remove();
    				
					let list = "";

    				for(let i in data.list){
    					list+="<tr onclick='detail(this);'>"
    							+"<td>"+data.list[i].prNo+"</td>"
    							+"<td>"+data.list[i].prTitle+"</td>"
    							+"<td>"+data.list[i].gitNick+"</td>"
    							+"<td>"+data.list[i].count+"</td>"
    						+"</tr>"
    				}
    				$(".table>tbody").html(list);
    				
    				
    				// pr 페이지 버튼
    				let page = "";
    				
    				for(let i=data.pi.startPage;i<=data.pi.endPage;i++){
    					page += "<li class='page-item'><a class='page-link' onclick='searchPr("+i+")'>"+i+"</a></li>"
    				}
    				
    				
    				let pagebtn = "";
    				if(data.pi.currentPage == 1){
    					pagebtn+="<li class='page-item disabled'><a class='page-link'>이전</a></li>"
    				}else{
    					pagebtn+="<li class='page-item'><a class='page-link' onclick='searchPr("+(data.pi.currentPage-1)+")'>이전</a></li>"
    				}
    				
    				pagebtn+=page;
    				
    				if(data.pi.currentPage == data.pi.endPage){
    					pagebtn+="<li class='page-item disabled'><a class='page-link'>다음</a></li>"
    				}else{
    					pagebtn+="<li class='page-item'><a class='page-link' onclick='searchPr("+(data.pi.currentPage+1)+")'>다음</a></li>"
    					
    				}
					
		    		$(".pagination").html(pagebtn);		
    			},
    			error:function(){
    				console.log("실패")
    			}
    			
    		})
    	}
    	

    
    </script>
</body>
</html>