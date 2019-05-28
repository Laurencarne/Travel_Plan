class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :review
      t.integer :rating
      t.string :photo
      t.integer :activity_id

      t.timestamps
    end
  end
end
