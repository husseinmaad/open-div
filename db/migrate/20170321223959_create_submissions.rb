class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.string :name
      t.text :short_description
      t.string :domain
      t.string :city_name
      t.string :region_name
      t.string :country_code
      t.string :avatar
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
