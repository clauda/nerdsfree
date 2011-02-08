jQuery(document).ready(function($){
    $("#container").notify();
});

jQuery(document).ready(function($){
	$("#mytags").tagit({
		availableTags: ["c++", "java", "php", "javascript", "asp", "ruby", "python", "c", "scala", "perl", "html", "css", "rails", ".net", "asp.net", "html5", "css3", "webdesign", "photoshop", "illustrator", "corel"]
	});
});

$(document).ready(function() {
    $('input[type="url"]').addClass("idleField");
    $('input[type="url"]').focus(function() {
        $(this).removeClass("idleField");
        if (this.value == this.defaultValue){
            this.value = '';
        }
        if(this.value != this.defaultValue){
            this.select();
        }
    });
    $('input[type="url"]').blur(function() {
        $(this).addClass("idleField");
        if ($.trim(this.value == '')){
            this.value = (this.defaultValue ? this.defaultValue : '');
        }
    });
});

