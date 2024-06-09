class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews, id: :uuid do |t|
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
