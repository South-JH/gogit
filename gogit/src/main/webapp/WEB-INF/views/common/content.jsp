<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.table>tbody>tr{
		cursor: pointer;
	}
	.table>tbody>tr:hover{
		background-color: #FEE1E8
	}
</style>
</head>
<body>

<!--  Body Wrapper -->
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
          <br> <br>
          <div class="row">
          
	          <h3>프로젝트 캘린더</h3>
	          <jsp:include page="../calendar/calendar.jsp" />
            
          </div>
          <br> <hr> <br>
          
          <div class="row">
            <h3>인기 PR LIST</h3>
            <a href="mypr.pr" align="right">▶더보기</a>
            <table class="table">
            	<thead>
            		<tr>
            			<th width="50px">NO</th>
            			<th width="300px">PR 제목</th>
            			<th width="100px">PR 작성자</th>
            			<th width="100px">작성일</th>
            			<th width="100px">조회수</th>
            		</tr>
            	</thead>
            	<tbody></tbody>
            </table>
            
            
          </div>
          <div class="row">
            
          </div>
        </div>
    </div> 
    
    <script>
    	$(function(){
    		prTopList()
    		setInterval(() => {
    			prTopList()
			}, 5000);
    	})
    	
    	function prTopList(){
    		$.ajax({
    			url:"prTop.mp",
    			success:function(data){
    				let value = "";
    				
    				for(let i in data){
    					value += "<tr>"
    								+"<td>"+data[i].prNo+"</td>"
    								+"<td>"+data[i].prTitle+"</td>"
    								+"<td>"+data[i].gitNick+"</td>"
    								+"<td>"+data[i].createDate+"</td>"
    								+"<td>"+data[i].count+"</td>"
    							+"</tr>"
    				}
    				$(".table>tbody").html(value);
    			}
    		})
    		
    		$(".table>tbody").on("click","tr",function(){
    			location.href="detail.mp?bno="+$(this).children().eq(0).text();
    		})
    	}
    </script>
</div>
</body>
</html>