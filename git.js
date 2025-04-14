jQuery(document).ready(function(){
	jQuery('.skillbar').each(function(){
		jQuery(this).find('.skillbar-bar').animate({
			width:jQuery(this).attr('data-percent')
		},6000);
	});
});
$('#holder').on({
    'dragover dragenter': function(e) {
        e.preventDefault();
        e.stopPropagation();
    },
    'drop': function(e) {
    var dataTransfer =  e.originalEvent.dataTransfer;
    if( dataTransfer && dataTransfer.files.length) {
        e.preventDefault();
        e.stopPropagation();
        if( dataTransfer && dataTransfer.files.length) {
		e.preventDefault();
		e.stopPropagation();
		$.each( dataTransfer.files, function(i, file) {
		var reader = new FileReader();
		reader.onload = $.proxy(function(file, $fileList, event) {
        var img = file.type.match('image.*') ? "<img src='" + event.target.result + "' /> " : "";
        $fileList.prepend( $("<li>").append( img + file.name ) );
		}, this, file, $("#fileList"));
		reader.readAsDataURL(file);
    });
}
    }
}});
function addEventHandler(obj, evt, handler) {
    if(obj.addEventListener) {
        // W3C method
        obj.addEventListener(evt, handler, false);
    } else if(obj.attachEvent) {
        // IE method.
        obj.attachEvent('on'+evt, handler);
    } else {
        // Old school method.
        obj['on'+evt] = handler;
    }
}
function loadimage(){
if(window.FileReader) { 
  addEventHandler(window, 'load', function() {
    var status = document.getElementById('status');
    var drop   = document.getElementById('drop');
    var list   = document.getElementById('list');
  	
    function cancel(e) {
      if (e.preventDefault) { e.preventDefault(); }
      return false;
    }
  
    // Tells the browser that we *can* drop on this target
    addEventHandler(drop, 'dragover', cancel);
    addEventHandler(drop, 'dragenter', cancel);
  });
} else { 
  document.getElementById('status').innerHTML = 'Your browser does not support the HTML5 FileReader.';
}
}