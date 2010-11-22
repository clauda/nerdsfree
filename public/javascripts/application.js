Cufon.replace('h1');
Cufon.replace('h2');
Cufon.replace('p');

jQuery(document).ready(function($){
  $('a[rel*=facebox]').facebox();
})

jQuery(document).ready(function($) {
    $("#chained").scrollable({circular: true, mousewheel: true}).navigator().autoscroll({
	    interval: 3000		
    });	
});

