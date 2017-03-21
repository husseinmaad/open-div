module ApplicationHelper


	  def custom_rating_generator ( value , dimension = nil, options = {})

		  stars = value

	    star         = options[:star]         || 5
	    enable_half  = options[:enable_half]  || true
	    half_show    = options[:half_show]    || true
	    star_path    = options[:star_path]    || ''
	    star_on      = options[:star_on]      || image_path('star-on.png')
	    star_off     = options[:star_off]     || image_path('star-off.png')
	    star_half    = options[:star_half]    || image_path('star-half.png')
	    cancel       = options[:cancel]       || false
	    cancel_place = options[:cancel_place] || 'left'
	    cancel_hint  = options[:cancel_hint]  || 'Cancel current rating!'
	    cancel_on    = options[:cancel_on]    || image_path('cancel-on.png')
	    cancel_off   = options[:cancel_off]   || image_path('cancel-off.png')
	    noRatedMsg   = options[:noRatedMsg]   || 'I\'am readOnly and I haven\'t rated yet!'
	    # round        = options[:round]        || { down: .26, full: .6, up: .76 }
	    space        = options[:space]        || false
	    single       = options[:single]       || false
	    target       = options[:target]       || ''
	    targetText   = options[:targetText]   || ''
	    targetType   = options[:targetType]   || 'hint'
	    targetFormat = options[:targetFormat] || '{score}'
	    targetScore  = options[:targetScore]  || ''
	    readOnly     = options[:readonly]     || true



	    content_tag :div, '', "data-dimension" => dimension, :class => "star", "data-rating" => stars,
	                "data-disable-after-rate" => true,
	                "data-readonly" => readOnly,
	                "data-enable-half" => enable_half,
	                "data-half-show" => half_show,
	                "data-star-count" => star,
	                "data-star-path" => star_path,
	                "data-star-on" => star_on,
	                "data-star-off" => star_off,
	                "data-star-half" => star_half,
	                "data-cancel" => cancel,
	                "data-cancel-place" => cancel_place,
	                "data-cancel-hint"  => cancel_hint,
	                "data-cancel-on" => cancel_on,
	                "data-cancel-off" => cancel_off,
	                "data-no-rated-message" => noRatedMsg,
	                # "data-round" => round,
	                "data-space" => space,
	                "data-single" => single,
	                "data-target" => target,
	                "data-target-text" => targetText,
	                "data-target-format" => targetFormat,
	                "data-target-score" => targetScore
	end



end
