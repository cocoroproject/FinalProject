(function($){
		$(document).ready(function() {
			var date = new Date();
			var d = date.getDate();
			var m = date.getMonth();
			var y = date.getFullYear();
			var calendar = $('#calendar').fullCalendar({
				height: 450,
				header: {
					left: 'prev,next today',
					center: 'title',
				},
				formatDate:'yyyy-MM-dd',
				defaultDate: date,
				editable: true,
				eventLimit: true, // allow "more" link when too many events
				selectable: true,
				select : function(start){
					var title = prompt('Event title');
					var content = prompt('Event content');
					
//					console.log(this.defaultDate);
					//alert(this);
//					console.log(o+"오늘도 혼났다");
//					console.log(start+"나는 스타트다");
//					console.log(this);
//					console.log(this.start);
//					console.log(this.start._d);
//					console.log(this.start._d.getDate());
					if(title){
					      console.log((start)._d);
			               console.log(start);
			               console.log(this);
			               eventData = {
			                  title: title,
			                  start: start
			               };
			           var full = (start)._d.getFullYear()+"-"+((start)._d.getUTCMonth()+1)+"-"+(start)._d.getDate();

						location.href='calenderInsert.jsp?plan_name='+title+"&plan_comment="+content+"&plan_date="+full;
//						$('#calendar').fullCalendar('renderEvent',eventData,true);
					}
					$('#calendar').fullCalendar('unselect');
				},
				editable: true,
				eventLimit: true, // allow "more" link when too many events
//				eventClick:function(calEvent, jsEvent, view) {
//					
//					alert('Event: ' + calEvent.title);
//			        alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
//			        alert('View: ' + view.name);
//
//			        // change the border color just for fun
//			        $(this).css('border-color', 'red');
//			        
//					var title = prompt("뭐 넣을래?");
//					calEvent.title = title;
//			        
//
//			        $('#calendar').fullCalendar('updateEvent', event);
//
//			    }
			    
			});
			
		});
	})(jQuery);