// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require underscore
//= require gmaps/google
//= require masonry.pkgd.min
//= require_tree .


$(function(){ $(document).foundation(); });

var start = document.getElementById('start').innerHTML;
CountDownTimer(start, 'countdown');

function CountDownTimer(dt, id)
{
   var end = new Date(dt);

   var _second = 1000;
   var _minute = _second * 60;
   var _hour = _minute * 60;
   var _day = _hour * 24;
   var timer;

   function showRemaining() {
       var now = new Date();
       var timeRemaining = end - now;
       if (timeRemaining < 0) {

           clearInterval(timer);
           document.getElementById(id).innerHTML = 'Enjoy Your Trip!';

           return;
       }
       var days = Math.floor(timeRemaining / _day);
       var hours = Math.floor((timeRemaining % _day) / _hour);
       var minutes = Math.floor((timeRemaining % _hour) / _minute);
       var seconds = Math.floor((timeRemaining % _minute) / _second);

       document.getElementById(id).innerHTML = days + ' days ';
       document.getElementById(id).innerHTML += hours + ' hours ';
       document.getElementById(id).innerHTML += minutes + ' minutes ';
       document.getElementById(id).innerHTML += seconds + ' seconds ';
   }

   timer = setInterval(showRemaining, 1000);
}
// 
// $(document).ready(){
//   $("#address").on deselection
//   auto fill - ajax call that the button
//   in succuess
//
// };
