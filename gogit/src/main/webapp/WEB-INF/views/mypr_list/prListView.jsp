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
		.row>div{
			margin-top: 50px
		}
	
		.table>thead>tr {
			text-align: center;
		}
		.table>tbody>tr {
			text-align: center;
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
    		page(1)
    	})
    	
    	function page(cpage){
    		$.ajax({
    			url:"prList.pr",
    			data:{
    				cpage:cpage
    			},
    			success:function(data){
    				
    				// pr 리스트 가져오기
    				let list = "";
    			
    				
    				for(let i in data.list){
    					list+="<tr>"
    							+"<td>"+data.list[i].prNo+"</td>"
    							+"<td>"+data.list[i].prTitle+"</td>"
    							+"<td>"+data.list[i].memId+"</td>"
    							+"<td>"+data.list[i].count+"</td>"
    						+"</tr>"
    				}
    				$(".table>tbody").html(list);
    				
    				
    				// pr 페이지 버튼
    				let page = "";
    				
    				for(let i=data.pi.startPage;i<=data.pi.endPage;i++){
    					page += "<li class='page-item'><a class='page-link' onclick='page("+i+")'>"+i+"</a></li>"
    				}
    				
    				
    				let pagebtn = "";
    				if(data.pi.currentPage == 1){
    					pagebtn+="<li class='page-item disabled'><a class='page-link'>이전</a></li>"
    				}else{
    					pagebtn+="<li class='page-item'><a class='page-link' onclick='page("+(data.pi.currentPage-1)+")'>이전</a></li>"
    				}
    				
    				pagebtn+=page;
    				
    				if(data.pi.currentPage == data.pi.endPage){
    					pagebtn+="<li class='page-item disabled'><a class='page-link'>다음</a></li>"
    				}else{
    					pagebtn+="<li class='page-item'><a class='page-link' onclick='page("+(data.pi.currentPage+1)+")'>다음</a></li>"
    					
    				}
					
		    		$(".pagination").html(pagebtn);		
    				
    				
    			},
    			error:function(){
    				
    			}
    		})
    	}
    
    </script>
</body>
</html>