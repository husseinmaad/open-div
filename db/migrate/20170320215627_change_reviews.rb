class ChangeReviews < ActiveRecord::Migration[5.0]
  def change
  	change_column :reviews, :anonymous, :boolean, default: false
  end
end
