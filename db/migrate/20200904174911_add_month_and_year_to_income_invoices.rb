class AddMonthAndYearToIncomeInvoices < ActiveRecord::Migration[6.0]
  def up
    add_column 'income_invoices', :month, :integer
    add_column 'income_invoices', :year, :integer

    IncomeInvoice.find_each do |invoice|
      invoice.events.reduce(invoice) do |invoice, event|
        event.apply(invoice)
      end
      invoice.save!
    end
  end

  def down
    remove_column 'income_invoices', :month
    remove_column 'income_invoices', :year
  end
end
