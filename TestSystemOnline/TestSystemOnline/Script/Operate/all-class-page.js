function OpenBox() {
    $('#class_show_box').css('z-index', '99');
    $('#class_show_box').css('opacity', '1');
    $('#class_show_box').css('transform', 'translateY(0)');
}
function CloseBox() {
    $('#class_show_box').css('opacity', '0');
    $('#class_show_box').css('transform', 'translateY(30px)');
    window.setTimeout(function () {
        $('#class_show_box').css('z-index', '0');
    }, 300);
}
function ClassDetail(id) {
    $.ajax({
        url: "/Operate/GetClassDetail",
        data: {
            guid: id
        },
        type: "post",
        dataType: "json",
        success: function (data) {
            if (data.state === "success") {
                OpenBox();
                $('#show_box_img').attr('src', data.data[0].ClassImg === null ? "/Image/Classroom/classtemp.png" : data.data[0].ClassImg);
                $('#show_box_title').html(data.data[0].ClassName);
                $('#class_master').html(data.data[0].Name);
                $('#class_course').html(data.data[0].CourseName);
                $('#class_number').html(data.data[0].Number === 0 ? "无" : data.data[0].Number);
                var other = '';
                for (var i = 0; i < data.data.length; i++) {
                    if (data.data[i].OtherCourse === null) {
                        break;
                    }
                    other += data.data[i].OtherCourse + '</br>';
                }
                $('#other_course').html(other === "" ? "无" : other);
            } else {
                alert(data.message);
            }
        }
    });
}
function GotoPage(index) {
    var key   = $('#dropClassCountries').val();
    var value = $('#txtClassSearch').val();
    $(window).attr('location', '/Operate/AllClassPage?pageIndex=' + index + '&key=' + key + '&value=' + value);
}
function ClassQuery() {
    var key   = $('#dropClassCountries').val();
    var value = $('#txtClassSearch').val();
    $(window).attr('location', '/Operate/AllClassPage?pageIndex=0&key=' + key + '&value=' + value);
}
