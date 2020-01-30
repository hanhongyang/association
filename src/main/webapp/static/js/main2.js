
// 上传数量控制，给出默认值
if($("#zhl_admin_box").is('.zhl_admin_update_no') || $("#zhl_admin_box").is('.zhl_admin_update_two')){
    var zhl_update_num = 1;
}else{
    var zhl_update_num = 1;
}
// 只允许上传单个图片时移除文件多选属性
$(".zhl_admin_update_no #zhl_admin_file").removeAttr('multiple');
$(".zhl_admin_update_two #zhl_admin_file").removeAttr('multiple');

// 上传数量控制，判断是否定义并赋值
zhl_update_num = typeof zhl_update_num != "undefined" && zhl_update_num ? zhl_update_num : 1;
// 上传大小控制，当前为1M
var zhl_update_size = 5*1024*1024;
/**
 * 文件选择触发
 */
$("#zhl_admin_file").change(function (){
    var fileAll = this.files.length;
    for(var i=0;i<fileAll;i++){
        var file = this.files[i];
        if( file.size >  zhl_update_size){
            var d = parseInt(i+1);
            alert("你选择的文件第"+d+"个太大了！");
            return false;
        }
        if(!/image\/\w+/.test(file.type)){
            alert("文件必须为图片！");
            return false;
        }
        var reader = new FileReader();
        //读取文件过程方法
        reader.onerror = function (e) {
            console.log("文件读取异常....");alert('文件上传异常请关闭重试....');
        }
        reader.onabort = function(e) {
            console.log("文件读取异常....");alert('文件上传异常请关闭重试....');
        };
        reader.onload = function (e) {
            var imgstr='<img src="'+e.target.result+'" class="zhl_admin_update_imgtmp" />';
            //限制上传的图片数
            var len = $('#zhl_admin_imgs>img').length;
            if(len < zhl_update_num){
                if(len == zhl_update_num-1){
                    $('#zhl_admin_img').hide();
                }else{
                    $('#zhl_admin_img').show();
                }
                $('#zhl_admin_imgs').append(imgstr);
            }else{
                alert('最多'+zhl_update_num+'张图片');
                $('#zhl_admin_img').hide();
                return false;
            }
        }

        reader.readAsDataURL(file);

    }
});

/**
 * 点击删除预选的图片
 */
$("#zhl_admin_imgs").delegate("img","click",function(){
    if(confirm('删除该张图片？')){
        $(this).remove();
        $('#zhl_admin_img').show();
    }
});

/**
 * 点击上传按钮
 */
$('#zhl_admin_update_btn').on('click',function(){
    var base64Data ;
    var name=document.getElementById("name").value;
    var description=document.getElementById("description").value;
    var ownerId=document.getElementById("ownerId").value;
    var type=$("#type").val()
    base64Data=$("#zhl_admin_imgs img").attr('src');
    if(!judgeEmpty(base64Data)){
            var formData = new FormData();
            formData.append('name',name);
            formData.append('description',description);
            formData.append('ownerId',ownerId);
            formData.append('type',type);
            formData.append('base64Data',base64Data);
            base64_uploading(formData);
    }else{
        alert('请选择文件');return false;
    }
})

/**
 * 判断文件是否为空
 */
function judgeEmpty(data) {
    return (Array.isArray(data) && data.length === 0) || (Object.prototype.isPrototypeOf(data) && Object.keys(data).length === 0);
}

/**
 * ajax上传base64自定义函数
 */
function base64_uploading(formData){
    // ajax 上传
    $.ajax({
        type : "POST",
        url : "/associationApply",
        data : formData,
        processData: false,   // jQuery不要去处理发送的数据
        contentType: false,   // jQuery不要去设置Content-Type请求头
        dataType : "json",
        success : function(result) {
            location.href="/applyResult"
        }
    });
    // ajax 上传

}