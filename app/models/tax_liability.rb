class TaxLiability < ApplicationRecord
  belongs_to :accounting
  has_many :income_invoices

  has_many :events, class_name: "Events::TaxLiability::BaseEvent"
end
