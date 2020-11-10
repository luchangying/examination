function OpenBox() {
    $('#course_show_box').css('z-index', '99');
    $('#course_show_box').css('opacity', '1');
    $('#course_show_box').css('transform', 'translateY(0)');
}
function CloseBox() {
    $('#course_show_box').css('opacity', '0');
    $('#course_show_box').css('transform', 'translateY(30px)');
    window.setTimeout(function () {
        $('#course_show_box').css('z-index', '0');
    }, 300);
}
function CourseDetail(id) {
    $.ajax({
        url: "/Operate/GetCourseDetail",
        data: {
            guid: id
        },
        type: "post",
        dataType: "json",
        success: function (data) {
            if (data.state === "success") {
                OpenBox();
                $('#show_box_img').attr('src', data.data[0].BookImg === null ? "/Image/Book/9787111211969.jpg" : data.data[0].BookImg);
                $('#show_box_title').html(data.data[0].CourseName);
                $('#course_book').html(data.data[0].Book);
                $('#course_compulsory').html(data.data[0].Compulsory ? "是" : "否");
                $('#course_teacher').html(data.data[0].Name);
                $('#course_message').html(data.data[0].CourseMess);
            } else {
                alert(data.message);
            }
        }

    });

}
function GotoPage(index) {
    var key   = $('#dropCourseCountries').val();
    var value = $('#txtCourseSearch').val();
    $(window).attr('location', '/Operate/AllCoursePage?pageIndex=' + index+ '&key=' + key + '&value=' + value);
}
function CourseQuery() {
    var key   = $('#dropCourseCountries').val();
    var value = $('#txtCourseSearch').val();
    $(window).attr('location', '/Operate/AllCoursePage?pageIndex=0&key=' + key + '&value=' + value);
}

