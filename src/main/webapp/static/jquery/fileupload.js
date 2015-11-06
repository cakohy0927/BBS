(function ($) {
    $.fn.fileupload = function (opts) {
        var settings = $.extend({
            fileId: '',
            url: '',
            method: 'POST',
            dataType: 'JSON'
        }, opts || {});
        _create_iframe(settings);
        $("#" + settings.fileId).change(function () {
            document.getElementById("uploadForm").setAttribute("action", settings.url); //FORM提交到这个页面
            document.getElementById("uploadForm").submit();
        });

        $(this).click(function () {
            $("#" + settings.fileId).click();
        });
    }
})(jQuery);

function _create_iframe(settings) {
    var uploadForm = "<form style='display:none' enctype='multipart/form-data' name='uploadForm' id=\"uploadForm\" method=\"post\" "
        + "target='uploadIframe' onsubmit='return false;'>"
        + "<input type='file' name='" + settings.fileId + "' id='" + settings.fileId + "'/>"
        + "</form>";
    var iframe = "<iframe id=\"uploadIframe\" name=\"uploadIframe\" style=\"display:none\"></iframe>";
    $("body").append(iframe);
    $("body").append(uploadForm);
}


