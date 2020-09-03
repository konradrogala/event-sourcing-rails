class Events::TaxLiability::BaseEvent < Lib::BaseEvent
  self.table_name = "tax_liability_events"

  belongs_to :tax_liability, class_name: "::TaxLiability", autosave: false
end
