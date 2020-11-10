$(function () {
    $("#file_upload").change(function () {
        var $file = $(this);
        // 确认文件格式
        var fileStr = $file.val();
        var fileArray = fileStr.split('\\');
        var fileName = fileArray[fileArray.length - 1];
        var extendName = fileName.substr(fileName.length - 3, 3);
        if (extendName === 'png' || extendName === 'jpg' || extendName === 'PNG' || extendName === 'JPG') {
            $("#btnOK").removeAttr('disabled');
            $('.headimg-mess').find('span').html('文件选取成功：');
        } else {
            $("#btnOK").attr('disabled', 'disabled');
            $('#file_upload').val('');
            $('.headimg-mess').find('span').html('文件格式不可用！请重试：');
            return;
        }
        // 实时显示图片
        var fileObj = $file[0];
        var windowURL = window.URL || window.webkitURL;
        var dataURL;
        var $imgBig = $("#img_big");
        var $imgSmall = $("#img_small");

        if (fileObj && fileObj.files && fileObj.files[0]) {
            dataURL = windowURL.createObjectURL(fileObj.files[0]);
            $imgBig.attr('src', dataURL);
            $imgSmall.attr('src', dataURL);
        } else {
            dataURL = fileStr;
            var imgBig = document.getElementById("img_big");
            var imgSmall = document.getElementById("img_small");
            imgBig.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
            imgBig.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;
            imgSmall.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
            imgSmall.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;
        }
    });
});