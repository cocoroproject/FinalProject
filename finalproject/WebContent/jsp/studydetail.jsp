<%@page import="cocoro.studygroup.model.Applydata"%>
<%@page import="cocoro.studygroup.model.Apply"%>
<%@page import="java.util.List"%>
<%@page import="cocoro.studygroup.service.StudyDetailService"%>
<%@page import="cocoro.studygroup.dao.StudyDetailDao"%> 
<%@page import="cocoro.studygroup.service.StudyActivityService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	
	StudyDetailService service = StudyDetailService.getInstance();
	int s_id = Integer.parseInt(request.getParameter("s_id")) ; 
	List<Applydata> list =  service.applyList(s_id);
	System.out.println(list.size()+"리스트사이즈");
	request.setAttribute("list", list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href='../js/calender/fullcalendar.css' rel='stylesheet' />
<link href='../js/calender/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='../js/calender/moment.min.js'></script>
<script src='../js/calender/jquery.min.js'></script>
<script src='../js/calender/fullcalendar.min.js'></script>
<script src='../js/calender/ca.js'></script>
<script type="text/javascript">
	function applygogo(apply_id,index){
		$.ajax({
			url:'applygogo.jsp?apply_id='+apply_id,
			type:'get',
			dataType : 'json',
			success: function(){
				alert("꺼죨");
			},
			error:function(){
				var item = document.getElementById("btnreject_"+index);
				var parent = item.parentNode.parentNode;
				if(item != null){
					item.parentNode.parentNode.parentNode.removeChild(parent);
				}
			}
			
		});//a작스닫기
	}
	function rejectgogo(apply_id,index){
		$.ajax({
			url:'rejectgogo.jsp?apply_id='+apply_id,
			type:'get',
			dataType : 'json',
			success: function(){
				alert("꺼죨");
			},
			error:function(){
				var item = document.getElementById("btnreject_"+index);
				var parent = item.parentNode.parentNode;
				if(item != null){
					item.parentNode.parentNode.parentNode.removeChild(parent);
				}
			}
			
		});//a작스닫기
	}
</script>
</head>
<body>
	<div class="bg-success" style="margin-left: 30px; margin-right: 30px;">
	  		<div style="float: left;"><img src="ab.PNG" alt="..." class="img-thumbnail"></div>
	  		<div class="top" style="padding-top:10px; padding-left:170px">
	  		<p style="float: left;"><h3>영어 정복</h3></p>
	  		<button type="button" class="btn btn-danger">스터디룸 입장</button>
	  		<button type="button" class="btn btn-default" aria-label="Left Align">
 				 <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
			</button>
			<button type="button" class="btn btn-default" aria-label="Left Align" data-toggle="modal" data-target="#myModal">
 				 <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
			</button>
			<!-- 가입신청한 사람들을 표시해주기 위한 모달모달 -->
					<!--    Modal -->
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">
							<!--  Modal content -->
							<div class="modal-content">
								<div class="modal-header">
									<h2>가입 희망자 </h2>
								</div>
								<div class="modal-body">
<!-- 									<form class="form-horizontal" action="calenderInsert.jsp"method="post"> -->
										<table class="table table-hover">
											<tr>
												<th>A_ID</th>
												<th>사용자명</th>
												<th>실력</th>
												<th></th>
											</tr> 
											<c:if test="${list.size() != 0}">
												<c:forEach  var="o" begin="0" end="${list.size()-1}" step="1">
													<c:if test="${list.get(o).apply_id !=null }">
														<tr id=btn_>
															<td>${list.get(o).apply_id }</td>
															<td>${list.get(o).u_name }</td>
															<td><c:if test="${list.get(o).rank_for_apply !=null }">${list.get(o).rank_for_apply }</c:if></td>
															<td><button type="button" id="btn_${o}" class="btn btn-danger" onclick="applygogo(${list.get(o).apply_id},${o})">가입</button>&nbsp;&nbsp;<button id="btnreject_${o}" type="button" class="btn btn-danger" onclick="rejectgogo(${list.get(o).apply_id},${o})">거부</button></td>
														</tr>
													</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${list.size() == 0 }">
												<tr>
													<td colspan='3'>가입 희망자가 없습니다.</td>
												</tr>
											</c:if>
										</table>
<!-- 									</form> -->
								</div>
							</div>
						</div>
					</div>
			<br />
			<p>영어를 정복하기 위한 김정복씨와 함께하는 영어 스터디</p>
			<br />
			</div>
			<div class="mid" style="border-top:5px solid white">
				<div>
					<div>list 값</div>
				</div>
				<div>
					<div id='calendar' style="width: 700px; height: 430px;"></div>
				</div>
			</div>
			<div class="foot" style="border-top:5px solid white">
			스판스판<br />
			스판스판<br />
			스판스판<br />
			스판스판<br />
			스판스판<br />
			스판스판<br />
			스판스판<br />
			스판스판<br />
			스판스판<br />
			스판스판<br />
			스판스판<br />
			스판스판<br />
			스판스판<br />
			스판스판<br />
			</div>
	</div>
	
</body>
<script src='../js/calender/fullcalendar.min.js'></script>
<link href='../js/calender/fullcalendar.css' rel='stylesheet' />
<link href='../js/calender//fullcalendar.print.css' rel='stylesheet' media='print' />
</html>