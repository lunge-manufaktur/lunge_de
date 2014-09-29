// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require events
//= require jquery_nested_form
//= require_tree

$(document).foundation();

// Hide notices after a few seconds
$('.notice').slideDown(500).delay(5000).slideUp(500);

// prevent links in iOS Webapp from openin gin new Safari tab
// Mobile Safari in standalone mode
if(("standalone" in window.navigator) && window.navigator.standalone){
 
  // If you want to prevent remote links in standalone web apps opening Mobile Safari, change 'remotes' to true
  var noddy, remotes = false;
  
  document.addEventListener('click', function(event) {
    
    noddy = event.target;
    
    // Bubble up until we hit link or top HTML element. Warning: BODY element is not compulsory so better to stop on HTML
    while(noddy.nodeName !== "A" && noddy.nodeName !== "HTML") {
          noddy = noddy.parentNode;
      }
    
    if('href' in noddy && noddy.href.indexOf('http') !== -1 && (noddy.href.indexOf(document.location.host) !== -1 || remotes))
    {
      event.preventDefault();
      document.location.href = noddy.href;
    }
  
  },false);
} 