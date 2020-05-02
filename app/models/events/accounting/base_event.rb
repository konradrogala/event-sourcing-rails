class Events::Accounting::BaseEvent < Lib::BaseEvent
  self.table_name = "accounting_events"

  belongs_to :accounting, class_name: "::Accounting", autosave: false
end
