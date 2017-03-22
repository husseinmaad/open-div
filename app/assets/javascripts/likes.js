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

var commentLikeButton = function(){
	$(".container").on("submit", ".like-button", function(e){
		e.preventDefault()
		console.log("working")
		$form = $(this)
		var myAction = $form.find("form").attr("action")
		var myMethod = $form.find("form").attr("method")
		if (myMethod === "get"){
			$.ajax({
				url: myAction,
				method: myMethod
			})
			.done(function(response){
				console.log(response)
				$form.parent().html(response)
			})
	}
	else {
			$.ajax({
				url: myAction,
				method: "delete"
			})
			.done(function(response){
				console.log(response)
				$form.parent().html(response)
			})
			.done(function(response){
				console.log(response)
				$form.parent().html(response)
			})

	}
	})
}
