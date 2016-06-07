function is_form_changed() {
    var is_changed = false;
    $("#article_form input, #article_form textarea, #article_form select").each(function() {
        var _v = $(this).attr('_value');
        if(typeof(_v) == 'undefined') _v = '';
        //console.log(_v,$(this).val());
        if(_v != $(this).val()){
            is_changed = true;
            return true;
        }
    });
    return is_changed;
}

$(function(){
    $("#article_form input, #article_form textarea, #article_form select").each(function() {
        $(this).attr('_value', $(this).val());
    });
});

window.onbeforeunload = function() {
    if(is_form_changed()) {
        event.returnValue="您的修改内容还没有保存，确定离开吗？";
    }
}


