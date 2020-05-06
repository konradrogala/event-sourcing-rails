# frozen_string_literal: true

module Commands
  class Accounting::VatActiveUpdated
    include Lib::Command

    attributes :accounting, :vat_active, :metadata

    private def build_event
      Events::Accounting::VatActiveUpdated.new(
        accounting: accounting,
        vat_active: vat_active,
        metadata: metadata
      )
    end
  end
end
