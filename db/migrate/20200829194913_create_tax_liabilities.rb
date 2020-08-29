class CreateTaxLiabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :tax_liabilities do |t|
      t.integer :accounting_id, null: false
      
      t.string :vat_id, null: false
      t.string :month, null: false
      t.string :year, null: false
      t.string :tax_amount, null: false
      t.string :vat_amount, null: false

      t.timestamps null: false
    end
  end
end
