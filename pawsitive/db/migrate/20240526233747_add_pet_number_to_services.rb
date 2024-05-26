class AddPetNumberToServices < ActiveRecord::Migration[7.1]
  def change
    add_column :services, :pet_number, :string
    add_column :services, :pet_types, :string, array: true, default: []
  end
end
