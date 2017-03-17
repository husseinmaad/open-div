class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :body
      t.integer :company_id 
      t.integer :reviewer_id
      t.integer :culture_rating
      t.integer :diversity_rating
      t.integer :inclusion_rating
      t.boolean :anonymous 

      t.timestamps
    end
  end
end
