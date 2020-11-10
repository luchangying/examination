(function ($) {
    $.option = {
        //跳转函数
        optionGoto: function (num) {
            let detail_box = $(".detail-box");
            detail_box.each(function () {
                detail_box.removeClass("detail-on");
            });
            detail_box.eq(num - 1).attr("class", "detail-box detail-on");

            let box_array = $(".box-temp");
            box_array.each(function () {
                let item = $(this);
                item.removeClass("options-on");
            });
            box_array.eq(num - 1).addClass("options-on");
        },
        //上翻页
        optionUp: function () {
            $("#option_up").click(function () {
                let box_on = $(".box-temp.options-on").text();
                let num = parseInt(box_on);
                if (num > 0) {
                    $.option.optionGoto(num - 1);
                } else {
                    $.option.optionGoto(29);
                }
            });
        },
        //下翻页
        optionDown: function () {
            $("#option_down").click(function () {
                let box_on = $(".box-temp.options-on").text();
                let num = parseInt(box_on);
                if (num < 30) {
                    $.option.optionGoto(num + 1);
                } else {
                    $.option.optionGoto(1);
                }
            });
        },
        //跳转
        optionClick: function () {
            $("#options_list").find(".box-temp").each(function () {
                let temp = $(this);
                temp.click(function () {
                    let num = temp.text();
                    $.option.optionGoto(num);
                });
            });
        },
        //答题
        optionSelect: function () {
            let option_select = $(".detail-options");
            option_select.each(function () {
                let temp = $(this);
                temp.find(".detail-option-item").each(function () {
                    let item = $(this);
                    item.click(function () {
                        item.parent().find(".detail-option-item").each(function () {
                            let clean = $(this);
                            clean.removeClass("item-selected");
                        });
                        item.addClass("item-selected");
                        $.option.optionComplete();
                        let select_count = $(".item-selected").length;
                        if (select_count === 30) {
                            $(".submit-test").addClass("OK");
                        } else {
                            $(".submit-test").removeClass("OK");
                        }
                    });

                });
            });
        },
        //已答考题
        optionComplete: function () {
            let option_select = $(".detail-options");
            option_select.each(function () {
                let temp = $(this);
                let num = temp.find(".detail-option-item.item-selected").length;
                if (num > 0) {
                    let index = option_select.index(temp);
                    let box_array = $(".box-temp");
                    box_array.eq(index).addClass("box-complete");
                }
            });
        },
        //倒计时
        rollOutTime: function () {
            let num = $("#test_time").html();
            let lastTime = parseFloat(num) * 60 * 60;//秒
            let mm = parseInt(lastTime / 60, 10);//计算剩余的分钟数
            let ss = parseInt(lastTime % 60, 10);//计算剩余的秒数
            let temp = $.option.checkTime(mm) + "分" + $.option.checkTime(ss) + "秒";
            $(".count-down-show").html("考试时间剩余：" + temp);
            if (lastTime - 1 <= 0) {
                $("#test_time").html(0 / 60 / 60);
                $.option.examSunbmit();
            } else {
                $("#test_time").html((lastTime - 1) / 60 / 60);
            }

        },
        //格式化时间
        checkTime: function (i) {
            if (i >= 0 && i < 10) {
                i = "0" + i;
                return i;
            } else {
                return i;
            }
        },
        //试卷提交函数
        examSunbmit: function () {
            let selectList = "";
            $(".detail-box").each(function () {
                selectList += $(this).find(".detail-option-item.item-selected").text().substr(0, 1) + ",";
            });//获取用户选中选项
            $.ajax({
                url: "/Student/SubmitExam",
                data: {
                    selectList: selectList
                },
                type: "post",
                dataType: "json",
                success: function (data) {
                    if (data.state === "success") {
                        $("#msg_content").addClass("show");
                        $("#exam_msg").html(data.message);
                        window.setInterval(function () {
                            window.location.href = "/Student/ExamOnline";
                        }, 1500);
                    }
                    else {
                        $("#msg_content").addClass("show");
                        $("#exam_msg").html(data.message);
                        window.setInterval(function () {
                            window.location.href = "/Student/ExamOnline";
                        }, 1500);
                    }
                }
            });
        },
        //按钮提交
        submitTest: function () {
            $("#submit_ok").click(function () {
                $.option.examSunbmit();
            });
        }
    };
    $(function () {
        $(".detail-box").eq(0).attr("class", "detail-box detail-on");
        $.option.optionClick();
        $.option.optionSelect();
        $.option.optionUp();
        $.option.optionDown();
        $.option.submitTest();
        window.setInterval(function () {
            $.option.rollOutTime();
        }, 1000);
    });
})(jQuery);
