class AddColumnsToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :start_time, :time
    add_column :bookings, :end_time, :time
    add_column :bookings, :phone_number, :string
    add_column :bookings, :message, :text, default: ""
    add_column :bookings, :recieve_updates, :boolean , default: false
  end
end
