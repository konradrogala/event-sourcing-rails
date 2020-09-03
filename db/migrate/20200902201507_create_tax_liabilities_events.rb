class CreateTaxLiabilitiesEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :tax_liability_events do |t|
      t.string :type, null: false
      t.integer :tax_liability_id, null: false

      t.text :data, null: false
      t.text :metadata, null: false
      t.datetime :created_at, null: false

      t.index :tax_liability_id
    end
  end
end
