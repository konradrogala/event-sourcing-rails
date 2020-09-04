# frozen_string_literal: true

module Commands
  class TaxLiability::AmountsUpdated
    include Lib::Command

    attributes :tax_liability, :tax_amount, :vat_amount, :metadata

    private def build_event
      Events::TaxLiability::AmountsUpdated.new(
        tax_liability: tax_liability,
        tax_amount: tax_amount,
        vat_amount: vat_amount,
        metadata: metadata
      )
    end
  end
end
