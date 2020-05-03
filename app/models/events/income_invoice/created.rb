# frozen_string_literal: true

class Events::IncomeInvoice::Created < Events::IncomeInvoice::BaseEvent
  data_attributes :accounting_id, :number, :client_vatid, :total_amount

  def apply(income_invoice)
    income_invoice.accounting_id = accounting_id
    income_invoice.number = number
    income_invoice.client_vatid = client_vatid
    income_invoice.total_amount = total_amount

    income_invoice
  end
end
