class CreateIncomeInvoice < ActiveRecord::Migration[6.0]
  def change
    create_table :income_invoices do |t|
      t.integer :accouting_id, null: false

      t.string :number, null: false
      t.string :client_vatid
      t.string :total_amount

      t.timestamps null: false
    end
  end
end
