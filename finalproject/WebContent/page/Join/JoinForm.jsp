<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!--  <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="../js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
-->  
</head>

<body>
	<h3 class="text-center">Cocoro 회원가입</h3>
	<hr>
	<div class="row">
		<div class="col-md-3"></div>
		<div class="tab-pane col-md-6" id="signup">
			<form class="form-horizontal" action="../page/Join/JoinOk.jsp" method="post">
				<fieldset>
					<!-- Sign Up Form Text input -->
					<div class="control-group">
						<label class="control-label" for="Email">이메일</label>

						<div class="controls">
					
							<input id="Email" name="u_email" class="form-control input-large"
								type="text" placeholder="JoeSixpack@naver.com">
						<div id="joinResult">
						
						</div>
						</div>

					</div>

					<!-- Text input -->
					<div class="control-group">
						<label class="control-label" for="userid">주소</label>
						<div class="controls">
							<input name="u_address" class="form-control input-large"
								type="text" placeholder="금천구 가산동" id="searchTextField"
								autocomplete="on" runat="server"> <em id="emId"></em>
						</div>
					</div>

					<!-- Text input -->
					<div class="control-group">


						<div class="controls">
							<label class="control-label">이름</label> <input id="username"
								name="u_name" class="form-control input-large" type="text"
								placeholder="이름">
						</div>
					</div>

					<!-- Password input -->
					<div class="control-group">
						<label class="control-label" for="password">비밀번호</label>
						<div class="controls" id="pwd-container">
							<input id="password" name="password"
								class="form-control input-large" type="password"
								placeholder="********">
							<div class="pwstrength_viewport_progress"></div>
						</div>
					</div>

					<!-- Text input -->
					<div class="control-group">
						<label class="control-label" for="reenterpassword">비밀번호 확인</label>
						<div class="controls">
							<input id="reenterpassword" class="form-control input-large"
								name="u_pwd" type="password" placeholder="********"> <em
								id="emPwd"></em>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="birth">생년 월일</label>
						<div class="controls">
							<input id="birth" class="form-control input-xs" name="u_birth"
								type="text" placeholder="1995-04-20">

						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="birth">성별</label>
						<div class="controls">
								<label class="radio-inline"> <input type="radio"
							value="남" name="u_sex">남
						</label> <label class="radio-inline"><input type="radio"
							value="여" name="u_sex">여 </label>

						</div>
					</div>



					<!-- Button -->
					<br>
					<div class="control-group">
						<!-- <label class="control-label" for="confirmsignup"></label> -->
						<div class="controls">
							<!-- <button id="confirmsignup" name="confirmsignup"
													class="btn btn-danger">Sign Up</button> -->
							<input type="submit" class="btn-success form-control input-large"
								value="회원 가입" />

						</div>
					</div>





				</fieldset>
			</form>
		</div>
	</div>

	<script type="text/javascript" src="../js/Join/jQuery.js"></script>
	<script type="text/javascript" src="../js/Join/pwstrength.js"></script>
	<script type="text/javascript" src="../js/Join/checkPassword.js"></script>
	<script type="text/javascript" src="../js/Join/checkId.js"></script>
	<script type="text/javascript" src="../js/Join/checkName.js"></script>
	<script type="text/javascript" src="../js/Join/submit.js"></script>
	<script
		src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"
		type="text/javascript"></script>
	<link rel="stylesheet" type="text/css"
		href="../css/Join/jquery.timepicker.css" />
	<link rel="stylesheet" type="text/css"
		href="../css/Join/bootstrap-datepicker.css" />
	<script type="text/javascript"
		src="../js/Join/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="../js/Join/jquery.timepicker.js"></script>

	<script type="text/javascript" src="../js/Join/datepair.js"></script>
	<script type="text/javascript" src="../js/Join/loginStart.js"></script>
		<script type="text/javascript">
	$(function(){
	
		
		
		
	$('#Email').keyup(function(){
				$.getJSON('../../page/Join/JoinSearch.jsp',{searchKey:$('#Email').val()},function(data){
					$.each(data,function(key,value){
						var div = '<div>';
						div += '<h6>'+value.u_email+ '은 중복된 값입니다</h6>';
						div += '</div>';
						$('#joinResult').append(div);
					})
				})
			})
		})
</script>
</body>
</html>