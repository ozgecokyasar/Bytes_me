// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require materialize
//= require rails-ujs
//= require_tree .


$(document).ready(() => {
  let checkboxes = [...document.getElementsByClassName('checkbox')]
  checkboxes.map(box => {
    box.addEventListener("click", event => {
      checkboxes
      .filter(x => x.id !== event.target.id)
      .map(x => x.checked = false)
    })
  })

  $('.button-collapse').sideNav({
     menuWidth: 300, // Default is 300
     edge: 'right', // Choose the horizontal origin
     closeOnClick: true, // Closes side-nav on <a> clicks, useful for Angular/Meteor
     draggable: true, // Choose whether you can drag to open on touch screens,

   })
})

$('.carousel.carousel-slider').carousel({fullWidth: true});
