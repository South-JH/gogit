<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery.min.js"></script>

<style type="text/css"></style>
<script>
	let cd = document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      height:'500px',
      navLinks: true, 
      headerToolbar: {
    	  left: 'prev,next today',
    	  center: 'title',
    	  right: 'addEventButton,dayGridMonth,timeGridWeek,timeGridDay,listWeek'
      },
      locale:'ko',
      buttonText:{
    	  today:'오늘',
    	  month:'월간',
    	  week:'주간',
    	  day:'일간',
    	  list:'리스트',
      },
      eventAdd:function(e){
    	  console.log(e)
      },
      eventChange:function(e){
    	  console.log(e)
      },
      eventRemove:function(e){
    	  console.log(e)
      },
      events:[
    	  {
    		  title:'sdfsdf',
    		  start:'2024-04-11',
    		  end:'2024-04-13',
    	  }
      ],
      customButtons:{
    	  addEventButton:{
    		  text:"일정추가",
    		  click:function(){
    			  let addEv;
    			  $("#calendarModal").modal("show");
    			 
				  $("#addEvent").on("click",function(){
					 addEv={
						 content : $("#content").val(),
						 start : $("#startDate").val(),
						 end : $("#endDate").val(),
					  }
					 $("#calendarModal").modal("hide");
					 console.log(addEv);
					 $("#content").val("");
					 $("#startDate").val("");
					 $("#endDate").val("");
					 
				  })

				$("#close").on("click",function(){
					$("#calendarModal").modal("hide");
				})
				
    		  }
    	  }
      }
      
    });
    calendar.render();
  });
	
	//console.log(cd);
</script>

<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script>
    
  </head>
  <body>
    <div id='calendar'></div>
    
    
    
    <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="title">일정을 입력하세요.</h5>
                    
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="content" class="col-form-label">일정 내용</label>
                        <input type="text" class="form-control" id="content" name="content">
                        <label for="startDate" class="col-form-label">시작 날짜</label>
                        <input type="date" class="form-control" id="startDate" name="startDate">
                        <label for="endDate" class="col-form-label">종료 날짜</label>
                        <input type="date" class="form-control" id="endDate" name="endDate">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="addEvent">추가</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="close">취소</button>
                </div>
    
            </div>
        </div>
    </div>


    

</body>
</html>