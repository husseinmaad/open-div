class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.string :industry
      t.string :location
      t.string :logo
      t.integer :creator_id 

      t.timestamps
    end
  end
end
