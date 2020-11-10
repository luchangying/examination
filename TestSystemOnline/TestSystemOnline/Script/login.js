// 刷新验证码，三个端口同时刷新
function ClickRemoveChangeCode() {
    for (var i = 1; i <= 3; i++) {
        var code = document.getElementById('imgCode_' + i);
        code.src = code.src + '1';
    }

}
(function ($) {
    $.login = {

        formMessage: function (rule, msg) {
            $('.' + rule + '_tips').find('.tips_msg').html(msg);
        },

        loginClick: function (name, pass, reg, btn, rule) {
            var $username = $("#" + name);
            var $password = $("#" + pass);
            var $code     = $("#" + reg);

            if ($username.val() === "") {
                $username.focus();
                $.login.formMessage(rule, '请输入账号！');
                return false;
            }
            if ($password.val() === "") {
                $password.focus();
                $.login.formMessage(rule, '请输入密码！');
                return false;
            }
            if ($code.val() === "") {
                $code.focus();
                $.login.formMessage(rule, '验证码为空！');
                return false;
            }
            $.login.formMessage('');
            $("#" + btn).attr('disabled', 'disabled');
            $.login.formMessage(rule, '验证中...');
            $.ajax({
                url: "/Account/CheckLogin",
                data: {
                    loginId: $.trim($username.val()),
                    loginPass: $.trim($password.val()),
                    code: $.trim($code.val()),
                    rule: rule
                },
                type: "post",
                dataType: "json",
                success: function (data) {
                    if (data.state === "success") {
                        $.login.formMessage(rule, '登录成功，正在跳转...');
                        window.setTimeout(function () {
                            window.location.href = "/Home/" + rule;
                        }, 500);
                    }
                    else {
                        $("#" + btn).removeAttr('disabled');
                        ClickRemoveChangeCode();
                        $code.val('');
                        $.login.formMessage(rule, data.message);
                    }
                }
            });
        },

        init: function () {
            ClickRemoveChangeCode();
            $("#btnAdminOK").click(function () {
                $.login.loginClick('txtAdminLoginID', 'txtAdminPass', 'txtAdminText', 'btnAdminOK', "admin");
            });
            $("#btnStudentOK").click(function () {
                $.login.loginClick('txtStudentLoginID', 'txtStudentPass', 'txtStudentText', 'btnStudentOK', "student");
            });
            $("#btnTeacherOK").click(function () {
                $.login.loginClick('txtTeacherLoginID', 'txtTeacherPass', 'txtTeacherText', 'btnTeacherOK', "teacher");
            });
        }
    };
    $(function () {
        var container = document.getElementById('container');
        var student   = document.getElementById('student');
        var teacher   = document.getElementById('teacher');
        var admin     = document.getElementById('admin');

        container.style.opacity = 1;
        container.style.paddingTop = '10px';

        student.onclick = function () {
            container.className = 'container-box student';
        };
        teacher.onclick = function () {
            container.className = 'container-box teacher';
        };
        admin.onclick = function () {
            container.className = 'container-box admin';
        };

        $.login.init();
    });
})(jQuery);
