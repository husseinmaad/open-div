module ReviewsHelper

	def custom_rating_for_review ( review , dimension = nil, options = {})
    @object = review.company
    @user   = review.reviewer
	  @rating = Rate.find_by_rater_id_and_rateable_id_and_dimension(@user.id, @object.id, dimension)

	  stars = @rating ? @rating.stars : 0

    star         = options[:star]         || 5
    enable_half  = options[:enable_half]  || true
    half_show    = options[:half_show]    || true
    star_path    = options[:star_path]    || '/images'
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

    disable_after_rate = options[:disable_after_rate] || false

    if disable_after_rate
      readOnly = rating_user.present? ? !@object.can_rate?(rating_user, dimension) : true
    end

    content_tag :div, '', "data-dimension" => dimension, :class => "star", "data-rating" => stars,
                "data-id" => @object.id, "data-classname" => @object.class.name == @object.class.base_class.name ? @object.class.name : @object.class.base_class.name,
                "data-disable-after-rate" => disable_after_rate,
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
