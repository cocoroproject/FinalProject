<%@page import="java.util.ArrayList"%>
<%@page import="cocoro.studygroup.model.StudyActivity"%>
<%@page import="cocoro.user.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="cocoro.studygroup.model.StudyGroup"%>
<%@page import="cocoro.studygroup.service.StudyCRUDService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<% 
    request.setCharacterEncoding("utf-8");
	String id = request.getParameter("s_id");
	int s_id = 0;
	int hit = 0;
	if(id != null)
	{
		s_id = Integer.parseInt(id);
	}

	StudyCRUDService service = StudyCRUDService.getInstance();
	StudyGroup studygroup = service.selectStudyService(s_id);
	

	int re = service.updateHit(studygroup);
	if(re > 0)
	{
		hit = studygroup.getS_total_hit()+1;
		studygroup.setS_total_hit(hit);
		service.updateHit(studygroup);
	}
	
	request.setAttribute("studygroup", studygroup);
	
	
	// 스터디 리더
 	Users users = service.selectUsers(s_id, studygroup.getS_leader_id());   
 	request.setAttribute("users", users); 
	
 	// 스터디 멤버
 	List<Users> studyMembers = new ArrayList<Users>();
 	studyMembers = service.selectStduyMember(s_id);
 	request.setAttribute("studyMembers", studyMembers);
 	
		/* 스터디 시간계산 */
       int s_t_start = 0;	
	   int s_t_end = 0;
	   int start_hour = 0;
	   int start_min = 0;
	   int end_hour = 0;
	   int end_min = 0;
	   String s_start_hour;
	   
       s_t_start = studygroup.getS_t_start();
       s_t_end = studygroup.getS_t_end();
       start_hour = s_t_start/60;
       start_min = s_t_start%60;
       end_hour = s_t_end/60;
       end_min = s_t_end%60;
       
       
%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="icon" type="image/x-icon" href="../../img/favicon.ico" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="../js/carousel.js"></script>
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script type="text/javascript">
function fn_enter() {
	location.href = "../../jsp/studydetail.jsp"
};
var studyMembers = "${studyMembers}";


var chart = AmCharts.makeChart( "chartdiv", {
	  "type": "serial",
	  "theme": "light",
	  "dataProvider": [ {
		  
		  
	  
		"member": "김동현",
	    "rank": 5
	 
	  
	  
	  }],
	  "valueAxes": [ {
	    "gridColor": "#FFFFFF",
	    "gridAlpha": 0.2,
	    "dashLength": 0
	  } ],
	  "gridAboveGraphs": true,
	  "startDuration": 1,
	  "graphs": [ {
	    "balloonText": "[[category]]: <b>[[value]]</b>",
	    "fillAlphas": 0.8,
	    "lineAlpha": 0.2,
	    "type": "column",
	    "valueField": "rank"
	  } ],
	  "chartCursor": {
	    "categoryBalloonEnabled": false,
	    "cursorAlpha": 0,
	    "zoomable": false
	  },
	  "categoryField": "member",
	  "categoryAxis": {
	    "gridPosition": "start",
	    "gridAlpha": 0,
	    "tickPosition": "start",
	    "tickLength": 10
	  },
	  "export": {
	    "enabled": true
	  }

	} );
</script>
<style type="text/css">
#chartdiv {
	width		: 100%;
	height		: 500px;
	font-size	: 11px;
}					
</style>
<style type="text/css">
@import url(http://fonts.googleapis.com/css?family=Lato:400,700);
body
{
    font-family: 'Lato', 'sans-serif';
    }
.profile 
{
    min-height: 355px;
    display: inline-block;
    }
figcaption.ratings
{
    margin-top:20px;
    }
figcaption.ratings a
{
    color:#f1c40f;
    font-size:11px;
    }
figcaption.ratings a:hover
{
    color:#f39c12;
    text-decoration:none;
    }
.divider 
{
    border-top:1px solid rgba(0,0,0,0.1);
    }
.emphasis 
{
    border-top: 4px solid transparent;
    }
.emphasis:hover 
{
    border-top: 4px solid #1abc9c;
    }
.emphasis h2
{
    margin-bottom:0;
    }
span.tags 
{
    background: #1abc9c;
    border-radius: 2px;
    color: #f5f5f5;
    font-weight: bold;
    padding: 2px 4px;
    }
.dropdown-menu 
{
    background-color: #34495e;    
    box-shadow: none;
    -webkit-box-shadow: none;
    width: 250px;
    margin-left: -125px;
    left: 50%;
    }
.dropdown-menu .divider 
{
    background:none;    
    }
.dropdown-menu>li>a
{
    color:#f5f5f5;
    }
.dropup .dropdown-menu 
{
    margin-bottom:10px;
    }
.dropup .dropdown-menu:before 
{
    content: "";
    border-top: 10px solid #34495e;
    border-right: 10px solid transparent;
    border-left: 10px solid transparent;
    position: absolute;
    bottom: -10px;
    left: 50%;
    margin-left: -10px;
    z-index: 10;
}

.fb-profile img.fb-image-lg{
    z-index: 0;
    width: 100%;  
    margin-bottom: 10px;
}

.fb-image-profile
{
    margin: -90px 10px 0px 50px;
    z-index: 9;
    width: 20%; 
}

@media (max-width:768px)
{
    
.fb-profile-text>h1{
    font-weight: 700;
    font-size:16px;
}

.fb-image-profile
{
    margin: -45px 10px 0px 25px;
    z-index: 9;
    width: 20%; 
}

</style>
</head>
<body>
<div class="container">
    <div class="fb-profile">
        <img align="left" class="fb-image-lg" src="http://tafebytes.com.au/wp-content/uploads/2012/11/study-group.jpg" alt="Profile image example"/>
        <img align="left" class="fb-image-profile thumbnail" src="http://1.soompi.io/wp-content/uploads/2015/02/IU.jpg" alt="Profile image example"/>
        <div class="fb-profile-text">
            <h3>스터디 리더 : ${users.u_name}</h3>
            <p>${users.u_email}</p>
        </div>
    </div>
</div>

<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
<div class="container">
	<div class="row">
		<div class="col-lg-12">
    	 <div class="well profile col-lg-12">
            <div class="col-sm-12">
          
                <div class="col-xs-6 col-sm-6" id="first">
                    <h2>${studygroup.s_name}</h2>
                    <p><strong>스터디 소개: </strong> ${studygroup.s_intro} </p>
                    <p><strong>스터디 키워드: </strong> ${studygroup.s_tag}  </p>
                    <p><strong>모집 인원 </strong>
                    	<span class="fa fa-user">:</span> ${studygroup.s_max_member}
                    </p>
                    <p><strong>실력: </strong>
                    <c:if test="${studygroup.s_abil_check > 0}">
                    	<c:forEach var="k" begin="1" end="${studygroup.s_abil_check}"> 
                  		<span class="fa fa-star"></span>
                   		</c:forEach>
                   
                   
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm"><i class="fa fa-search"></i></button>
					<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
 						 <div class="modal-dialog modal-sm">
   							 <div class="modal-content">
     						    <div id="chartdiv"></div>
   							 </div>
 						 </div>
					</div>
					</c:if>
					<c:if test="${studygroup.s_abil_check < 1}">
                   		<span>실력 정보 없음</span>
                   	</c:if>
                   </p>
                   <p><strong>디파짓:</strong>
                   		<c:if test="${studygroup.s_deposit!=-1}">
    					<label>${studygroup.s_deposit}원</label>
    					</c:if>
    					<c:if test="${studygroup.s_deposit==-1}">
    					<label>&nbsp;사용안함</label>
    					</c:if>
    				</p>
    				<p><strong>출석체크: </strong>
    				<c:if test="${studygroup.s_attend_check=='T'}">
                    	<input type="checkbox" name="s_attend_check" id="s_attend_check-0" value="T" checked="" disabled="">사용함
                    	<input type="checkbox" name="s_attend_check" id="s_attend_check-1" value="F" disabled="">사용안함
    				</c:if>
    				<c:if test="${studygroup.s_attend_check=='F'}">
	    				<input type="checkbox" name="s_attend_check" id="s_attend_check-0" value="T" disabled="">사용함
    					<input type="checkbox" name="s_attend_check" id="s_attend_check-1" value="F" checked="" disabled="">사용안함
    				</c:if> 					
    				</p>
    				<p><strong>스터디 장소: </strong>
                    <c:if test="${studygroup.s_online=='T'}">
                        <input type="checkbox" name="s_online" id="s_online-0" value="T" checked="" disabled="">온라인
    				</c:if>
    				<c:if test="${studygroup.s_offline=='T'}">	
    					<input type="checkbox" name="s_offline" id="s_online-1" value="T" checked="" disabled="">오프라인
                    </c:if>
                    </p>
                    <p><strong>스터디 성격: </strong>
                    <c:if test="${studygroup.s_mento_check=='T'}">
                    	<input type="checkbox" name="s_mento_check" id="s_mento_check-0" value="T" checked="" disabled="">튜터링
                    	<input type="checkbox" name="s_mento_check" id="s_mento_check-1" value="S" disabled="">스터디
    				</c:if>
    				<c:if test="${studygroup.s_mento_check=='S'}">
	    				<input type="checkbox" name="s_mento_check" id="s_mento_check-0" value="T" disabled="">튜터링
    					<input type="checkbox" name="s_mento_check" id="s_mento_check-1" value="S" checked="" disabled="">스터디
                    </c:if>
                    </p>
                    <p><strong>스터디 종류: </strong>
                    <c:if test="${studygroup.s_kind_check=='T'}">
                    	<input type="checkbox" name="s_kind_check" id="s_kind_check-0" value="T" checked="" disabled="">개방형
    					<input type="checkbox" name="s_kind_check" id="s_kind_check-1" value="F" disabled="">폐쇄형
    				</c:if> 
    				 <c:if test="${studygroup.s_kind_check=='F'}">
                    	<input type="checkbox" name="s_kind_check" id="s_kind_check-0" value="T" disabled="">개방형
    					<input type="checkbox" name="s_kind_check" id="s_kind_check-1" value="F" checked="" disabled="">폐쇄형
    				</c:if>      
                    </p>
                </div> 
               
             <div class="col-xs-6 col-sm-6" id="second">
             
            		<p style="margin-top:40px"></p>
             		<p><strong>오프라인 모임 위치: </strong>
             		   <c:if test="${studygroup.s_address!='null'}">
					   <label>${studygroup.s_address}</label>
					   </c:if> 
					   <c:if test="${studygroup.s_address=='null'}">
					   <label>오프라인 모임 없음</label>
					   </c:if>            	
             		<p style="margin-top:4px"></p>
   
					<div id="map" style="width:100%;height:200px;"></div>

					<p id="infoDiv"></p>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=3cd0e2fbd6251c82935cf18a47f510a6&libraries=services"></script>
<script>
var s_location_x = ${studygroup.s_location_x};
var s_location_y = ${studygroup.s_location_y};
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(s_location_x, s_location_y), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new daum.maps.MapTypeControl();

// 지도 타입 컨트롤을 지도에 표시합니다
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

    var infoDiv = document.getElementById('infoDiv');
   

</script>
             	
       			</div>
       		
       			
             	<c:set var="start_year" value="${fn:substring(studygroup.s_start,0, 4)}"></c:set>
             	<c:set var="start_month" value="${fn:substring(studygroup.s_start,5, 7)}"></c:set>
             	<c:set var="start_day" value="${fn:substring(studygroup.s_start,8, 10)}"></c:set>
             	<c:set var="end_year" value="${fn:substring(studygroup.s_end,0, 4)}"></c:set>
             	<c:set var="end_month" value="${fn:substring(studygroup.s_end,5, 7)}"></c:set>
             	<c:set var="end_day" value="${fn:substring(studygroup.s_end,8, 10)}"></c:set>
                       <p style="margin-top:20px"></p>
                    <p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;스터디 기간: </strong>
                    	<label>${start_year}년&nbsp;${start_month}월&nbsp;${start_day}일</label>
                    	<label>~</label>
                    	<label>${end_year}년&nbsp;${end_month}월&nbsp;${end_day}일</label>                    	
                    </p>
              
            
                    <p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;스터디 시간: </strong>
                    	<c:if test="${studygroup.s_t_start<750}">                      
                    	<label>오전&nbsp;<%=start_hour%>시</label>
                    	</c:if>
                    	<c:if test="${studygroup.s_t_start>750}">                      
                    	<label>오후&nbsp;<%=start_hour-12%>시</label>
                    	</c:if>
                    	<c:if test="${studygroup.s_t_start%60!=0}">
                    	<label>&nbsp;<%=start_min%>분</label>
                    	</c:if>
                    	<label>~</label>
                    	<c:if test="${studygroup.s_t_end<750}">                      
                    	<label>오전&nbsp;<%=end_hour%>시</label>
                    	</c:if>
                    	<c:if test="${studygroup.s_t_end>750}">                      
                    	<label>오후&nbsp;<%=end_hour-12%>시</label>
                    	</c:if>
                    	<c:if test="${studygroup.s_t_end%60!=0}">
                    	<label><%=end_min%>분</label>
                    	</c:if>
                    	                    	
                    </p>
    			
                    
    			
    				
                       
            </div>      
            <div class="col-xs-12 text-center">
                <div class="col-xs-12 col-sm-4 emphasis">
                 <c:if test="${studygroup.s_kind_check =='F'}">
                 	<c:if test="${studygroup.s_abil_check > 0}">
                 <button type="button" class="btn btn-success btn-block" data-toggle="modal" data-target=".rank_for_apply" ><span class="fa fa-plus-circle"></span> 가입신청 </button>
					
				<div class="modal fade rank_for_apply" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  					<div class="modal-dialog modal-sm">
 					   <div class="modal-content">
 					   		<strong><label>해당 스터디와 관련된 당신의 스킬레벨을 입력해주세요</label></strong>
      						 <select class="form-control" id="rank_for_apply_check" name="rank_for_apply_check" value="" required="">
                   		          <option value="1">1</option>
                     	          <option value="2">2</option>
                   	 	          <option value="3">3</option>
                      	          <option value="4">4</option>
                      		      <option value="5">5</option>
                       	          <option value="6">6</option>
                                  <option value="7">7</option>
                         	      <option value="8">8</option>
                       		      <option value="9">9</option>
  							  </select>
  							  <button class="btn btn-success btn-block" id="rank_confirm"> 확인 </button>
  							  

 					   </div>
  					</div>
				</div>
                    </c:if>  
                 </c:if>  
                
                 <c:if test="${studygroup.s_kind_check =='F'}">
                 	<c:if test="${studygroup.s_abil_check < 1}">
                  		<button type="button" class="btn btn-success btn-block" onclick="fn_applyOk(0)"><span class="fa fa-plus-circle"></span> 가입신청 </button>
					</c:if>
                </c:if>
                 <c:if test="${studygroup.s_kind_check =='T'}">
                    <button class="btn btn-success btn-block" onclick="fn_enter()"><span class="fa fa-plus-circle"></span> 입장하기 </button>
                 </c:if>
<script type="text/javascript">
$(document).ready(function() 
		 {
		var rank = 0;
		$('#rank_for_apply_check').change(function () {
			rank = $(this).val();
		});
		$('#rank_confirm').click(function()
		 	{
				$('.rank_for_apply').hide();
				
				fn_applyOk(rank);
		 	});
		
		 });
function fn_applyOk(rank) {
 	location.href="applyOk.jsp?s_id=${studygroup.s_id}&rank_for_apply="+rank;
 }	
</script>
                </div>
            </div>
        </div>                 
	  </div>
    </div>
  </div>
</body>
</html>
