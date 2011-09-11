// 判断文档加载完毕
$(document).ready(function() {
    // do something ...

});

// 浏览器滚动
$(window).scroll(function() {
    // do something ...
});

// 判断IE6
if ($.browser.msie && ($.browser.version == "6.0") && !$.support.style) {
    // do something ...
}

// CSS
$("#objId").css("top", 250);
