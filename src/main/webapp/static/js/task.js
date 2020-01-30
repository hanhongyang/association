$(document).ready(function(){
	$('.btn-accept').click(function(){
		var values="";
		values +=$(this).attr("value");
		//获取tr数组的索引为2的值     
		$.ajax({
			type : "get",
	        async : true,
	        url :"http://localhost:8080/Accept/"+values,
	        success:function (data) {
	           location.reload(true);
	        }
		});
	});
	$('.btn-refuse').click(function(){
		var values="";
		values +=$(this).attr("value");
		//获取tr数组的索引为2的值     
		$.ajax({
			type : "get",
	        async : true,
	        url :"http://localhost:8080/Refuse/"+values,
	        success:function (data) {
	           location.reload(true);
	        }
		});
	});
	$('.btn-Time').click(function(){
		var values="";
		values +=$(this).attr("value");
		values +=" "+$(".test").val();
		//获取tr数组的索引为2的值     
		$.ajax({
			type : "get",
	        async : true,
	        url :"http://localhost:8080/UpdateTime/"+values,
	        success:function (data) {
	           location.reload(true);
	        }
		});
	});
});