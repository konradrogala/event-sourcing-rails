class IncomeInvoice < ApplicationRecord
  belongs_to :accounting
  # belongs_to :tax_liability

  has_many :events, class_name: "Events::IncomeInvoice::BaseEvent"
end
