class Events::IncomeInvoice::BaseEvent < Lib::BaseEvent
  self.table_name = "income_invoice_events"

  belongs_to :income_invoice, class_name: "::IncomeInvoice", autosave: false
end
