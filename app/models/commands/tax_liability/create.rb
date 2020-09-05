# frozen_string_literal: true

module Commands
  class TaxLiability::Create
    include Lib::Command

    attributes :accounting, :month, :year, :tax_amount, :vat_amount, :metadata

    validates :month, presence: true
    validates :year, presence: true

    private def build_event
      Events::TaxLiability::Created.new(
        accounting_id: accounting.id,
        vat_id: accounting.vat_id,
        month: month,
        year: year,
        tax_amount: tax_amount,
        vat_amount: vat_amount,
        metadata: metadata
      )
    end
  end
end
