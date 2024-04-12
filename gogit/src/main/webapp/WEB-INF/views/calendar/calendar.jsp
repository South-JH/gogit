<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery.min.js"></script>

<style type="text/css">
	#calendar{
		background-color: white;
		margin-top: 50px;
	}
</style>
<script>
	document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      height:'700px',
      slotMinTime: '08:00',// Day 캘린더에서 시작 시간 
      slotMaxTime: '20:00',
      navLinks: true, 
      headerToolbar: {
    	  left: 'prev,next today',
    	  center: 'title',
    	  right: 'dayGridMonth timeGridDay'
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
    	  /* $.ajax({
    		  url:"insert.cal",
    		  data:{
    			  
    		  },
    		  success:function(){
    			  
    		  },
    		  error:function(){
    			  
    		  }
    	  }) */
    	  
    	  console.log(e)
      },
      eventChange:function(e){
    	  /* $.ajax({
		  url:"update.cal",
		  data:{
			  
		  },
		  success:function(){
			  
		  },
		  error:function(){
			  
		  }
	  }) */
      },
      eventRemove:function(e){
    	  /* $.ajax({
		  url:"delete.cal",
		  data:{
			  
		  },
		  success:function(){
			  
		  },
		  error:function(){
			  
		  }
	  }) */
      },
      
      select: function(selectDay) {
    	  $("#startDate").val(selectDay.startStr)
    	  $("#calendarModal").modal("show");
    	   $("#addEvent").on("click",function(){
    		   
         		
    		  	calendar.addEvent({
         			title: $("#content").val(),
         			start: $("#startDate").val()+"T"+$("#startTime").val()+":00",
         			end: $("#endDate").val()+"T"+$("#endTime").val()+":00",
         			backgroundColor:$("#eventColor").val(),
    		  	})
    		  	
    		  	
    		  	$("#calendarModal").modal("hide");
    		  	$("#content").val("");
				$("#startDate").val("");
				$("#endDate").val("");
				
    	  })
    	  
    	  $("#close").on("click",function(){
				$("#calendarModal").modal("hide");
			}) 
         	
      },
      eventClick:function(e){
    	  let con = confirm("이벤트 삭제 하시겠습니까?");
    	  if(con){
    		  e.event.remove();
    	  }
      },
      
     
      editable:true,
      dayMaxEvents: true,
      selectable: true,
      
      
    });
    calendar.render();
   
  });
	
	
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
                        <input type="time" class="form-control" id="startTime" name="startTime">
                        
                        <label for="endDate" class="col-form-label">종료 날짜</label>
                        <input type="date" class="form-control" id="endDate" name="endDate">
                        <input type="time" class="form-control" id="endTime" name="endTime">
                        
                        
                        <label for="eventColor" class="col-form-label">이벤트 바 색상</label>
                        <input type="color" class="form-control" id="eventColor" name="eventColor" style="width: 50px">
                       
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