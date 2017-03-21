class RemoveRatingsFromReviews < ActiveRecord::Migration[5.0]
  def change
    remove_column :reviews, :culture_rating
    remove_column :reviews, :diversity_rating
    remove_column :reviews, :inclusion_rating
  end
end
