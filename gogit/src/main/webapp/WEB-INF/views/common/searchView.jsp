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
.Repositirybtn{
    color: black;
}
.Repositirybtn:hover{
    cursor: pointer;
    color: rgb(2 56 75);
}
.userbtn:hover{
    cursor: pointer;
    color: rgb(2 56 75);
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
                                  <a class="Repositirybtn" onclick="reposearch();">Repositiry(${ count }) ·</a>
                              </div>
                              <div>
                                  <a class="userbtn">User(${seList.get(0).totalCount })</a>
                              </div>
                          </div>
                        </div>
                        <script>
                        	function reposearch(){
                        		let keyword = document.getElementById('searchinput').value;
                        		location.href="reposearch.jm?keyword=" + keyword;
                        	} 
                        </script>

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
	                                                  <a href="detail.sr?nickName=${s.login}&avatar=${s.avatarUrl}">
	                                                      <div>
	                                                          <h3>${ s.login }</h3>
	                                                      </div>
	                                                  </a>
	                                                  
	                                              </div>
	                                              
	                                          </div>         
	                                      </div>                                  
	                                  </div>                              
                                </c:forEach>
                              </div>   
                              
                 <script>
		    let lastScroll = 0;
		    let count = 0;
		    let loading = false; // 추가된 부분: 호출 중인지 여부를 나타내는 변수
		
		    $(document).scroll(function(e){
		        var currentScroll = $(this).scrollTop();
		        var documentHeight = $(document).height();
		        var nowHeight = $(this).scrollTop() + $(window).height();
		
		        if(currentScroll > lastScroll && !loading){ // 변경된 부분: 호출 중인지 확인
		            if(documentHeight < (nowHeight + (documentHeight * 0.1))){
		                console.log("이제 여기서 데이터를 더 불러와 주면 된다.");
		                loading = true; // 추가된 부분: 호출 중으로 표시
		                ++count;
		                loadMoreData(count);
		            }
		        }
		        lastScroll = currentScroll;
		    });

			    function loadMoreData(count) {
			        console.log("여기임"+count);
			        let keyword = document.getElementById('searchinput').value;
			        let abc = document.getElementsByClassName('repo-list-wrap')[0].innerHTML;
			        $.ajax({
			            url: "search.jmm",
			            data: {
			                keyword: keyword,
			                page: count
			            },
			            success: function(result){
			                loading = false; // 추가된 부분: 호출 완료 후 상태 변경
			                
			                for (let i = 0; i < result.length; i++) {
			                    let rv = result[i];
			                    let login = rv.login;
			                    let avatarUrl = rv.avatarUrl;                 
			
			                abc += "<div class='repo-list-area'>" +
			                "<div class='repo-list-one'>" + 
			                "<div class='repo-list-one-area'>" +
			                "<div>" +
			                "<img src='" + avatarUrl + "' width='60px' height='60px'>" +
			                "</div>" + 
			                "<div class='repo-title-area'>" +
			                "<a href='detail.sr'>" +
			                "<div>" +
			                "<h3>" + login + "</h3>" +
			                "</div>" +
			                "</a>" +
			                "</div>" +
			                "<div>" + 			                
			                "</div>" +
			                "</div>" +
			                "</div>" +
			                "</div>";
			                }
			                $(".repo-list-wrap").append(abc);             
			            },
			            error: function(){
			                console.log("ajax 통신 실패!");
			                loading = false; // 추가된 부분: 호출 실패 시도로 간주하여 상태 변경
			            }
			        });
			    }
			</script>           
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