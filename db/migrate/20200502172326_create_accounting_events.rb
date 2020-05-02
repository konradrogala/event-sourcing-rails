class CreateAccountingEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :accounting_events do |t|
      t.string :type, null: false
      t.integer :accounting_id, null: false

      t.text :data, null: false
      t.text :metadata, null: false
      t.datetime :created_at, null: false

      t.index :accounting
    end
  end
end
