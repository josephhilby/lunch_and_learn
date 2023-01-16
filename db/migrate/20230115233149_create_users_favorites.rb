class CreateUsersFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :users_favorites do |t|
      t.references :user, foreign_key: true
      t.references :favorite, foreign_key: true
    end
  end
end
