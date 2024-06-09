class AddServiceIdToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :service_id, :integer
  end
end
