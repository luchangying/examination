//获取剩余时间
function ShowCountDown(date) {
    var now = new Date();
    var endDate = new Date(date);
    var leftTime = endDate.getTime() - now.getTime();
    var dd = parseInt(leftTime / 1000 / 60 / 60 / 24, 10);//计算剩余的天数
    var hh = parseInt(leftTime / 1000 / 60 / 60 % 24, 10);//计算剩余的小时数
    var mm = parseInt(leftTime / 1000 / 60 % 60, 10);//计算剩余的分钟数
    var ss = parseInt(leftTime / 1000 % 60, 10);//计算剩余的秒数
    var d = checkTime(dd, dd, hh, mm, "天");
    var h = checkTime(hh, dd, hh, mm, "时");
    var m = checkTime(mm, dd, hh, mm, "分");
    var s = checkTime(ss, dd, hh, mm, "秒");
    var temp = d + h + m + s;
    return temp;
}
//格式化时间格式
function checkTime(i, dd, hh, mm, unit) {
    if (i <= 0) {

        if (dd === 0) {
            return "";
        }
        if (dd === 0 && hh === 0) {
            return "";
        }
        if (dd === 0 && hh === 0 && mm === 0) {
            return "";
        }

        if (dd > 0) {
            return "00" + unit;
        } else if (hh > 0) {
            return "00" + unit;
        } else if (mm > 0) {
            return "00" + unit;
        } else {
            return "";
        }
    } else if (i > 0 && i < 10) {
        i = "0" + i + unit;
        return i;
    } else {
        i = i + unit;
        return i;
    }
}
//开始考试
function ExamBegin(id) {
    $(window).attr('location', '/Student/BeginExam?guid=' + id);
}
$(document).ready(function () {
    window.setInterval(function () {
        $('.examonline-check').each(function () {
            var date = $(this).find('.test-time').text();
            var show = $(this).find('.count-down-show');
            show.html(ShowCountDown(date));
        });
    }, 1000);

});