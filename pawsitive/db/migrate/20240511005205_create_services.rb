class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services, id: :uuid do |t|
      t.references :member, null: false, foreign_key: { to_table: :users }, type: :uuid
      t.string :service_type
      t.string :description
      t.jsonb :availability
      t.jsonb :price
      t.jsonb :size

      t.timestamps
    end
  end
end
