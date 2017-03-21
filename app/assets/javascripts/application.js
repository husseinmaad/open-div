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
//= require materialize-sprockets
//= require jquery.raty
//= require ratyrate
//= require_tree .
$(document).on('turbolinks:load', function() {
    reviewLikeButton()
    commentLikeButton()
});

var reviewLikeButton = function() {
        $(".review-like-buttons").on("submit", ".like-button", function(e) {
            e.preventDefault()
            console.log("Worked!")
            $form = $(this)
            $form.parent().parent().parent().find(".likes").hide()
            var myAction = $(this).find("form").attr("action")
            var myMethod = $(this).find("form").attr("method")
            if (myMethod === "get") {
                $.ajax({
                        url: myAction,
                        method: "get"
                    })
                    .done(function(response) {
                        console.log(response)
                        $form.html(response)
                    })
            } else {
                $.ajax({
                        url: myAction,
                        method: "delete"
                    })
                    .done(function(response) {
                        console.log(response)
                        $form.html(response)

                    })
            }
        })
}

var commentLikeButton = function() {
    $(".container").on("submit", ".like-button", function(e) {
        e.preventDefault()
        console.log("working")
        $form = $(this)
        var myAction = $form.find("form").attr("action")
        var myMethod = $form.find("form").attr("method")
        if (myMethod === "get") {
            $.ajax({
                    url: myAction,
                    method: myMethod
                })
                .done(function(response) {
                    console.log(response)
                    $form.parent().html(response)
                })
        } else {
            $.ajax({
                    url: myAction,
                    method: "delete"
                })
                .done(function(response) {
                    console.log(response)
                    $form.parent().html(response)
                })
                .done(function(response) {
                    console.log(response)
                    $form.parent().html(response)
                })

        }
    })
}














