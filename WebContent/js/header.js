jQuery(document).ready(function() {
	jQuery('ul.sf-menu').superfish({
		delay:       200,                            // one second delay on mouseout
		animation:   {opacity:'show',height:'show'},  // fade-in and slide-down animation
		speed:       'normal',                          // faster animation speed
		autoArrows:  true                            // disable generation of arrow mark-up
	});		
});

function showPopup(){
	$("#userMenu").css("visibility", "visible");
	$("#userMenu").css("display", "block");
}
