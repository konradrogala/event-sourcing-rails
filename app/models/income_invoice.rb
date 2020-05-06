class IncomeInvoice < ApplicationRecord
  belongs_to :accounting

  has_many :events, class_name: "Events::IncomeInvoice::BaseEvent"
end
