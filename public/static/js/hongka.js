// 后台编辑页面，检测表单是否被修改
function is_form_changed() {
    var is_changed = false;
    $("#article_form input, #article_form textarea, #article_form select").each(function() {
        var _v = $(this).attr('_value');
        if(typeof(_v) == 'undefined') _v = '';
        console.log(_v,$(this).val());
        if(_v != $(this).val()){
            is_changed = true;
            return true
        }
    });
    return is_changed;
}

$(function(){
    $("#article_form input, #article_form textarea, #article_form select").each(function() {
    $(this).attr('_value', $(this).val());
    });
});

//window.onbeforeunload = function() {
//    if(is_form_changed()) {
//        return confirm('您的修改内容还没有保存，确定离开吗？');
//    }
//}



//window.onunload = function() {
//    if(is_form_changed()) {
//
//        return '您的修改内容还没有保存，确定离开吗？';
//
//    }
//}


var submit_clicked = false;
$('.btn').click(function(){
    submit_clicked = true;
});


window.onbeforeunload = function closeEditorWarning(){

    /** Check to see if the settings warning is displayed */
    if(/*($('#unsaved-settings').css('display') !== 'none') && */submit_clicked === false){
        bol_option_changed = true;
    }

    /** Display a warning if the user is trying to leave the page with unsaved settings */
    if(bol_option_changed === true){
        return '';
    }


};
