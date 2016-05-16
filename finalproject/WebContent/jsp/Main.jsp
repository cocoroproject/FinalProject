<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="../js/carousel.js"></script>
<style type="text/css">
.body_content{
	margin-top: 30px;
}
.img-responsive{
display: block;
  margin-left: auto;
  margin-right: auto;
}
.body_intro{
margin-top: 100px;
margin-left: 300px;
}
</style>
</head>
<body>

	<!-- 슬라이드 -->
		<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img data-src="holder.js/900x500/auto/#777:#777" alt="900x500"
					src="../img/mainTestimg2.jpg" data-holder-rendered="true">
				<div class="carousel-caption">
					<h3>
						<b>Cocoro에 오신걸 환영합니다</b>
					</h3>
					<h2 class="text-center">
						<b>나만의 스터디를 만들어보세요</b>
						</h2>
						<div class="col-md-12">
						<input type="text" class="form-control" id="search"
								placeholder="당신의 관심사를 넣어주세요">
							<button type="button" class="btn btn-lg btn-primary">검색</button>
								</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 바디 부분  -->
	<div class="body_content">
	<div class="row">
		<div class="col-lg-4">
			<img class="img-responsive" src="../img/mainTestimg.JPG"
				alt="Generic placeholder image" width="140" height="140">
			<h2 class="text-center">인물</h2>
			<p class="text-center">Donec sed odio dui. Etiam porta sem malesuada magna mollis
				euismod. Nullam id dolor id nibh ultricies vehicula ut id elit.
				Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
				Praesent commodo cursus magna.</p>
		</div>
		<!-- /.col-lg-4 -->
		<div class="col-lg-4">
			<img class="img-responsive" src="../img/mainTestimg.JPG"
				alt="Generic placeholder image" width="140" height="140">
			<h2 class="text-center">스터디</h2>
			<p class="text-center">Duis mollis, est non commodo luctus, nisi erat porttitor
				ligula, eget lacinia odio sem nec elit. Cras mattis consectetur
				purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo,
				tortor mauris condimentum nibh.</p>
		</div>
		<!-- /.col-lg-4 -->
		<div class="col-lg-4">
			<img class="img-responsive" src="../img/mainTestimg.JPG"
				alt="Generic placeholder image" width="140" height="140">
			<h2 class="text-center">검색</h2>
			<p class="text-center">Duis mollis, est non commodo luctus, nisi erat porttitor
				ligula, eget lacinia odio sem nec elit. Cras mattis consectetur
				purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo,
				tortor mauris condimentum nibh.</p>
		</div>
	</div>
</div>

<!-- 바디슬라이드 
	<div class="body_slide">
	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img data-src="holder.js/900x500/auto/#777:#777" alt="900x500"
					src="img2.jpg" data-holder-rendered="true">
				<div class="carousel-caption">
					<h3><b>Cocoro에 오신걸 환영합니다</b></h3>
					<h2 class="text-center"><b>나만의 스터디를 만들어보세요</b><h2>
					<button type="button" class="btn btn-lg btn-danger">스터디만들기</button>
				</div>
			</div>
			<div class="item">
				<img data-src="holder.js/900x500/auto/#777:#777" alt="900x500"
					src="img2.jpg" data-holder-rendered="true">
				<div class="carousel-caption">
				<h3><b>Cocoro에 오신걸 환영합니다</b></h3>
					<h2 class="text-center"><b>당신의 관심사에 맞는 친구를 찾아보세요</b><h2>
					<button type="button" class="btn btn-lg btn-primary">친구찾기</button>
				</div>
			</div>
				<div class="item">
				<img data-src="holder.js/900x500/auto/#777:#777" alt="900x500"
					src="img2.jpg" data-holder-rendered="true">
				<div class="carousel-caption">
				<h3><b>Cocoro에 오신걸 환영합니다</b></h3>
					<h2 class="text-center"><b>무엇이 궁금하세요</b><h2>
    				<input type="text" class="form-control" id="search" placeholder="당신의 관심사를 넣어주세요">
					<button type="button" class="btn btn-lg btn-primary">검색</button>
				</div>
			</div>
		</div>
	</div>
	</div>	
-->
	<!--  아래 스터디 소개 이미지  -->
	<div class="h3 text-center space-3">환영합니다 Cocoro에 대해 간략히 소개해드릴게요</div>
		<div class="row m-b-l flex-sm align-group-center-sm"
			data-reactid="152">
			<div
				class="col-lg-2 col-md-2 col-xs-12 flex flex-column align-group-center m-y-s"
				data-reactid="153">
				<div class="col-md-1"></div>
				<div
					style="background-image: url(//cdn.lyft.net/brochure/images/lyft-plus.404156fa.svg); height: 120px; width: 120px;"
					class="radius-circle" data-reactid="154"></div>
			</div>
			<div class="col-md-8 col-xs-12 text-md-left text-xs-center"
				data-reactid="155">
				<h3 class="text-thin" data-reactid="156">관심사</h3>
				<p class="m-b-0" data-reactid="157">평소 당신이 관심있던 관심사를 #태그를 이용해
					등록해보세요 !</p>
			</div>
		</div>
		<div>
			<div class="row m-b-l flex-sm align-group-center-sm"
				data-reactid="146">
				<div
					class="col-lg-2 col-md-3 col-xs-12 flex flex-column align-group-center m-y-s"
					data-reactid="147">
					<div
						style="background-image: url(//cdn.lyft.net/brochure/images/lyft-classic.d07fbd86.svg); height: 120px; width: 120px;"
						class="radius-circle" data-reactid="148"></div>
				</div>
				<div class="col-md-8 col-xs-12 text-md-left text-xs-center"
					data-reactid="149">
					<h3 class="text-thin" data-reactid="150">스터디</h3>
					<p class="m-b-0" data-reactid="151">우리 Cocoro에서는 당신의 관심사와 맞는
						스터디를 매칭해줍니다 !!</p>
				</div>
			</div>

			<div class="row m-b-l flex-sm align-group-center-sm"
				data-reactid="158">
				<div
					class="col-lg-2 col-md-3 col-xs-12 flex flex-column align-group-center m-y-s"
					data-reactid="159">
					<div
						style="background-image: url(//cdn.lyft.net/brochure/images/lyft-line.24ded851.svg); height: 120px; width: 120px;"
						class="radius-circle" data-reactid="160"></div>
				</div>
				<div class="col-md-8 col-xs-12 text-md-left text-xs-center"
					data-reactid="161">
					<h3 class="text-thin" data-reactid="162">인물매칭</h3>
					<p class="m-b-0" data-reactid="163">Cocoro는 당신의 관심사를 바탕으로 당신과
						맞는 성향의 인물을 매칭해줍니다 !</p>
					<p class="m-b-0 m-t-s" data-reactid="164">
						<a class="text-capitalize" href="/line" data-reactid="165">learn
							more</a>
					</p>
				</div>
			</div>
		</div>
</body>
</html>