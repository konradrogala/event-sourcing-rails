class CreateIncomeInvoiceEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :income_invoice_events do |t|
      t.string :type, null: false
      t.integer :income_invoice_id, null: false

      t.text :data, null: false
      t.text :metadata, null: false
      t.datetime :created_at, null: false

      t.index :income_invoice_id
    end
  end
end
