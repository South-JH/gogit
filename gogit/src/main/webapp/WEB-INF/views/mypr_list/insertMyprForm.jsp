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
      #stack-wrap{
      	border: 1px solid gray;
      	border-radius: 5px;
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
                  />
                  <br /><br />
                  <label for="prTime">프로젝트 가능시간</label>
                  <input
                    type="date"
                    class="form-control"
                    id="prTime"
                    style="width: 500px"
                    name="prTime"
                  />
                  <br /><br />
             
                  
                 
                  <label>기술스택 - 아래에서 선택해주세요</label>
                  <br><br>
                  <div id="stack-wrap">
                  	
                  	 <br>
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
         			
                  <br><br>
                  <div id="myStack-wrap">
                    <label>나의 스택</label>
                    <div id="myStack"><ul></ul></div>
                  </div>
                  
                </div>
                <input type="hidden" name="stackName" id="stackName" />
                <input type="hidden" name="memId" id="memId" value="${ loginUser.memId }"/>
				<br />
				<br />
				<br />
				<br />
				<br />
			
                <label for="prContent">PR내용</label>
                <br><br>
                <textarea class="form-control" name="prContent" id="prContent" cols="100" rows="10" placeholder="내용 입력" style="resize: none"></textarea>
                <div align="center">
                <button class="btn btn-danger">등록하기</button>
                <button id="reset" type="reset" class="btn btn-warning">취소하기</button>
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

      let stackArray = [];
      let value = "";
      $(function () {
        selectStack();

        let myStack = {};
        $("#front>ul").on("click", "li", function () {
          if (stackArray.indexOf($(this).text()) == -1) {
            stackArray.push($(this).text());
            value += "<li>" + stackArray[stackArray.length - 1] + "</li>";
            $("#myStack>ul").html(value);
            $("#stackName").val(stackArray);
          }
        });
        $("#back>ul").on("click", "li", function () {
          if (stackArray.indexOf($(this).text()) == -1) {
            stackArray.push($(this).text());

            value += "<li>" + stackArray[stackArray.length - 1] + "</li>";
            $("#myStack>ul").html(value);
            $("#stackName").val(stackArray);
          }
        });
        $("#mobile>ul").on("click", "li", function () {
          if (stackArray.indexOf($(this).text()) == -1) {
            stackArray.push($(this).text());
            value += "<li>" + stackArray[stackArray.length - 1] + "</li>";
            $("#myStack>ul").html(value);
            $("#stackName").val(stackArray);
          }
        });
        $("#etc>ul").on("click", "li", function () {
          if (stackArray.indexOf($(this).text()) == -1) {
            stackArray.push($(this).text());
            value += "<li>" + stackArray[stackArray.length - 1] + "</li>";
            $("#myStack>ul").html(value);
            $("#stackName").val(stackArray);
          }
        });
        
        $("#reset").click(function(){
        	$("#myStack>ul").children().remove();
        	stackArray = [];
        	value="";
        })
      });

      function selectStack() {
        let frontval = "";
        let backval = "";
        let mobileval = "";
        let etcval = "";

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
              frontval += "<li>" + front[i] + "</li>";
            }
            $("#front>ul").html(frontval);

            for (let i in back) {
              backval += "<li>" + back[i] + "</li>";
            }
            $("#back>ul").html(backval);

            for (let i in mobile) {
              mobileval += "<li>" + mobile[i] + "</li>";
            }
            $("#mobile>ul").html(mobileval);

            for (let i in etc) {
              etcval += "<li>" + etc[i] + "</li>";
            }
            $("#etc>ul").html(etcval);
          },
        });
      }
      
      
    </script>
  </body>
</html>
