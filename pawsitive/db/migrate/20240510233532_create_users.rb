class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.float :latitude
      t.float :longitude
      t.integer :role

      t.timestamps
    end
  end
end
