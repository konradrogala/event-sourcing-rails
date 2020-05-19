class Accounting < ApplicationRecord
  # belongs_to :user
  has_many :income_invoices

  has_many :events, class_name: "Events::Accounting::BaseEvent"
end
