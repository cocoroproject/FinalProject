$(function(){
	$('#searchKey').keyup(function(){
		$('#autoText').empty();
		$.getJSON('../page/mypage/autoSearch.jsp',{searchKey:$('#searchKey').val()},function(data){
			$.each(data,function(key,value){
				var div = '<div>';
				div += '<h6>'+value.u_email+'('+value.u_name+')</h6>';
				div += '<a href="../layout/mainLayout.jsp?f_o_id='+value.u_id+'"><button class="btn-sm btn-primary">친구페이지</button></a>';
				div += '</div>';
				$('#autoText').append(div);
			})
		})
	})
})