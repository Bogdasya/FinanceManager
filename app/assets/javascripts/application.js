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
//= require bootstrap-sprockets
//= require jquery_ujs
//= require chartkick
//= require turbolinks
//= require moment
//= require bootstrap-datepicker
//= require_tree .

$(function() {
    $(document).ajaxError(function (e, xhr, settings) {
        if (xhr.status == 401) {
            $(".modal-header").append("<div class='alert alert-danger alert-dismissible fade in' role='alert'> <button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span> </button> <span style='margin-left: 200px;'> Пароль не подходит </span></div>")
        }
    });

    $("#create_wallet").click(function () {
        $("#wallet_div").show();
        $("#create_wallet").hide();
    });
    $('#create_charge').click(function () {
        $("#charge_new").show();
        $(".jumbotron").hide();
    });
});