<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="../js/carousel.js"></script>
</head>
<body>
<form class="form-horizontal">
	<fieldset>
		<table class="table table-striped">
			<div class="row">
				<label class="col-xs-5 control-label" for="p_id">&nbsp;&nbsp;디파짓 설정</label>
  				<input class="col-xs-4" type="text" id="set_deposit" name="set_deposit" class="form-control" placeholder="예)50000원">
			</div><br>

			<div class="row">
  				<div class="col-xs-4">
  					<label class="col-md-3 control-label" for="p_id">No.</label>  
  				</div>
  				<div class="col-xs-4">
 					<label class="col-md-3 control-label" for="p_name">Name</label>
  				</div>
  				<div class="col-xs-4">
    				<label class="col-md-3 control-label" for="p_price">Value</label>
 				 </div>
			</div>

			<div class="row">
 				<div class="col-xs-4">
  					<label class="col-md-3 control-label" for="show_p_id">1</label>
  				</div>
  				<div class="col-xs-4">
 					<label class="col-md-3 control-label" for="show_p_name">지각</label>
  				</div>
  				<div class="col-xs-4">
    				<label class="col-md-3 control-label" for="show_p_price">500원</label>
  				</div>
			</div><br>

			<div class="row">
  				<div class="col-xs-4">
   					<input type="text" id="set_penaltyName" name="set_penaltyName" class="form-control" placeholder="예)결석 ">
  				</div>
  				<div class="col-xs-4">
     				<input type="text" id="set_penaltyPrice" name="set_penaltyPrice" class="form-control" placeholder="예)10000원">
  				</div>
  				<div class="col-xs-4">
 				 	<button id="penaltyAdd" name="penaltyAdd" class="btn btn-primary">추가</button>
		  		</div>
			</div><br>
		</table>
		
		<div class="center-block">
 	 		<label class="col-xs-3 control-label" for="d_confirm"></label>
  			<div class="col-xs-9">
   				<button id="s_confirm" name="d_confirm" class="btn btn-success">확인</button>
    			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  				<button id="s_cancel" name="d_cancel" class="btn btn-danger">취소</button>
		    </div>
		</div>
	</fieldset>
  </form>
</body>
</html>