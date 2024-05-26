class CreateAvailabilities < ActiveRecord::Migration[7.1]
  def change
    create_table :availabilities, id: :uuid do |t|
      t.references :service, null: false, foreign_key: true, type: :uuid
      t.date :date, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.boolean :available, default: true, null: false

      t.timestamps
    end
  end
end
