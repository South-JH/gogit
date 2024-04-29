<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .teamMates{text-align: center;}
    .teamlist>div{justify-content : center}
    .proimg-div>img{
        width: 45px;
		height: 45px;
        border-radius: 50%;
    }
    /*div 가운데 정렬*/
    .addbtn-div{
		display: flex;
		justify-content : center	
    }
    .sliderhight-div, .rightBar-div{
        border-radius: 10px;
        border: 1px solid #d4d2d2;
    }  
</style>
</head>
<body>

    <div class="slideright-div" style="margin-left: 10px;">
        <div class="sliderhight-div" style="background-color:#ffffff;">
            <div style="width: 300px; height: 300px;" class="teamlist">
                <div class="teamMates" style="margin-bottom: 10px;"><b style="color: rgb(2 56 75);">TeamMates</b></div>
                
                <div style="display: flex; margin-bottom: 5px;">
                    <div class="proimg-div" style="width: 60px;"><img src="${loginUser.profile}"></div>
                    <div>
                        <b>${ loginUser.gitNick }</b><!-- 작성자 -->
                        <div>@${ loginUser.gitNick }</div>
                    </div>
                </div>
                
                <c:forEach var="p" items="${prMemberList }"><!-- 팀멤버 -->              
                <div style="display: flex; margin-bottom: 5px;">
                    <div class="proimg-div" style="width: 60px;"><img src="${loginUser.profile}"></div>
                    <div>
                        <b>${ p.gitNick } </b>
                        <div>@${p.gitNick }</div>
                    </div>
                </div>
                </c:forEach>                                 
            </div>           
        </div>
        <!-- 복사해보기 -->
        <div class="rightBar-div" style="width: 300px; height: 275px; margin-top: 15px; padding: 5px; background-color: #ffffff;">
            <div><p style="text-align: center;"><b>팀원추가</b></p></div>
            <div>
                <p style="text-align: left;">프로젝트에 추가할 팀원을 선택한 후에 하단에 '팀원 추가 하기' 버튼을 눌러주세요!</p>
                <p style="text-align: left;">(체크: 팀원추가/체크해제: 팀원해제)</p>
            </div>
            <br>

            <div style="border: 1px solid gray; height: 30px;">
                <input type="checkbox" id="vehicle1" name="nickName" value="hijimin">
                  <label for="vehicle1"> hijimin </label><br>
            </div>
            
            <div id="addbtn" class="addbtn-div" style="margin-top: 5px;"><button class="btn btn-primary btn-sm" style="background-color: rgb(2 56 75);">팀원추가하기</button></div>
        </div>        
    </div>
    
    <script>
    $(function(){
		alarm();
		alarmCircle();
		setInterval(() => {
			alarm();
			alarmCircle();
		}, 5000);
	})	
	function alarm(){
    		$.ajax({
    			url:"alarm.me",
    			data:{
    				memId:'${loginUser.memId}'
    			},
    			success:function(data){
    				let value = "";
    				
    				for(let i in data){
    					
    					switch (data[i].alarmType) {
						case "project":
							value += "<div>";
	    					if(data[i].alarmYn == 1){
	    						value +="<li class='list-group-item active' onclick='readAl(this);'>"+data[i].gitNick+"님이 프로젝트("+data[i].alarmTitle+")에 참가 요청했습니다."
	    					}else{
	    						value +="<li class='list-group-item' onclick='readAl(this);'>"+data[i].gitNick+"님이 프로젝트("+data[i].alarmTitle+")에 참가 요청했습니다."
	    					}
	    					value += "<input type='hidden' value='"+data[i].memId+"'>"
									+"<input type='hidden' value='"+data[i].alarmNo+"'> </li>"
	    							+"<button class='btn btn-warning' onclick='apply("+data[i].alarmContentNo+",this)'>승인</button>"
	    							+"<button class='btn btn-danger' onclick='cancel(this)'>거절</button>"
	    							
	    						+"</div>"
							break;
						default:
							break;
						}
    				}
    				$("#alarmList>ul").html(value);
    			},
    			error:function(){
    				console.log("실패")
    			}
    		})
    	}
    
    function apply(num,e){
		 $.ajax({
			url:"application.pr",
			data:{
				pNo:num,
				memId:$(e).siblings("li").children("input:eq(0)").val()
			},
			success:function(data){
				console.log(data)
			}
		})
		
		$.ajax({
			url:"delete.al",
			data:{
				alarmNo:$(e).siblings("li").children("input:eq(1)").val()
			},
			success:function(data){
				$(e).parent().remove();
				console.log(data)
			}
		}) 
	}  
    
    function alcancel(e){

		   $.ajax({
			  url:"alcancel.pr",
			  data:{memId:$(e).siblings("li").children("input:eq(0)").val()},
			  success:function(data){
				  console.log(data);
			  }
		  })
		  
		  $.ajax({
			url:"delete.al",
			data:{
				alarmNo:$(e).siblings("li").children("input:eq(1)").val()
			},
			success:function(data){
				$(e).parent().remove();
				console.log(data)
			}
		}) 
	  }
    </script>
</body>
</html>