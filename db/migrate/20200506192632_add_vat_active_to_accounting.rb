class AddVatActiveToAccounting < ActiveRecord::Migration[6.0]
  def up
    add_column 'accountings', :vat_active, :boolean, default: false

    Accounting.find_each do |accounting|
      accounting.events.reduce(accounting) do |accounting, event|
        event.apply(accounting)
      end
      accounting.save!
    end
  end

  def down
    remove_column 'accountings', :vat_active
  end
end
