<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.repo-wrap {
	display: flex;
	flex-direction: column;
	height: auto;
}

.repo-wrap>div {
	padding: 25px 0px;
	/* width: 900px; */
}

/* 레파지토리 목록 부분 */
.bottom-area {
 	border:1px solid #e6e6e6;
	height: auto;
	border-radius: 10px;
 	padding: 50px 100px; 
	background-color: white;
 	box-shadow: 0 0 6px rgba(0,0,0,0.03), 0 0 6px rgba(0,0,0,0.03); 
}

.bottom-area-wrap {
	display: flex;
	justify-content: flex-end;
	margin-bottom: 20px;
}

h2 {
	margin: 0;
}

/* 레포지토리 리스트 목록 스타일 */
.repo-list-one {
	border: 1px solid #e6e6e6;
	border-radius: 6px;
	height: 90px;
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 15px 20px;
}

.repo-list-total-wrap {
	/* border: 1px solid #e6e6e6; */
	border-radius: 8px;
}

.repo-list-area {
 	padding-top: 30px;
}

.body-wrapper {
	/* background-color: #f9f9ff; */
}

a {
	color: #333333;
	text-decoration: none;
}

.repo-title-area {
	padding: 0px 35px;
}

.repo-list-one-area {
	display: flex;
}

.repo-other-img {
	width: 35px;
	height: 35px;
	border-radius: 35px;
	display: flex;
    justify-content: center;
    align-items: center;
}

.repo-other-img:hover {
	background-color: #eeeeee;
}

.repo-other {
	display: flex;
	flex-direction: column;
    align-items: center;
    width: 70px;
	height: 90px;
	position: absolute;
    right: 50px;
	border: 1px solid #e6e6e6;
	/* box-shadow: 0px 0px 1px; */
	display: none;
	border-radius: 6px;
}

.repo-other>div {
	height: 30px;
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
}

.repo-other button {
	border: none;
	background-color: transparent;
}

.repo-other>div:hover {
	background-color: #eeeeee;
}

.repo-public {
	border: 1px solid #d9d9d9;
	border-radius: 30px;
	width: 80px;
	height: 30px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: 600;
}

#repo-other-a {
	color: black;
}

.repo-other>div:first-child {
	border-radius: 6px 6px 0 0;
}

.repo-other>div:last-child {
	border-radius: 0 0 6px 6px;
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
             
              <!-- 레파지토리 리스트 -->
	          <div class="repo-wrap">
                <div>
                    <div>
                        <h2>search List</h2>
                    </div>
                </div>
                <div>
                    <div class="bottom-area">
                        <div>                         
                          <div style="display:flex;">
                              <div>
                                  <a>Repository()</a>
                              </div>
                              <div>
                                  <a>User(${seList.get(0).totalCount })</a>
                              </div>
                          </div>
                        </div>

                      <!-- 목록 시작 -->
                      <div class="repo-list-total-wrap">
                          <div>
                         
                          
                          </div>
                          <div></div>
                      
                       
                                <div class="repo-list-wrap">
                                
                                <c:forEach var="s" items="${ seList }">
	                                <div class="repo-list-area">
	                                      <div class="repo-list-one">
	                                          <div class="repo-list-one-area">
	                                              <div>
	                                               <!--<img src="resources/images/repo-img.png" width="60px" height="60px">-->
	                                                  <img src="${ s.avatarUrl }" width="60px" height="60px">
	                                              </div>
	                                              <div class="repo-title-area">
	                                                  <a href="detail.sr">
	                                                      <div>
	                                                          <h3>${ s.login }</h3>
	                                                      </div>
	                                                  </a>
	                                                  <div>public</div>
	                                              </div>
	                                              <div>
	                                                  <div class="repo-public">
	                                                      <div>ㅇㅇ</div>
	                                                  </div>
	                                              </div>
	                                          </div>         
	                                      </div>                                  
	                                  </div>                              
                                <img src="https://ghchart.rshah.org/${ s.login }">
                                </c:forEach>
                              </div>                 
                      </div>
                      <!-- 목록 끝 -->
                    </div>
                </div>
            </div>
            <!-- 검색 리스트 END -->            
             </div>
           </div>
        </div>
    </div>
</body>
</html>