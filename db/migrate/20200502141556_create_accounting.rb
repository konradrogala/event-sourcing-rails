class CreateAccounting < ActiveRecord::Migration[6.0]
  def change
    create_table :accountings do |t|
      t.string :vat_id, null: false
      
      t.timestamps null: false
    end
  end
end
