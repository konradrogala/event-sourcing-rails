# frozen_string_literal: true

module Commands
  class Accounting::Create
    include Lib::Command

    attributes :vat_id, :metadata

    private def build_event
      Events::Accounting::Created.new(
        vat_id: vat_id,
        metadata: metadata
      )
    end
  end
end
