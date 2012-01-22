// Run the script on DOM ready:
$(function(){
 $('.stats').visualize({type: 'pie', height: '300px', width: '420px'});
	$('.stats').visualize({type: 'bar', width: '420px'});
	$('.stats').visualize({type: 'area', width: '420px'});
	$('.stats').visualize({type: 'line', width: '420px'});
});