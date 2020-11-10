(function ($) {
    $.change = {

        formMessage: function (msg) {
            $('.tips').find('.msg').html(msg);
        },

        changeClick: function () {
            var $rule = $('#rule_temp');
            var $oldPass = $('#txtOldPass');
            var $newPass = $('#txtNewPass');
            var $chePass = $('#txtChePass');

            if ($oldPass.val() === '') {
                $oldPass.focus();
                $.change.formMessage('请输入原始密码！');
                return false;
            }
            if ($newPass.val() === '') {
                $newPass.focus();
                $.change.formMessage('请输入重设密码！');
                return false;
            }
            if ($chePass.val() === '') {
                $chePass.focus();
                $.change.formMessage('请输入确认密码！');
                return false;
            }

            $('#btnOK').attr('disabled', 'disabled');
            $.change.formMessage('验证中...');

            $.ajax({
                url: '/Operate/ChangePass',
                data: {
                    oldPass: $.trim($oldPass.val()),
                    newPass: $.trim($newPass.val()),
                    chePass: $.trim($chePass.val())
                },
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    if (data.state === "success") {
                        $.change.formMessage('修改成功，正在跳转...');
                        window.setTimeout(function () {
                            //window.history.go(-1);
                            window.location.href = "/Home/" + $rule.html();  
                        }, 500);
                    } else {
                        $('#btnOK').removeAttr('disabled');
                        $.change.formMessage(data.message);
                    }
                }
            });
        },

        init: function () {
            $('#btnOK').click(function () {
                $.change.changeClick();
            });
        }
    };
    $(function () {
        $.change.init();
    });
})(jQuery);