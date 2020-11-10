//题库搜索(符合条件的题目显示or隐藏)
function OptionsSearch(elementId) {
    $('#' + elementId).bind('input propertychange', function () {
        $(".options-item").each(function () {
            var item = $(this);
            if (item.find('.item-question-top').text().indexOf($('#' + elementId).val()) === -1) {
                item.hide();
            } else {
                item.show();
            }
        });
    });
}

//显示选择题库
function SingleBank() {
    $('#single_options').attr('class', 'release-options selected');
    $('#judge_options').attr('class', 'release-options');
    $('#btnSingleBank').parent().addClass('btn-bank-on');
    $('#btnJudgeBank').parent().removeClass('btn-bank-on');
}

//显示判断题库
function JudgeBank() {
    $('#single_options').attr('class', 'release-options');
    $('#judge_options').attr('class', 'release-options selected');
    $('#btnJudgeBank').parent().addClass('btn-bank-on');
    $('#btnSingleBank').parent().removeClass('btn-bank-on');
}

//显示已选选择题数量
function SingleSelected() {
    var count_single = $('#single_options').find('.check-box.right').length;
    $('#single_option_selected').text('选择题: ' + count_single + '/20');
}

//显示已选判断题数量
function JudgeSelected() {
    var count_judge = $('#judge_options').find('.check-box.right').length;
    $('#judge_option_selected').text('判断题: ' + count_judge + '/10');
}

//打开弹出层
function ShowSelectedPaper() {
    $('#teacher_release').attr('class', 'teacher-release selected-paper');
}

//关闭弹出层
function HideSelectedPaper() {
    $('#teacher_release').attr('class', 'teacher-release');
}

//打开信息提示框
function ViewMessageBox(mess) {
    $('#message_box').addClass('open');
    $('#box_centent_info').text(mess);
}

//关闭信息提示框
function CloseMessageBox() {
    $('#message_box').removeClass('open');
}

//试卷信息验证
function VerificationRelease() {
    //题量检测
    var single_count = $('#single_options').find('.check-box.right').length;//已选
    var judge_count = $('#judge_options').find('.check-box.right').length;//已选
    if (single_count !== 20) {
        ViewMessageBox('选择题题量不够！');
        return false;
    }
    if (judge_count !== 10) {
        ViewMessageBox('判断题题量不够！');
        return false;
    }
    //试卷名称
    if ($('#txtTestName').val().length <= 0) {
        ViewMessageBox('未输入试卷名称！');
        return false;
    }
    if ($('#txtTestName').val().length > 15) {
        ViewMessageBox('试卷名称过长！');
        return false;
    }
    //考试时间
    var tempTime = $('#txtTestTime').val().replace(/T/g, ' ');
    var date = new Date();

    var seperator1 = "-";
    var seperator2 = " ";
    var seperator3 = ":";

    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    var hour = date.getHours();
    var minute = date.getMinutes();
    var second = date.getSeconds();

    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (day >= 0 && day <= 9) {
        day = "0" + day;
    }
    if (hour >= 0 && hour <= 9) {
        hour = "0" + hour;
    }
    if (minute >= 0 && minute <= 9) {
        minute = "0" + minute;
    }
    if (second >= 0 && second <= 9) {
        second = "0" + second;
    }

    var today = year + seperator1 + month + seperator1 + day + seperator2 + hour + seperator3 + minute + seperator3 + second;
    if (tempTime.length <= 0) {
        ViewMessageBox('未输入考试时间！');
        return false;
    }
    if (tempTime <= today) {
        ViewMessageBox('需要提前发布考试！');
        return false;
    }
    //考试时长
    if ($('#txtTimeLength').val() < 1 || $('#txtTimeLength').val() > 4) {
        ViewMessageBox('考试时长不合理！');
        return false;
    }
    return true;
}

$(document).ready(function () {
    //题库搜索执行
    OptionsSearch('txtSingleBox');
    OptionsSearch('txtJudgeBox');

    //选择单选题
    var single_list = '';
    $('#single_options').find('.options-item').each(function () {
        var single_optin = $(this);//当前数据
        var check_box = single_optin.find('.check-box');//多选框
        var option_id = single_optin.find('.options-id').text();//数据ID
        check_box.click(function () {
            if (check_box.is('.check-box.right')) {
                check_box.attr("class", "check-box");
                single_list = single_list.replace("'" + option_id + "',", '');
                SingleSelected();
            } else {
                if ($('#single_options').find('.check-box.right').length !== 20) {
                    check_box.attr("class", "check-box right");
                    single_list += "'" + option_id + "',";
                    SingleSelected();
                } else {
                    ViewMessageBox('选择题题量已满！');
                    return;
                }
            }
        });
    });

    //选择判断题
    var judge_list = '';
    $('#judge_options').find('.options-item').each(function () {
        var judge_optin = $(this);//当前数据
        var check_box = judge_optin.find('.check-box');//多选框
        var option_id = judge_optin.find('.options-id').text();//数据ID
        check_box.click(function () {
            if (check_box.is('.check-box.right')) {
                check_box.attr("class", "check-box");
                judge_list = judge_list.replace("'" + option_id + "',", '');
                JudgeSelected();
            } else {
                if ($('#judge_options').find('.check-box.right').length !== 10) {
                    check_box.attr("class", "check-box right");
                    judge_list += "'" + option_id + "',";
                    JudgeSelected();
                } else {
                    ViewMessageBox('判断题题量已满！');
                    return;
                }
            }
        });
    });

    //随机选题
    $('#btnRandomAdd').click(function () {
        var single_count = 20 - $('#single_options').find('.check-box.right').length;//剩余未选
        var judge_count = 10 - $('#judge_options').find('.check-box.right').length;//剩余未选

        $('#single_options').find('.options-item').each(function () {
            var single_optin = $(this);//当前数据
            var check_box = single_optin.find('.check-box');//多选框
            var option_id = single_optin.find('.options-id').text();//数据ID
            if (single_count === 0) {
                return;
            }
            if (check_box.is('.check-box.right')) {
                return;
            } else {
                if (Math.random() > 0.5) {
                    check_box.attr("class", "check-box right");
                    single_list += "'" + option_id + "',";
                    SingleSelected();
                    single_count--;
                }
            }
        });
        $('#judge_options').find('.options-item').each(function () {
            var judge_optin = $(this);//当前数据
            var check_box = judge_optin.find('.check-box');//多选框
            var option_id = judge_optin.find('.options-id').text();//数据ID
            if (judge_count === 0) {
                return;
            }
            if (check_box.is('.check-box.right')) {
                return;
            } else {
                if (Math.random() > 0.5) {
                    check_box.attr("class", "check-box right");
                    judge_list += "'" + option_id + "',";
                    JudgeSelected();
                    judge_count--;
                }
            }
        });
    });

    //重新选题
    $('#btnReturnBank').click(function () {
        // 清空保存
        single_list = '';
        judge_list = '';
        $('#single_options').find('.options-item').each(function () {
            var single_optin = $(this);//当前数据
            var check_box = single_optin.find('.check-box');//多选框
            if (check_box.is('.check-box.right')) {
                check_box.removeClass('right');
            }
            SingleSelected();
        });
        $('#judge_options').find('.options-item').each(function () {
            var judge_optin = $(this);//当前数据
            var check_box = judge_optin.find('.check-box');//多选框
            if (check_box.is('.check-box.right')) {
                check_box.removeClass('right');
            }
            JudgeSelected();
        });
    });

    //考卷预览
    $('#btnShowSelectedPaper').click(function () {
        var boolTemp = VerificationRelease();
        if (!boolTemp) {
            return;
        }
        $.ajax({
            url: "/Teacher/ViewSelectedPaper",
            data: {
                paperTitle: $('#txtTestName').val(),
                singleList: single_list,
                judgeList: judge_list
            },
            type: "post",
            dataType: "json",
            success: function (data) {
                if (data.state === "success") {
                    ShowSelectedPaper();
                    $('#txtSelectedTestTile').html($('#txtTestName').val());
                    $('#txtSelectedCourse').html($('#txtTestCourse').val());
                    $('#txtSelectedTestTime').html($('#txtTestTime').val().replace(/T/g, ' '));
                    $('#txtSelectedTeacher').html($('#txtReleaseTeacher').val());
                    $('#txtSelectedTimeLength').html($('#txtTimeLength').val() + "小时");
                    var temp = 1;
                    var singleHtml = '';
                    for (var i = 0; i < data.data.Table1.length; i++) {
                        singleHtml += '<div class="selected-options-item"><div class="selected-item-question"><div class="selected-item-top"><span title="">' + temp++ + '、' + data.data.Table1[i].TitleSkip + '</span></div><div class="selected-item-down"><div class="selected-option">A : ' + data.data.Table1[i].OptionTrueA + '</div><div class="selected-option">B : ' + data.data.Table1[i].OptionB + '</div><div class="selected-option">C : ' + data.data.Table1[i].OptionC + '</div><div class="selected-option">D : ' + data.data.Table1[i].OptionD + '</div></div></div></div>';
                    }
                    var judgeHtml = '';
                    for (var j = 0; j < data.data.Table2.length; j++) {
                        judgeHtml += '<div class="selected-options-item"><div class="selected-item-question"><div class="selected-item-top"><span title="">' + temp++ + '、' + data.data.Table2[j].TitleSkip + '</span></div><div class="selected-item-down"><div class="selected-option">A : ' + data.data.Table2[j].OptionTrueA + '</div><div class="selected-option">B : ' + data.data.Table2[j].OptionB + '</div></div></div></div>';
                    }
                    allHtml = singleHtml + judgeHtml;
                    $('#paper_options').html(allHtml);
                } else {
                    ViewMessageBox(data.message);
                }
            }
        });
    });

    //提交试卷
    $('#btnReleaseOK').click(function () {
        var boolTemp = VerificationRelease();
        if (!boolTemp) {
            return;
        }
        $.ajax({
            url: "/Teacher/ReleaseCheck",
            data: {
                paperTitle: $('#txtTestName').val(),
                singleList: single_list,
                judgeList: judge_list,
                classId: $.trim($('#dropTestClass').val()),
                testTime: $('#txtTestTime').val().replace(/T/g, ' '),
                rollOutTime: $('#txtTimeLength').val()
            },
            type: "post",
            dataType: "json",
            success: function (data) {
                if (data.state === "success") {
                    ViewMessageBox(data.message);
                } else {
                    ViewMessageBox(data.message);
                }
            }
        });
    });
});

