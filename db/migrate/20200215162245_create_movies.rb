class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title 
      t.string :director
      t.string :rating
      t.integer :release_year
      t.integer :user_id 
      t.timestamps null: false
    end
  end
end
