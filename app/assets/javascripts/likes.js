$(document).on('turbolinks:load', function() {
    reviewLikeButton();
    commentLikeButton()
});

var reviewLikeButton = function() {
        $(".new-review-like-buttons").on("submit", function(e) {
            e.preventDefault();
            console.log("Worked!");
            var $form = $(this);

        //     // Hide the button
            $form.parent().parent().parent().find(".likes").hide();
            var myAction = $(this).find("form").attr("action")
            var myMethod = $(this).find("form").attr("method")
            // debugger

        //     console.log(myAction)
        //     console.log(myMethod)
            if ($($form.find("input")[0]).attr("value") != "delete") {
            	console.log("IN THE IF (LIKE)")
                $.ajax({
                        url: myAction,
                        method: "post"
                    })
                    .done(function(response) {
                        // console.log(response)
                        $form.html(response)
                    });
            } else {
            	console.warn("IN THE ELSE (UNLIKE)")
                $.ajax({
                        url: myAction,
                        method: 'delete'
                    })
                    .done(function(response) {
                        // console.log(response)
                        $form.html(response)

                    })
                    .fail(function(response){
                    	console.error(response)
                    })
            }
        })
}

var commentLikeButton = function() {
    $(".comments-likes-button").on("submit", ".like-button", function(e) {
        e.preventDefault()
        console.log("working")
        var $form = $(this)
        var myAction = $form.find("form").attr("action")
        var myMethod = $form.find("form").attr("method")
        if ($($form.find("input")[0]).attr("value") != "delete") {
            $.ajax({
                    url: myAction,
                    method: myMethod
                })
                .done(function(response) {
                    console.log(response)
                    $form.parent().html(response)
                })
        } else if ($($form.find("input")[0]).attr("value") === "delete"){
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













