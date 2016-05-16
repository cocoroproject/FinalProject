<%@page import="cocoro.studygroup.model.StudyGroup"%>
<%@page import="cocoro.user.model.Users"%>
<%@page import="org.apache.catalina.Session"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cocoro.search.model.tagSuggestion"%>
<%@page import="java.util.List"%>
<%@page import="cocoro.search.service.SearchService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	SearchService service = SearchService.getInstance();
    String salut ="Cocoro에 오신걸 환영합니다";
    List<tagSuggestion> list = new ArrayList<tagSuggestion>();
    List<StudyGroup> listS = new ArrayList<StudyGroup>();
    
    
    if((Users)session.getAttribute("users")!=null){
    Users users = (Users)session.getAttribute("users");
    System.out.print("로그인 된 메인");
    salut = users.getU_name()+"님 환영합니다.";

    list = service.tagSuggest(users.getU_tag());
   
   
    
    listS = service.item_recommend(users.getU_id());
    
    
    for(int i =0 ; i< list.size();i++){
      System.out.println(list.get(i));
   } 
    
    System.out.println("유저 아이"+users.getU_id());
   // System.out.println("리스트 사이즈"+listS.size());

    
/*    for(int i =0 ; i< listS.size();i++){
  	 System.out.println(listS.get(i));
   } */
    
    
    }

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->

<script src="../js/carousel.js"></script>
<script type="text/javascript">
$(document).ready(function(e){
    $('.search-panel .dropdown-menu').find('a').click(function(e) {
    	e.preventDefault();
    	var changed_txt = $('.search-panel span#search_concept').text();
		var concept = $(this).text();
		$('.search-panel span#search_concept').text(concept);
	    $('.input-group #search_param').val(concept); 
		$(this).text(changed_txt);
	
    
    
    });
});
</script>

<style type="text/css">
#main_img {
	max-width: 100%;
	height: auto;
}
.grid-divider{
text-align: center;
}

</style>
</head>
<body>

	<!-- body -->
	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<div class="carousel-inner" role="listbox">

			<img data-src="holder.js/900x500/auto/#777:#777" alt="900x500"
				src="../img/mainTestimg2.jpg" data-holder-rendered="true"
				id="main_img">
			<div class="carousel-caption">
				<h3>
					<b><%=salut %></b>
				</h3>
				<h2 class="text-center">
					<b>나만의 스터디를 만들어보세요 </b>
				</h2>

				<form action="../page/Search/doSearch.jsp" method="get">
					<div class="input-group">
						<div class="input-group-btn search-panel">
							<button type="button" class="btn btn-default dropdown-toggle"
								data-toggle="dropdown">
								<span id="search_concept">스터디</span> <span class="caret"></span>
							</button>

							<ul class="dropdown-menu" role="menu">
								<li><a href="#id"><i class="fa fa-angle-double-right"></i>인물</a></li>

							</ul>


						</div>

						<input type="hidden" name="searchCtg" value="스터디"
							id="search_param"> <input type="text"
							class="form-control" name="searchWord" placeholder="Search.."
							id="search_key" value=""> <span class="input-group-btn">
							<button class="btn btn-info" type="submit">Search</button>
						</span>

					</div>
				</form>
			</div>
		</div>

		<div class="container">
			

			<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
			<div class="row">
			<div class="page-header">
				<h2 id="h2_padd">관심사에 따른 추천</h2>
			</div>
			</div>
			  <div class="row  grid-divider">
			 <%if(list!=null&&list.size()!=0){ for(int i =0;i<list.size();i++){%>
				<div class="col-sm-3">
				<img src="../img/groupImg.PNG" alt="bootsnipp" class="img-rounded img-responsive" />
			    <div class="col-padding">
			    <h4><%=list.get(i).getS_name() %></h4>
			    </div>
				</div>
			   <%}}else{%>
				   
				   <h4 style="text-align: center">관심사를 입력해 주세요</h4>
			  <%} %>
		
				</div>
				<div class="row">
			<div class="page-header">
				<h2 id="h2_padd">맞춤 추천</h2>
			</div>
			</div>
			<div class="row  grid-divider">
			 
			  	 <%if(listS !=null&& listS.size()!=0){ for(int i =0;i< listS.size();i++){%>
				<div class="col-sm-3">
				<img src="../img/groupImg.PNG" alt="bootsnipp" class="img-rounded img-responsive" />
			    <div class="col-padding">
			    <h4><%=listS.get(i).getS_name() %></h4>
			    </div>
				</div>
			   <%}}else{%>
				   
				   <h4 style="text-align: center">맞춤 컨텐츠가 없습니다.</h4>
			  <%} %>
		
				</div>
				</div>
			</div>
		</div>
</body>
</html>