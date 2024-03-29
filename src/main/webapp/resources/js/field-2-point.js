$(function(){
		var a_selection = $("#aq-course1").find("select");
		var a_point_list = $("#aq-course2").find("select");
		var b_selection = $("#aq-course3").find("select");
		var b_point_list = $("#aq-course4").find("select");

		a_selection.change(function(){
			$.ajax({
				headers : {
					'Accept' : 'application/json',
					'Content-Type' : 'application/json'
				},
				type : "GET",
				url : "admin/get-knowledge-point/" + a_selection.val(),
				success : function(message,tst,jqXHR) {
					if(!util.checkSessionOut(jqXHR))return false;
					if (message.result == "success") {
						a_point_list.empty();
						$.each(message.object,function(key,values){
							a_point_list.append("<option value=\"" + key + "\">" + values + "</option>");
						});
					} else {
						util.error("操作失败请稍后尝试");
					}
				},
				error : function(xhr) {
					util.error("操作失败请稍后尝试");
				}
			});
		});

		b_selection.change(function(){
		$.ajax({
				   headers : {
					   'Accept' : 'application/json',
					   'Content-Type' : 'application/json'
				   },
				   type : "GET",
				   url : "admin/get-knowledge-point/" + b_selection.val(),
				   success : function(message,tst,jqXHR) {
					   if(!util.checkSessionOut(jqXHR))return false;
					   if (message.result == "success") {
						   b_point_list.empty();
						   $.each(message.object,function(key,values){
							   b_point_list.append("<option value=\"" + key + "\">" + values + "</option>");
						   });
					   } else {
						   util.error("操作失败请稍后尝试");
					   }
				   },
				   error : function(xhr) {
					   util.error("操作失败请稍后尝试");
				   }
			   });
	});
});

