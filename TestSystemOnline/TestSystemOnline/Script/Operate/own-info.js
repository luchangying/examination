$(document).ready(function () {
    $(".info-bar").each(function () {
        var li = $(this);
        if (li.find('.info-bar-right').html().length === 0) {
            li.hide();
        }
    });
});