# frozen_string_literal: true

module Commands
  class IncomeInvoice::Create
    include Lib::Command

    attributes :accounting, :number, :client_vatid, :total_amount, :month, :year, :metadata

    private def build_event
      Events::IncomeInvoice::Created.new(
        accounting_id: accounting.id,
        number: number,
        client_vatid: client_vatid,
        total_amount: total_amount,
        month: month,
        year: year,
        metadata: metadata
      )
    end
  end
end
