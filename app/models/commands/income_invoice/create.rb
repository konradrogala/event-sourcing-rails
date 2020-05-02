# frozen_string_literal: true

module Commands
  class IncomeInvoice::Create
    include Lib::Command

    attributes :accouting_id, :number, :client_vatid, :total_amount, :metadata

    private def build_event
      Events::IncomeInvoice::Created.new(
        accouting_id: accouting_id,
        number: number,
        client_vatid: client_vatid,
        total_amount: total_amount,
        metadata: metadata
      )
    end
  end
end
