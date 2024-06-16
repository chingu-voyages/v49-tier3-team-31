class RemoveAvailabilityFromServices < ActiveRecord::Migration[7.1]
  def change
    remove_column :services, :availability, :jsonb
  end
end
