<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .teamMates, .rightBar-div>div{text-align: center;}
</style>
</head>
<body>

    <div class="sideright-div">
        <div style="background-color:#ffffff;">
            <div style="border: 1px solid red; width: 300px; height: 300px;">
                <div class="teamMates"><b>TeamMates</b></div>
                <div>
                    팀원목록 보여질 자리
                </div>
            </div>

            <div class="rightBar-div" style="border: 1px solid red; width: 300px; height: 300px;">
                <div><b>팀원추가</b></div>
                <div>
                    프로젝트에 추가할 팀원을 선택한 후에 하단에 '팀원 추가 하기' 버튼을 눌러주세요!<br>
                    (체크: 팀원추가/체크해제: 팀원해제)
                </div>

                <div style="border: 1px solid red; height: 30px;">
                    <input type="checkbox" id="vehicle1" name="nickName" value="hijimin">
                      <label for="vehicle1"> hijimin </label><br>
                </div>
                <br>

                <div><button>팀원추가하기</button></div>
            </div>
        </div>
    </div>



</body>
</html>