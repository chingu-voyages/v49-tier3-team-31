class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages, id: :uuid do |t|
      t.uuid :sender_id, null: false
      t.uuid :receiver_id, null: false
      t.text :content, null: false
      t.references :booking, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :messages, :sender_id
    add_index :messages, :receiver_id
    end
  end
