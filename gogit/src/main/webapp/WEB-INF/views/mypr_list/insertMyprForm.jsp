<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style>
      #form-wrap form {
        margin-top: 50px;
      }
      #stack-wrap {
        border: 1px solid gray;
        border-radius: 5px;
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
      data-header-position="fixed"
    >
      <!--  Main wrapper -->
      <div class="body-wrapper">
        <div class="container-fluid">
          <!--  Row 1 -->
          <div class="row">
            <h3>나의 PR 등록</h3>
            <div id="form-wrap">
              <form action="insert.mp">
                <div class="form-group">
                  <label for="prTitle">PR 제목</label>
                  <input
                    type="text"
                    class="form-control"
                    id="prTitle"
                    style="width: 500px"
                    name="prTitle"
                    required
                  />
                  <br /><br />
                  <label for="prTime">프로젝트 가능시간</label>
                  <input
                    type="date"
                    class="form-control"
                    id="prTime"
                    style="width: 500px"
                    name="prTime"
                    required
                  />
                  <br /><br />

                  <label>기술스택 - 아래에서 선택해주세요</label>
                  <br /><br />
                  <div id="stack-wrap">
                    <br />
                    <div id="front-wrap">
                      <label>프론트엔드</label>
                      <div id="front">
                        <ul></ul>
                      </div>
                    </div>
                    <div id="back-wrap">
                      <label>백엔드</label>
                      <div id="back"><ul></ul></div>
                    </div>
                    <div id="mobile-wrap">
                      <label>모바일</label>
                      <div id="mobile"><ul></ul></div>
                    </div>
                    <div id="etc-wrap">
                      <label>기타</label>
                      <div id="etc"><ul></ul></div>
                    </div>
                  </div>

                  <br /><br />
                  <div id="myStack-wrap">
                    <label>나의 스택</label>
                    <div id="myStack">
                      <label>프론트엔드</label>
                      <ul id="myfront"></ul>
                      <label>백엔드</label>
                      <ul id="myback"></ul>
                      <label>모바일</label>
                      <ul id="mymobile"></ul>
                      <label>기타</label>
                      <ul id="myetc"></ul>
                    </div>
                  </div>
                </div>

                <input type="hidden" name="stackName" id="stackName" />

                <input
                  type="hidden"
                  name="memId"
                  id="memId"
                  value="${ loginUser.memId }"
                  required
                />
                <br />
                <br />
                <br />
                <br />
                <br />

                <label for="prContent">PR내용</label>
                <br /><br />
                <textarea
                  class="form-control"
                  name="prContent"
                  id="prContent"
                  cols="100"
                  rows="10"
                  placeholder="내용 입력"
                  style="resize: none"
                  required
                ></textarea>
                <div align="center">
                  <button id="insertBtn" class="btn btn-danger" disabled>
                    등록하기
                  </button>
                  <button id="reset" type="reset" class="btn btn-warning">
                    취소하기
                  </button>
             
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
      let frontImg = [];
      let backImg = [];
      let mobileImg = [];
      let etcImg = [];
      let stackArr=[];
      
      $(function(){
    	  stackList()
    	  
      })
      
      function stackList(){
    	  $.ajax({
    		  url:"select.st",
    		  success:function(data){
    			  
    			  for(let i in data){
    				  switch (data[i].stackType) {
					case "프론트엔드":
						front.push(data[i].stackName);
						frontImg.push(data[i].stackImg);
						break;
					case "백엔드":
						back.push(data[i].stackName);
						backImg.push(data[i].stackImg);
						break;
					case "모바일":
						mobile.push(data[i].stackName);
						mobileImg.push(data[i].stackImg);
						break;

					default:
						etc.push(data[i].stackName);
						etcImg.push(data[i].stackImg);
						break;
					}
    			  }
    		
    			  
    			   for(let i in front){

    				  $("#front>ul").append("<li><img src='"+frontImg[i]+"' title='"+front[i]+"'></li>")
    			  }
    			   for(let i in back){
     				  $("#back>ul").append("<li><img src='"+backImg[i]+"' title='"+back[i]+"'></li>")
     			  }   	
    			   for(let i in mobile){
     				  $("#mobile>ul").append("<li><img src='"+mobileImg[i]+"' title='"+mobile[i]+"'></li>")
     			  }   	
    			   for(let i in etc){
     				  $("#etc>ul").append("<li><img src='"+etcImg[i]+"' title='"+etc[i]+"'></li>")
     			  }   	
    		  }
    	  })
      }
      
      $("#front>ul").on("click","li",function(){
    	  stackArr.push($(this).children("img").attr("title"));
    	  $("#myfront").append("<li>"+$(this).html()+"</li>");
    	  $(this).remove();
		  $("#stackName").val(stackArr);
		  $("#insertBtn").attr("disabled",false);
      })
      $("#back>ul").on("click","li",function(){
    	  stackArr.push($(this).children("img").attr("title"));
    	  $("#myback").append("<li>"+$(this).html()+"</li>");
    	  $(this).remove();
    	  $("#stackName").val(stackArr);
    	  $("#insertBtn").attr("disabled",false);
      })
      $("#mobile>ul").on("click","li",function(){
    	  stackArr.push($(this).children("img").attr("title"));
    	  $("#mymobile").append("<li>"+$(this).html()+"</li>");
    	  $(this).remove();
    	  $("#stackName").val(stackArr);
    	  $("#insertBtn").attr("disabled",false);
      })
      $("#etc>ul").on("click","li",function(){
    	  stackArr.push($(this).children("img").attr("title"));
    	  $("#myetc").append("<li>"+$(this).html()+"</li>");
    	  $(this).remove();
    	  $("#stackName").val(stackArr);
    	  $("#insertBtn").attr("disabled",false);
      })
      
      $("#myfront").on("click","li",function(){
    	  let num = stackArr.indexOf($(this).children("img").attr("title"));
    	  if(num != -1){
    		  stackArr.splice(num,1);
    	  }
    	  $("#front>ul").append("<li>"+$(this).html()+"</li>");
    	  $(this).remove();
    	  $("#stackName").val(stackArr);  	
    	  if(stackArr.length == 0){
    		  $("#insertBtn").attr("disabled",true);
    	  }
      })
      $("#myback").on("click","li",function(){
    	  let num = stackArr.indexOf($(this).children("img").attr("title"));
    	  if(num != -1){
    		  stackArr.splice(num,1);
    	  }
    	  $("#back>ul").append("<li>"+$(this).html()+"</li>");
    	  $(this).remove();
    	  $("#stackName").val(stackArr);
    	  if(stackArr.length == 0){
    		  $("#insertBtn").attr("disabled",true);
    	  }
      })
      $("#mymobile").on("click","li",function(){
    	  let num = stackArr.indexOf($(this).children("img").attr("title"));
    	  if(num != -1){
    		  stackArr.splice(num,1);
    	  }
    	  $("#mobile>ul").append("<li>"+$(this).html()+"</li>");
    	  $(this).remove();
    	  $("#stackName").val(stackArr);
    	  if(stackArr.length == 0){
    		  $("#insertBtn").attr("disabled",true);
    	  }
      })
      $("#myetc").on("click","li",function(){
    	  let num = stackArr.indexOf($(this).children("img").attr("title"));
    	  if(num != -1){
    		  stackArr.splice(num,1);
    	  }
    	  $("#etc>ul").append("<li>"+$(this).html()+"</li>");
    	  $(this).remove();
    	  $("#stackName").val(stackArr);
    	  if(stackArr.length == 0){
    		  $("#insertBtn").attr("disabled",true);
    	  }
      })
      
    </script>
  </body>
</html>
