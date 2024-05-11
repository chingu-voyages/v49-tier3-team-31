class AddPriceToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :price, :integer
  end
end
