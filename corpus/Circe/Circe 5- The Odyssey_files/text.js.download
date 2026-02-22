//JavaScript for text.jsp

var req;
var lastID;
var loadingXML = false;
var text_sidecart = null;
jQuery().ready( function() {
	//------------------------------------------------------------
    //  Get a sidecart instance.
    //------------------------------------------------------------
    text_sidecart = jQuery('#sidecartRight').sidecart({
    	side: 'right',
		theme: 'perseus'
    }).data('#sidecartRight');
            
    //------------------------------------------------------------
    //  Add sidecart views as PerseusLD data is loaded.
    //------------------------------------------------------------
    jQuery("#text_annotations_query").on( 'PerseusLD--LOADED', function( _e, _extra ) {
	    //------------------------------------------------------------
	    //  Check event extra object to see if "last" item is true.
	    //------------------------------------------------------------
    	var type = _extra.type;
	    text_sidecart.addView({
	    	id: 'annotations_'+type,
	        type: 'annotations',
	        link: 'Classroom Annotations (' + type +')',
	        src: '#text_annotations_query .perseusld_results.perseusld_'+type,
	        //------------------------------------------------------------
	        //  This callback function runs once when the view is first
	        //  initialized.
	        //------------------------------------------------------------
	        init: function() {;
	        	jQuery('#sidecartRight #annotations_' + type + ' .annotation').readmore({
	        		maxHeight: 200,
	                moreLink: '<a href="#">More</a>',
	                lessLink: '<a href="#">Less</a>'
	            });
	        },
	        //------------------------------------------------------------
	        //  This callback function runs everytime a view's tab is clicked
	        //------------------------------------------------------------
	        refresh: function() {}
	    });
    });
 
    jQuery( "#text_annotations_query" ).PerseusLD();
});
   
function loadVocabWgt(doc) {
   if (loadingXML) {
     return;
   }
   
   loadingXML = true;	

   var url = "vocab.wgt?works="
              + doc + "&usingChunks=true";
   
   var textLink = document.getElementById("vocab-link");
   lastID = "vocab"; 
 
    textLink.style.color = "black";
    textLink.style.textDecoration = "none";
    textLink.innerHTML = "loading...";
    textLink.setAttribute('href', 'javascript:()');
    if (window.XMLHttpRequest) {
        req = new XMLHttpRequest();
        req.onreadystatechange = processReqChange;
        req.open("GET", url, true);
	req.setRequestHeader('If-Modified-Since','Wed, 15 Nov 1995 00:00:00 GMT');
        req.send(null);
    // branch for IE/Windows ActiveX version
    } else if (window.ActiveXObject) {
        req = new ActiveXObject("Microsoft.XMLHTTP");
        if (req) {
            req.onreadystatechange = processReqChange;
            req.open("GET", url, true);
            req.send();
        }
    }

}

function loadXMLDoc(docID, query, docIndex) {

    if (loadingXML) {
	return;
    }

    loadingXML = true;

    var url = "loadquery?doc=" + query;
    if (docIndex != -1) {
	url += "&num=" + docIndex;
    }

    // branch for native XMLHttpRequest object
    var textLink = document.getElementById(docID + "-link");

    lastID = docID;

    textLink.style.color = "black";
    textLink.style.textDecoration = "none";
    textLink.innerHTML = "loading...";
    textLink.setAttribute('href', 'javascript:()');
    if (window.XMLHttpRequest) {
        req = new XMLHttpRequest();
        req.onreadystatechange = processReqChange;
        req.open("GET", url, true);
	req.setRequestHeader('If-Modified-Since','Wed, 15 Nov 1995 00:00:00 GMT');
        req.send(null);
    // branch for IE/Windows ActiveX version
    } else if (window.ActiveXObject) {
        req = new ActiveXObject("Microsoft.XMLHTTP");
        if (req) {
            req.onreadystatechange = processReqChange;
            req.open("GET", url, true);
            req.send();
        }
    }

}

function processReqChange() {
    if (req.readyState == 4) {
	if (req.status == 200) {
	    var textDisplay = document.getElementById(lastID + "-contents");

	    textDisplay.innerHTML = req.responseText;
	    textDisplay.style.display = "block";
	    
	    var textLink = document.getElementById(lastID + "-link");
	    textLink.className = "toggle";
	    //textLink.style.textDecoration = "underline";
	    textLink.style.color = "blue";
	    textLink.innerHTML = "hide";
	    textLink.setAttribute('href', 'javascript:toggle(\'' + lastID + '\')');
	} else {
	    alert("Problem! status = " + req.status + " " + req.statusText + " " + req.readyState);
	    textLink.innerHTML = "hide";	    	    
	    textLink.setAttribute('href', 'javascript:toggle(\'' + lastID + '\')');	
	}
	loadingXML = false;
    }
}

function showJumpHelp() {
  	var div = document.getElementById('jumphelp');
  	div.style.display = "";
}

function hideJumpHelp() {
	var div = document.getElementById('jumphelp');
  	div.style.display = "none";
}
