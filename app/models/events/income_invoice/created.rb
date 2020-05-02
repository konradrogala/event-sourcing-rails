# frozen_string_literal: true

class Events
  class IncomeInvoice
    class Created < Events::IncomeInvoice::BaseEvent
      data_attributes :accouting_id, :number, :client_vatid, :total_amount

      def apply(income_invoice)
        income_invoice.accouting_id = accouting_id
        income_invoice.number = number
        income_invoice.client_vatid = client_vatid
        income_invoice.total_amount = total_amount

        income_invoice
      end
    end
  end
end
