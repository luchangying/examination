window.onload = function () {
    var enum_span_open    = document.getElementById("enum_span_open");
    var enum_image_open   = document.getElementById("enum_image_open");
    var enum_button_close = document.getElementById("enum_button_close");

    var begin_body = document.getElementById('begin_body');
    var card       = document.getElementById('card');


    begin_body.style.opacity = '1';

    enum_span_open.onclick = function () {
        card.className = 'card on';
    };
    enum_image_open.onclick = function () {
        card.className = 'card on';
    };
    enum_button_close.onclick = function () {
        card.className = 'card';
    };

    $('#ruletemp_enum').find('.enum-item').each(function () {
        var enum_item = $(this);//当前数据
        var enum_item_key = enum_item.find('.key-title');
        enum_item_key.click(function () {
            if (enum_item.is('.enum-item.close-item')) {
                enum_item.attr('class', 'enum-item');
            } else {
                enum_item.attr('class', 'enum-item close-item');
            }
        });
    });

};
function delayURL(url) {
    var card = $('#card');
    card.className = 'card';
    window.setTimeout(function () {
        window.location.href = url;
    }, 300);
}
