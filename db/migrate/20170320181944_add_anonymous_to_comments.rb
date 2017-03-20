class AddAnonymousToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments , :anonymous , :boolean , default: true
  end
end
