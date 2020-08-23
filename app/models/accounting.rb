class Accounting < ApplicationRecord
  has_many :income_invoices

  has_many :events, class_name: "Events::Accounting::BaseEvent"
end
