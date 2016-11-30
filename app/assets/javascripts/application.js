// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap
let planType = 0

function checkPlanSwitch(){
  if( !($('#user_premium_plan').is(":checked")) && planType == 1 ){
    bootbox.confirm("Your private wikis will become public if you downgrade your account.<br> Would you like to continue?",
            function(result){ if(result){$('#edit_user').submit();} });
  }else{
    $('#edit_user').submit();
  }
}

function storePlanType(){
  if($('#user_premium_plan').is(":checked")){
    planType = 1;
  }else{
    planType = 0;
  }
}
