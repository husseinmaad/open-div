class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :short_description
      t.string :domain # company website
      t.string :city_name
      t.string :region_name
      t.string :country_code
      t.string :profile_image_url
      t.integer :creator_id

      t.timestamps
    end
  end
end
