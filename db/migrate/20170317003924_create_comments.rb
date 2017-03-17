class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body 
      t.integer :commentor_id, foreign_key: true
      t.references :commentable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
